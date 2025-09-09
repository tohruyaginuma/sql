BEGIN TRANSACTION;

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = '包丁';

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

COMMIT;


BEGIN TRANSACTION;

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = '包丁';

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

ROLLBACK;

-- 自動コミットモードでは下記のような動きになっている。1行づつトランザクションの開始と終了で囲われている
BEGIN TRANSACTION;

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka - 1000
WHERE shohin_mei = '包丁';

COMMIT;

BEGIN TRANSACTION;

UPDATE ShohinIns
SET hanbai_tanka = hanbai_tanka + 1000
WHERE shohin_mei = 'Tシャツ';

COMMIT;


INSERT INTO ShohinSaeki (
    shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki
) SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
FROM Shohin 
WHERE shohin_id <= '0003';