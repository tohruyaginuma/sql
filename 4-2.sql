/*
DELETE
- DROP TABLE 文 テーブル自体を削除する
- DELETE 文 テーブルは残したまま、テーブル内部の全ての行を削除する
*/

-- TABLE全ての行を削除
DELETE FROM ShohinCopy;

/*
探索型 DELETE ： WHERE句で指定した特定のレコードを削除すること
- SELECTと違い下記は使えない
    - GROUP BY
    - HAVING
    - ORDER BY
*/

SELECT * FROM ShohinIns;

SELECT * FROM ShohinIns
WHERE hanbai_tanka >= 4000;

DELETE FROM ShohinIns
WHERE hanbai_tanka >= 4000;

/*
TRUNCATE テーブル内のレコードの全件削除
TRUNCATE <TABLE>
- 一部だけ削除はできない
- DELETEよりも処理が高速
    - DELETEはDMLの中でもかなり遅い文
    - 全件削除ならこちらを使う
- DBMSによってDDLに定義されているので、必ず使う前にドキュメントを確認
*/