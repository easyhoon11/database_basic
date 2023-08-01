# 제약조건(Constraint)
# 테이블 컬럼의 무결성을 보장해주는 조건

# NOT NULL : 해당 컬럼에 null을 지정할 수 없도록 하는 조건 (필수 값)
# INSERT, UPDATE에 영향을 미침
CREATE TABLE sample_table_1 (
	column1 INT,
    not_null_column INT NOT NULL
);

INSERT INTO sample_table_1 VALUES (1, null);
INSERT INTO sample_table_1 (column1) VALUES (1);
INSERT INTO sample_table_1 VALUES (1, 1);

UPDATE sample_table_1 SET not_null_column = null;

# UNIQUE : 해당 컬럼에 중복되는 값을 가질 수 없도록 하는 조건(중복 제어)
# INSERT, UPDATE에 영향을 미침
CREATE TABLE sample_table_2 (
	column1 INT,
    unique_column INT UNIQUE
);
INSERT INTO sample_table_2 VALUES (1, 1);
INSERT INTO sample_table_2 VALUES (1, 1);
INSERT INTO sample_table_2 VALUES (1, 2);

UPDATE sample_table_2 SET unique_column = 1;

# PRIMARY KEY : 기본키 제약 조건, 해당 컬럼을 기본키(구분자)로 지정
# UNIQUE + NOT NULL
# INSERT, UPDATE, DELETE에 영향을 미침
CREATE TABLE sample_table_3 (
	column1 INT,
    primary_column INT PRIMARY KEY
);

INSERT INTO sample_table_3 VALUES (1, null);
INSERT INTO sample_table_3 VALUES (1, 1);
INSERT INTO sample_table_3 VALUES (1, 1);

CREATE TABLE sample_table_4 (
	primary_column1 INT,
	primary_column2 INT,
    column1 INT,
    CONSTRAINT sample_table_4_pk
    PRIMARY KEY (primary_column1, primary_column2)
);

# FOREIGN KEY : 외래키 제약조건, 해당 컬럼이 외부 테이블의 기본키와 관계가 있음을 나타냄
CREATE TABLE super_table (
	primary_column INT PRIMARY KEY,
    column1 INT
);

CREATE TABLE sub_table (
	column2 INT,
    foreign_column INT,
    CONSTRAINT sub_table_fk
    FOREIGN KEY (foreign_column)
    REFERENCES super_table(primary_column)
    ON UPDATE CASCADE ON DELETE SET NULL
    # ON UPDATE, ON DELETE
    # 수정 및 삭제 작업에 대해서 참조하고 있는 데이터가 변경될때의 작업
    # CASCADE : 참조되어지는 데이터가 변경되면, 참조하는 데이터도 변경되는 것
    # SET NULL : 참조되어지는 데이터가 변경되면, 참조하는 데이터가 null로 변경됨
    # RESTRICT : 참조되어지는 데이터가 변경이 불가능
);

INSERT INTO super_table VALUES (1, 1);
INSERT INTO sub_table VALUES (1, 1);

UPDATE sub_table SET foreign_column = 2;

UPDATE super_table SET primary_column = 2;

DELETE FROM super_table;

SELECT * FROM super_table;
SELECT * FROM sub_table;