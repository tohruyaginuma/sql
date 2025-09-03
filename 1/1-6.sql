-- DML
BEGIN TRANSACTION;

INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣類', 1000, 500, '2009-09-20');
INSERT INTO Shohin VALUES ('0002', 'ジーンズ', '衣類', 3000, 1500, '2009-09-21');
INSERT INTO Shohin VALUES ('0003', 'スニーカー', '靴', 5000, 2500, '2009-09-22');
INSERT INTO Shohin VALUES ('0004', 'キャップ', '帽子', 1200, 600, '2009-09-23');
INSERT INTO Shohin VALUES ('0005', 'リュック', 'バッグ', 3500, 2000, '2009-09-24');
INSERT INTO Shohin VALUES ('0006', 'パーカー', '衣類', 2500, 1200, '2009-09-25');
INSERT INTO Shohin VALUES ('0007', 'サンダル', '靴', 1800, 900, '2009-09-26');
INSERT INTO Shohin VALUES ('0008', 'ベルト', 'アクセサリー', 800, 400, '2009-09-27');

COMMIT

-- Practice
CREATE TABLE Jyushoroku(
    toroku_bango    INTEGER   NOT NULL,
    namae   VARCHAR(128)    NOT NULL,
    Jyushoroku   VARCHAR(256)    NOT NULL,
    tel_no  CHAR(10)    ,
    mail_address  CHAR(20)  , 
    PRIMARY KEY (toroku_bango)
);

ALTER TABLE Jyushoroku ADD COLUMN yubin_bango CHAR(8) NOT NULL;

DROP TABLE Jyushoroku;