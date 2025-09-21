/*
- 集約関数はNULLを除外して集計
- COUNT(*)のみNULLを含める
- 重複を省く場合、DISTINCTキーワードを使う

# 集約関数、集合関数
- COUNT： テーブルのレコード数を数える、引数によって動作が変わる
- SUM：テーブルの数値列のデータを合計する。数値の列のみ
- AVG：テーブルの数値列のデータを平均する。数値の列のみ
- MAX：テーブルの任意の列のデータの最大値を求める。どんなデータ型でもいける
- MIN：テーブルの任意の列のデータの最小値を求める。どんなデータ型でもいける

- 四則演算ではNULLは無視されるが集約関数は計算前に全てNULLを無視する
- COUNT(*)は例外
- DISTINCTは集約関数全てに適用可能
*/

-- NULL込みで全件検索
SELECT COUNT(*) FROM Shohin;

-- NULLを除外してカウントする場合、特定のカラムを選択
SELECT COUNT(shiire_tanka) FROM Shohin;

SELECT SUM(hanbai_tanka) FROM Shohin;
SELECT SUM(hanbai_tanka), SUM(shiire_tanka) FROM Shohin;

SELECT AVG(hanbai_tanka), AVG(shiire_tanka) FROM Shohin;

SELECT MAX(hanbai_tanka), MIN(shiire_tanka) FROM Shohin;

-- 最初にshohin_bunrui列の重複を除外し、行数を数える
SELECT COUNT(DISTINCT shohin_bunrui) FROM Shohin;

-- 行数を数えた結果の重複を除外する。つまり意味ない
SELECT DISTINCT COUNT(shohin_bunrui) FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka) FROM Shohin;