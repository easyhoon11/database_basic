# 별칭 Alias
# 컬럼이나 테이블명을 다른 이름으로 표현하고자 할때 사용

# 컬럼 혹은 테이블명이 길거나, 더 의미있는 이름을 부여하고 싶거나
# 다른 테이블간의 연결을 할때, 혹은 같은 테이블을 여러번 참조할때

USE human_resource;
SELECT 업소명 AS 가게명 
FROM bbq AS 치킨사업테이블;

DROP TABLE employee;

CREATE TABLE department(
	department_name VARCHAR(100) NOT NULL UNIQUE,
    department_tel_number VARCHAR(15) NOT NULL UNIQUE,
    department_address TEXT NOT NULL,
    PRIMARY KEY (department_name)
);

CREATE TABLE employee (
	employee_number VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(10) NOT NULL,
    address TEXT NOT NULL,
    department_name VARCHAR(100),
    PRIMARY KEY (employee_number),
    FOREIGN KEY (department_name) REFERENCES department(department_name)
    );
    
INSERT INTO department VALUES ('기획부', '051-111-1111', '부산광역시');
INSERT INTO department VALUES ('영업부', '051-222-1111', '부산광역시');
INSERT INTO department VALUES ('연구소', '051-333-1111', '부산광역시');
INSERT INTO department VALUES ('인사부', '051-444-1111', '부산광역시');
INSERT INTO department VALUES ('개발부', '051-555-1111', '부산광역시');
INSERT INTO department VALUES ('재무부', '051-666-1111', '부산광역시');
    
INSERT INTO employee VALUES ('3015', '양희정', '부산광역시', '인사부');
INSERT INTO employee VALUES ('3032', '여상길', '부산광역시', '연구소');
INSERT INTO employee VALUES ('3076', '김경훈', '부산광역시', '영업부');
INSERT INTO employee VALUES ('1687', '조창석', '부산광역시', '인사부');
INSERT INTO employee VALUES ('3103', '유정봉', '부산광역시', '기획부');
INSERT INTO employee VALUES ('3110', '이수광', '부산광역시', '인사부');
INSERT INTO employee VALUES ('3133', '박진우', '부산광역시', '연구소');
INSERT INTO employee VALUES ('3138', '이수경', '부산광역시', '인사부');
INSERT INTO employee VALUES ('3141', '이지훈', '부산광역시', '영업부');
INSERT INTO employee VALUES ('3151', '최지선', '부산광역시', '개발부');
INSERT INTO employee VALUES ('2894', '정아름', '부산광역시', NULL);
INSERT INTO employee VALUES ('2939', '김정민', '부산광역시', '연구소');
INSERT INTO employee VALUES ('2375', '김유정', '부산광역시', '기획부');
INSERT INTO employee VALUES ('2861', '정이제', '부산광역시', '개발부');
INSERT INTO employee VALUES ('3263', '이소진', '부산광역시', NULL);
INSERT INTO employee VALUES ('0000', '서지훈', '부산광역시', NULL);
    
SELECT * FROM department;
SELECT * FROM employee;

# JOIN : 두 개 이상의 테이블을 조합하여 검색 결과를 얻고자 할때 사용
# INNER, LEFT, RIGHT, FULL
    
# INNER JOIN - 첫 번째 테이블과 두 번째 테이블의 데이터 중 
#			   조건에 일치하는 데이터만 조합
# SELECT 컬럼명, ... FROM 첫번째테이블 INNER JOIN 두번째테이블 ON 조건
    
SELECT 
	E.employee_number AS '사원번호',
    E.name AS '사원이름', 
    D.department_name AS '부서이름', 
    D.department_tel_number AS '전화번호'
FROM department AS D
INNER JOIN employee AS E
ON D.department_name = E.department_name;

# LEFT JOIN - 첫 번째 테이블에 있는 모든 데이터와 두 번째 테이블에서
#			  조건에 부합하는 데이터만을 조합
# SELECT 컬럼명, ...
# FROM 첫번째테이블 LEFT JOIN 두번째테이블 ON 조건;

SELECT * 
FROM department LEFT JOIN employee
ON department.department_name = employee.department_name;
    
# RIGHT JOIN - 두 번째 테이블에 있는 모든 데이터와 첫 번째 테이블에서
#			   조건에 부합하는 데이터만을 조합
# SELECT 컬럼명, ... 
# FROM 첫번째테이블 RIGHT JOIN 두번째테이블 ON 조건;
SELECT * 
FROM department RIGHT JOIN employee
ON department.department_name = employee.department_name;