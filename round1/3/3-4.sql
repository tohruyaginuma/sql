/*
# ORDER BY
- ORDER BYしてないSQLの戻り値はランダム順
- ORDER BY句のキーになる列名はソートキーと呼ぶ
- 実行順
    - FROM, WHERE, GROUPE BY, HAVING, SELECT, ORDER BY
- DESC：降順
- ASC：昇順 * Default（省略した場合、ASCになる）
- ソートしたアイテム内で同じ値があれば、そこはランダム順位なるので、ソートを追加できる
    - 左のソートキーから順にソートされる
- NULLのあるレコードは先頭か末尾にまとめられる（どちらかはDBMSに依存）
- AS ソートキーに別名使える
    - SELECTの後にORDER BYが実行されるため
- テーブルに存在する列であればSELECTに含まれていない句でもORDER BYできる
- 集約関数も使える
- 列番号でソートしてはならない。
    - 列番号：SELECTした項目を左から１、２、３と番号を振ったもの
    - 技術的には可能
    - １、コードが読みにくい
    - ２、標準SQLで削除予定の機能であるため
*/

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin ORDER BY hanbai_tanka;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka DESC;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka ASC;


SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka, shohin_id;

-- ORDER BYでは別名が使える
SELECT shohin_id AS id, shohin_mei, hanbai_tanka AS ht, shiire_tanka
FROM Shohin
ORDER BY ht, id;

-- SELECT外の列も指定可能
SELECT shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin ORDER BY shohin_id;

-- 集約関数によりORDERできる
SELECT shohin_bunrui, COUNT(*) FROM Shohin GROUP BY shohin_bunrui ORDER BY COUNT(*);

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY hanbai_tanka DESC, shohin_id;

-- 列番号の指定。技術的には可能だが避けること
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
FROM Shohin
ORDER BY 3 DESC, 1;