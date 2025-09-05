/*
- GROUP BY：切り分けて集約できる
- 集約キーにNULLが含まれる場合、集約結果にも不明行として現れる

集約関数とGROUP BY句を使うときの注意点
1. SELECT句にかけるものが限定される
2. GROUP BY句にはSELECT句でつけた列の別名(AS)は使えない。ポスグレでは使えるが通常SQLでない。
3. GROUP BY句は集約結果をソートしない。実行順ではランダム
4. WHERE句に集約関数を書くことはできない。(eg: COUNT,SUM...)

- GROUP BYを使っていない時はテーブル全体を一つのグループとみなす
- テーブルをグループごとにカットするイメージ
- GROUP BYに指定する列を集約キー、グループ化列と呼ぶ
- FROM句の後ろ、WHEREがある場合はその後ろに置く
- NULLが含まれる場合、NULLを１グループとみなす
- WHEREを併用する際の実行順
    - FROM → WHERE → GROUP BY → SELECT
    - この実行順ゆえに、別名ASは利用できない
    - ポスグレでは使えるが通常SQLとは離れる
- 集約時は三つの値しかSELECTできない
    - 定数（テーブルや列とは無関係に固定値を出力）
    - 集約関数
    - 集約キー
- 集約関数をかけるのはSELECT句とHAVING句だけ
- DISTINCTとGROUP BYは重複を排除する点で同じを動作をする。
    - どちらで実現するべきかは現実の問題に対して行うべき。結果だけを考えるのでなく。
    - グループ化が目的なのか、重複の削除が目的なのか。
*/

SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

SELECT shiire_tanka, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;

SELECT shiire_tanka, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = '衣類'
GROUP BY shiire_tanka;

-- invalid sql
SELECT shohin_mei, shiire_tanka, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;

SELECT 100, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;

-- 別名は使えない。ポスグレでは動作する
SELECT shohin_bunrui AS sb, COUNT(*)
FROM Shohin
GROUP BY sb;