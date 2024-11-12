drop database elk;
create database elk;
use elk;

create table user
(
    uid      int auto_increment primary key,
    name     varchar(10),
    email    varchar(50) unique,
    password varchar(255),
    interest varchar(100),
    company  varchar(100),
    role     varchar(10),
    birth    varchar(20)
);

create table question
(
    qid      int auto_increment primary key,
    uid      int,
    interest varchar(100),
    title    varchar(255),
    content  varchar(255),
    category varchar(50),
    createAt date,
    updateAt date,
    great    int,
    foreign key (uid) references user (uid)
);

create table comment
(
    cid      int auto_increment primary key,
    uid      int,
    qid      int,
    content  varchar(255),
    createAt date,
    updateAt date,
    foreign key (uid) references user (uid),
    foreign key (qid) references question (qid)
);

create table tag
(
    tid   int primary key,
    tname varchar(30)
);

create table question_tag
(
    qid int,
    tid int,
    primary key (tid, qid),
    foreign key (qid) references question (qid) on delete cascade,
    foreign key (tid) references tag (tid)
);

-- 사용자
INSERT INTO user (uid, name, email, password, interest, company, role, birth)
VALUES (null, 'account1', 'user1@example.com', 'password1', '프로그래밍', 'NAVER', 'customer', '1990-01-01'),
       (null, 'account2', 'user2@example.com', 'password2', '인공지능', 'NEXON', 'customer', '1992-02-02'),
       (null, 'account3', 'user3@example.com', 'password3', '빅데이터', 'AMAZON', 'customer', '1994-03-03'),
       (null, 'account4', 'user4@example.com', 'password4', '사물인터넷', 'APPLE', 'customer', '1996-04-04'),
       (null, 'account5', 'user5@example.com', 'password5', '모바일 개발', 'GOOGLE', 'customer', '1998-05-05'),
       (null, 'account6', 'user6@example.com', 'password6', '클라우드 컴퓨팅', 'MICROSOFT', 'customer', '2000-06-06'),
       (null, 'account7', 'user7@example.com', 'password7', '데이터 분석', 'SAMSUNG', 'customer', '2002-07-07'),
       (null, 'account8', 'user8@example.com', 'password8', '디지털 마케팅', 'TESLA', 'customer', '2004-08-08'),
       (null, 'account9', 'user9@example.com', 'password9', '머신러닝', 'IBM', 'customer', '2006-09-09'),
       (null, 'account10', 'user10@example.com', 'password10', '블록체인', 'ORACLE', 'customer', '2008-10-10'),
       (null, 'account11', 'user11@example.com', 'password11', '네트워크 보안', 'SONY', 'customer', '1988-01-01'),
       (null, 'account12', 'user12@example.com', 'password12', '웹 개발', 'LG', 'customer', '1989-02-02'),
       (null, 'account13', 'user13@example.com', 'password13', '데이터베이스', 'FACEBOOK', 'customer', '1991-03-03'),
       (null, 'account14', 'user14@example.com', 'password14', '로봇공학', 'SPACEX', 'customer', '1993-04-04'),
       (null, 'account15', 'user15@example.com', 'password15', '하드웨어 설계', 'AMAZON', 'customer', '1995-05-05'),
       (null, 'account16', 'user16@example.com', 'password16', '소프트웨어 엔지니어링', 'APPLE', 'customer', '1997-06-06'),
       (null, 'account17', 'user17@example.com', 'password17', '컴퓨터 비전', 'NEXON', 'customer', '1999-07-07'),
       (null, 'account18', 'user18@example.com', 'password18', '모바일 앱 디자인', 'NAVER', 'customer', '2001-08-08'),
       (null, 'account19', 'user19@example.com', 'password19', '게임 개발', 'NETFLIX', 'customer', '2003-09-09'),
       (null, 'account20', 'user20@example.com', 'password20', '가상현실', 'DISNEY', 'customer', '2005-10-10'),
       (null, 'account21', 'user21@example.com', 'password21', '증강현실', 'TESLA', 'customer', '1987-11-11'),
       (null, 'account22', 'user22@example.com', 'password22', '사이버 보안', 'GOOGLE', 'customer', '1986-12-12'),
       (null, 'account23', 'user23@example.com', 'password23', '기계 학습', 'MICROSOFT', 'customer', '1985-01-13'),
       (null, 'account24', 'user24@example.com', 'password24', '기계 설계', 'APPLE', 'customer', '1984-02-14'),
       (null, 'account25', 'user25@example.com', 'password25', '프로젝트 관리', 'SONY', 'customer', '1983-03-15'),
       (null, 'account26', 'user26@example.com', 'password26', '유저 경험 디자인', 'AMAZON', 'customer', '1982-04-16'),
       (null, 'account27', 'user27@example.com', 'password27', '데이터 시각화', 'NEXON', 'customer', '1981-05-17'),
       (null, 'account28', 'user28@example.com', 'password28', '사운드 엔지니어링', 'NAVER', 'customer', '1980-06-18'),
       (null, 'account29', 'user29@example.com', 'password29', '영상 편집', 'APPLE', 'customer', '1979-07-19'),
       (null, 'account30', 'user30@example.com', 'password30', '클라우드 보안', 'GOOGLE', 'customer', '1978-08-20'),
       (null, 'account31', 'user31@example.com', 'password31', '데이터 분석', 'MICROSOFT', 'customer', '1987-01-21'),
       (null, 'account32', 'user32@example.com', 'password32', '경영 분석', 'TESLA', 'customer', '1986-02-22'),
       (null, 'account33', 'user33@example.com', 'password33', '시스템 관리', 'FACEBOOK', 'customer', '1985-03-23'),
       (null, 'account34', 'user34@example.com', 'password34', '백엔드 개발', 'SPACEX', 'customer', '1984-04-24'),
       (null, 'account35', 'user35@example.com', 'password35', '프론트엔드 개발', 'SONY', 'customer', '1983-05-25'),
       (null, 'account36', 'user36@example.com', 'password36', '기술 지원', 'NAVER', 'customer', '1982-06-26'),
       (null, 'account37', 'user37@example.com', 'password37', 'AI 연구', 'DISNEY', 'customer', '1981-07-27'),
       (null, 'account38', 'user38@example.com', 'password38', '그래픽 디자인', 'NETFLIX', 'customer', '1980-08-28'),
       (null, 'account39', 'user39@example.com', 'password39', '네트워크 엔지니어링', 'APPLE', 'customer', '1979-09-29'),
       (null, 'account40', 'user40@example.com', 'password40', 'DB 관리', 'ORACLE', 'customer', '1978-10-30'),
       (null, 'account41', 'user41@example.com', 'password41', '소프트웨어 테스팅', 'GOOGLE', 'customer', '1977-11-01'),
       (null, 'account42', 'user42@example.com', 'password42', '품질 관리', 'IBM', 'customer', '1976-12-02'),
       (null, 'account43', 'user43@example.com', 'password43', 'IT 컨설팅', 'LG', 'customer', '1975-01-03'),
       (null, 'account44', 'user44@example.com', 'password44', 'R&D', 'NEXON', 'customer', '1974-02-04'),
       (null, 'account45', 'user45@example.com', 'password45', '클라우드 컴퓨팅', 'NAVER', 'customer', '1973-03-05'),
       (null, 'account46', 'user46@example.com', 'password46', '블록체인', 'APPLE', 'customer', '1972-04-06'),
       (null, 'account47', 'user47@example.com', 'password47', '게임 엔진 개발', 'SPACEX', 'customer', '1971-05-07'),
       (null, 'account48', 'user48@example.com', 'password48', '인공지능 챗봇', 'TESLA', 'customer', '1970-06-08'),
       (null, 'account49', 'user49@example.com', 'password49', '소프트웨어 아키텍처', 'MICROSOFT', 'customer', '1969-07-09'),
       (null, 'account50', 'user50@example.com', 'password50', '보안 엔지니어링', 'SONY', 'customer', '1968-08-10'),
       (null, 'account51', 'user51@example.com', 'password51', '프로그래밍', 'NAVER', 'customer', '1990-01-01'),
       (null, 'account52', 'user52@example.com', 'password52', '인공지능', 'NEXON', 'customer', '1991-02-02'),
       (null, 'account53', 'user53@example.com', 'password53', '데이터베이스', 'AMAZON', 'customer', '1992-03-03'),
       (null, 'account54', 'user54@example.com', 'password54', '네트워크', 'APPLE', 'customer', '1993-04-04'),
       (null, 'account55', 'user55@example.com', 'password55', '보안', 'GOOGLE', 'customer', '1994-05-05'),
       (null, 'account56', 'user56@example.com', 'password56', '웹 개발', 'MICROSOFT', 'customer', '1995-06-06'),
       (null, 'account57', 'user57@example.com', 'password57', '모바일 개발', 'SAMSUNG', 'customer', '1996-07-07'),
       (null, 'account58', 'user58@example.com', 'password58', '빅데이터', 'TESLA', 'customer', '1997-08-08'),
       (null, 'account59', 'user59@example.com', 'password59', '클라우드 컴퓨팅', 'IBM', 'customer', '1998-09-09'),
       (null, 'account60', 'user60@example.com', 'password60', '사물인터넷(IoT)', 'ORACLE', 'customer', '1999-10-10'),
       (null, 'account61', 'user61@example.com', 'password61', '블록체인', 'SONY', 'customer', '2000-11-11'),
       (null, 'account62', 'user62@example.com', 'password62', '머신러닝', 'LG', 'customer', '2001-12-12'),
       (null, 'account63', 'user63@example.com', 'password63', '딥러닝', 'FACEBOOK', 'customer', '2002-01-01'),
       (null, 'account64', 'user64@example.com', 'password64', '데이터 분석', 'SPACEX', 'customer', '2003-02-02'),
       (null, 'account65', 'user65@example.com', 'password65', '컴퓨터 그래픽스', 'NETFLIX', 'customer', '2004-03-03'),
       (null, 'account66', 'user66@example.com', 'password66', '게임 개발', 'DISNEY', 'customer', '2005-04-04'),
       (null, 'account67', 'user67@example.com', 'password67', '운영체제', 'INTEL', 'customer', '2006-05-05'),
       (null, 'account68', 'user68@example.com', 'password68', '소프트웨어 엔지니어링', 'AMD', 'customer', '2007-06-06'),
       (null, 'account69', 'user69@example.com', 'password69', '자연어 처리(NLP)', 'CISCO', 'customer', '2008-07-07'),
       (null, 'account70', 'user70@example.com', 'password70', '로보틱스', 'DELL', 'customer', '2009-08-08'),
       (null, 'account71', 'user71@example.com', 'password71', '경영학', 'UBER', 'customer', '1980-09-09'),
       (null, 'account72', 'user72@example.com', 'password72', '경제학', 'AIRBNB', 'customer', '1981-10-10'),
       (null, 'account73', 'user73@example.com', 'password73', '심리학', 'PAYPAL', 'customer', '1982-11-11'),
       (null, 'account74', 'user74@example.com', 'password74', '사회학', 'TWITTER', 'customer', '1983-12-12'),
       (null, 'account75', 'user75@example.com', 'password75', '교육학', 'SNAP', 'customer', '1984-01-01'),
       (null, 'account76', 'user76@example.com', 'password76', '문학', 'SHOPIFY', 'customer', '1985-02-02'),
       (null, 'account77', 'user77@example.com', 'password77', '역사', 'SQUARE', 'customer', '1986-03-03'),
       (null, 'account78', 'user78@example.com', 'password78', '철학', 'SPOTIFY', 'customer', '1987-04-04'),
       (null, 'account79', 'user79@example.com', 'password79', '미술', 'TIKTOK', 'customer', '1988-05-05'),
       (null, 'account80', 'user80@example.com', 'password80', '음악', 'REDDIT', 'customer', '1989-06-06'),
       (null, 'account81', 'user81@example.com', 'password81', '영화', 'PINTEREST', 'customer', '1990-07-07'),
       (null, 'account82', 'user82@example.com', 'password82', '생물학', 'YOUTUBE', 'customer', '1991-08-08'),
       (null, 'account83', 'user83@example.com', 'password83', '화학', 'INSTAGRAM', 'customer', '1992-09-09'),
       (null, 'account84', 'user84@example.com', 'password84', '물리학', 'WHATSAPP', 'customer', '1993-10-10'),
       (null, 'account85', 'user85@example.com', 'password85', '천문학', 'GITHUB', 'customer', '1994-11-11'),
       (null, 'account86', 'user86@example.com', 'password86', '지구과학', 'SLACK', 'customer', '1995-12-12'),
       (null, 'account87', 'user87@example.com', 'password87', '의학', 'ZOOM', 'customer', '1996-01-01'),
       (null, 'account88', 'user88@example.com', 'password88', '약학', 'LINKEDIN', 'customer', '1997-02-02'),
       (null, 'account89', 'user89@example.com', 'password89', '간호학', 'TINDER', 'customer', '1998-03-03'),
       (null, 'account90', 'user90@example.com', 'password90', '법학', 'MATCH', 'customer', '1999-04-04'),
       (null, 'account91', 'user91@example.com', 'password91', '프로그래밍', 'SALESFORCE', 'customer', '1980-01-01'),
       (null, 'account92', 'user92@example.com', 'password92', '인공지능', 'BROADCOM', 'customer', '1981-02-02'),
       (null, 'account93', 'user93@example.com', 'password93', '데이터베이스', 'SERVICENOW', 'customer', '1982-03-03'),
       (null, 'account94', 'user94@example.com', 'password94', '네트워크', 'AT&T', 'customer', '1983-04-04'),
       (null, 'account95', 'user95@example.com', 'password95', '보안', 'SPRINT', 'customer', '1984-05-05'),
       (null, 'account96', 'user96@example.com', 'password96', '웹 개발', 'AMERICAN EXPRESS', 'customer', '1985-06-06'),
       (null, 'account97', 'user97@example.com', 'password97', '모바일 개발', 'VERIZON', 'customer', '1986-07-07'),
       (null, 'account98', 'user98@example.com', 'password98', '빅데이터', 'BOSTON DYNAMICS', 'customer', '1987-08-08'),
       (null, 'account99', 'user99@example.com', 'password99', '클라우드 컴퓨팅', 'WAYMO', 'customer', '1988-09-09'),
       (null, 'account100', 'user100@example.com', 'password100', '사물인터넷(IoT)', 'EPIC GAMES', 'customer', '1989-10-10'),
       (null, 'account101', 'user101@example.com', 'password101', '프로그래밍', 'PALANTIR', 'customer', '1980-01-01'),
       (null, 'account102', 'user102@example.com', 'password102', '인공지능', 'INTUIT', 'customer', '1981-02-02'),
       (null, 'account103', 'user103@example.com', 'password103', '데이터베이스', 'SALESFORCE', 'customer', '1982-03-03'),
       (null, 'account104', 'user104@example.com', 'password104', '네트워크', 'T-MOBILE', 'customer', '1983-04-04'),
       (null, 'account105', 'user105@example.com', 'password105', '보안', 'ZENDESK', 'customer', '1984-05-05'),
       (null, 'account106', 'user106@example.com', 'password106', '웹 개발', 'INTEL', 'customer', '1985-06-06'),
       (null, 'account107', 'user107@example.com', 'password107', '모바일 개발', 'QUALCOMM', 'customer', '1986-07-07'),
       (null, 'account108', 'user108@example.com', 'password108', '빅데이터', 'SPOTIFY', 'customer', '1987-08-08'),
       (null, 'account109', 'user109@example.com', 'password109', '클라우드 컴퓨팅', 'UBER', 'customer', '1988-09-09'),
       (null, 'account110', 'user110@example.com', 'password110', '사물인터넷(IoT)', 'AIRBNB', 'customer', '1989-10-10'),
       (null, 'account111', 'user111@example.com', 'password111', '블록체인', 'TESLA', 'customer', '1990-11-11'),
       (null, 'account112', 'user112@example.com', 'password112', '머신러닝', 'LYFT', 'customer', '1991-12-12'),
       (null, 'account113', 'user113@example.com', 'password113', '딥러닝', 'DOORDASH', 'customer', '1992-01-01'),
       (null, 'account114', 'user114@example.com', 'password114', '데이터 분석', 'SHOPIFY', 'customer', '1993-02-02'),
       (null, 'account115', 'user115@example.com', 'password115', '컴퓨터 그래픽스', 'DROPBOX', 'customer', '1994-03-03'),
       (null, 'account116', 'user116@example.com', 'password116', '게임 개발', 'SLACK', 'customer', '1995-04-04'),
       (null, 'account117', 'user117@example.com', 'password117', '운영체제', 'ZOOM', 'customer', '1996-05-05'),
       (null, 'account118', 'user118@example.com', 'password118', '소프트웨어 엔지니어링', 'PINTEREST', 'customer', '1997-06-06'),
       (null, 'account119', 'user119@example.com', 'password119', '자연어 처리(NLP)', 'INSTAGRAM', 'customer', '1998-07-07'),
       (null, 'account120', 'user120@example.com', 'password120', '로보틱스', 'YOUTUBE', 'customer', '1999-08-08'),
       (null, 'account121', 'user121@example.com', 'password121', '경영학', 'REDDIT', 'customer', '1980-09-09'),
       (null, 'account122', 'user122@example.com', 'password122', '경제학', 'TIKTOK', 'customer', '1981-10-10'),
       (null, 'account123', 'user123@example.com', 'password123', '심리학', 'TWITTER', 'customer', '1982-11-11'),
       (null, 'account124', 'user124@example.com', 'password124', '사회학', 'SPACEX', 'customer', '1983-12-12'),
       (null, 'account125', 'user125@example.com', 'password125', '교육학', 'BLUE ORIGIN', 'customer', '1984-01-01'),
       (null, 'account126', 'user126@example.com', 'password126', '문학', 'GITHUB', 'customer', '1985-02-02'),
       (null, 'account127', 'user127@example.com', 'password127', '역사', 'VIMEO', 'customer', '1986-03-03'),
       (null, 'account128', 'user128@example.com', 'password128', '철학', 'PATREON', 'customer', '1987-04-04'),
       (null, 'account129', 'user129@example.com', 'password129', '미술', 'KICKSTARTER', 'customer', '1988-05-05'),
       (null, 'account130', 'user130@example.com', 'password130', '음악', 'PAYPAL', 'customer', '1989-06-06'),
       (null, 'account131', 'user131@example.com', 'password131', '영화', 'SOFI', 'customer', '1990-07-07'),
       (null, 'account132', 'user132@example.com', 'password132', '생물학', 'CLOUDFLARE', 'customer', '1991-08-08'),
       (null, 'account133', 'user133@example.com', 'password133', '화학', 'CISCO', 'customer', '1992-09-09'),
       (null, 'account134', 'user134@example.com', 'password134', '물리학', 'VERIZON', 'customer', '1993-10-10'),
       (null, 'account135', 'user135@example.com', 'password135', '천문학', 'AMERICAN EXPRESS', 'customer', '1994-11-11'),
       (null, 'account136', 'user136@example.com', 'password136', '지구과학', 'PELOTON', 'customer', '1995-12-12'),
       (null, 'account137', 'user137@example.com', 'password137', '의학', 'DRAFTKINGS', 'customer', '1996-01-01'),
       (null, 'account138', 'user138@example.com', 'password138', '약학', 'FANDUEL', 'customer', '1997-02-02'),
       (null, 'account139', 'user139@example.com', 'password139', '간호학', 'BOSTON DYNAMICS', 'customer', '1998-03-03'),
       (null, 'account140', 'user140@example.com', 'password140', '법학', 'WAYMO', 'customer', '1999-04-04'),
       (null, 'account141', 'user141@example.com', 'password141', '프로그래밍', 'EPIC GAMES', 'customer', '1980-05-05'),
       (null, 'account142', 'user142@example.com', 'password142', '인공지능', 'NVIDIA', 'customer', '1981-06-06'),
       (null, 'account143', 'user143@example.com', 'password143', '데이터베이스', 'VMWARE', 'customer', '1982-07-07'),
       (null, 'account144', 'user144@example.com', 'password144', '네트워크', 'SAP', 'customer', '1983-08-08'),
       (null, 'account145', 'user145@example.com', 'password145', '보안', 'RED HAT', 'customer', '1984-09-09'),
       (null, 'account146', 'user146@example.com', 'password146', '웹 개발', 'DROPBOX', 'customer', '1985-10-10'),
       (null, 'account147', 'user147@example.com', 'password147', '모바일 개발', 'ADOBE', 'customer', '1986-11-11'),
       (null, 'account148', 'user148@example.com', 'password148', '빅데이터', 'ORACLE', 'customer', '1987-12-12'),
       (null, 'account149', 'user149@example.com', 'password149', '클라우드 컴퓨팅', 'SNAPCHAT', 'customer', '1988-01-01'),
       (null, 'account150', 'user150@example.com', 'password150', '사물인터넷(IoT)', 'PINTEREST', 'customer', '1989-02-02'),
       (null, 'account151', 'user151@example.com', 'password151', '프로그래밍', 'TESLA', 'customer', '1980-01-01'),
       (null, 'account152', 'user152@example.com', 'password152', '인공지능', 'META', 'customer', '1981-02-02'),
       (null, 'account153', 'user153@example.com', 'password153', '데이터베이스', 'IBM', 'customer', '1982-03-03'),
       (null, 'account154', 'user154@example.com', 'password154', '네트워크', 'VISA', 'customer', '1983-04-04'),
       (null, 'account155', 'user155@example.com', 'password155', '보안', 'INTEL', 'customer', '1984-05-05'),
       (null, 'account156', 'user156@example.com', 'password156', '웹 개발', 'MICROSOFT', 'customer', '1985-06-06'),
       (null, 'account157', 'user157@example.com', 'password157', '모바일 개발', 'AMAZON', 'customer', '1986-07-07'),
       (null, 'account158', 'user158@example.com', 'password158', '빅데이터', 'APPLE', 'customer', '1987-08-08'),
       (null, 'account159', 'user159@example.com', 'password159', '클라우드 컴퓨팅', 'ORACLE', 'customer', '1988-09-09'),
       (null, 'account160', 'user160@example.com', 'password160', '사물인터넷(IoT)', 'ALPHABET', 'customer', '1989-10-10'),
       (null, 'account161', 'user161@example.com', 'password161', '블록체인', 'DISNEY', 'customer', '1990-11-11'),
       (null, 'account162', 'user162@example.com', 'password162', '머신러닝', 'NETFLIX', 'customer', '1991-12-12'),
       (null, 'account163', 'user163@example.com', 'password163', '딥러닝', 'SPOTIFY', 'customer', '1992-01-01'),
       (null, 'account164', 'user164@example.com', 'password164', '데이터 분석', 'UBER', 'customer', '1993-02-02'),
       (null, 'account165', 'user165@example.com', 'password165', '컴퓨터 그래픽스', 'T-MOBILE', 'customer', '1994-03-03'),
       (null, 'account166', 'user166@example.com', 'password166', '게임 개발', 'DROPBOX', 'customer', '1995-04-04'),
       (null, 'account167', 'user167@example.com', 'password167', '운영체제', 'ZENDESK', 'customer', '1996-05-05'),
       (null, 'account168', 'user168@example.com', 'password168', '소프트웨어 엔지니어링', 'LINKEDIN', 'customer', '1997-06-06'),
       (null, 'account169', 'user169@example.com', 'password169', '자연어 처리(NLP)', 'YELP', 'customer', '1998-07-07'),
       (null, 'account170', 'user170@example.com', 'password170', '로보틱스', 'REDDIT', 'customer', '1999-08-08'),
       (null, 'account171', 'user171@example.com', 'password171', '경영학', 'AIRBNB', 'customer', '1980-09-09'),
       (null, 'account172', 'user172@example.com', 'password172', '경제학', 'TWITTER', 'customer', '1981-10-10'),
       (null, 'account173', 'user173@example.com', 'password173', '심리학', 'SALESFORCE', 'customer', '1982-11-11'),
       (null, 'account174', 'user174@example.com', 'password174', '사회학', 'PAYPAL', 'customer', '1983-12-12'),
       (null, 'account175', 'user175@example.com', 'password175', '교육학', 'SHOPIFY', 'customer', '1984-01-01'),
       (null, 'account176', 'user176@example.com', 'password176', '문학', 'TESLA', 'customer', '1985-02-02'),
       (null, 'account177', 'user177@example.com', 'password177', '역사', 'ZOOM', 'customer', '1986-03-03'),
       (null, 'account178', 'user178@example.com', 'password178', '철학', 'SLACK', 'customer', '1987-04-04'),
       (null, 'account179', 'user179@example.com', 'password179', '미술', 'PINTEREST', 'customer', '1988-05-05'),
       (null, 'account180', 'user180@example.com', 'password180', '음악', 'GITHUB', 'customer', '1989-06-06'),
       (null, 'account181', 'user181@example.com', 'password181', '영화', 'TIKTOK', 'customer', '1990-07-07'),
       (null, 'account182', 'user182@example.com', 'password182', '생물학', 'SPACEX', 'customer', '1991-08-08'),
       (null, 'account183', 'user183@example.com', 'password183', '화학', 'BROADCOM', 'customer', '1992-09-09'),
       (null, 'account184', 'user184@example.com', 'password184', '물리학', 'KLA', 'customer', '1993-10-10'),
       (null, 'account185', 'user185@example.com', 'password185', '천문학', 'LYFT', 'customer', '1994-11-11'),
       (null, 'account186', 'user186@example.com', 'password186', '지구과학', 'COINBASE', 'customer', '1995-12-12'),
       (null, 'account187', 'user187@example.com', 'password187', '의학', 'SQUARE', 'customer', '1996-01-01'),
       (null, 'account188', 'user188@example.com', 'password188', '약학', 'INTUIT', 'customer', '1997-02-02'),
       (null, 'account189', 'user189@example.com', 'password189', '간호학', 'ADOBE', 'customer', '1998-03-03'),
       (null, 'account190', 'user190@example.com', 'password190', '법학', 'VERIZON', 'customer', '1999-04-04'),
       (null, 'account191', 'user191@example.com', 'password191', '프로그래밍', 'SONY', 'customer', '1980-05-05'),
       (null, 'account192', 'user192@example.com', 'password192', '인공지능', 'META', 'customer', '1981-06-06'),
       (null, 'account193', 'user193@example.com', 'password193', '데이터베이스', 'TENCENT', 'customer', '1982-07-07'),
       (null, 'account194', 'user194@example.com', 'password194', '네트워크', 'CISCO', 'customer', '1983-08-08'),
       (null, 'account195', 'user195@example.com', 'password195', '보안', 'RED HAT', 'customer', '1984-09-09'),
       (null, 'account196', 'user196@example.com', 'password196', '웹 개발', 'VIMEO', 'customer', '1985-10-10'),
       (null, 'account197', 'user197@example.com', 'password197', '모바일 개발', 'AT&T', 'customer', '1986-11-11'),
       (null, 'account198', 'user198@example.com', 'password198', '빅데이터', 'IBM', 'customer', '1987-12-12'),
       (null, 'account199', 'user199@example.com', 'password199', '클라우드 컴퓨팅', 'DELL', 'customer', '1988-01-01'),
       (null, 'account200', 'user200@example.com', 'password200', '사물인터넷(IoT)', 'HP', 'customer', '1989-02-02'),
       (null, 'account201', 'user201@example.com', 'password201', '프로그래밍', 'SHOPIFY', 'customer', '1980-01-01'),
       (null, 'account202', 'user202@example.com', 'password202', '인공지능', 'COINBASE', 'customer', '1981-02-02'),
       (null, 'account203', 'user203@example.com', 'password203', '데이터베이스', 'DROPBOX', 'customer', '1982-03-03'),
       (null, 'account204', 'user204@example.com', 'password204', '네트워크', 'SPOTIFY', 'customer', '1983-04-04'),
       (null, 'account205', 'user205@example.com', 'password205', '보안', 'ZENDESK', 'customer', '1984-05-05'),
       (null, 'account206', 'user206@example.com', 'password206', '웹 개발', 'INTEL', 'customer', '1985-06-06'),
       (null, 'account207', 'user207@example.com', 'password207', '모바일 개발', 'QUALCOMM', 'customer', '1986-07-07'),
       (null, 'account208', 'user208@example.com', 'password208', '빅데이터', 'RED HAT', 'customer', '1987-08-08'),
       (null, 'account209', 'user209@example.com', 'password209', '클라우드 컴퓨팅', 'SLACK', 'customer', '1988-09-09'),
       (null, 'account210', 'user210@example.com', 'password210', '사물인터넷(IoT)', 'UBER', 'customer', '1989-10-10'),
       (null, 'account211', 'user211@example.com', 'password211', '블록체인', 'LYFT', 'customer', '1990-11-11'),
       (null, 'account212', 'user212@example.com', 'password212', '머신러닝', 'PINTEREST', 'customer', '1991-12-12'),
       (null, 'account213', 'user213@example.com', 'password213', '딥러닝', 'GITHUB', 'customer', '1992-01-01'),
       (null, 'account214', 'user214@example.com', 'password214', '데이터 분석', 'YOUTUBE', 'customer', '1993-02-02'),
       (null, 'account215', 'user215@example.com', 'password215', '컴퓨터 그래픽스', 'INSTAGRAM', 'customer', '1994-03-03'),
       (null, 'account216', 'user216@example.com', 'password216', '게임 개발', 'DISNEY', 'customer', '1995-04-04'),
       (null, 'account217', 'user217@example.com', 'password217', '운영체제', 'AMAZON', 'customer', '1996-05-05'),
       (null, 'account218', 'user218@example.com', 'password218', '소프트웨어 엔지니어링', 'APPLE', 'customer', '1997-06-06'),
       (null, 'account219', 'user219@example.com', 'password219', '자연어 처리(NLP)', 'NETFLIX', 'customer', '1998-07-07'),
       (null, 'account220', 'user220@example.com', 'password220', '로보틱스', 'IBM', 'customer', '1999-08-08'),
       (null, 'account221', 'user221@example.com', 'password221', '경영학', 'META', 'customer', '1980-09-09'),
       (null, 'account222', 'user222@example.com', 'password222', '경제학', 'GOOGLE', 'customer', '1981-10-10'),
       (null, 'account223', 'user223@example.com', 'password223', '심리학', 'TIKTOK', 'customer', '1982-11-11'),
       (null, 'account224', 'user224@example.com', 'password224', '사회학', 'SALESFORCE', 'customer', '1983-12-12'),
       (null, 'account225', 'user225@example.com', 'password225', '교육학', 'AIRBNB', 'customer', '1984-01-01'),
       (null, 'account226', 'user226@example.com', 'password226', '문학', 'TWITTER', 'customer', '1985-02-02'),
       (null, 'account227', 'user227@example.com', 'password227', '역사', 'SNAPCHAT', 'customer', '1986-03-03'),
       (null, 'account228', 'user228@example.com', 'password228', '철학', 'SHOPIFY', 'customer', '1987-04-04'),
       (null, 'account229', 'user229@example.com', 'password229', '미술', 'SPACEX', 'customer', '1988-05-05'),
       (null, 'account230', 'user230@example.com', 'password230', '음악', 'TESLA', 'customer', '1989-06-06'),
       (null, 'account231', 'user231@example.com', 'password231', '영화', 'VIMEO', 'customer', '1990-07-07'),
       (null, 'account232', 'user232@example.com', 'password232', '생물학', 'PAYPAL', 'customer', '1991-08-08'),
       (null, 'account233', 'user233@example.com', 'password233', '화학', 'PATREON', 'customer', '1992-09-09'),
       (null, 'account234', 'user234@example.com', 'password234', '물리학', 'SQUARE', 'customer', '1993-10-10'),
       (null, 'account235', 'user235@example.com', 'password235', '천문학', 'ZOOM', 'customer', '1994-11-11'),
       (null, 'account236', 'user236@example.com', 'password236', '지구과학', 'SOFI', 'customer', '1995-12-12'),
       (null, 'account237', 'user237@example.com', 'password237', '의학', 'KICKSTARTER', 'customer', '1996-01-01'),
       (null, 'account238', 'user238@example.com', 'password238', '약학', 'GITHUB', 'customer', '1997-02-02'),
       (null, 'account239', 'user239@example.com', 'password239', '간호학', 'PINTEREST', 'customer', '1998-03-03'),
       (null, 'account240', 'user240@example.com', 'password240', '법학', 'SPOTIFY', 'customer', '1999-04-04'),
       (null, 'account241', 'user241@example.com', 'password241', '프로그래밍', 'VISA', 'customer', '1980-05-05'),
       (null, 'account242', 'user242@example.com', 'password242', '인공지능', 'RED HAT', 'customer', '1981-06-06'),
       (null, 'account243', 'user243@example.com', 'password243', '데이터베이스', 'INTUIT', 'customer', '1982-07-07'),
       (null, 'account244', 'user244@example.com', 'password244', '네트워크', 'T-MOBILE', 'customer', '1983-08-08'),
       (null, 'account245', 'user245@example.com', 'password245', '보안', 'COINBASE', 'customer', '1984-09-09'),
       (null, 'account246', 'user246@example.com', 'password246', '웹 개발', 'ADOBE', 'customer', '1985-10-10'),
       (null, 'account247', 'user247@example.com', 'password247', '모바일 개발', 'VMWARE', 'customer', '1986-11-11'),
       (null, 'account248', 'user248@example.com', 'password248', '빅데이터', 'NVIDIA', 'customer', '1987-12-12'),
       (null, 'account249', 'user249@example.com', 'password249', '클라우드 컴퓨팅', 'KLA', 'customer', '1988-01-01'),
       (null, 'account250', 'user250@example.com', 'password250', '사물인터넷(IoT)', 'EPIC GAMES', 'customer', '1989-02-02'),
       (null, 'account251', 'user251@example.com', 'password251', '프로그래밍', 'ZOOM', 'customer', '1980-01-01'),
       (null, 'account252', 'user252@example.com', 'password252', '인공지능', 'HONEYWELL', 'customer', '1981-02-02'),
       (null, 'account253', 'user253@example.com', 'password253', '데이터베이스', 'NOKIA', 'customer', '1982-03-03'),
       (null, 'account254', 'user254@example.com', 'password254', '네트워크', 'DELL', 'customer', '1983-04-04'),
       (null, 'account255', 'user255@example.com', 'password255', '보안', 'VMWARE', 'customer', '1984-05-05'),
       (null, 'account256', 'user256@example.com', 'password256', '웹 개발', 'HEWLETT PACKARD', 'customer', '1985-06-06'),
       (null, 'account257', 'user257@example.com', 'password257', '모바일 개발', 'PELOTON', 'customer', '1986-07-07'),
       (null, 'account258', 'user258@example.com', 'password258', '빅데이터', 'BOSTON DYNAMICS', 'customer', '1987-08-08'),
       (null, 'account259', 'user259@example.com', 'password259', '클라우드 컴퓨팅', 'HP', 'customer', '1988-09-09'),
       (null, 'account260', 'user260@example.com', 'password260', '사물인터넷(IoT)', 'JOHNSON & JOHNSON', 'customer',
        '1989-10-10'),
       (null, 'account261', 'user261@example.com', 'password261', '블록체인', 'PROCTER & GAMBLE', 'customer', '1990-11-11'),
       (null, 'account262', 'user262@example.com', 'password262', '머신러닝', 'KRAFT HEINZ', 'customer', '1991-12-12'),
       (null, 'account263', 'user263@example.com', 'password263', '딥러닝', 'PFIZER', 'customer', '1992-01-01'),
       (null, 'account264', 'user264@example.com', 'password264', '데이터 분석', 'UNILEVER', 'customer', '1993-02-02'),
       (null, 'account265', 'user265@example.com', 'password265', '컴퓨터 그래픽스', 'CATERPILLAR', 'customer', '1994-03-03'),
       (null, 'account266', 'user266@example.com', 'password266', '게임 개발', 'BOEING', 'customer', '1995-04-04'),
       (null, 'account267', 'user267@example.com', 'password267', '운영체제', 'LOCKHEED MARTIN', 'customer', '1996-05-05'),
       (null, 'account268', 'user268@example.com', 'password268', '소프트웨어 엔지니어링', 'RAYTHEON', 'customer', '1997-06-06'),
       (null, 'account269', 'user269@example.com', 'password269', '자연어 처리(NLP)', 'GENERAL ELECTRIC', 'customer',
        '1998-07-07'),
       (null, 'account270', 'user270@example.com', 'password270', '로보틱스', '3M', 'customer', '1999-08-08'),
       (null, 'account271', 'user271@example.com', 'password271', '경영학', 'CISCO', 'customer', '1980-09-09'),
       (null, 'account272', 'user272@example.com', 'password272', '경제학', 'ADOBE', 'customer', '1981-10-10'),
       (null, 'account273', 'user273@example.com', 'password273', '심리학', 'INTEL', 'customer', '1982-11-11'),
       (null, 'account274', 'user274@example.com', 'password274', '사회학', 'APPLE', 'customer', '1983-12-12'),
       (null, 'account275', 'user275@example.com', 'password275', '교육학', 'AMAZON', 'customer', '1984-01-01'),
       (null, 'account276', 'user276@example.com', 'password276', '문학', 'GOOGLE', 'customer', '1985-02-02'),
       (null, 'account277', 'user277@example.com', 'password277', '역사', 'META', 'customer', '1986-03-03'),
       (null, 'account278', 'user278@example.com', 'password278', '철학', 'FACEBOOK', 'customer', '1987-04-04'),
       (null, 'account279', 'user279@example.com', 'password279', '미술', 'DISNEY', 'customer', '1988-05-05'),
       (null, 'account280', 'user280@example.com', 'password280', '음악', 'MICROSOFT', 'customer', '1989-06-06'),
       (null, 'account281', 'user281@example.com', 'password281', '영화', 'IBM', 'customer', '1990-07-07'),
       (null, 'account282', 'user282@example.com', 'password282', '생물학', 'SONY', 'customer', '1991-08-08'),
       (null, 'account283', 'user283@example.com', 'password283', '화학', 'ORACLE', 'customer', '1992-09-09'),
       (null, 'account284', 'user284@example.com', 'password284', '물리학', 'SPOTIFY', 'customer', '1993-10-10'),
       (null, 'account285', 'user285@example.com', 'password285', '천문학', 'TWITTER', 'customer', '1994-11-11'),
       (null, 'account286', 'user286@example.com', 'password286', '지구과학', 'REDDIT', 'customer', '1995-12-12'),
       (null, 'account287', 'user287@example.com', 'password287', '의학', 'LINKEDIN', 'customer', '1996-01-01'),
       (null, 'account288', 'user288@example.com', 'password288', '약학', 'SALESFORCE', 'customer', '1997-02-02'),
       (null, 'account289', 'user289@example.com', 'password289', '간호학', 'TESLA', 'customer', '1998-03-03'),
       (null, 'account290', 'user290@example.com', 'password290', '법학', 'SNAPCHAT', 'customer', '1999-04-04'),
       (null, 'account291', 'user291@example.com', 'password291', '프로그래밍', 'PAYPAL', 'customer', '1980-05-05'),
       (null, 'account292', 'user292@example.com', 'password292', '인공지능', 'ZOOM', 'customer', '1981-06-06'),
       (null, 'account293', 'user293@example.com', 'password293', '데이터베이스', 'TIKTOK', 'customer', '1982-07-07'),
       (null, 'account294', 'user294@example.com', 'password294', '네트워크', 'SPACEX', 'customer', '1983-08-08'),
       (null, 'account295', 'user295@example.com', 'password295', '보안', 'NETFLIX', 'customer', '1984-09-09'),
       (null, 'account296', 'user296@example.com', 'password296', '웹 개발', 'UBER', 'customer', '1985-10-10'),
       (null, 'account297', 'user297@example.com', 'password297', '모바일 개발', 'AIRBNB', 'customer', '1986-11-11'),
       (null, 'account298', 'user298@example.com', 'password298', '빅데이터', 'COINBASE', 'customer', '1987-12-12'),
       (null, 'account299', 'user299@example.com', 'password299', '클라우드 컴퓨팅', 'ADOBE', 'customer', '1988-01-01'),
       (null, 'account300', 'user300@example.com', 'password300', '사물인터넷(IoT)', 'INTUIT', 'customer', '1989-02-02');

