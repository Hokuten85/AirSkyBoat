select * from (
SELECT p.itemid, ib.name, sell01, 0 as buy01, p.price, 10 as stock01, sell12, 0 as buy12, p.price12, 10 as stock12
FROM pydarkstar_items p
INNER JOIN item_basic ib
	ON p.itemid = ib.itemid
WHERE NOT EXISTS(SELECT 1 FROM item_equipment ie where ib.itemid = ie.itemId)
and not exists (select 1 from item_weapon iw where ib.itemid = iw.itemId)
and not exists (select 1 from item_puppet ip where ib.itemid = ip.itemId)
and not exists (select 1 from item_furnishing if2 where ib.itemid = if2.itemId)
and not exists (select 1 from item_usable iu where ib.itemid = iu.itemId)
and ib.itemid NOT BETWEEN 0x0200 AND 0x0206
AND ib.aH NOT IN (0, 36, 49, 61)
AND ib.itemid NOT IN (658, 836, 860, 865, 867, 874, 899, 901, 908, 909, 1110, 1272, 1273, 1274, 1275, 1276, 1277, 1279, 1280, 1281, 1282, 1283, 1293, 1295, 1296, 1311, 1312, 1313, 2168, 2169, 2172, 2371, 2372, 2373, 4949,4952,4955,4958,4961,4964,4687,4688,4689,4747,4728,4729,4730,4731,4732,4853,4855,4857,4869,4870,4873,4882,4946,4994)
AND ib.itemid NOT BETWEEN 3444 AND 3492
and ib.itemid NOT BETWEEN 6147 AND 6179
and ib.itemid NOT BETWEEN 6457 AND 8798
and ib.itemid NOT BETWEEN 8930 AND 9878
and ib.itemid not between 1344 and 1403
and ib.itemid not between 1606 and 1613
and ib.itemid not between 1641 and 1648
and ib.itemid not between 2441 and 2458
AND NOT ib.flags & (0x4000 | 0x8000)
AND ib.aH NOT IN (15, 35, 36, 49)
AND NOT ib.flags & 0x80
UNION -- Ranged
SELECT pi2.itemid, ib.name, pi2.sell01, 0 as buy01, 1000 div ib.stackSize as price, 10 as stock01, sell12, 0 as buy12, 1000 as price12, 10 as stock12
FROM item_basic ib
inner join pydarkstar_items pi2 
	on ib.itemid = pi2.itemid 
WHERE aH IN (15, 35, 36, 49)
AND NoSale = 0
AND NOT flags & (0x4000 | 0x8000)
UNION -- fish
SELECT pi2.itemid, ib.name, pi2.sell01, 0 as buy01, price, 10 as stock01, sell12, 0 as buy12, price12, 10 as stock12
FROM item_basic ib
inner join pydarkstar_items pi2 
	on ib.itemid = pi2.itemid 
where ah = 51
AND NoSale = 0
AND NOT flags & (0x4000 | 0x8000)
) a
order by itemid