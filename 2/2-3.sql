-- NOT演算子
SELECT shohin_mei, shohin_bunrui, hanbai_tanka FROM Shohin WHERE hanbai_tanka >= 1000;
SELECT shohin_mei, shohin_bunrui, hanbai_tanka FROM Shohin WHERE NOT hanbai_tanka >= 1000;

/* 
NOTを使うといちいち頭のなかで変換しないといけない
基本は使用を避けて、高度なSQLでのみ利用するイメージで使う
例えば上記は hanbai_tanka < 1000 で表現できる
*/

SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shohin_bunrui = 'アクセサリー'
AND hanbai_tanka >= 500;


SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shohin_bunrui = 'アクセサリー'
OR shohin_bunrui = '靴';

/* OR演算子よりもAND演算子が優先される
この場合、靴で9/22と9/24の商品がヒットする */
SELECT shohin_bunrui
FROM Shohin
WHERE shohin_bunrui = '靴'
AND torokubi = '2009-09-22'
OR torokubi = '2009-09-24';

/* ORを優先したい場合()を使用
靴かつ9/22 or 9/24の商品 */
SELECT shohin_bunrui
FROM Shohin
WHERE shohin_bunrui = '靴'
AND (torokubi = '2009-09-22'
OR torokubi = '2009-09-24');

/*
SQLは３論理で考える。
TRUE FALSE UNKNOWN
なるべくNULLを値に入れないこと
*/

-- 2.1
SELECT shohin_mei, torokubi
FROM Shohin
WHERE torokubi >= '2009-04-28';

-- 2.2
-- すべてUNKNOWN NULL

-- 2.3
-- 2.4
SELECT shohin_mei, shohin_bunrui
FROM Shohin
WHERE hanbai_tanka - hanbai_tanka * 0.9 > 100
AND shohin_bunrui = '靴';