-- 질문 추가
INSERT INTO question (qid, uid, interest, title, content, category, createAt, updateAt, great)
VALUES (null, 1, '프로그래밍', '자바 기초 질문', '자바 변수 선언 방법이 궁금합니다.', '질문답변', '2024-01-01', '2024-01-01', 0),
       (null, 2, '프로그래밍', '자바스크립트 비동기 질문', '동기와 비동기가 정확히 무엇인가요?', '질문답변', '2024-01-02', '2024-01-02', 5),
       (null, 2, '인공지능', '딥러닝과 머신러닝 차이점', '두 개념의 차이를 알고 싶습니다.', '질문답변', '2024-01-02', '2024-01-02', 0),
       (null, 3, '데이터베이스', 'SQL과 NoSQL의 차이', '어떤 상황에서 각 DB를 사용하나요?', '질문답변', '2024-01-03', '2024-01-03', 0),
       (null, 4, '프로그래밍', '리액트와 뷰의 차이', '리액트와 뷰 중 어떤 것이 더 효율적인가요?', '자유 게시판', '2024-01-04', '2024-01-04', 0),
       (null, 5, '네트워크', 'OSI 7계층 설명', 'OSI 모델의 각 계층에 대해 설명해주세요.', '질문답변', '2024-01-05', '2024-01-05', 0),
       (null, 6, '보안', 'XSS와 CSRF 차이', '두 보안 취약점의 차이점을 설명해주세요.', '질문답변', '2024-01-06', '2024-01-06', 0),
       (null, 7, '알고리즘', '버블 정렬의 시간 복잡도', '버블 정렬의 시간 복잡도를 알고 싶습니다.', '질문답변', '2024-01-07', '2024-01-07', 0),
       (null, 8, '모바일 개발', '안드로이드와 iOS 개발 차이', '안드로이드와 iOS 개발의 차이점이 궁금합니다.', '자유 게시판', '2024-01-08', '2024-01-08', 0),
       (null, 9, '클라우드 컴퓨팅', 'AWS와 Azure 비교', 'AWS와 Azure의 차이점을 알고 싶습니다.', '질문답변', '2024-01-09', '2024-01-09', 0),
       (null, 10, '데이터 과학', '빅데이터와 데이터 과학', '두 개념의 차이와 적용 예를 알고 싶습니다.', '자유 게시판', '2024-01-10', '2024-01-10', 0),
       (null, 11, '머신러닝', '회귀분석과 분류의 차이', '회귀와 분류의 차이점을 설명해주세요.', '질문답변', '2024-01-11', '2024-01-11', 0),
       (null, 12, '프로그래밍', 'RESTful API란?', 'RESTful API의 개념을 알고 싶습니다.', '자유 게시판', '2024-01-12', '2024-01-12', 0),
       (null, 13, '운영체제', '쓰레드와 프로세스 차이', '쓰레드와 프로세스의 차이점을 설명해주세요.', '질문답변', '2024-01-13', '2024-01-13', 0),
       (null, 14, '프로그래밍', '자바스크립트 클로저 개념', '자바스크립트 클로저의 원리가 궁금합니다.', '자유 게시판', '2024-01-14', '2024-01-14', 0),
       (null, 15, '컴퓨터 비전', 'OpenCV 사용법', 'OpenCV로 이미지를 분석하는 방법을 알고 싶습니다.', '질문답변', '2024-01-15', '2024-01-15', 0),
       (null, 16, '인공지능', 'GAN의 구조', 'GAN의 기본 구조와 원리를 설명해주세요.', '질문답변', '2024-01-16', '2024-01-16', 0),
       (null, 17, '데이터 분석', '파이썬으로 데이터 시각화', '파이썬으로 데이터 시각화를 하는 방법이 궁금합니다.', '자유 게시판', '2024-01-17', '2024-01-17', 0),
       (null, 18, '컴퓨터 그래픽스', '렌더링 엔진의 역할', '렌더링 엔진이 어떤 역할을 하는지 궁금합니다.', '질문답변', '2024-01-18', '2024-01-18', 0),
       (null, 19, '네트워크', 'TCP와 UDP 차이', 'TCP와 UDP의 차이점을 설명해주세요.', '자유 게시판', '2024-01-19', '2024-01-19', 0),
       (null, 20, '보안', '암호화와 해싱의 차이', '암호화와 해싱의 개념 차이를 알고 싶습니다.', '질문답변', '2024-01-20', '2024-01-20', 0),
       (null, 21, '프로그래밍', 'CSS Flexbox 사용법', 'Flexbox로 레이아웃을 잡는 방법을 알고 싶습니다.', '질문답변', '2024-01-21', '2024-01-21', 0),
       (null, 22, '알고리즘', '이진 탐색의 시간 복잡도', '이진 탐색의 시간 복잡도를 설명해주세요.', '자유 게시판', '2024-01-22', '2024-01-22', 0),
       (null, 23, '모바일 개발', 'React Native와 Flutter 비교', 'React Native와 Flutter의 차이점을 알고 싶습니다.', '질문답변', '2024-01-23',
        '2024-01-23', 0),
       (null, 24, '클라우드 컴퓨팅', '서버리스 컴퓨팅', '서버리스 컴퓨팅의 개념을 알고 싶습니다.', '자유 게시판', '2024-01-24', '2024-01-24', 0),
       (null, 25, '머신러닝', 'KNN 알고리즘의 원리', 'KNN 알고리즘의 원리를 설명해주세요.', '질문답변', '2024-01-25', '2024-01-25', 0),
       (null, 26, '프로그래밍', 'API와 SDK의 차이', 'API와 SDK의 차이를 설명해주세요.', '자유 게시판', '2024-01-26', '2024-01-26', 0),
       (null, 27, '운영체제', '데드락이란?', '데드락의 원인과 해결 방법이 궁금합니다.', '질문답변', '2024-01-27', '2024-01-27', 0),
       (null, 28, '프로그래밍', '파이썬과 자바 비교', '파이썬과 자바의 장단점 비교가 궁금합니다.', '자유 게시판', '2024-01-28', '2024-01-28', 0),
       (null, 29, '컴퓨터 비전', '이미지 분류 모델', '이미지 분류 모델을 만드는 방법을 알고 싶습니다.', '질문답변', '2024-01-29', '2024-01-29', 0),
       (null, 30, '데이터 분석', '빅데이터와 통계 차이', '빅데이터와 통계의 차이를 설명해주세요.', '질문답변', '2024-01-30', '2024-01-30', 0),
       (null, 31, '프로그래밍', 'Java의 상속 개념', '상속을 어떻게 사용하는지 알고 싶습니다.', '질문답변', '2024-02-01', '2024-02-01', 0),
       (null, 32, '데이터베이스', '데이터베이스 인덱스의 역할', '인덱스가 왜 필요한지 설명해주세요.', '질문답변', '2024-02-02', '2024-02-02', 0),
       (null, 33, '인공지능', '강화학습 기초', '강화학습의 개념과 사례가 궁금합니다.', '질문답변', '2024-02-03', '2024-02-03', 0),
       (null, 34, '프로그래밍', 'CSS Grid와 Flexbox 차이', '두 레이아웃 방식의 차이를 설명해주세요.', '자유 게시판', '2024-02-04', '2024-02-04', 0),
       (null, 35, '네트워크', 'VPN이란 무엇인가?', 'VPN의 원리와 사용법을 알고 싶습니다.', '질문답변', '2024-02-05', '2024-02-05', 0),
       (null, 36, '보안', 'SQL Injection 방어 방법', 'SQL 인젝션을 방어하는 방법이 궁금합니다.', '질문답변', '2024-02-06', '2024-02-06', 0),
       (null, 37, '알고리즘', '퀵 정렬의 동작 원리', '퀵 정렬이 어떻게 작동하는지 설명해주세요.', '자유 게시판', '2024-02-07', '2024-02-07', 0),
       (null, 38, '모바일 개발', 'iOS와 안드로이드 앱 차이', '두 플랫폼 앱 개발의 차이점을 알고 싶습니다.', '질문답변', '2024-02-08', '2024-02-08', 0),
       (null, 39, '클라우드 컴퓨팅', '클라우드 보안 위험', '클라우드 사용 시 보안 리스크가 무엇인가요?', '질문답변', '2024-02-09', '2024-02-09', 0),
       (null, 40, '데이터 과학', '탐색적 데이터 분석 (EDA)', 'EDA의 절차와 유용성에 대해 설명해주세요.', '자유 게시판', '2024-02-10', '2024-02-10', 0),
       (null, 41, '머신러닝', '의사결정나무의 작동 원리', '의사결정나무 알고리즘이 어떻게 작동하는지 설명해주세요.', '질문답변', '2024-02-11', '2024-02-11', 0),
       (null, 42, '프로그래밍', '마이크로서비스 아키텍처', '마이크로서비스의 장단점이 궁금합니다.', '자유 게시판', '2024-02-12', '2024-02-12', 0),
       (null, 43, '운영체제', '캐시 메모리 역할', '캐시 메모리가 어떤 역할을 하는지 알고 싶습니다.', '질문답변', '2024-02-13', '2024-02-13', 0),
       (null, 44, '프로그래밍', 'C++와 파이썬 성능 차이', 'C++와 파이썬의 성능 차이에 대해 알고 싶습니다.', '자유 게시판', '2024-02-14', '2024-02-14', 0),
       (null, 45, '컴퓨터 비전', '객체 탐지 기술', '컴퓨터 비전에서 객체 탐지를 어떻게 구현하는지 설명해주세요.', '질문답변', '2024-02-15', '2024-02-15', 0),
       (null, 46, '인공지능', 'CNN의 구조와 원리', 'CNN의 기본 원리를 알고 싶습니다.', '질문답변', '2024-02-16', '2024-02-16', 0),
       (null, 47, '데이터 분석', 'R과 파이썬 비교', '데이터 분석에서 R과 파이썬의 장단점이 궁금합니다.', '자유 게시판', '2024-02-17', '2024-02-17', 0),
       (null, 48, '컴퓨터 그래픽스', '쉐이더 프로그래밍', '쉐이더 프로그래밍이 무엇인지 설명해주세요.', '질문답변', '2024-02-18', '2024-02-18', 0),
       (null, 49, '네트워크', 'IP 주소와 포트', 'IP 주소와 포트가 어떻게 동작하는지 궁금합니다.', '자유 게시판', '2024-02-19', '2024-02-19', 0),
       (null, 50, '보안', 'VPN 보안성', 'VPN이 어떻게 보안을 강화하는지 알고 싶습니다.', '질문답변', '2024-02-20', '2024-02-20', 0),
       (null, 51, '프론트엔드', '웹 접근성의 중요성', '웹 접근성이 왜 중요한지 알고 싶습니다.', '질문답변', '2024-02-21', '2024-02-21', 0),
       (null, 52, '알고리즘', '최소 신장 트리 원리', '최소 신장 트리가 어떻게 작동하는지 궁금합니다.', '자유 게시판', '2024-02-22', '2024-02-22', 0),
       (null, 53, '모바일 개발', '앱 내 결제 시스템 구현', '안드로이드에서 인앱 결제를 구현하는 방법이 궁금합니다.', '질문답변', '2024-02-23', '2024-02-23', 0),
       (null, 54, '클라우드 컴퓨팅', '클라우드에서의 DevOps', '클라우드 환경에서 DevOps를 어떻게 사용하는지 설명해주세요.', '자유 게시판', '2024-02-24',
        '2024-02-24', 0),
       (null, 55, '머신러닝', 'SVM 알고리즘 설명', 'SVM 알고리즘의 작동 원리를 설명해주세요.', '질문답변', '2024-02-25', '2024-02-25', 0),
       (null, 56, '프로그래밍', '세션과 JWT 차이', '세션과 JWT 인증 방식의 차이를 알고 싶습니다.', '자유 게시판', '2024-02-26', '2024-02-26', 0),
       (null, 57, '운영체제', '멀티태스킹과 멀티프로세싱', '두 개념의 차이점과 사용 사례가 궁금합니다.', '질문답변', '2024-02-27', '2024-02-27', 0),
       (null, 58, '프로그래밍', '정규 표현식 기본', '정규 표현식을 어떻게 사용하는지 궁금합니다.', '자유 게시판', '2024-02-28', '2024-02-28', 0),
       (null, 59, '컴퓨터 비전', '이미지 세그멘테이션', '이미지 세그멘테이션이 어떻게 이루어지는지 설명해주세요.', '질문답변', '2024-02-29', '2024-02-29', 0),
       (null, 60, '데이터 분석', 'EDA와 PCA 차이', '탐색적 데이터 분석과 주성분 분석의 차이를 설명해주세요.', '질문답변', '2024-03-01', '2024-03-01', 0),
       (null, 6, '프로그래밍', '파이썬 변수 종류', '파이썬에서 변수의 종류에 대해 알고 싶습니다.', '질문답변', '2024-04-11', '2024-04-11', 0),
       (null, 7, '인공지능', '딥러닝에서 활성화 함수', '딥러닝에서 어떤 활성화 함수를 사용하는지 궁금합니다.', '자유 게시판', '2024-04-12', '2024-04-12', 5),
       (null, 8, '네트워크', 'VPN과 방화벽 차이', 'VPN과 방화벽이 어떻게 다른지 설명해주세요.', '질문답변', '2024-04-13', '2024-04-13', 0),
       (null, 9, '운영체제', 'Linux의 기본 명령어', 'Linux에서 자주 쓰이는 명령어가 궁금합니다.', '질문답변', '2024-04-14', '2024-04-14', 1),
       (null, 10, '머신러닝', 'K-means 클러스터링 원리', 'K-means 알고리즘의 작동 방식을 알고 싶습니다.', '질문답변', '2024-04-15', '2024-04-15', 0),
       (null, 11, '데이터 과학', 'R 프로그래밍 언어의 장점', '데이터 분석에서 R을 사용하는 이유가 궁금합니다.', '자유 게시판', '2024-04-16', '2024-04-16', 0),
       (null, 12, '보안', 'HTTPS 보안 프로토콜', 'HTTPS 프로토콜이 보안을 어떻게 강화하는지 궁금합니다.', '질문답변', '2024-04-17', '2024-04-17', 0),
       (null, 13, '알고리즘', '힙 정렬의 원리', '힙 정렬의 작동 방식을 알고 싶습니다.', '질문답변', '2024-04-18', '2024-04-18', 0),
       (null, 14, '프론트엔드', 'React의 상태 관리', 'React에서 상태를 관리하는 방법이 궁금합니다.', '질문답변', '2024-04-19', '2024-04-19', 3),
       (null, 15, '컴퓨터 그래픽스', '3D 그래픽스의 기본', '3D 그래픽스를 시작하려면 무엇을 공부해야 하나요?', '자유 게시판', '2024-04-20', '2024-04-20', 0),
       (null, 16, '네트워크', '웹소켓과 HTTP 차이', '웹소켓이 HTTP와 어떻게 다른지 알고 싶습니다.', '질문답변', '2024-04-21', '2024-04-21', 1),
       (null, 17, '머신러닝', 'LSTM 모델의 작동 원리', 'LSTM 모델이 어떻게 작동하는지 궁금합니다.', '질문답변', '2024-04-22', '2024-04-22', 2),
       (null, 18, '데이터 분석', 'EDA와 데이터 정제의 차이', '탐색적 데이터 분석과 데이터 정제가 어떻게 다른가요?', '자유 게시판', '2024-04-23', '2024-04-23',
        0),
       (null, 19, '클라우드 컴퓨팅', '컨테이너와 가상 머신 비교', '컨테이너와 가상 머신의 차이점이 궁금합니다.', '질문답변', '2024-04-24', '2024-04-24', 0),
       (null, 20, '프로그래밍', 'SQL 쿼리의 성능 최적화', 'SQL 쿼리를 최적화하는 방법이 궁금합니다.', '질문답변', '2024-04-25', '2024-04-25', 1),
       (null, 21, '컴퓨터 비전', 'OpenCV의 활용 사례', 'OpenCV를 활용한 사례가 궁금합니다.', '질문답변', '2024-04-26', '2024-04-26', 0),
       (null, 22, '프론트엔드', 'Vue의 컴포넌트 통신', 'Vue.js에서 컴포넌트 간 통신 방법이 궁금합니다.', '자유 게시판', '2024-04-27', '2024-04-27', 3),
       (null, 23, '운영체제', 'Linux 파일 시스템 구조', 'Linux의 파일 시스템 구조에 대해 알고 싶습니다.', '질문답변', '2024-04-28', '2024-04-28', 0),
       (null, 24, '보안', '해싱과 암호화 차이', '해싱과 암호화의 차이가 무엇인가요?', '질문답변', '2024-04-29', '2024-04-29', 0),
       (null, 25, '네트워크', '라우팅 프로토콜의 종류', '라우팅 프로토콜에는 어떤 종류가 있나요?', '질문답변', '2024-04-30', '2024-04-30', 0),
       (null, 26, '컴퓨터 비전', 'YOLO와 Faster R-CNN 비교', 'YOLO와 Faster R-CNN의 차이가 궁금합니다.', '질문답변', '2024-05-01',
        '2024-05-01', 2),
       (null, 27, '인공지능', '자연어 처리의 응용', '자연어 처리가 어디에 사용되는지 궁금합니다.', '질문답변', '2024-05-02', '2024-05-02', 1),
       (null, 28, '알고리즘', '알고리즘의 복잡도 분석', '알고리즘 복잡도 분석 방법이 궁금합니다.', '자유 게시판', '2024-05-03', '2024-05-03', 3),
       (null, 29, '데이터베이스', 'NoSQL 데이터베이스의 장단점', 'NoSQL의 장점과 단점이 궁금합니다.', '질문답변', '2024-05-04', '2024-05-04', 0),
       (null, 30, '프로그래밍', '자바스크립트 클로저 활용', '자바스크립트 클로저의 활용 방법이 궁금합니다.', '자유 게시판', '2024-05-05', '2024-05-05', 4),
       (null, 31, '머신러닝', '과적합 방지 방법', '머신러닝에서 과적합을 방지하려면 어떻게 해야 하나요?', '질문답변', '2024-05-06', '2024-05-06', 0),
       (null, 32, '클라우드 컴퓨팅', '하이브리드 클라우드란?', '하이브리드 클라우드의 개념을 알고 싶습니다.', '자유 게시판', '2024-05-07', '2024-05-07', 1),
       (null, 33, '프로그래밍', '컴파일러와 인터프리터의 차이', '컴파일러와 인터프리터의 차이를 설명해주세요.', '질문답변', '2024-05-08', '2024-05-08', 2),
       (null, 34, '네트워크', 'IP 주소 체계', 'IPv4와 IPv6의 차이점이 궁금합니다.', '질문답변', '2024-05-09', '2024-05-09', 0),
       (null, 35, '프론트엔드', '웹 성능 최적화 방법', '웹 페이지의 성능을 최적화하는 방법이 궁금합니다.', '자유 게시판', '2024-05-10', '2024-05-10', 5),
       (null, 36, '데이터 분석', '데이터 전처리 기법', '데이터 전처리 기법에는 어떤 것이 있나요?', '질문답변', '2024-05-11', '2024-05-11', 0),
       (null, 37, '보안', '공개 키와 개인 키 차이', '공개 키와 개인 키의 차이를 설명해주세요.', '질문답변', '2024-05-12', '2024-05-12', 2),
       (null, 38, '머신러닝', '군집화와 분류의 차이', '군집화와 분류는 어떻게 다른가요?', '질문답변', '2024-05-13', '2024-05-13', 0),
       (null, 39, '알고리즘', '그래프의 최소 신장 트리', '그래프의 최소 신장 트리를 만드는 방법이 궁금합니다.', '자유 게시판', '2024-05-14', '2024-05-14', 3),
       (null, 40, '프로그래밍', 'Python과 C++ 성능 비교', 'Python과 C++ 성능 차이가 어떻게 되나요?', '질문답변', '2024-05-15', '2024-05-15', 0),
       (null, 41, '프론트엔드', '웹 접근성 개선 방법', '웹 접근성을 개선하는 방법이 궁금합니다.', '질문답변', '2024-05-16', '2024-05-16', 1),
       (null, 42, '컴퓨터 그래픽스', '쉐이더 프로그래밍 개념', '쉐이더 프로그래밍이 무엇인가요?', '질문답변', '2024-05-17', '2024-05-17', 0),
       (null, 43, '운영체제', '스레드 관리와 컨텍스트 스위칭', '스레드 관리와 컨텍스트 스위칭이 무엇인가요?', '질문답변', '2024-05-18', '2024-05-18', 0),
       (null, 44, '클라우드 컴퓨팅', '클라우드 보안 전략', '클라우드 환경에서 보안을 강화하는 방법이 궁금합니다.', '자유 게시판', '2024-05-19', '2024-05-19', 2),
       (null, 45, '네트워크', '네트워크 계층과 프로토콜', '네트워크 계층별로 사용되는 프로토콜을 알고 싶습니다.', '질문답변', '2024-05-20', '2024-05-20', 0),
       (null, 13, '프로그래밍', 'Python 리스트와 튜플 차이', 'Python에서 리스트와 튜플의 차이점을 알고 싶습니다.', '질문답변', '2024-05-21', '2024-05-21', 3),
       (null, 14, '네트워크', 'NAT와 PAT 차이', 'NAT와 PAT의 차이점이 궁금합니다.', '자유 게시판', '2024-05-22', '2024-05-22', 2),
       (null, 15, '데이터베이스', '데이터 정규화란?', '데이터베이스에서 정규화의 개념과 필요성에 대해 설명해주세요.', '질문답변', '2024-05-23', '2024-05-23', 0),
       (null, 16, '알고리즘', '동적 프로그래밍과 분할 정복', '두 알고리즘 기법의 차이점이 무엇인가요?', '자유 게시판', '2024-05-24', '2024-05-24', 4),
       (null, 17, '보안', 'MD5와 SHA 암호화 차이', 'MD5와 SHA 암호화 방식의 차이를 알고 싶습니다.', '질문답변', '2024-05-25', '2024-05-25', 1),
       (null, 18, '프로그래밍', '자바 예외 처리', '자바에서 예외 처리를 어떻게 구현하나요?', '질문답변', '2024-05-26', '2024-05-26', 0),
       (null, 19, '데이터 과학', '빅데이터에서 샘플링', '빅데이터 분석에서 샘플링의 중요성을 알고 싶습니다.', '자유 게시판', '2024-05-27', '2024-05-27', 3),
       (null, 20, '머신러닝', '의사결정 나무의 특징', '의사결정 나무 알고리즘의 특징을 설명해주세요.', '질문답변', '2024-05-28', '2024-05-28', 5),
       (null, 21, '프론트엔드', 'CSS 변환과 전환 차이', 'CSS의 변환과 전환의 차이를 알고 싶습니다.', '질문답변', '2024-05-29', '2024-05-29', 1),
       (null, 22, '운영체제', 'CPU 스케줄링 알고리즘 비교', '라운드 로빈과 SJF 알고리즘의 차이점을 설명해주세요.', '질문답변', '2024-05-30', '2024-05-30', 4),
       (null, 23, '네트워크', '로드 밸런서의 역할', '로드 밸런서가 어떤 역할을 하는지 궁금합니다.', '자유 게시판', '2024-06-01', '2024-06-01', 2),
       (null, 24, '알고리즘', 'DFS와 BFS의 차이점', 'DFS와 BFS 탐색 알고리즘의 차이를 알고 싶습니다.', '질문답변', '2024-06-02', '2024-06-02', 0),
       (null, 25, '인공지능', '딥러닝에서 드롭아웃의 역할', '드롭아웃이 무엇인지 설명해주세요.', '자유 게시판', '2024-06-03', '2024-06-03', 3),
       (null, 26, '컴퓨터 그래픽스', '프랙탈의 정의', '프랙탈이 무엇인지 알고 싶습니다.', '질문답변', '2024-06-04', '2024-06-04', 0),
       (null, 27, '데이터베이스', '뷰와 테이블의 차이', '뷰와 테이블의 차이를 설명해주세요.', '질문답변', '2024-06-05', '2024-06-05', 2),
       (null, 28, '보안', 'SQL 인젝션 방어', 'SQL 인젝션을 방어하는 방법이 궁금합니다.', '질문답변', '2024-06-06', '2024-06-06', 0),
       (null, 29, '머신러닝', '데이터 전처리의 중요성', '머신러닝에서 데이터 전처리가 왜 중요한가요?', '질문답변', '2024-06-07', '2024-06-07', 1),
       (null, 30, '프로그래밍', '객체 지향과 절차 지향 차이', '객체 지향 프로그래밍과 절차 지향 프로그래밍의 차이점을 설명해주세요.', '질문답변', '2024-06-08', '2024-06-08', 0),
       (null, 31, '네트워크', 'ARP 프로토콜의 역할', 'ARP 프로토콜이 무엇인지 설명해주세요.', '자유 게시판', '2024-06-09', '2024-06-09', 2),
       (null, 32, '프론트엔드', '웹 성능 최적화 방법', '웹 성능 최적화를 위한 팁을 알고 싶습니다.', '질문답변', '2024-06-10', '2024-06-10', 5),
       (null, 33, '알고리즘', '최소 신장 트리의 예제', '최소 신장 트리 알고리즘의 예시가 궁금합니다.', '자유 게시판', '2024-06-11', '2024-06-11', 3),
       (null, 34, '데이터 분석', 'Pandas와 NumPy 차이', '데이터 분석에서 Pandas와 NumPy의 차이를 알고 싶습니다.', '질문답변', '2024-06-12', '2024-06-12', 0),
       (null, 35, '운영체제', '파일 시스템의 종류', '운영체제에서 사용되는 파일 시스템의 종류가 궁금합니다.', '질문답변', '2024-06-13', '2024-06-13', 1),
       (null, 36, '프로그래밍', '비동기 처리의 장점', '비동기 처리의 장점과 단점을 설명해주세요.', '질문답변', '2024-06-14', '2024-06-14', 0),
       (null, 37, '컴퓨터 그래픽스', '안티앨리어싱의 원리', '안티앨리어싱이 무엇인지 궁금합니다.', '자유 게시판', '2024-06-15', '2024-06-15', 2),
       (null, 38, '클라우드 컴퓨팅', 'IaaS, PaaS, SaaS 차이', '클라우드에서 IaaS, PaaS, SaaS의 차이를 알고 싶습니다.', '질문답변', '2024-06-16', '2024-06-16', 0),
       (null, 39, '머신러닝', '하이퍼파라미터 튜닝 방법', '하이퍼파라미터 튜닝 방법이 궁금합니다.', '자유 게시판', '2024-06-17', '2024-06-17', 4),
       (null, 40, '네트워크', 'TCP와 IP 차이', 'TCP와 IP가 어떻게 다른지 궁금합니다.', '질문답변', '2024-06-18', '2024-06-18', 1),
       (null, 41, '데이터 과학', 'EDA 과정', 'EDA 과정에서 수행해야 할 작업을 알고 싶습니다.', '질문답변', '2024-06-19', '2024-06-19', 3),
       (null, 42, '보안', 'SSL/TLS 암호화 원리', 'SSL/TLS 암호화가 어떻게 작동하는지 궁금합니다.', '질문답변', '2024-06-20', '2024-06-20', 0),
       (null, 43, '프론트엔드', 'JavaScript에서 이벤트 위임', 'JavaScript에서 이벤트 위임을 사용하는 이유가 궁금합니다.', '자유 게시판', '2024-06-21', '2024-06-21', 1),
       (null, 44, '운영체제', '다중 스레드의 장단점', '운영체제에서 다중 스레드의 장단점이 궁금합니다.', '질문답변', '2024-06-22', '2024-06-22', 2),
       (null, 45, '컴퓨터 비전', 'HOG 특징 추출', 'HOG 특징 추출이 무엇인지 알고 싶습니다.', '질문답변', '2024-06-23', '2024-06-23', 0),
       (null, 46, '프로그래밍', '고급 데이터 구조', '트리, 그래프, 힙 등 고급 데이터 구조를 설명해주세요.', '질문답변', '2024-06-24', '2024-06-24', 4),
       (null, 47, '알고리즘', '이진 트리 순회 방법', '이진 트리의 순회 방법이 궁금합니다.', '자유 게시판', '2024-06-25', '2024-06-25', 2),
       (null, 48, '네트워크', 'HTTP2의 장점', 'HTTP2의 장점과 특징을 알고 싶습니다.', '질문답변', '2024-06-26', '2024-06-26', 0),
       (null, 49, '프론트엔드', 'CSS Flexbox와 Grid 비교', 'CSS의 Flexbox와 Grid의 차이점이 궁금합니다.', '자유 게시판', '2024-06-27', '2024-06-27', 5),
       (null, 50, '데이터베이스', '데이터 웨어하우스 개념', '데이터 웨어하우스란 무엇인지 궁금합니다.', '질문답변', '2024-06-28', '2024-06-28', 1),
       (null, 42, '프로그래밍', '자바의 추상 클래스와 인터페이스 차이', '자바의 추상 클래스와 인터페이스의 차이점을 설명해주세요.', '질문답변', '2024-06-21', '2024-06-21', 2),
       (null, 43, '데이터베이스', '인덱스 사용의 장단점', '데이터베이스에서 인덱스를 사용하는 장단점이 궁금합니다.', '자유 게시판', '2024-06-22', '2024-06-22', 3),
       (null, 44, '알고리즘', '비선형 자료구조의 종류', '비선형 자료구조의 예와 특징을 설명해주세요.', '질문답변', '2024-06-23', '2024-06-23', 0),
       (null, 45, '프론트엔드', '반응형 웹 디자인 기초', '반응형 웹 디자인을 구현하는 기본적인 방법이 궁금합니다.', '자유 게시판', '2024-06-24', '2024-06-24', 5),
       (null, 46, '네트워크', 'OSI 모델의 각 계층 설명', 'OSI 모델의 각 계층과 그 기능을 설명해주세요.', '질문답변', '2024-06-25', '2024-06-25', 1),
       (null, 47, '머신러닝', '클러스터링과 분류의 차이', '클러스터링과 분류의 차이점을 알고 싶습니다.', '자유 게시판', '2024-06-26', '2024-06-26', 2),
       (null, 48, '보안', 'SQL 인젝션 방어 방법', 'SQL 인젝션을 방어하기 위한 다양한 방법을 알고 싶습니다.', '질문답변', '2024-06-27', '2024-06-27', 0),
       (null, 49, '데이터 과학', 'EDA와 데이터 정제의 중요성', 'EDA와 데이터 정제의 중요성을 설명해주세요.', '자유 게시판', '2024-06-28', '2024-06-28', 4),
       (null, 50, '프로그래밍', '자바스크립트의 this 키워드', '자바스크립트에서 this 키워드의 역할을 알고 싶습니다.', '질문답변', '2024-06-29', '2024-06-29', 3),
       (null, 51, '컴퓨터 그래픽스', '쉐이더와 렌더링의 차이', '쉐이더와 렌더링의 차이점이 무엇인가요?', '질문답변', '2024-06-30', '2024-06-30', 2),
       (null, 52, '프론트엔드', '웹 접근성과 SEO의 관계', '웹 접근성이 SEO에 미치는 영향을 알고 싶습니다.', '자유 게시판', '2024-07-01', '2024-07-01', 1),
       (null, 53, '운영체제', '가상 메모리와 실제 메모리', '가상 메모리와 실제 메모리의 차이를 설명해주세요.', '질문답변', '2024-07-02', '2024-07-02', 0),
       (null, 54, '네트워크', 'IP 주소 체계와 서브넷', 'IP 주소와 서브넷의 개념이 궁금합니다.', '질문답변', '2024-07-03', '2024-07-03', 3),
       (null, 55, '프론트엔드', 'CSS로 애니메이션 구현', 'CSS를 활용한 애니메이션 구현 방법이 궁금합니다.', '자유 게시판', '2024-07-04', '2024-07-04', 0),
       (null, 56, '프로그래밍', '코드 최적화의 중요성', '코드 최적화의 중요성과 방법에 대해 설명해주세요.', '질문답변', '2024-07-05', '2024-07-05', 4),
       (null, 57, '알고리즘', '퀵 정렬과 머지 정렬의 차이', '퀵 정렬과 머지 정렬의 차이와 각각의 장단점을 설명해주세요.', '자유 게시판', '2024-07-06', '2024-07-06', 2),
       (null, 58, '네트워크', '방화벽의 역할', '네트워크 보안을 위해 방화벽이 어떤 역할을 하는지 설명해주세요.', '질문답변', '2024-07-07', '2024-07-07', 1),
       (null, 59, '보안', 'XSS 공격 방어', 'XSS 공격을 방어하는 방법을 알고 싶습니다.', '질문답변', '2024-07-08', '2024-07-08', 5),
       (null, 60, '클라우드 컴퓨팅', '서버리스 컴퓨팅이란?', '서버리스 컴퓨팅의 장점과 단점에 대해 설명해주세요.', '질문답변', '2024-07-09', '2024-07-09', 0),
       (null, 61, '데이터 과학', 'EDA의 주요 기법', 'EDA의 주요 기법과 그 중요성을 설명해주세요.', '질문답변', '2024-07-10', '2024-07-10', 3),
       (null, 62, '프로그래밍', 'API 설계 원칙', 'API 설계 시 고려해야 할 원칙을 설명해주세요.', '자유 게시판', '2024-07-11', '2024-07-11', 4),
       (null, 63, '운영체제', '멀티태스킹의 원리', '운영체제에서 멀티태스킹이 어떻게 작동하는지 궁금합니다.', '질문답변', '2024-07-12', '2024-07-12', 0),
       (null, 64, '네트워크', 'VPN과 프록시 서버 차이', 'VPN과 프록시 서버의 차이점을 알고 싶습니다.', '질문답변', '2024-07-13', '2024-07-13', 1),
       (null, 65, '머신러닝', '딥러닝에서 과적합 방지법', '과적합 방지를 위해 딥러닝에서 사용할 수 있는 방법을 알고 싶습니다.', '질문답변', '2024-07-14', '2024-07-14', 2),
       (null, 66, '프론트엔드', 'React와 Vue 비교', 'React와 Vue의 주요 차이점을 설명해주세요.', '자유 게시판', '2024-07-15', '2024-07-15', 3),
       (null, 67, '데이터베이스', '데이터 웨어하우스와 데이터 레이크', '데이터 웨어하우스와 데이터 레이크의 차이를 설명해주세요.', '질문답변', '2024-07-16', '2024-07-16', 1),
       (null, 68, '알고리즘', '이진 탐색과 선형 탐색의 차이', '이진 탐색과 선형 탐색의 차이를 알고 싶습니다.', '질문답변', '2024-07-17', '2024-07-17', 2),
       (null, 69, '보안', '암호화와 해싱의 차이점', '암호화와 해싱의 차이와 각각의 사용 사례를 알고 싶습니다.', '질문답변', '2024-07-18', '2024-07-18', 4),
       (null, 70, '머신러닝', 'K-means 클러스터링', 'K-means 클러스터링 알고리즘의 원리를 설명해주세요.', '질문답변', '2024-07-19', '2024-07-19', 3),
       (null, 71, '프론트엔드', '웹 접근성과 UX', '웹 접근성이 UX에 미치는 영향을 알고 싶습니다.', '자유 게시판', '2024-07-20', '2024-07-20', 0),
       (null, 72, '운영체제', '캐시 메모리의 역할', '캐시 메모리가 운영체제에서 어떤 역할을 하는지 설명해주세요.', '질문답변', '2024-07-21', '2024-07-21', 5),
       (null, 73, '네트워크', 'OSI 모델과 TCP/IP 모델 비교', 'OSI 모델과 TCP/IP 모델의 차이점을 설명해주세요.', '자유 게시판', '2024-07-22', '2024-07-22', 4),
       (null, 74, '보안', '멀웨어와 바이러스 차이', '멀웨어와 바이러스의 차이와 각각의 방어 방법이 궁금합니다.', '질문답변', '2024-07-23', '2024-07-23', 1),
       (null, 75, '알고리즘', '재귀 알고리즘의 장단점', '재귀 알고리즘의 장단점을 설명해주세요.', '자유 게시판', '2024-07-24', '2024-07-24', 2),
       (null, 76, '프로그래밍', '객체 지향 설계 원칙', '객체 지향 설계 원칙에 대해 설명해주세요.', '질문답변', '2024-07-25', '2024-07-25', 0),
       (null, 77, '머신러닝', '지도 학습과 비지도 학습', '지도 학습과 비지도 학습의 차이와 예시를 설명해주세요.', '질문답변', '2024-07-26', '2024-07-26', 3),
       (null, 78, '데이터 분석', '시계열 데이터 분석 기초', '시계열 데이터 분석의 기본 개념을 알고 싶습니다.', '질문답변', '2024-07-27', '2024-07-27', 5),
       (null, 79, '클라우드 컴퓨팅', '클라우드 보안의 중요성', '클라우드 보안이 중요한 이유와 이를 강화하는 방법을 설명해주세요.', '질문답변', '2024-07-28', '2024-07-28', 1),
       (null, 80, '컴퓨터 그래픽스', '렌더링 엔진의 역할', '렌더링 엔진이 어떤 역할을 하는지 궁금합니다.', '질문답변', '2024-07-29', '2024-07-29', 0),
       (null, 81, '네트워크', 'DHCP와 DNS의 차이', 'DHCP와 DNS의 차이점을 알고 싶습니다.', '자유 게시판', '2024-07-30', '2024-07-30', 2),
       (null, 82, '데이터 과학', '머신러닝과 통계학의 차이', '머신러닝과 통계학의 차이와 유사점을 설명해주세요.', '질문답변', '2024-07-31', '2024-07-31', 3),
       (null, 83, '알고리즘', '힙 정렬의 특징', '힙 정렬 알고리즘의 특징을 설명해주세요.', '질문답변', '2024-08-01', '2024-08-01', 0),
       (null, 84, '보안', 'SSL과 TLS의 차이', 'SSL과 TLS의 차이를 설명해주세요.', '질문답변', '2024-08-02', '2024-08-02', 1),
       (null, 85, '프로그래밍', '멀티스레딩의 장단점', '멀티스레딩의 장단점을 설명해주세요.', '질문답변', '2024-08-03', '2024-08-03', 4),
       (null, 86, '데이터베이스', '관계형 데이터베이스의 기초', '관계형 데이터베이스의 기본 개념을 설명해주세요.', '질문답변', '2024-08-04', '2024-08-04', 3),
       (null, 87, '프론트엔드', 'Vue 컴포넌트의 재사용성', 'Vue.js에서 컴포넌트 재사용성을 높이는 방법이 궁금합니다.', '자유 게시판', '2024-08-05', '2024-08-05', 5),
       (null, 88, '네트워크', 'IPv4와 IPv6의 차이', 'IPv4와 IPv6의 차이점을 설명해주세요.', '질문답변', '2024-08-06', '2024-08-06', 2),
       (null, 89, '머신러닝', 'KNN 알고리즘의 원리', 'KNN 알고리즘이 어떻게 작동하는지 설명해주세요.', '질문답변', '2024-08-07', '2024-08-07', 4),
       (null, 90, '알고리즘', '동적 프로그래밍의 활용', '동적 프로그래밍의 활용 예시를 알고 싶습니다.', '질문답변', '2024-08-08', '2024-08-08', 3),
       (null, 3, '철학', '칸트와 헤겔의 철학적 차이', '칸트와 헤겔의 철학적 차이를 알고 싶습니다.', '질문답변', '2024-08-09', '2024-08-09', 3),
       (null, 4, '문학', '시와 산문의 차이점', '시와 산문의 차이점에 대해 알고 싶습니다.', '질문답변', '2024-08-10', '2024-08-10', 1),
       (null, 5, '역사', '르네상스와 바로크 시대의 예술적 특징', '르네상스와 바로크 시대의 예술적 차이점을 설명해주세요.', '자유 게시판', '2024-08-11', '2024-08-11', 0),
       (null, 6, '미술', '인상주의와 표현주의의 차이', '인상주의와 표현주의가 어떻게 다른지 알고 싶습니다.', '질문답변', '2024-08-12', '2024-08-12', 2),
       (null, 7, '음악', '고전 음악과 현대 음악의 특징', '고전 음악과 현대 음악의 차이와 특징을 설명해주세요.', '자유 게시판', '2024-08-13', '2024-08-13', 1),
       (null, 8, '사회학', '구조 기능주의와 갈등 이론의 차이', '사회학에서 구조 기능주의와 갈등 이론이 어떻게 다른지 궁금합니다.', '질문답변', '2024-08-14', '2024-08-14', 0),
       (null, 9, '심리학', '프로이트와 융의 심리학 비교', '프로이트와 융의 심리학 이론이 어떻게 다른지 설명해주세요.', '질문답변', '2024-08-15', '2024-08-15', 3),
       (null, 10, '경제학', '케인즈와 신고전파 경제학의 차이', '케인즈 경제학과 신고전파 경제학의 차이를 설명해주세요.', '자유 게시판', '2024-08-16', '2024-08-16', 2),
       (null, 11, '철학', '실존주의와 현상학', '실존주의와 현상학의 주요 개념과 차이를 알고 싶습니다.', '질문답변', '2024-08-17', '2024-08-17', 1),
       (null, 12, '역사', '세계 대전의 원인과 결과', '1차와 2차 세계 대전의 주요 원인과 결과가 무엇인가요?', '질문답변', '2024-08-18', '2024-08-18', 4),
       (null, 13, '교육학', '진보주의와 본질주의 교육 철학', '진보주의와 본질주의 교육 철학의 차이점을 설명해주세요.', '자유 게시판', '2024-08-19', '2024-08-19', 0),
       (null, 14, '영화', '누벨바그와 할리우드 영화의 차이', '프랑스의 누벨바그 영화와 할리우드 영화의 차이를 알고 싶습니다.', '질문답변', '2024-08-20', '2024-08-20', 2),
       (null, 1, '문학', '고전 소설의 매력', '고전 소설의 매력과 특징이 무엇인지 알고 싶습니다.', '자유 게시판', '2024-08-09', '2024-08-09', 2),
       (null, 2, '철학', '니체의 철학 이해하기', '니체의 철학 사상이 어떻게 형성되었는지 궁금합니다.', '질문답변', '2024-08-10', '2024-08-10', 3),
       (null, 3, '역사', '르네상스와 중세 차이', '르네상스와 중세의 주요 차이점이 궁금합니다.', '자유 게시판', '2024-08-11', '2024-08-11', 1),
       (null, 4, '심리학', '인지 심리학의 개념', '인지 심리학의 주요 개념과 이론에 대해 알고 싶습니다.', '질문답변', '2024-08-12', '2024-08-12', 0),
       (null, 5, '사회학', '사회 구조와 개인의 관계', '사회 구조가 개인에게 미치는 영향에 대해 알고 싶습니다.', '자유 게시판', '2024-08-13', '2024-08-13', 4),
       (null, 6, '교육학', '효과적인 학습 방법', '효과적인 학습 방법과 교육 이론이 궁금합니다.', '질문답변', '2024-08-14', '2024-08-14', 5),
       (null, 7, '경영학', '리더십의 중요성', '경영에서 리더십이 왜 중요한지 설명해주세요.', '질문답변', '2024-08-15', '2024-08-15', 3),
       (null, 8, '경제학', '수요와 공급의 법칙', '수요와 공급 법칙이 경제에 미치는 영향이 궁금합니다.', '질문답변', '2024-08-16', '2024-08-16', 2),
       (null, 9, '음악', '바흐와 모차르트의 음악 스타일 차이', '바흐와 모차르트의 음악적 특징을 비교해주세요.', '자유 게시판', '2024-08-17', '2024-08-17', 1),
       (null, 10, '미술', '인상주의와 표현주의 차이', '인상주의와 표현주의의 주요 차이점이 궁금합니다.', '질문답변', '2024-08-18', '2024-08-18', 2),
       (null, 11, '문학', '한국 고전 문학의 특징', '한국 고전 문학의 주요 특징에 대해 알고 싶습니다.', '자유 게시판', '2024-08-19', '2024-08-19', 0),
       (null, 12, '역사', '산업 혁명의 영향', '산업 혁명이 사회에 미친 영향에 대해 설명해주세요.', '질문답변', '2024-08-20', '2024-08-20', 4),
       (null, 13, '철학', '존 롤스의 정의론', '롤스의 정의론과 그 의의를 알고 싶습니다.', '자유 게시판', '2024-08-21', '2024-08-21', 2),
       (null, 14, '심리학', '프로이트의 정신 분석학', '프로이트가 주장한 정신 분석학의 개념이 궁금합니다.', '질문답변', '2024-08-22', '2024-08-22', 5),
       (null, 15, '경제학', '경제 성장과 환경', '경제 성장과 환경 보존 사이의 관계에 대해 설명해주세요.', '질문답변', '2024-08-23', '2024-08-23', 3),
       (null, 16, '사회학', '사회적 자본의 개념', '사회적 자본의 개념과 중요성에 대해 설명해주세요.', '자유 게시판', '2024-08-24', '2024-08-24', 1),
       (null, 17, '교육학', '코칭과 멘토링의 차이', '코칭과 멘토링의 차이점이 궁금합니다.', '질문답변', '2024-08-25', '2024-08-25', 0),
       (null, 18, '음악', '음악에서의 화성의 역할', '음악에서 화성이 가지는 역할이 궁금합니다.', '자유 게시판', '2024-08-26', '2024-08-26', 2),
       (null, 19, '미술', '르네상스 미술의 특징', '르네상스 미술이 가지는 특징과 주요 작가가 궁금합니다.', '질문답변', '2024-08-27', '2024-08-27', 5),
       (null, 20, '심리학', '동기 이론 비교', '여러 동기 이론들의 차이와 적용 사례가 궁금합니다.', '질문답변', '2024-08-28', '2024-08-28', 0),
       (null, 21, '문학', '현대 문학의 경향', '현대 문학의 주요 경향과 변화에 대해 알고 싶습니다.', '자유 게시판', '2024-08-29', '2024-08-29', 1),
       (null, 22, '역사', '프랑스 혁명의 주요 원인', '프랑스 혁명이 발생하게 된 주요 원인이 궁금합니다.', '질문답변', '2024-08-30', '2024-08-30', 3),
       (null, 23, '철학', '실존주의의 철학적 의미', '실존주의 철학이 무엇을 의미하는지 알고 싶습니다.', '자유 게시판', '2024-08-31', '2024-08-31', 4),
       (null, 24, '사회학', '소셜 미디어와 사회 변화', '소셜 미디어가 사회 변화에 미치는 영향에 대해 설명해주세요.', '질문답변', '2024-09-01', '2024-09-01', 2),
       (null, 25, '교육학', '창의적 문제 해결의 중요성', '교육에서 창의적 문제 해결의 중요성과 방법이 궁금합니다.', '자유 게시판', '2024-09-02', '2024-09-02', 3),
       (null, 26, '경영학', '전략적 사고와 경쟁 우위', '경영학에서 전략적 사고가 경쟁 우위에 어떻게 기여하는지 설명해주세요.', '질문답변', '2024-09-03', '2024-09-03', 1),
       (null, 27, '경제학', '케인즈 경제학과 현대 경제', '케인즈의 경제 이론이 현대 경제에 미친 영향이 궁금합니다.', '자유 게시판', '2024-09-04', '2024-09-04', 2),
       (null, 28, '미술', '입체주의의 탄생과 발전', '입체주의가 어떻게 탄생하고 발전했는지 알고 싶습니다.', '질문답변', '2024-09-05', '2024-09-05', 5),
       (null, 29, '음악', '재즈 음악의 진화', '재즈 음악이 어떻게 진화해왔는지 알고 싶습니다.', '자유 게시판', '2024-09-06', '2024-09-06', 1),
       (null, 30, '철학', '윤리학에서의 의무론', '윤리학에서 의무론이 어떤 역할을 하는지 설명해주세요.', '질문답변', '2024-09-07', '2024-09-07', 4),
       (null, 1, '프로그래밍', 'Python에서 메모리 관리', 'Python의 메모리 관리 방식을 알고 싶습니다.', '질문답변', '2024-08-09', '2024-08-09', 2),
       (null, 2, '경제학', '인플레이션과 디플레이션', '인플레이션과 디플레이션의 차이점이 궁금합니다.', '자유 게시판', '2024-08-10', '2024-08-10', 3),
       (null, 3, '데이터 과학', '데이터 시각화의 중요성', '데이터 시각화가 왜 중요한지 알고 싶습니다.', '질문답변', '2024-08-11', '2024-08-11', 1),
       (null, 4, '네트워크', 'VPN과 NAT 차이', 'VPN과 NAT의 차이점에 대해 설명해주세요.', '질문답변', '2024-08-12', '2024-08-12', 0),
       (null, 5, '심리학', '인지 행동 치료', '인지 행동 치료의 효과와 적용 사례가 궁금합니다.', '자유 게시판', '2024-08-13', '2024-08-13', 4),
       (null, 6, '컴퓨터 비전', '이미지 필터링 기술', '컴퓨터 비전에서 이미지 필터링이 어떻게 활용되는지 설명해주세요.', '질문답변', '2024-08-14', '2024-08-14', 0),
       (null, 7, '경영학', '리더십 이론 비교', '여러 리더십 이론의 차이점과 적용 사례가 궁금합니다.', '질문답변', '2024-08-15', '2024-08-15', 1),
       (null, 8, '인공지능', 'AI와 자동화의 차이점', 'AI와 단순 자동화의 차이점이 무엇인가요?', '자유 게시판', '2024-08-16', '2024-08-16', 2),
       (null, 9, '경제학', '공급과 수요의 원리', '경제학에서 공급과 수요의 원리를 알고 싶습니다.', '질문답변', '2024-08-17', '2024-08-17', 3),
       (null, 10, '프론트엔드', 'CSS 애니메이션 기법', 'CSS로 구현할 수 있는 애니메이션 기법이 궁금합니다.', '질문답변', '2024-08-18', '2024-08-18', 5),
       (null, 11, '역사', '고대 이집트의 사회 구조', '고대 이집트 문명의 사회 구조에 대해 알고 싶습니다.', '자유 게시판', '2024-08-19', '2024-08-19', 2),
       (null, 12, '물리학', '상대성 이론의 기본 개념', '상대성 이론이 무엇인지 알고 싶습니다.', '질문답변', '2024-08-20', '2024-08-20', 0),
       (null, 13, '프로그래밍', '자바의 예외 처리', '자바에서 예외 처리를 어떻게 구현하는지 궁금합니다.', '질문답변', '2024-08-21', '2024-08-21', 1),
       (null, 14, '교육학', '학습 스타일 이론', '학습 스타일 이론의 종류와 특징이 궁금합니다.', '자유 게시판', '2024-08-22', '2024-08-22', 3),
       (null, 15, '컴퓨터 그래픽스', '모델링과 렌더링의 차이', '컴퓨터 그래픽스에서 모델링과 렌더링의 차이점이 궁금합니다.', '질문답변', '2024-08-23', '2024-08-23', 2),
       (null, 16, '사회학', '문화 상대주의', '문화 상대주의의 개념과 예시를 알고 싶습니다.', '자유 게시판', '2024-08-24', '2024-08-24', 4),
       (null, 17, '빅데이터', 'Hadoop과 Spark의 차이점', '빅데이터에서 Hadoop과 Spark의 차이점을 알고 싶습니다.', '질문답변', '2024-08-25', '2024-08-25', 0),
       (null, 18, '문학', '고전 문학의 특징', '고전 문학이 현대 문학과 어떻게 다른지 궁금합니다.', '자유 게시판', '2024-08-26', '2024-08-26', 1),
       (null, 19, '운영체제', '메모리 관리 기법', '운영체제의 메모리 관리 기법에 대해 알고 싶습니다.', '질문답변', '2024-08-27', '2024-08-27', 3),
       (null, 20, '심리학', '프로이트와 융의 심리 이론', '프로이트와 융의 심리 이론 차이가 궁금합니다.', '질문답변', '2024-08-28', '2024-08-28', 2),
       (null, 21, '데이터베이스', '관계형 데이터베이스의 기초', '관계형 데이터베이스의 기본 개념을 알고 싶습니다.', '자유 게시판', '2024-08-29', '2024-08-29', 1),
       (null, 22, '화학', '산과 염기의 정의', '화학에서 산과 염기의 정의와 차이점이 궁금합니다.', '질문답변', '2024-08-30', '2024-08-30', 0),
       (null, 23, '경제학', '시장 경제와 계획 경제', '시장 경제와 계획 경제의 차이점을 설명해주세요.', '자유 게시판', '2024-08-31', '2024-08-31', 2),
       (null, 24, '교육학', '피아제의 인지 발달 이론', '피아제의 인지 발달 이론의 주요 개념을 설명해주세요.', '질문답변', '2024-09-01', '2024-09-01', 3),
       (null, 25, '보안', '악성 코드 유형', '보안에서 악성 코드의 주요 유형을 알고 싶습니다.', '질문답변', '2024-09-02', '2024-09-02', 5),
       (null, 26, '철학', '실존주의 철학', '실존주의 철학의 개념과 주요 사상가에 대해 알고 싶습니다.', '자유 게시판', '2024-09-03', '2024-09-03', 4),
       (null, 27, '빅데이터', '빅데이터의 3V 특성', '빅데이터의 3V 특성이란 무엇인가요?', '질문답변', '2024-09-04', '2024-09-04', 0),
       (null, 28, '사회학', '사회화 과정과 기관', '사회화 과정에서 중요한 기관에 대해 알고 싶습니다.', '자유 게시판', '2024-09-05', '2024-09-05', 2),
       (null, 29, '알고리즘', '깊이 우선 탐색과 너비 우선 탐색', '깊이 우선 탐색과 너비 우선 탐색의 차이를 알고 싶습니다.', '질문답변', '2024-09-06', '2024-09-06', 1),
       (null, 30, '법학', '민법과 형법의 차이', '민법과 형법의 차이점이 궁금합니다.', '자유 게시판', '2024-09-07', '2024-09-07', 3),
       (null, 31, '인공지능', '머신러닝과 딥러닝의 차이점', '머신러닝과 딥러닝이 어떻게 다른지 설명해주세요.', '질문답변', '2024-09-08', '2024-09-08', 5),
       (null, 32, '음악', '클래식과 재즈의 차이', '클래식과 재즈 음악의 차이와 특징을 알고 싶습니다.', '자유 게시판', '2024-09-09', '2024-09-09', 2),
       (null, 33, '프로그래밍', '객체 지향 프로그래밍의 장점', '객체 지향 프로그래밍의 장점을 알고 싶습니다.', '질문답변', '2024-09-10', '2024-09-10', 0),
       (null, 34, '역사', '산업 혁명의 영향', '산업 혁명이 사회에 미친 영향을 설명해주세요.', '자유 게시판', '2024-09-11', '2024-09-11', 4),
       (null, 35, '의학', '백신의 원리와 종류', '의학에서 백신의 원리와 주요 종류가 궁금합니다.', '질문답변', '2024-09-12', '2024-09-12', 1),
       (null, 36, '경영학', '회사의 윤리적 경영', '윤리적 경영이 무엇인지 설명해주세요.', '자유 게시판', '2024-09-13', '2024-09-13', 3),
       (null, 37, '천문학', '블랙홀의 형성 과정', '블랙홀은 어떻게 형성되는지 설명해주세요.', '질문답변', '2024-09-14', '2024-09-14', 2),
       (null, 38, '데이터 과학', '데이터 모델링 기법', '데이터 모델링 기법의 종류와 특징을 알고 싶습니다.', '질문답변', '2024-09-15', '2024-09-15', 0),
       (null, 39, '문학', '고전주의와 낭만주의 차이', '문학에서 고전주의와 낭만주의의 차이가 궁금합니다.', '자유 게시판', '2024-09-16', '2024-09-16', 5),
       (null, 40, '게임 개발', '게임 엔진의 역할', '게임 개발에서 엔진이 어떤 역할을 하는지 궁금합니다.', '질문답변', '2024-09-17', '2024-09-17', 1),
       (null, 41, '사회학', '사회 계층 구조', '사회학에서 사회 계층 구조의 개념을 알고 싶습니다.', '자유 게시판', '2024-09-18', '2024-09-18', 2),
       (null, 42, '데이터베이스', '데이터베이스 트랜잭션', '트랜잭션이 무엇이며 왜 중요한지 궁금합니다.', '질문답변', '2024-09-19', '2024-09-19', 4),
       (null, 43, '프론트엔드', '반응형 웹 디자인', '반응형 웹 디자인의 기본 개념을 알고 싶습니다.', '자유 게시판', '2024-09-20', '2024-09-20', 3),
       (null, 44, '알고리즘', '정렬 알고리즘의 종류', '주요 정렬 알고리즘과 그 차이를 설명해주세요.', '질문답변', '2024-09-21', '2024-09-21', 5),
       (null, 45, '경제학', '환율의 개념과 영향', '환율이 경제에 미치는 영향에 대해 알고 싶습니다.', '질문답변', '2024-09-22', '2024-09-22', 0),
       (null, 46, '운영체제', '파일 시스템 구조', '운영체제의 파일 시스템 구조가 궁금합니다.', '질문답변', '2024-09-23', '2024-09-23', 2),
       (null, 47, '법학', '헌법과 법률의 차이', '헌법과 법률의 차이를 알고 싶습니다.', '자유 게시판', '2024-09-24', '2024-09-24', 3),
       (null, 48, '음악', '바로크 음악의 특징', '음악에서 바로크 시대의 주요 특징을 설명해주세요.', '자유 게시판', '2024-09-25', '2024-09-25', 2),
       (null, 49, '네트워크', '라우팅 프로토콜', '라우팅 프로토콜의 종류와 역할을 설명해주세요.', '질문답변', '2024-09-26', '2024-09-26', 4),
       (null, 50, '컴퓨터 비전', '엣지 검출 알고리즘', '컴퓨터 비전에서 엣지 검출 알고리즘의 원리를 알고 싶습니다.', '질문답변', '2024-09-27', '2024-09-27', 1);

