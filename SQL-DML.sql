# DML (데이터 조작어)
# 실제 데이터를 삽입, 검색, 수정, 삭제할때 사용됨

# INSERT
# 데이터를 테이블에 삽입할때 사용
# 1. 전체 컬럼에 대하여 삽입
# INSERT INTO 테이블명 VALUES (값1, 값2, ...);
INSERT INTO employee VALUES('20230731001', '홍길동', 30);
# 전체 컬럼에 대한 삽입 작업은 컬럼의 순서와 삽입하고자 하는 데이터의 순서가 일치 해야함
# INSERT INTO employee VALUES(30, '20230731002', '홍길동');
# 전체 컬럼에 대한 삽입 작업은 컬럼의 갯수와 삽입하고자하는 데이터의 갯수가 일치 해야함
# INSERT INTO employee VALUES ('20230731002', '홍길동');

# 2. 특정 컬럼을 지정하여 삽입
# INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
# VALUES (값1, 값2, ...);
INSERT INTO employee (employee_number, name, age)
VALUES ('20230731002', '김철수', 20);

# 컬럼을 지정하여 삽입 작업을 할 때 지정하는 컬럼에는 순서가 없음
# 지정한 컬럼의 순서와 값의 순서는 일치해야함
INSERT INTO employee (age, employee_number, name )
VALUES (20, '20230731002', '김철수');

INSERT INTO employee (age)
VALUES (20);

# UPDATE 
# 테이블에 존재하는 데이터를 수정할 때 사용
# UPDATE 테이블명 SET 컬럼1 = 값1[, 컬럼2 = 값2 ...]
# [WHERE 조건];
UPDATE employee SET age = 10;
UPDATE employee SET age = 15, name = '세종대왕';
UPDATE employee SET employee_number = '20230731003'
WHERE employee_number IS null;

# DELETE
# 테이블에서 데이터를 삭제할때 사용
# DELETE FROM 테이블명 [WHERE 조건];
DELETE FROM employee WHERE employee_number = '20230731001';
DELETE FROM employee;

SELECT * FROM employee; 

# 삭제
# DROP[DDL] / DELETE[DML] / TRUNCATE[DDL]

CREATE TABLE sample(
	num1 INT AUTO_INCREMENT PRIMARY KEY,
    comment1 TEXT
);

INSERT INTO sample (comment1) VALUES ('예시');

DROP TABLE sample;

DELETE FROM sample;

TRUNCATE TABLE sample;

SELECT * FROM sample;

INSERT INTO employee VALUES ('20230731001', '홍길동', 20);
INSERT INTO employee VALUES ('20230731002', '김철수', 26);
INSERT INTO employee VALUES ('20230731003', '이열자', 32);
INSERT INTO employee VALUES ('20230731004', '배철수', null);

# SELECT 
# 테이블에서 데이터를 조회할 때 사용
# 1. 전체 컬럼 및 데이터 조회
# SELECT * FROM 테이블명;
SELECT * FROM employee;

# 2. 특정 컬럼 조회
SELECT age, name FROM employee;

# 3. 특정 로우 조회
SELECT * FROM employee WHERE age = 20;