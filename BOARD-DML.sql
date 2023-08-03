USE sample_board_2;

# 회원가입 SQL
INSERT INTO user (email, password, nickname, tel_number, address, address_detail, agreed_personal)
VALUES ('email3@email.com', 'qlalfqjsgh', 'nickname3', '0111111113', '부산광역시 부산진구', '에이원프라자', true);

SELECT *FROM user;

# 로그인 SQL
SELECT *FROM user
WHERE email = 'email@email.com' AND password = 'qlalfqjsgh';

# 게시물 쓰기 SQL
INSERT INTO board (title, contents, writer_email)
VALUES ('제목6', '내용6', 'email2@email.com');

# 게시물 수정 SQL
UPDATE board SET title = '수정 제목', contents = '수정 내용' WHERE board_number = 1;

# 게시물 삭제 SQL
DELETE FROM board WHERE board_number = 1;

# 댓글 작성 SQL
INSERT INTO comment (board_number, user_email, content)
VALUES (4, 'email2@email.com', '안녕하세요');

# 좋아요 등록 SQL
INSERT INTO favorite VALUES (3, 'email@email.com');

# 좋아요 취소 SQL
DELETE FROM favorite 
WHERE board_number = 2 AND user_email = 'email.com';

# 최신게시물 불러오기 SQL
SELECT 
	B.board_number,
    B.title,
    B.contents,
    B.write_datetime,
    B.view_count,
    U.nickname,
    U.profile_image
FROM board AS B INNER JOIN user AS U
ON B.writer_email = U.email
ORDER BY B.write_datetime DESC;

# 검색 게시물 리스트 불러오기 SQL
SELECT
	B.board_number,
    B.title,
    B.contents,
    B.write_datetime,
    B.view_count,
    U.nickname,
    U.profile_image 
FROM board AS B INNER JOIN user AS U
ON B.writer_email = U.email
WHERE B.title LIKE '%4%'
ORDER BY B.write_datetime DESC;

# 특정 유저가 작성한 게시물 리스트 불러오기 SQL
SELECT
	B.board_number,
    B.title,
    B.contents,
    B.write_datetime,
    B.view_count,
    U.nickname,
    U.profile_image
FROM board AS B INNER JOIN user AS U
ON B.writer_email = U.email
WHERE B.writer_email = 'email@email.com'
ORDER BY B.write_datetime DESC;

# 게시물 번호가 2번인 게시물을 조회
# (게시물 번호, 제목, 내용, 작성날짜, 작성자이메일, 작성자 닉네임, 작성자 프로필사진)
SELECT
	B.board_number,
    B.title,
    B.contents,
    B.write_datetime,
    B.writer_email,
    U.nickname,
    U.profile_image
FROM board AS B INNER JOIN user AS U
ON B.writer_email = U.email
WHERE B.board_number = 2;