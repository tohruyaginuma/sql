CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

DROP VIEW ShohinSum;

-- AS意味ないのではと思ったが、必須。標準SQLによりつけることが定義されている。
-- 理由は、そのサブクエリをテーブルのように扱うから。
SELECT shohin_bunrui, cnt_shohin
FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
FROM Shohin
GROUP BY shohin_bunrui) AS ShohinSum;