/*
# ORDER BY
- ORDER BYしてないSQLの戻り値はランダム順
- ORDER BY句のキーになる列名はソートキーと呼ぶ
- 実行順
    - 
*/

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka FROM Shohin ORDER BY hanbai_tanka;