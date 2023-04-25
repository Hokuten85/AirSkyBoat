/*************************************
 *  Used for the 75 Cap Dynamis
 *  Used to handle hourglass functions.
 *************************************/
#include "map/utils/moduleutils.h"
#include <algorithm>

#include "common/logging.h"
#include "common/sql.h"
#include "map/entities/charentity.h"
#include "map/lua/luautils.h"
#include "map/utils/battleutils.h"
#include "map/utils/charutils.h"
#include "map/packets/char_update.h"
#include "map/packets/char_stats.h"
#include "map/packets/char_skills.h"

namespace
{

}; // namespace

class IvaliceFuncModule : public CPPModule
{
    void OnInit() override
    {
        /* player:getTraitValue(traitID)
                                                v------------object------------v v--param0--v */
        lua["CBaseEntity"]["getTraitValue"] = [](CLuaBaseEntity* PLuaBaseEntity, uint8 traitID)
        {
            TracyZoneScoped;
			
			CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
			if (PEntity->objtype == TYPE_PC)
			{
				return battleutils::getTraitValue(static_cast<CBattleEntity*>(PEntity), traitID);
			}

			return 0;
        };

        /* player:addCharMod(modID, modValue)
                                                v------------object--------v  v--param0--v  v---param1---v */
        lua["CBaseEntity"]["addCharMod"] = [](CLuaBaseEntity* PLuaBaseEntity, uint16 modID, int16 modValue)
        {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
            auto*        PChar   = static_cast<CCharEntity*>(PEntity);
            auto         mod     = static_cast<Mod>(modID);

            charutils::AddCharMod(PChar, mod, modValue);
            charutils::BuildingCharSkillsTable(PChar);
            charutils::CalculateStats(PChar);
            PChar->UpdateHealth();
            PChar->addHP(PChar->GetMaxHP());
            PChar->addMP(PChar->GetMaxMP());

            PChar->pushPacket(new CCharUpdatePacket(PChar));
            PChar->pushPacket(new CCharStatsPacket(PChar));
            PChar->pushPacket(new CCharSkillsPacket(PChar));

            return 0;
        };

        /* player:getCharMod(modID)
                                                v------------object--------v  v--param0--v  */
        lua["CBaseEntity"]["getCharMod"] = [](CLuaBaseEntity* PLuaBaseEntity, uint16 modID)
        {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
            auto*        PChar   = static_cast<CCharEntity*>(PEntity);
            auto         mod     = static_cast<Mod>(modID);

            return PChar->getCharMod(mod);
        };
    }
};

REGISTER_CPP_MODULE(IvaliceFuncModule);