-- 태그 추가
INSERT INTO tag (tid, tname)
VALUES
    -- 기존 IT 및 공학 태그
    (1, '프로그래밍'),
    (2, '인공지능'),
    (3, '데이터베이스'),
    (4, '네트워크'),
    (5, '보안'),
    (6, '웹 개발'),
    (7, '모바일 개발'),
    (8, '빅데이터'),
    (9, '클라우드 컴퓨팅'),
    (10, '사물인터넷(IoT)'),
    (11, '블록체인'),
    (12, '머신러닝'),
    (13, '딥러닝'),
    (14, '데이터 분석'),
    (15, '컴퓨터 그래픽스'),
    (16, '게임 개발'),
    (17, '운영체제'),
    (18, '소프트웨어 엔지니어링'),
    (19, '자연어 처리(NLP)'),
    (20, '로보틱스'),
    (21, '경영학'),
    (22, '경제학'),
    (23, '심리학'),
    (24, '사회학'),
    (25, '교육학'),
    (26, '문학'),
    (27, '역사'),
    (28, '철학'),
    (29, '미술'),
    (30, '음악'),
    (31, '영화'),
    (32, '생물학'),
    (33, '화학'),
    (34, '물리학'),
    (35, '천문학'),
    (36, '지구과학'),
    (37, '의학'),
    (38, '약학'),
    (39, '간호학'),
    (40, '법학'),
    (41, '알고리즘');

