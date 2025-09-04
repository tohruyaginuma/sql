SELECT shohin_id, shohin_mei, shiire_tanka FROM Shohin;

SELECT * FROM Shohin;

SELECT
    shohin_id   AS id,
    shohin_mei  AS name,
    shiire_tanka    AS tanka
FROM Shohin;

SELECT
    shohin_id   AS "商品ID",
    shohin_mei  AS "商品名",
    shiire_tanka    AS "仕入単価"
FROM Shohin;

SELECT '商品' AS mojiretsu, 38 AS kazu, '2009-2-24' AS hizuke, shohin_id, shohin_mei FROM Shohin;

SELECT DISTINCT shohin_bunrui FROM Shohin;

SELECT DISTINCT shiire_tanka FROM Shohin;

SELECT DISTINCT shohin_bunrui, torokubi FROM Shohin;

SELECT shohin_mei, shohin_bunrui
FROM Shohin
WHERE shohin_bunrui = '衣類';

-- 2-2 
SELECT shohin_mei, hanbai_tanka, hanbai_tanka * 2 AS "hanbai_tanka_x2"
FROM Shohin;

SELECT shohin_mei, shohin_bunrui , hanbai_tanka FROM Shohin WHERE hanbai_tanka <> 500;

SELECT shohin_mei, shohin_bunrui, torokubi FROM Shohin WHERE torokubi < '2009-09-29';

-- 計算した結果を比較できる
SELECT shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin WHERE hanbai_tanka - shiire_tanka >= 500;

-- DDL
CREATE TABLE Chars (
    chr CHAR(3) NOT NULL, 
    PRIMARY KEY (chr)
);

-- DML
BEGIN TRANSACTION;

INSERT INTO Chars VALUES ('1');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');

COMMIT;

-- 文字列で検索している点に注意。辞書式に評価される
SELECT chr FROM Chars WHERE chr > '2';

-- NULLに比較演算子は使えない、IS NULL を利用する
SELECT shohin_mei, shiire_tanka FROM Shohin WHERE shiire_tanka = 2800;
SELECT shohin_mei, shiire_tanka FROM Shohin WHERE shiire_tanka IS NULL;

-- NULLでない値を検索する場合
SELECT shohin_mei, shiire_tanka FROM Shohin WHERE shiire_tanka IS NOT NULL;

-- !=を使えるDMBSもあるが、標準ではないので、使わない方が安全

