/*
UPDATE SET
- レコードの更新
- 探索型UPDATE: WHERE句を利用したUPDATE文をそう呼ぶ
-  DMLに属する（INSERT, DELETEと同じ）
*/

UPDATE ShohinIns SET torokubi = '2009-10-10';

SELECT * FROM ShohinIns ORDER BY shohin_id;

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka * 10
WHERE shohin_bunrui = 'キッチン用品';

/*
NULLクリア
- UPDATEを使うことで列をNULLで更新すること
- NOT NULL制約のところには当然使えない
*/
UPDATE ShohinIns
SET torokubi = NULL
WHERE shohin_id = '0007';

/*
複数列のUPDATE
- 2列以上の同時UPDATEが可能
*/
UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka * 10,
    shiire_tanka = shiire_tanka / 2
WHERE shohin_bunrui = 'キッチン用品';

-- ()リストでまとめることもできる
-- しかし、一部のDBMSで利用できないので、リストを使わない方法が安全。
UPDATE ShohinIns
SET (hanbai_tanka, shiire_tanka) = (hanbai_tanka * 10, shiire_tanka / 2)
WHERE shohin_bunrui = 'キッチン用品';