-- 태그 연관 데이터 추가
-- question에 맞는 단일 태그 추가
-- interest에 맞춰서 question_tag 테이블 다시 작성
INSERT INTO question_tag (qid, tid)
VALUES
    (1, 1), (2, 1), (3, 2), (4, 3), (5, 1), (6, 4),
    (7, 5), (8, 7), (9, 9), (10, 14), (11, 12), (12, 1),
    (13, 17), (14, 1), (15, 1), (16, 15), (17, 8), (18, 6),
    (19, 5), (20, 10), (21, 10), (22, 4), (23, 9), (24, 6),
    (25, 12), (26, 1), (27, 17), (28, 17), (29, 41), (30, 6),
    (31, 13), (32, 19), (33, 12), (34, 5), (35, 6), (36, 3),
    (37, 7), (38, 17), (39, 15), (40, 9), (41, 9), (42, 3),
    (43, 5), (44, 7), (45, 14), (46, 2), (47, 10), (48, 6),
    (49, 41), (50, 1), (51, 9), (52, 5), (53, 1), (54, 12),
    (55, 6), (56, 9), (57, 17), (58, 1), (59, 9), (60, 15),
    (61, 1), (62, 12), (63, 4), (64, 17), (65, 12), (66, 14),
    (67, 5), (68, 41), (69, 6), (70, 15), (71, 9), (72, 12),
    (73, 14), (74, 9), (75, 3), (76, 15), (77, 6), (78, 17),
    (79, 5), (80, 4), (81, 15), (82, 19), (83, 41), (84, 3),
    (85, 6), (86, 12), (87, 9), (88, 1), (89, 4), (90, 6),
    (91, 14), (92, 5), (93, 8), (94, 41), (95, 1), (96, 6),
    (97, 15), (98, 17), (99, 9), (100, 4), (101, 1), (102, 12),
    (103, 4), (104, 6), (105, 12), (106, 7), (107, 13), (108, 1),
    (109, 9), (110, 17), (111, 15), (112, 10), (113, 19), (114, 2),
    (115, 6), (116, 9), (117, 12), (118, 3), (119, 5), (120, 14),
    (121, 9), (122, 8), (123, 13), (124, 1), (125, 3), (126, 6),
    (127, 14), (128, 7), (129, 10), (130, 15), (131, 5), (132, 9),
    (133, 1), (134, 8), (135, 14), (136, 5), (137, 18), (138, 10),
    (139, 8), (140, 6), (141, 1), (142, 9), (143, 13), (144, 3),
    (145, 10), (146, 15), (147, 12), (148, 5), (149, 8), (150, 14),
    (151, 18), (152, 17), (153, 6), (154, 1), (155, 4), (156, 13),
    (157, 19), (158, 8), (159, 14), (160, 12), (161, 15), (162, 5),
    (163, 2), (164, 3), (165, 17), (166, 4), (167, 13), (168, 9),
    (169, 10), (170, 14), (171, 6), (172, 1), (173, 18), (174, 5),
    (175, 10), (176, 4), (177, 15), (178, 17), (179, 9), (180, 8),
    (181, 19), (182, 6), (183, 3), (184, 7), (185, 14), (186, 2),
    (187, 18), (188, 15), (189, 28), (190, 26), (191, 27), (192, 29),
    (193, 30), (194, 24), (195, 23), (196, 22), (197, 28), (198, 27),
    (199, 25), (200, 31),
    -- question 의 interest 와 맞게 tid 수정 필요
    (201, 1), (202, 1), (203, 2), (204, 6), (205, 10), (206, 19),
    (207, 3), (208, 4), (209, 5), (210, 7), (211, 8), (212, 9),
    (213, 12), (214, 13), (215, 14), (216, 15), (217, 17), (218, 18),
    (219, 20), (220, 22), (221, 23), (222, 24), (223, 25), (224, 26),
    (225, 27), (226, 28), (227, 29), (228, 30), (229, 31), (230, 8),
    (231, 9), (232, 15), (233, 14), (234, 3), (235, 2), (236, 1),
    (237, 41), (238, 20), (239, 22), (240, 19),
    (241, 8), (242, 9), (243, 10), (244, 11), (245, 12), (246, 13), (247, 14),
    (248, 15), (249, 17), (250, 18), (251, 19), (252, 20), (253, 22), (254, 23),
    (255, 24), (256, 25), (257, 26), (258, 27), (259, 28), (260, 29), (261, 30),
    (262, 31), (263, 8), (264, 9), (265, 15), (266, 14), (267, 3), (268, 2),
    (269, 1), (270, 41), (271, 20), (272, 22), (273, 9), (274, 6), (275, 10),
    (276, 19), (277, 3), (278, 4), (279, 5), (280, 7);

