/*
# HAVING 句
- GROUP BYによってグループ分けしたものに対してさらに条件を指定して選択する
- WHERE句はあくまでもレコードに対してのみしか条件を指定できない
- GROUP BY句の後ろに書く
- 実行順
    - SELECT FROM WHERE GROUP BY HAVING
- HAVING句に書く事ができる要素
    - 定数
    - 集約関数
    - 集約キー
- 集約キーに対する条件はWHERE句に書く
    - WHEREとHAVINGでは役割が違うので責任を分離させる
        - WHERE：行に対する条件
        - HAVING：グループに対する条件指定
    - WHERE句の方が実行速度が速いため
        - WHERE句はDBMS内部的にソート前に行を絞り込む
        - WHEREはGROUP BYの前に実行するので実行速度アップ
        - WHERE句の条件に指定する列にインデックスを作成することで速度アップ
*/

-- GROUP BYしたものを絞り込むイメージ
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING COUNT(*) = 2;

SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) >= 2500;

-- invalid sql,
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING shohin_mei = 'ボールペン';

-- 集約キーの絞り込みをHAVINGにかけるが、
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui
HAVING shohin_bunrui = 'アクセサリー';

-- WHEREに書くべき
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
WHERE shohin_bunrui = 'アクセサリー'
GROUP BY shohin_bunrui;

