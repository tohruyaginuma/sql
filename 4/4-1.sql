/*
INSERT データの登録
- 原則として、一回の実行で1行を追加する
- () : リストと呼ぶ
- INSERT ... SELECTでコピーもできる
*/

CREATE TABLE ShohinIns
(
    shohin_id   CHAR(4) NOT NULL,
    shohin_mei  VARCHAR(100) NOT NULL,
    shohin_bunrui   VARCHAR(32) NOT NULL,
    hanbai_tanka    INTEGER    DEFAULT 0,
    shiire_tanka    INTEGER ,
    torokubi    DATE    ,
    PRIMARY KEY (shohin_id)
);

-- 下記のような()で括った部分のことをリストと呼ぶ
INSERT INTO ShohinIns (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
) VALUES (
    '0001', 'Tシャツ', '衣類', 1000, 500, '2009-09-20'
);

/* 
- 原則として単一行の挿入だが、複数挿入もできる
- テーブルの列名のリストは、全列に対してINSERTを行う場合、省略できる。暗黙で左から順にアサインされる
- 避けることがおすすめ。理由は二つ 
1. 構文エラーの時にどこが間違えてるのか判断しづらくなる
2. 全てのDBMSで利用できるわけではないのでポータビリティが低い
*/
INSERT INTO ShohinIns VALUES 
('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-20'),
('0003', 'カッターシャツ', '衣類', 4000, 2800, NULL),
('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');

/*
ディフォルト値の挿入方法は２種類
1. 明示的な方法 こちらがおすすめ⭐️
2. 暗黙的な方法
*/
INSERT INTO ShohinIns (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
) VALUES (
    '0007', 'おろしがね', 'キッチン用品', DEFAULT, 790, '2009-04-28'
);

INSERT INTO ShohinIns (
    shohin_id, shohin_mei, shohin_bunrui, shiire_tanka, torokubi
) VALUES (
    '0007', 'おろしがね', 'キッチン用品', 790, '2009-04-28'
)

SELECT * FROM ShohinIns WHERE shohin_id = '0007';
DELETE FROM ShohinIns WHERE shohin_id = '0007';

CREATE TABLE ShohinCopy (
    shohin_id   CHAR(4) NOT NULL,
    shohin_mei  VARCHAR(100) NOT NULL,
    shohin_bunrui   VARCHAR(32) NOT NULL,
    hanbai_tanka    INTEGER    ,
    shiire_tanka    INTEGER    ,
    torokubi    DATE    ,
    PRIMARY KEY (shohin_id)
);


-- レコードのコピーも可能
-- 下記のようにテーブルのバックアップをとることも可能
-- INSERT文内のSELECTではWHEREやGROUP BYなどどんなSQLでも使える。ただしORDER BYは効果なし。
INSERT INTO ShohinCopy (
    shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
) SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi FROM ShohinIns;


CREATE TABLE ShohinBunrui(
    shohin_bunrui   VARCHAR(32) NOT NULL,
    sum_hanbai_tanka    INTEGER ,
    sum_shiire_tanka    INTEGER ,
    PRIMARY KEY (shohin_bunrui)
);

INSERT INTO ShohinBunrui(shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
FROM ShohinIns
GROUP BY shohin_bunrui;

UPDATE ShohinSaeki
SET hanbai_tanka = 3000,
    saeki = hanbai_tanka - shiire_tanka
WHERE shohin_mei = 'カッターシャツ';