-- 리뷰 추가
INSERT INTO comment (cid, uid, qid, content, createAt, updateAt)
VALUES (null, 1, 1, '좋은 정보 감사합니다.', '2024-04-11', '2024-04-11'),
       (null, 2, 1, '더 많은 설명을 부탁드립니다.', '2024-04-11', '2024-04-11'),
       (null, 3, 2, '이 주제에 대해 자세히 알고 싶어요.', '2024-04-12', '2024-04-12'),
       (null, 4, 2, '이해하기 쉽게 설명해 주셔서 감사합니다.', '2024-04-12', '2024-04-12'),
       (null, 5, 3, '좋은 글이네요!', '2024-04-13', '2024-04-13'),
       (null, 1, 3, '저도 같은 의견입니다.', '2024-04-13', '2024-04-13'),
       (null, 6, 4, '이 글은 참 유익하네요.', '2024-04-14', '2024-04-14'),
       (null, 7, 4, '저도 이 주제에 관심이 많습니다.', '2024-04-14', '2024-04-14'),
       (null, 8, 5, '더 많은 예제를 추가해 주시면 감사하겠습니다.', '2024-04-15', '2024-04-15'),
       (null, 9, 5, '좋은 글 감사합니다.', '2024-04-15', '2024-04-15'),
       (null, 10, 6, '궁금한 점이 해결됐어요.', '2024-04-16', '2024-04-16'),
       (null, 11, 6, '도움이 많이 되었습니다.', '2024-04-16', '2024-04-16'),
       (null, 12, 7, '더 알아보고 싶어요.', '2024-04-17', '2024-04-17'),
       (null, 13, 7, '훌륭한 설명입니다.', '2024-04-17', '2024-04-17'),
       (null, 14, 8, '다른 예제도 추가해 주세요.', '2024-04-18', '2024-04-18'),
       (null, 15, 8, '아주 유익한 글입니다.', '2024-04-18', '2024-04-18'),
       (null, 16, 9, '도움이 많이 되었어요.', '2024-04-19', '2024-04-19'),
       (null, 17, 9, '이해가 잘 돼요.', '2024-04-19', '2024-04-19'),
       (null, 18, 10, '좋은 예시입니다.', '2024-04-20', '2024-04-20'),
       (null, 19, 10, '도움이 되네요.', '2024-04-20', '2024-04-20'),
       (null, 1, 11, '너무 유익한 글이네요!', '2024-04-21', '2024-04-21'),
       (null, 2, 11, '이해가 쉽네요.', '2024-04-21', '2024-04-21'),
       (null, 3, 12, '정말 좋은 정보입니다.', '2024-04-22', '2024-04-22'),
       (null, 4, 12, '이해가 쉬웠어요.', '2024-04-22', '2024-04-22'),
       (null, 5, 13, '궁금했던 부분이 해결됐습니다.', '2024-04-23', '2024-04-23'),
       (null, 6, 13, '정보가 많아서 좋네요.', '2024-04-23', '2024-04-23'),
       (null, 7, 14, '이 글 덕분에 많은 것을 배웠습니다.', '2024-04-24', '2024-04-24'),
       (null, 8, 14, '좋은 자료 감사합니다.', '2024-04-24', '2024-04-24'),
       (null, 9, 15, '관련 자료가 많아 좋습니다.', '2024-04-25', '2024-04-25'),
       (null, 10, 15, '유용한 정보입니다.', '2024-04-25', '2024-04-25'),
       (null, 11, 16, '많은 도움이 됐어요.', '2024-04-26', '2024-04-26'),
       (null, 12, 16, '잘 이해됐어요.', '2024-04-26', '2024-04-26'),
       (null, 13, 17, '이해가 잘 됐습니다.', '2024-04-27', '2024-04-27'),
       (null, 14, 17, '잘 배웠습니다.', '2024-04-27', '2024-04-27'),
       (null, 15, 18, '유익한 정보네요.', '2024-04-28', '2024-04-28'),
       (null, 16, 18, '감사합니다.', '2024-04-28', '2024-04-28'),
       (null, 17, 19, '글 잘 읽었습니다.', '2024-04-29', '2024-04-29'),
       (null, 18, 19, '이해가 쉽게 잘 설명되어 있어요.', '2024-04-29', '2024-04-29'),
       (null, 19, 20, '유익한 설명 감사합니다.', '2024-04-30', '2024-04-30'),
       (null, 20, 20, '글 잘 읽었어요.', '2024-04-30', '2024-04-30'),
       (null, 1, 21, '많은 도움이 되었습니다.', '2024-05-01', '2024-05-01'),
       (null, 2, 21, '글의 내용이 매우 유익하네요.', '2024-05-01', '2024-05-01'),
       (null, 3, 22, '질문에 대한 답변 감사합니다.', '2024-05-02', '2024-05-02'),
       (null, 4, 22, '친절한 설명 감사합니다.', '2024-05-02', '2024-05-02'),
       (null, 5, 23, '이해가 잘 되었어요.', '2024-05-03', '2024-05-03'),
       (null, 6, 23, '유익한 글 감사합니다.', '2024-05-03', '2024-05-03'),
       (null, 7, 24, '더 많은 예제가 있으면 좋겠어요.', '2024-05-04', '2024-05-04'),
       (null, 8, 24, '좋은 글 감사합니다.', '2024-05-04', '2024-05-04'),
       (null, 9, 25, '정말 많은 도움이 됐습니다.', '2024-05-05', '2024-05-05'),
       (null, 10, 25, '감사합니다.', '2024-05-05', '2024-05-05'),
       (null, 11, 26, '정말 유익한 정보네요.', '2024-05-06', '2024-05-06'),
       (null, 12, 26, '잘 읽었습니다.', '2024-05-06', '2024-05-06'),
       (null, 13, 27, '내용이 정말 좋아요.', '2024-05-07', '2024-05-07'),
       (null, 14, 27, '이해가 잘 되는 설명입니다.', '2024-05-07', '2024-05-07'),
       (null, 15, 28, '관련 자료 감사합니다.', '2024-05-08', '2024-05-08'),
       (null, 16, 28, '자세한 설명 감사해요.', '2024-05-08', '2024-05-08'),
       (null, 17, 29, '너무 유익한 글이네요.', '2024-05-09', '2024-05-09'),
       (null, 18, 29, '도움이 많이 됐습니다.', '2024-05-09', '2024-05-09'),
       (null, 19, 30, '다음 글도 기대할게요!', '2024-05-10', '2024-05-10'),
       (null, 20, 30, '궁금했던 부분이 해결됐어요.', '2024-05-10', '2024-05-10'),
       (null, 1, 31, '더 많은 예제가 있으면 좋겠어요.', '2024-05-11', '2024-05-11'),
       (null, 2, 31, '내용이 참 좋습니다.', '2024-05-11', '2024-05-11'),
       (null, 3, 32, '완벽한 설명이네요.', '2024-05-12', '2024-05-12'),
       (null, 4, 32, '많은 도움이 됐습니다.', '2024-05-12', '2024-05-12'),
       (null, 5, 33, '이해가 잘 되네요.', '2024-05-13', '2024-05-13'),
       (null, 6, 33, '정말 좋은 글입니다.', '2024-05-13', '2024-05-13'),
       (null, 7, 34, '유익한 정보 감사합니다.', '2024-05-14', '2024-05-14'),
       (null, 8, 34, '많은 도움이 됐어요.', '2024-05-14', '2024-05-14'),
       (null, 9, 35, '읽으면서 많이 배웠습니다.', '2024-05-15', '2024-05-15'),
       (null, 10, 35, '잘 설명해 주셔서 감사합니다.', '2024-05-15', '2024-05-15'),
       (null, 11, 36, '완벽한 정보네요.', '2024-05-16', '2024-05-16'),
       (null, 12, 36, '좋은 자료 고맙습니다.', '2024-05-16', '2024-05-16'),
       (null, 13, 37, '아주 유익한 글이에요.', '2024-05-17', '2024-05-17'),
       (null, 14, 37, '감사합니다.', '2024-05-17', '2024-05-17'),
       (null, 15, 38, '더 많은 정보 부탁드려요.', '2024-05-18', '2024-05-18'),
       (null, 1, 39, '자동 생성된 댓글입니다.', '2024-05-19', '2024-05-19'),
       (null, 2, 40, '자동 생성된 댓글입니다.', '2024-05-20', '2024-05-20'),
       (null, 3, 41, '자동 생성된 댓글입니다.', '2024-05-21', '2024-05-21'),
       (null, 4, 42, '자동 생성된 댓글입니다.', '2024-05-22', '2024-05-22'),
       (null, 5, 43, '자동 생성된 댓글입니다.', '2024-05-23', '2024-05-23'),
       (null, 6, 44, '자동 생성된 댓글입니다.', '2024-05-24', '2024-05-24'),
       (null, 7, 45, '자동 생성된 댓글입니다.', '2024-05-25', '2024-05-25'),
       (null, 8, 46, '자동 생성된 댓글입니다.', '2024-05-26', '2024-05-26'),
       (null, 9, 47, '자동 생성된 댓글입니다.', '2024-05-27', '2024-05-27'),
       (null, 10, 48, '자동 생성된 댓글입니다.', '2024-05-28', '2024-05-28'),
       (null, 11, 49, '자동 생성된 댓글입니다.', '2024-05-29', '2024-05-29'),
       (null, 12, 50, '자동 생성된 댓글입니다.', '2024-05-30', '2024-05-30'),
       (null, 13, 51, '자동 생성된 댓글입니다.', '2024-05-31', '2024-05-31'),
       (null, 14, 52, '자동 생성된 댓글입니다.', '2024-06-01', '2024-06-01'),
       (null, 15, 53, '자동 생성된 댓글입니다.', '2024-06-02', '2024-06-02'),
       (null, 16, 54, '자동 생성된 댓글입니다.', '2024-06-03', '2024-06-03'),
       (null, 17, 55, '자동 생성된 댓글입니다.', '2024-06-04', '2024-06-04'),
       (null, 18, 56, '자동 생성된 댓글입니다.', '2024-06-05', '2024-06-05'),
       (null, 19, 57, '자동 생성된 댓글입니다.', '2024-06-06', '2024-06-06'),
       (null, 20, 58, '자동 생성된 댓글입니다.', '2024-06-07', '2024-06-07'),
       (null, 1, 59, '자동 생성된 댓글입니다.', '2024-06-08', '2024-06-08'),
       (null, 2, 60, '자동 생성된 댓글입니다.', '2024-06-09', '2024-06-09'),
       (null, 3, 61, '자동 생성된 댓글입니다.', '2024-06-10', '2024-06-10'),
       (null, 4, 62, '자동 생성된 댓글입니다.', '2024-06-11', '2024-06-11'),
       (null, 5, 63, '자동 생성된 댓글입니다.', '2024-06-12', '2024-06-12'),
       (null, 6, 64, '자동 생성된 댓글입니다.', '2024-06-13', '2024-06-13'),
       (null, 7, 65, '자동 생성된 댓글입니다.', '2024-06-14', '2024-06-14'),
       (null, 8, 66, '자동 생성된 댓글입니다.', '2024-06-15', '2024-06-15'),
       (null, 9, 67, '자동 생성된 댓글입니다.', '2024-06-16', '2024-06-16'),
       (null, 10, 68, '자동 생성된 댓글입니다.', '2024-06-17', '2024-06-17'),
       (null, 11, 69, '자동 생성된 댓글입니다.', '2024-06-18', '2024-06-18'),
       (null, 12, 70, '자동 생성된 댓글입니다.', '2024-06-19', '2024-06-19'),
       (null, 13, 71, '자동 생성된 댓글입니다.', '2024-06-20', '2024-06-20'),
       (null, 14, 72, '자동 생성된 댓글입니다.', '2024-06-21', '2024-06-21'),
       (null, 15, 73, '자동 생성된 댓글입니다.', '2024-06-22', '2024-06-22'),
       (null, 16, 74, '자동 생성된 댓글입니다.', '2024-06-23', '2024-06-23'),
       (null, 17, 75, '자동 생성된 댓글입니다.', '2024-06-24', '2024-06-24'),
       (null, 18, 76, '자동 생성된 댓글입니다.', '2024-06-25', '2024-06-25'),
       (null, 19, 77, '자동 생성된 댓글입니다.', '2024-06-26', '2024-06-26'),
       (null, 20, 78, '자동 생성된 댓글입니다.', '2024-06-27', '2024-06-27'),
       (null, 1, 39, '자동 생성된 댓글입니다.', '2024-06-28', '2024-06-28'),
       (null, 2, 40, '자동 생성된 댓글입니다.', '2024-06-29', '2024-06-29'),
       (null, 3, 41, '자동 생성된 댓글입니다.', '2024-06-30', '2024-06-30'),
       (null, 4, 42, '자동 생성된 댓글입니다.', '2024-07-01', '2024-07-01'),
       (null, 5, 43, '자동 생성된 댓글입니다.', '2024-07-02', '2024-07-02'),
       (null, 6, 44, '자동 생성된 댓글입니다.', '2024-07-03', '2024-07-03'),
       (null, 7, 45, '자동 생성된 댓글입니다.', '2024-07-04', '2024-07-04'),
       (null, 8, 46, '자동 생성된 댓글입니다.', '2024-07-05', '2024-07-05'),
       (null, 9, 47, '자동 생성된 댓글입니다.', '2024-07-06', '2024-07-06'),
       (null, 10, 48, '자동 생성된 댓글입니다.', '2024-07-07', '2024-07-07'),
       (null, 11, 49, '자동 생성된 댓글입니다.', '2024-07-08', '2024-07-08'),
       (null, 12, 50, '자동 생성된 댓글입니다.', '2024-07-09', '2024-07-09'),
       (null, 13, 51, '자동 생성된 댓글입니다.', '2024-07-10', '2024-07-10'),
       (null, 14, 52, '자동 생성된 댓글입니다.', '2024-07-11', '2024-07-11'),
       (null, 15, 53, '자동 생성된 댓글입니다.', '2024-07-12', '2024-07-12'),
       (null, 16, 54, '자동 생성된 댓글입니다.', '2024-07-13', '2024-07-13'),
       (null, 17, 55, '자동 생성된 댓글입니다.', '2024-07-14', '2024-07-14'),
       (null, 18, 56, '자동 생성된 댓글입니다.', '2024-07-15', '2024-07-15'),
       (null, 19, 57, '자동 생성된 댓글입니다.', '2024-07-16', '2024-07-16'),
       (null, 20, 58, '자동 생성된 댓글입니다.', '2024-07-17', '2024-07-17'),
       (null, 1, 59, '자동 생성된 댓글입니다.', '2024-07-18', '2024-07-18'),
       (null, 2, 60, '자동 생성된 댓글입니다.', '2024-07-19', '2024-07-19'),
       (null, 3, 61, '자동 생성된 댓글입니다.', '2024-07-20', '2024-07-20'),
       (null, 4, 62, '자동 생성된 댓글입니다.', '2024-07-21', '2024-07-21'),
       (null, 5, 63, '자동 생성된 댓글입니다.', '2024-07-22', '2024-07-22'),
       (null, 6, 64, '자동 생성된 댓글입니다.', '2024-07-23', '2024-07-23'),
       (null, 7, 65, '자동 생성된 댓글입니다.', '2024-07-24', '2024-07-24'),
       (null, 8, 66, '자동 생성된 댓글입니다.', '2024-07-25', '2024-07-25'),
       (null, 9, 67, '자동 생성된 댓글입니다.', '2024-07-26', '2024-07-26'),
       (null, 10, 68, '자동 생성된 댓글입니다.', '2024-07-27', '2024-07-27'),
       (null, 11, 69, '자동 생성된 댓글입니다.', '2024-07-28', '2024-07-28'),
       (null, 12, 70, '자동 생성된 댓글입니다.', '2024-07-29', '2024-07-29'),
       (null, 13, 71, '자동 생성된 댓글입니다.', '2024-07-30', '2024-07-30'),
       (null, 14, 72, '자동 생성된 댓글입니다.', '2024-07-31', '2024-07-31'),
       (null, 15, 73, '자동 생성된 댓글입니다.', '2024-08-01', '2024-08-01'),
       (null, 16, 74, '자동 생성된 댓글입니다.', '2024-08-02', '2024-08-02'),
       (null, 17, 75, '자동 생성된 댓글입니다.', '2024-08-03', '2024-08-03'),
       (null, 18, 76, '자동 생성된 댓글입니다.', '2024-08-04', '2024-08-04'),
       (null, 19, 77, '자동 생성된 댓글입니다.', '2024-08-05', '2024-08-05'),
       (null, 20, 78, '자동 생성된 댓글입니다.', '2024-08-06', '2024-08-06'),
       (null, 1, 39, '자동 생성된 댓글입니다.', '2024-08-07', '2024-08-07'),
       (null, 2, 40, '자동 생성된 댓글입니다.', '2024-08-08', '2024-08-08'),
       (null, 3, 41, '자동 생성된 댓글입니다.', '2024-08-09', '2024-08-09'),
       (null, 4, 42, '자동 생성된 댓글입니다.', '2024-08-10', '2024-08-10'),
       (null, 5, 43, '자동 생성된 댓글입니다.', '2024-08-11', '2024-08-11'),
       (null, 6, 44, '자동 생성된 댓글입니다.', '2024-08-12', '2024-08-12'),
       (null, 7, 45, '자동 생성된 댓글입니다.', '2024-08-13', '2024-08-13');

