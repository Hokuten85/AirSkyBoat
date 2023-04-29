:onCrash
echo [%date% %time%] Restarting BROKER...

Z:
cd Z:\Source\Repos\pydarkstar\bin

python .\broker.py

echo BROKER was stopped or crashed!
GOTO onCrash