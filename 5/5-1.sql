CREATE VIEW ShohinSum (shohin_bunrui, cnt_chohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shohin_bunrui, cnt_chohin
FROM ShohinSum;

CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
AS
SELECT *
FROM Shohin
WHERE shohin_bunrui = '事務用品';

INSERT INTO ShohinJim VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- ビュー更新許可のルール
CREATE OR REPLACE RULE insert_rule
AS ON INSERT
TO ShohinJim DO INSTEAD
INSERT INTO Shohin VALUES (
    new.shohin_id,
    new.shohin_mei,
    new.shohin_bunrui,
    new.hanbai_tanka,
    new.shiire_tanka,
    new.torokubi
);

DROP VIEW ShohinSum;

DROP VIEW ShohinSum CASCADE;

DELETE FROM Shohin WHERE shohin_id = '0009';