-- 카테고리별 조회에 대한 인덱스
create index idx_question_category on question (category);

-- 사용자별 조회에 대한 인덱스
create index idx_question_uid on question (uid);

-- 제목 검색에 대한 인덱스
create index idx_question_title on question (title);

-- 코멘트 테이블에서 질문 ID(qid)로 조회 성능 향상을 위한 인덱스
create index idx_comment_qid on comment (qid);

-- 코멘트 테이블에서 사용자 ID(uid)로 조회 성능 향상을 위한 인덱스
create index idx_comment_uid on comment (uid);

-- View
drop view if exists question_with_user;
create view question_with_user as
select q.qid,
       q.uid,
       q.content,
       q.category,
       q.title,
       q.createAt,
       q.updateAt,
       q.great,
       u.name    AS user_name,
       u.email   AS user_email,
       u.company as user_company
from question as q
         join user as u on q.uid = u.uid;

drop view if exists comment_with_user;
create view comment_with_user as
select c.cid,
       c.uid,
       c.qid,
       c.content,
       c.createAt,
       c.updateAt,
       u.name,
       u.company
from comment as c
         join user as u on c.uid = u.uid;

drop view if exists question_with_comment;
create view question_with_comment as
select q.qid,
       q.uid      as question_uid,
       q.content  as question_content,
       q.category,
       q.title,
       q.createAt as question_createAt,
       c.createAt as comment_createAt
from question as q
         join comment as c on q.qid = c.qid;


-- Trigger
-- 질문 삭제시 질문과 연결된 모든 댓글을 삭제하는 트리거
drop trigger if exists delete_question_comments;
create trigger delete_question_comments
    after delete
    on question
    for each row
begin
    delete from comment where qid = OLD.qid;
end;

-- Procedure
-- 동적 테이블 조회
drop procedure if exists select_all_data;
delimiter
//
create procedure select_all_data(in tableName varchar(50))
begin
    set @query = concat('select * from ', tableName);
    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end
//
delimiter ;


-- 사용자 추가 프로시저
drop procedure if exists create_user;
delimiter
//
create procedure create_user(
    in p_name varchar(100),
    in p_email varchar(100),
    in p_password varchar(255),
    in p_interest varchar(100),
    in p_role varchar(50),
    in p_birth date,
    in p_company varchar(100)
)
begin
    insert into user (name, email, password, interest, company, role, birth)
    values (p_name, p_email, p_password, p_interest, p_company, p_role, p_birth);
end
//
delimiter ;

-- 이메일을 사용한 사용자 uid 조회
drop procedure if exists select_uid_by_email;
delimiter
//
create procedure select_uid_by_email(
    in p_email varchar(50)
)
begin
    select uid
    from user
    where email = p_email;
end
//
delimiter ;


-- 질문 등록 프로시저
drop procedure if exists createQuestion;
DELIMITER
//
CREATE PROCEDURE create_question(
    IN p_qid INT,
    IN p_uid INT,
    IN p_content TEXT,
    IN p_category VARCHAR(50),
    IN p_title VARCHAR(255),
    IN p_createAt TIMESTAMP,
    IN p_updateAt TIMESTAMP
)
BEGIN
    INSERT INTO question (qid, uid, content, category, title, createAt, updateAt, great)
    VALUES (p_qid, p_uid, p_content, p_category, p_title, p_createAt, p_updateAt, 0);
END
//
DELIMITER ;

-- 질문 수정 프로시저
drop procedure if exists update_question;
delimiter
//
create procedure update_question(
    IN p_qid INT,
    IN p_content TEXT,
    IN p_category VARCHAR(50),
    IN p_title VARCHAR(255),
    IN p_updateAt TIMESTAMP
)
begin
    UPDATE question
    SET content  = p_content,
        category = p_category,
        title    = p_title,
        updateAt = p_updateAt
    WHERE qid = p_qid;
end
//
delimiter ;

-- 질문 삭제 프로시저
drop procedure if exists delete_question;
delimiter
//
create procedure delete_question(in p_qid int)
begin
    delete
    from question
    where qid = p_qid;
end
//
delimiter ;

-- 카테고리별 데이터 조회
drop procedure if exists select_question_by_category;
delimiter
//
create procedure select_question_by_category(
    in p_category varchar(10)
)
begin
    select *
    from question_with_user
    where category = p_category
    group by qid;
end
//
delimiter ;

-- 특정 사용자별 데이터 조회
drop procedure if exists select_my_question;
delimiter
//
create procedure select_my_question(in p_uid int)
begin
    select *
    from question_with_user
    where uid = p_uid;
end
//
delimiter ;

-- 카테고리와 제목 검색
drop procedure if exists select_question_by_keyword;
delimiter
//
create procedure select_question_by_keyword(
    in p_keyword varchar(255)
)
begin
    select *
    from question
    where title like concat('%', p_keyword, '%');
end
//
delimiter ;


-- 좋아요 수 증가
drop procedure if exists increment_great;
delimiter
//
create procedure increment_great(
    in p_qid int
)
begin
    update question
    set great = great + 1
    where qid = p_qid;
end
//
delimiter ;

-- 좋아요 수 조회
drop procedure if exists select_great_count;
delimiter
//
create procedure select_great_count(in p_qid int)
begin
    select great
    from question
    where qid = p_qid;
end
//
delimiter ;


-- 코멘트 추가
drop procedure if exists create_comment;
delimiter
//
create procedure create_comment(
    IN p_cid INT,
    IN p_uid INT,
    IN p_qid INT,
    IN p_content TEXT,
    IN p_createAt TIMESTAMP,
    IN p_updateAt TIMESTAMP
)
begin
    insert into comment (cid, uid, qid, content, createAt, updateAt)
    values (p_cid, p_uid, p_qid, p_content, p_createAt, p_updateAt);
end
//
delimiter ;

-- 코멘트 수정
drop procedure if exists update_comment;
delimiter
//
create procedure update_comment(
    in p_cid int,
    in p_content varchar(255),
    in p_updateAt date
)
begin
    update comment
    set content  = p_content,
        updateAt = p_updateAt
    where cid = p_cid;
end
//
delimiter ;

-- 질문별 댓글 불러오기
drop procedure if exists select_comment_by_question_id;
delimiter
//
create procedure select_comment_by_question_id(in p_qid int)
begin
    select *
    from comment_with_user
    where qid = p_qid
    group by cid;
end //
delimiter ;

-- 코멘트 삭제
drop procedure if exists delete_comment_by_id;
delimiter //
create procedure delete_comment_by_id(in p_cid int)
begin
    delete from comment where cid = p_cid;
end //
delimiter ;

-- 전체 코멘트 삭제
drop procedure if exists delete_comment;
delimiter
//
create procedure delete_comment(in p_qid int)
begin
    delete from comment where qid = p_qid;
end
//
delimiter ;


-- 통계 프로시저
-- 사용자별 활동 통계
drop procedure if exists get_user_activity_stats;
delimiter //
create procedure get_user_activity_stats(in p_period varchar(20))
begin
    declare start_date date;
    set start_date =
            case
                when p_period = 'daily' then curdate()
                when p_period = 'weekly' then date_sub(curdate(), interval 7 day)
                when p_period = 'monthly' then date_sub(curdate(), interval 1 month)
                when p_period = 'yearly' then date_sub(curdate(), interval 1 year)
                else curdate()
                end;

    select q.uid, u.name, u.email, u.company, count(*) as question_count
    from question as q
             join user as u on q.uid = u.uid
    where createAt >= start_date
    group by q.uid;
end //
delimiter ;

-- 사용자가 작성한 코멘트 or 질문의 개수
drop procedure if exists get_written_count;
delimiter //
create procedure get_written_count(
    in p_uName varchar(10),
    in p_tableName varchar(20)
)
begin
    set @query = concat(
            'select u.uid, u.name, u.email, count(*) as ', p_uName, '_cnt '
                'from ', p_tableName, ' as tname '
                'inner join user as u on u.uid = tname.uid ',
            'where u.name = ''', p_uName, ''' ',
            'group by u.uid');

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 사용자별 평균 질문 or 코멘트 개수
drop procedure if exists get_average_count;
delimiter //
create procedure get_average_count(
    in p_tName varchar(20)
)
begin
    set @query = concat(
            'select u.uid, u.name, u.email, avg(user_counts.cnt) as average_', p_tName, '_count ',
            'from user as u ',
            'join (',
            '   select uid, count(*) as cnt ',
            '   from ', p_tName, ' as t ',
            '   group by uid',
            ') as user_counts on u.uid = user_counts.uid ',
            'group by u.uid'
                 );

    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 질문, 코멘트를 입력받아 가장 많이 작성한 사용자 분석
drop procedure if exists get_top_user_by_cnt;
delimiter //
create procedure get_top_user_by_cnt(
    in p_tableName varchar(20),
    in p_colCount varchar(20)
)
begin
    -- 안전한 컬럼 및 테이블 검증 (comment와 question 테이블만 허용)
    if p_tableName not in ('comment', 'question') then
        signal sqlstate '45000' set message_text = 'Invalid table name';
    elseif p_colCount not in ('cid', 'qid') then
        signal sqlstate '45000' set message_text = 'Invalid column name';
    end if;

    -- 동적 쿼리 생성
    set @query = concat(
            'select u.uid, u.name, u.company, count(*) as cnt ',
            'from ', p_tableName, ' as q ',
            'join user as u on q.uid = u.uid ',
            'group by u.uid ',
        -- 질문 갯수 기준으로 내림차순 정렬
            'order by cnt desc'
                 );

    -- 동적 쿼리 실행
    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
-- 회사 이름과 질문 or 코멘트 테이블을 입력받아 가장 많이 작성한 회사를 내림차순으로 출력
drop procedure if exists get_top_user_company_by_cnt;
delimiter //
create procedure get_top_user_company_by_cnt(
    in p_company varchar(10),
    in p_tableName varchar(20)
)
begin
    set @query = concat(
            'select u.company, count(*) as ', p_tableName, '_cnt ',
            'from ', p_tableName, ' as t ',
            'join user as u on t.uid = u.uid ',
            'where u.company = ''', p_company, ''' ',
            'group by u.company ',
            'order by ', p_tableName, '_cnt desc'
                 );
end //
delimiter ;

-- 최근 인기있는 주제 분석
drop procedure if exists get_popular_topics;
delimiter //
create procedure get_popular_topics()
begin
    select t.tname as topic, count(*) as question_count
    from question as q
             join question_tag as qt on q.qid = qt.qid
             join tag as t on qt.tid = t.tid
    group by t.tname
    order by question_count desc
    limit 10;
end //
delimiter ;

-- 소속 회사별 활동 현황 분석
drop procedure if exists get_activity_by_company;
delimiter //
create procedure get_activity_by_company()
begin
    select u.company,
           count(distinct q.qid) as question_cnt,
           count(distinct c.cid) as comment_cnt
    from user as u
             left join question as q on u.uid = q.uid
             left join comment as c on u.uid = c.uid
    group by u.company;
end //
delimiter ;

-- 시간대별 활동 분석
drop procedure if exists get_activity_by_time;
delimiter //
create procedure get_activity_by_time()
begin
    select hour(createAt) as hour, count(*) as activity_cnt
    from question
    group by hour
    order by hour;
end //
delimiter ;

-- 사용자 응답 시간 분석
drop procedure if exists get_user_response_time;
delimiter //
create procedure get_user_response_time(in p_uid int)
begin
    select q.qid, timestampdiff(minute, q.createAt, min(c.createAt)) as response_time_minutes
    from question as q
             join comment as c on q.qid = c.qid
    where q.uid = p_uid
    group by q.qid;
end //
delimiter ;