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
VALUES (null, 'account1', 'user1@example.com', 'password1', '프로그래밍', 'CompanyA', 'admin', '1990-01-01'),
       (null, 'account2', 'user2@example.com', 'password2', '인공지능', 'CompanyB', 'customer', '1992-02-02'),
       (null, 'account3', 'user3@example.com', 'password3', '빅데이터', 'CompanyC', 'admin', '1994-03-03'),
       (null, 'account4', 'user4@example.com', 'password4', '사물인터넷', 'CompanyD', 'customer', '1996-04-04'),
       (null, 'account5', 'user5@example.com', 'password5', '모바일 개발', 'CompanyE', 'admin', '1998-05-05'),
       (null, 'account6', 'user6@example.com', 'password6', '클라우드 컴퓨팅', 'CompanyF', 'customer', '2000-06-06'),
       (null, 'account7', 'user7@example.com', 'password7', '데이터 분석', 'CompanyG', 'admin', '2002-07-07'),
       (null, 'account8', 'user8@example.com', 'password8', '디지털 마케팅', 'CompanyH', 'customer', '2004-08-08'),
       (null, 'account9', 'user9@example.com', 'password9', '머신러닝', 'CompanyI', 'admin', '2006-09-09'),
       (null, 'account10', 'user10@example.com', 'password10', '블록체인', 'CompanyJ', 'customer', '2008-10-10'),
       (null, 'account11', 'user11@example.com', 'password11', '네트워크 보안', 'CompanyK', 'customer', '1988-01-01'),
       (null, 'account12', 'user12@example.com', 'password12', '웹 개발', 'CompanyL', 'admin', '1989-02-02'),
       (null, 'account13', 'user13@example.com', 'password13', '데이터베이스', 'CompanyM', 'customer', '1991-03-03'),
       (null, 'account14', 'user14@example.com', 'password14', '로봇공학', 'CompanyN', 'admin', '1993-04-04'),
       (null, 'account15', 'user15@example.com', 'password15', '하드웨어 설계', 'CompanyO', 'customer', '1995-05-05'),
       (null, 'account16', 'user16@example.com', 'password16', '소프트웨어 엔지니어링', 'CompanyP', 'admin', '1997-06-06'),
       (null, 'account17', 'user17@example.com', 'password17', '컴퓨터 비전', 'CompanyQ', 'customer', '1999-07-07'),
       (null, 'account18', 'user18@example.com', 'password18', '모바일 앱 디자인', 'CompanyR', 'admin', '2001-08-08'),
       (null, 'account19', 'user19@example.com', 'password19', '게임 개발', 'CompanyS', 'customer', '2003-09-09'),
       (null, 'account20', 'user20@example.com', 'password20', '가상현실', 'CompanyT', 'admin', '2005-10-10'),
       (null, 'account21', 'user21@example.com', 'password21', '증강현실', 'CompanyU', 'customer', '1987-11-11'),
       (null, 'account22', 'user22@example.com', 'password22', '사이버 보안', 'CompanyV', 'admin', '1986-12-12'),
       (null, 'account23', 'user23@example.com', 'password23', '기계 학습', 'CompanyW', 'customer', '1985-01-13'),
       (null, 'account24', 'user24@example.com', 'password24', '기계 설계', 'CompanyX', 'admin', '1984-02-14'),
       (null, 'account25', 'user25@example.com', 'password25', '프로젝트 관리', 'CompanyY', 'customer', '1983-03-15'),
       (null, 'account26', 'user26@example.com', 'password26', '유저 경험 디자인', 'CompanyZ', 'admin', '1982-04-16'),
       (null, 'account27', 'user27@example.com', 'password27', '데이터 시각화', 'CompanyAA', 'customer', '1981-05-17'),
       (null, 'account28', 'user28@example.com', 'password28', '사운드 엔지니어링', 'CompanyBB', 'admin', '1980-06-18'),
       (null, 'account29', 'user29@example.com', 'password29', '영상 편집', 'CompanyCC', 'customer', '1979-07-19'),
       (null, 'account30', 'user30@example.com', 'password30', '클라우드 보안', 'CompanyDD', 'admin', '1978-08-20'),
       (null, 'account31', 'user31@example.com', 'password31', '데이터 분석', 'CompanyEE', 'customer', '1987-01-21'),
       (null, 'account32', 'user32@example.com', 'password32', '경영 분석', 'CompanyFF', 'admin', '1986-02-22'),
       (null, 'account33', 'user33@example.com', 'password33', '시스템 관리', 'CompanyGG', 'customer', '1985-03-23'),
       (null, 'account34', 'user34@example.com', 'password34', '백엔드 개발', 'CompanyHH', 'admin', '1984-04-24'),
       (null, 'account35', 'user35@example.com', 'password35', '프론트엔드 개발', 'CompanyII', 'customer', '1983-05-25'),
       (null, 'account36', 'user36@example.com', 'password36', '기술 지원', 'CompanyJJ', 'admin', '1982-06-26'),
       (null, 'account37', 'user37@example.com', 'password37', 'AI 연구', 'CompanyKK', 'customer', '1981-07-27'),
       (null, 'account38', 'user38@example.com', 'password38', '그래픽 디자인', 'CompanyLL', 'admin', '1980-08-28'),
       (null, 'account39', 'user39@example.com', 'password39', '네트워크 엔지니어링', 'CompanyMM', 'customer', '1979-09-29'),
       (null, 'account40', 'user40@example.com', 'password40', 'DB 관리', 'CompanyNN', 'admin', '1978-10-30'),
       (null, 'account41', 'user41@example.com', 'password41', '소프트웨어 테스팅', 'CompanyOO', 'customer', '1977-11-01'),
       (null, 'account42', 'user42@example.com', 'password42', '품질 관리', 'CompanyPP', 'admin', '1976-12-02'),
       (null, 'account43', 'user43@example.com', 'password43', 'IT 컨설팅', 'CompanyQQ', 'customer', '1975-01-03'),
       (null, 'account44', 'user44@example.com', 'password44', 'R&D', 'CompanyRR', 'admin', '1974-02-04'),
       (null, 'account45', 'user45@example.com', 'password45', '클라우드 컴퓨팅', 'CompanySS', 'customer', '1973-03-05'),
       (null, 'account46', 'user46@example.com', 'password46', '블록체인', 'CompanyTT', 'admin', '1972-04-06'),
       (null, 'account47', 'user47@example.com', 'password47', '게임 엔진 개발', 'CompanyUU', 'customer', '1971-05-07'),
       (null, 'account48', 'user48@example.com', 'password48', '인공지능 챗봇', 'CompanyVV', 'admin', '1970-06-08'),
       (null, 'account49', 'user49@example.com', 'password49', '소프트웨어 아키텍처', 'CompanyWW', 'customer', '1969-07-09'),
       (null, 'account50', 'user50@example.com', 'password50', '보안 엔지니어링', 'CompanyXX', 'admin', '1968-08-10'),
       (null, 'account51', 'user51@example.com', 'password51', '자동차 전자 시스템', 'CompanyYY', 'customer', '1967-09-11'),
       (null, 'account52', 'user52@example.com', 'password52', '에너지 시스템', 'CompanyZZ', 'admin', '1966-10-12'),
       (null, 'account53', 'user53@example.com', 'password53', '물류 최적화', 'CompanyAAA', 'customer', '1965-11-13'),
       (null, 'account54', 'user54@example.com', 'password54', '금융 시스템 개발', 'CompanyBBB', 'admin', '1964-12-14'),
       (null, 'account55', 'user55@example.com', 'password55', '모바일 결제', 'CompanyCCC', 'customer', '1963-01-15'),
       (null, 'account56', 'user56@example.com', 'password56', '전자상거래', 'CompanyDDD', 'admin', '1962-02-16'),
       (null, 'account57', 'user57@example.com', 'password57', '의료 IT', 'CompanyEEE', 'customer', '1961-03-17'),
       (null, 'account58', 'user58@example.com', 'password58', '헬스케어 기술', 'CompanyFFF', 'admin', '1960-04-18'),
       (null, 'account59', 'user59@example.com', 'password59', '법률 테크놀로지', 'CompanyGGG', 'customer', '1959-05-19'),
       (null, 'account60', 'user60@example.com', 'password60', '스마트 홈 기술', 'CompanyHHH', 'admin', '1958-06-20'),
       (null, 'account61', 'user61@example.com', 'password61', '스마트 홈 기술', 'CompanyAAA', 'user', '1958-06-21'),
       (null, 'account62', 'user62@example.com', 'password62', 'IoT', 'CompanyBBB', 'user', '1958-07-21'),
       (null, 'account63', 'user63@example.com', 'password63', '인공지능', 'CompanyCCC', 'user', '1959-01-01'),
       (null, 'account64', 'user64@example.com', 'password64', '자율주행', 'CompanyDDD', 'user', '1960-02-15'),
       (null, 'account65', 'user65@example.com', 'password65', '블록체인', 'CompanyEEE', 'user', '1961-03-17'),
       (null, 'account66', 'user66@example.com', 'password66', '클라우드 컴퓨팅', 'CompanyFFF', 'user', '1962-04-20'),
       (null, 'account67', 'user67@example.com', 'password67', '빅데이터 분석', 'CompanyGGG', 'user', '1963-05-25'),
       (null, 'account68', 'user68@example.com', 'password68', '사이버 보안', 'CompanyHHH', 'user', '1964-06-30'),
       (null, 'account69', 'user69@example.com', 'password69', '디지털 마케팅', 'CompanyIII', 'user', '1965-07-05'),
       (null, 'account70', 'user70@example.com', 'password70', '가상 현실', 'CompanyJJJ', 'user', '1966-08-10'),
       (null, 'account71', 'user71@example.com', 'password71', '증강 현실', 'CompanyKKK', 'user', '1967-09-15'),
       (null, 'account72', 'user72@example.com', 'password72', '로봇 공학', 'CompanyLLL', 'user', '1968-10-20'),
       (null, 'account73', 'user73@example.com', 'password73', '디지털 헬스케어', 'CompanyMMM', 'user', '1969-11-25'),
       (null, 'account74', 'user74@example.com', 'password74', '에너지 저장 기술', 'CompanyNNN', 'user', '1970-12-30'),
       (null, 'account75', 'user75@example.com', 'password75', '스마트 시티', 'CompanyOOO', 'user', '1971-01-15'),
       (null, 'account76', 'user76@example.com', 'password76', '자원 재활용', 'CompanyPPP', 'user', '1972-02-20'),
       (null, 'account77', 'user77@example.com', 'password77', '지속 가능성', 'CompanyQQQ', 'user', '1973-03-25'),
       (null, 'account78', 'user78@example.com', 'password78', '스마트 농업', 'CompanyRRR', 'user', '1974-04-30'),
       (null, 'account79', 'user79@example.com', 'password79', '바이오 기술', 'CompanySSS', 'user', '1975-05-05'),
       (null, 'account80', 'user80@example.com', 'password80', '우주 기술', 'CompanyTTT', 'user', '1976-06-10'),
       (null, 'account81', 'user81@example.com', 'password81', '양자 컴퓨팅', 'CompanyUUU', 'user', '1977-07-15'),
       (null, 'account82', 'user82@example.com', 'password82', '3D 프린팅', 'CompanyVVV', 'user', '1978-08-20'),
       (null, 'account83', 'user83@example.com', 'password83', '웨어러블 기술', 'CompanyWWW', 'user', '1979-09-25'),
       (null, 'account84', 'user84@example.com', 'password84', '드론 기술', 'CompanyXXX', 'user', '1980-10-30'),
       (null, 'account85', 'user85@example.com', 'password85', '뉴로 모피즈', 'CompanyYYY', 'user', '1981-11-15'),
       (null, 'account86', 'user86@example.com', 'password86', '유전공학', 'CompanyZZZ', 'user', '1982-12-10'),
       (null, 'account87', 'user87@example.com', 'password87', '환경 과학', 'CompanyAAA', 'user', '1983-01-05'),
       (null, 'account88', 'user88@example.com', 'password88', '신소재', 'CompanyBBB', 'user', '1984-02-15'),
       (null, 'account89', 'user89@example.com', 'password89', '스마트 에너지', 'CompanyCCC', 'user', '1985-03-20'),
       (null, 'account90', 'user90@example.com', 'password90', '첨단 제조 기술', 'CompanyDDD', 'user', '1986-04-25'),
       (null, 'account91', 'user91@example.com', 'password91', '모바일 기술', 'CompanyEEE', 'user', '1987-05-30'),
       (null, 'account92', 'user92@example.com', 'password92', '디지털 트윈', 'CompanyFFF', 'user', '1988-06-15'),
       (null, 'account93', 'user93@example.com', 'password93', '자연 언어 처리', 'CompanyGGG', 'user', '1989-07-10'),
       (null, 'account94', 'user94@example.com', 'password94', '컴퓨터 비전', 'CompanyHHH', 'user', '1990-08-05'),
       (null, 'account95', 'user95@example.com', 'password95', '엣지 컴퓨팅', 'CompanyIII', 'user', '1991-09-15'),
       (null, 'account96', 'user96@example.com', 'password96', '첨단 운송 기술', 'CompanyJJJ', 'user', '1992-10-10'),
       (null, 'account97', 'user97@example.com', 'password97', '지능형 자동화', 'CompanyKKK', 'user', '1993-11-25'),
       (null, 'account98', 'user98@example.com', 'password98', '분산 컴퓨팅', 'CompanyLLL', 'user', '1994-12-20'),
       (null, 'account99', 'user99@example.com', 'password99', '데이터 과학', 'CompanyMMM', 'user', '1995-01-15'),
       (null, 'account100', 'user100@example.com', 'password100', '지리 정보 시스템', 'CompanyNNN', 'admin', '1996-02-10');

-- 질문 추가
INSERT INTO question (qid, uid, interest, title, content, category, createAt, updateAt, great)
VALUES (null, 1, '프로그래밍', '자바 기초 질문', '자바 변수 선언 방법이 궁금합니다.', '질문답변', '2024-01-01', '2024-01-01', 0),
       (null, 2, '프로그래밍', '자바스크립트 비동기 질문', '동기와 비동기가 정확히 무엇인가요?', '질문답변', '2024-01-02', '2024-01-02', 5),
       (null, 2, '인공지능', '딥러닝과 머신러닝 차이점', '두 개념의 차이를 알고 싶습니다.', '질문답변', '2024-01-02', '2024-01-02', 0),
       (null, 3, '데이터베이스', 'SQL과 NoSQL의 차이', '어떤 상황에서 각 DB를 사용하나요?', '질문답변', '2024-01-03', '2024-01-03', 0),
       (null, 4, '프론트엔드', '리액트와 뷰의 차이', '리액트와 뷰 중 어떤 것이 더 효율적인가요?', '자유 게시판', '2024-01-04', '2024-01-04', 0),
       (null, 5, '네트워크', 'OSI 7계층 설명', 'OSI 모델의 각 계층에 대해 설명해주세요.', '질문답변', '2024-01-05', '2024-01-05', 0),
       (null, 6, '보안', 'XSS와 CSRF 차이', '두 보안 취약점의 차이점을 설명해주세요.', '질문답변', '2024-01-06', '2024-01-06', 0),
       (null, 7, '알고리즘', '버블 정렬의 시간 복잡도', '버블 정렬의 시간 복잡도를 알고 싶습니다.', '질문답변', '2024-01-07', '2024-01-07', 0),
       (null, 8, '모바일 개발', '안드로이드와 iOS 개발 차이', '안드로이드와 iOS 개발의 차이점이 궁금합니다.', '자유 게시판', '2024-01-08', '2024-01-08', 0),
       (null, 9, '클라우드 컴퓨팅', 'AWS와 Azure 비교', 'AWS와 Azure의 차이점을 알고 싶습니다.', '질문답변', '2024-01-09', '2024-01-09', 0),
       (null, 10, '데이터 과학', '빅데이터와 데이터 과학', '두 개념의 차이와 적용 예를 알고 싶습니다.', '자유 게시판', '2024-01-10', '2024-01-10', 0),
       (null, 11, '머신러닝', '회귀분석과 분류의 차이', '회귀와 분류의 차이점을 설명해주세요.', '질문답변', '2024-01-11', '2024-01-11', 0),
       (null, 12, '백엔드', 'RESTful API란?', 'RESTful API의 개념을 알고 싶습니다.', '자유 게시판', '2024-01-12', '2024-01-12', 0),
       (null, 13, '운영체제', '쓰레드와 프로세스 차이', '쓰레드와 프로세스의 차이점을 설명해주세요.', '질문답변', '2024-01-13', '2024-01-13', 0),
       (null, 14, '프로그래밍', '자바스크립트 클로저 개념', '자바스크립트 클로저의 원리가 궁금합니다.', '자유 게시판', '2024-01-14', '2024-01-14', 0),
       (null, 15, '컴퓨터 비전', 'OpenCV 사용법', 'OpenCV로 이미지를 분석하는 방법을 알고 싶습니다.', '질문답변', '2024-01-15', '2024-01-15', 0),
       (null, 16, '인공지능', 'GAN의 구조', 'GAN의 기본 구조와 원리를 설명해주세요.', '질문답변', '2024-01-16', '2024-01-16', 0),
       (null, 17, '데이터 분석', '파이썬으로 데이터 시각화', '파이썬으로 데이터 시각화를 하는 방법이 궁금합니다.', '자유 게시판', '2024-01-17', '2024-01-17', 0),
       (null, 18, '컴퓨터 그래픽스', '렌더링 엔진의 역할', '렌더링 엔진이 어떤 역할을 하는지 궁금합니다.', '질문답변', '2024-01-18', '2024-01-18', 0),
       (null, 19, '네트워크', 'TCP와 UDP 차이', 'TCP와 UDP의 차이점을 설명해주세요.', '자유 게시판', '2024-01-19', '2024-01-19', 0),
       (null, 20, '보안', '암호화와 해싱의 차이', '암호화와 해싱의 개념 차이를 알고 싶습니다.', '질문답변', '2024-01-20', '2024-01-20', 0),
       (null, 21, '프론트엔드', 'CSS Flexbox 사용법', 'Flexbox로 레이아웃을 잡는 방법을 알고 싶습니다.', '질문답변', '2024-01-21', '2024-01-21', 0),
       (null, 22, '알고리즘', '이진 탐색의 시간 복잡도', '이진 탐색의 시간 복잡도를 설명해주세요.', '자유 게시판', '2024-01-22', '2024-01-22', 0),
       (null, 23, '모바일 개발', 'React Native와 Flutter 비교', 'React Native와 Flutter의 차이점을 알고 싶습니다.', '질문답변', '2024-01-23',
        '2024-01-23', 0),
       (null, 24, '클라우드 컴퓨팅', '서버리스 컴퓨팅', '서버리스 컴퓨팅의 개념을 알고 싶습니다.', '자유 게시판', '2024-01-24', '2024-01-24', 0),
       (null, 25, '머신러닝', 'KNN 알고리즘의 원리', 'KNN 알고리즘의 원리를 설명해주세요.', '질문답변', '2024-01-25', '2024-01-25', 0),
       (null, 26, '백엔드', 'API와 SDK의 차이', 'API와 SDK의 차이를 설명해주세요.', '자유 게시판', '2024-01-26', '2024-01-26', 0),
       (null, 27, '운영체제', '데드락이란?', '데드락의 원인과 해결 방법이 궁금합니다.', '질문답변', '2024-01-27', '2024-01-27', 0),
       (null, 28, '프로그래밍', '파이썬과 자바 비교', '파이썬과 자바의 장단점 비교가 궁금합니다.', '자유 게시판', '2024-01-28', '2024-01-28', 0),
       (null, 29, '컴퓨터 비전', '이미지 분류 모델', '이미지 분류 모델을 만드는 방법을 알고 싶습니다.', '질문답변', '2024-01-29', '2024-01-29', 0),
       (null, 30, '데이터 분석', '빅데이터와 통계 차이', '빅데이터와 통계의 차이를 설명해주세요.', '질문답변', '2024-01-30', '2024-01-30', 0),
       (null, 31, '프로그래밍', 'Java의 상속 개념', '상속을 어떻게 사용하는지 알고 싶습니다.', '질문답변', '2024-02-01', '2024-02-01', 0),
       (null, 32, '데이터베이스', '데이터베이스 인덱스의 역할', '인덱스가 왜 필요한지 설명해주세요.', '질문답변', '2024-02-02', '2024-02-02', 0),
       (null, 33, '인공지능', '강화학습 기초', '강화학습의 개념과 사례가 궁금합니다.', '질문답변', '2024-02-03', '2024-02-03', 0),
       (null, 34, '프론트엔드', 'CSS Grid와 Flexbox 차이', '두 레이아웃 방식의 차이를 설명해주세요.', '자유 게시판', '2024-02-04', '2024-02-04', 0),
       (null, 35, '네트워크', 'VPN이란 무엇인가?', 'VPN의 원리와 사용법을 알고 싶습니다.', '질문답변', '2024-02-05', '2024-02-05', 0),
       (null, 36, '보안', 'SQL Injection 방어 방법', 'SQL 인젝션을 방어하는 방법이 궁금합니다.', '질문답변', '2024-02-06', '2024-02-06', 0),
       (null, 37, '알고리즘', '퀵 정렬의 동작 원리', '퀵 정렬이 어떻게 작동하는지 설명해주세요.', '자유 게시판', '2024-02-07', '2024-02-07', 0),
       (null, 38, '모바일 개발', 'iOS와 안드로이드 앱 차이', '두 플랫폼 앱 개발의 차이점을 알고 싶습니다.', '질문답변', '2024-02-08', '2024-02-08', 0),
       (null, 39, '클라우드 컴퓨팅', '클라우드 보안 위험', '클라우드 사용 시 보안 리스크가 무엇인가요?', '질문답변', '2024-02-09', '2024-02-09', 0),
       (null, 40, '데이터 과학', '탐색적 데이터 분석 (EDA)', 'EDA의 절차와 유용성에 대해 설명해주세요.', '자유 게시판', '2024-02-10', '2024-02-10', 0),
       (null, 41, '머신러닝', '의사결정나무의 작동 원리', '의사결정나무 알고리즘이 어떻게 작동하는지 설명해주세요.', '질문답변', '2024-02-11', '2024-02-11', 0),
       (null, 42, '백엔드', '마이크로서비스 아키텍처', '마이크로서비스의 장단점이 궁금합니다.', '자유 게시판', '2024-02-12', '2024-02-12', 0),
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
       (null, 56, '백엔드', '세션과 JWT 차이', '세션과 JWT 인증 방식의 차이를 알고 싶습니다.', '자유 게시판', '2024-02-26', '2024-02-26', 0),
       (null, 57, '운영체제', '멀티태스킹과 멀티프로세싱', '두 개념의 차이점과 사용 사례가 궁금합니다.', '질문답변', '2024-02-27', '2024-02-27', 0),
       (null, 58, '프로그래밍', '정규 표현식 기본', '정규 표현식을 어떻게 사용하는지 궁금합니다.', '자유 게시판', '2024-02-28', '2024-02-28', 0),
       (null, 59, '컴퓨터 비전', '이미지 세그멘테이션', '이미지 세그멘테이션이 어떻게 이루어지는지 설명해주세요.', '질문답변', '2024-02-29', '2024-02-29', 0),
       (null, 60, '데이터 분석', 'EDA와 PCA 차이', '탐색적 데이터 분석과 주성분 분석의 차이를 설명해주세요.', '질문답변', '2024-03-01', '2024-03-01', 0),
       (null, 1, '프로그래밍', 'Java의 인터페이스 사용법', '인터페이스를 구현하는 방법이 궁금합니다.', '질문답변', '2024-03-02', '2024-03-02', 0),
       (null, 2, '데이터베이스', 'SQL 쿼리 최적화', 'SQL 쿼리를 최적화하는 방법에 대해 알고 싶습니다.', '자유 게시판', '2024-03-03', '2024-03-03', 0),
       (null, 3, '머신러닝', 'KNN 알고리즘 설명', 'KNN 알고리즘의 작동 원리가 궁금합니다.', '질문답변', '2024-03-04', '2024-03-04', 0),
       (null, 4, '프론트엔드', 'React와 Vue의 차이점', 'React와 Vue를 비교해 주세요.', '자유 게시판', '2024-03-05', '2024-03-05', 0),
       (null, 5, '네트워크', 'DNS의 작동 원리', 'DNS가 어떻게 작동하는지 설명해주세요.', '질문답변', '2024-03-06', '2024-03-06', 0),
       (null, 6, '보안', 'XSS 방어 방법', 'XSS 공격을 방어하는 방법이 궁금합니다.', '질문답변', '2024-03-07', '2024-03-07', 0),
       (null, 7, '알고리즘', '그래프 탐색의 기초', 'DFS와 BFS의 차이를 알고 싶습니다.', '자유 게시판', '2024-03-08', '2024-03-08', 0),
       (null, 8, '모바일 개발', '안드로이드의 MVVM 패턴', 'MVVM 패턴을 사용하는 방법에 대해 알고 싶습니다.', '질문답변', '2024-03-09', '2024-03-09', 0),
       (null, 9, '클라우드 컴퓨팅', '서버리스 컴퓨팅이란?', '서버리스 컴퓨팅의 개념과 장점이 궁금합니다.', '질문답변', '2024-03-10', '2024-03-10', 0),
       (null, 10, '데이터 과학', '파이썬의 Pandas 라이브러리', 'Pandas의 기본 사용법을 알고 싶습니다.', '자유 게시판', '2024-03-11', '2024-03-11', 0),
       (null, 11, '머신러닝', '지도학습과 비지도학습', '머신러닝에서 지도학습과 비지도학습의 차이를 설명해주세요.', '질문답변', '2024-03-12', '2024-03-12', 0),
       (null, 12, '백엔드', 'REST와 SOAP의 차이점', 'REST와 SOAP API의 차이를 알고 싶습니다.', '자유 게시판', '2024-03-13', '2024-03-13', 0),
       (null, 13, '운영체제', '프로세스와 스레드 차이', '프로세스와 스레드의 차이를 알고 싶습니다.', '질문답변', '2024-03-14', '2024-03-14', 0),
       (null, 14, '프로그래밍', '객체지향 프로그래밍의 4가지 원칙', '객체지향의 원칙이 궁금합니다.', '자유 게시판', '2024-03-15', '2024-03-15', 0),
       (null, 15, '컴퓨터 비전', 'YOLO 알고리즘이란?', 'YOLO 알고리즘의 원리와 활용 사례가 궁금합니다.', '질문답변', '2024-03-16', '2024-03-16', 0),
       (null, 16, '인공지능', '딥러닝의 기초 개념', '딥러닝의 기본 개념을 알고 싶습니다.', '질문답변', '2024-03-17', '2024-03-17', 0),
       (null, 17, '데이터 분석', 'EDA의 중요성', 'EDA가 왜 중요한지 알고 싶습니다.', '자유 게시판', '2024-03-18', '2024-03-18', 0),
       (null, 18, '컴퓨터 그래픽스', 'OpenGL의 기본', 'OpenGL의 기본 사용법을 알고 싶습니다.', '질문답변', '2024-03-19', '2024-03-19', 0),
       (null, 19, '네트워크', 'HTTP와 HTTPS의 차이', 'HTTP와 HTTPS의 차이점을 알고 싶습니다.', '자유 게시판', '2024-03-20', '2024-03-20', 0),
       (null, 20, '보안', 'SSL 인증서란 무엇인가?', 'SSL 인증서의 역할이 궁금합니다.', '질문답변', '2024-03-21', '2024-03-21', 0),
       (null, 21, '프론트엔드', 'CSS 애니메이션 활용법', 'CSS 애니메이션을 어떻게 사용하는지 궁금합니다.', '질문답변', '2024-03-22', '2024-03-22', 0),
       (null, 22, '알고리즘', '해싱의 원리', '해싱 알고리즘이 어떻게 작동하는지 궁금합니다.', '자유 게시판', '2024-03-23', '2024-03-23', 0),
       (null, 23, '모바일 개발', 'Swift의 기초', 'Swift 프로그래밍 언어의 기본을 알고 싶습니다.', '질문답변', '2024-03-24', '2024-03-24', 0),
       (null, 24, '클라우드 컴퓨팅', '컨테이너 기술의 이해', 'Docker와 Kubernetes의 차이가 궁금합니다.', '자유 게시판', '2024-03-25', '2024-03-25', 0),
       (null, 25, '머신러닝', '로지스틱 회귀의 원리', '로지스틱 회귀의 개념을 알고 싶습니다.', '질문답변', '2024-03-26', '2024-03-26', 0),
       (null, 26, '백엔드', '비동기 처리와 동기 처리', '동기와 비동기 처리의 차이를 알고 싶습니다.', '자유 게시판', '2024-03-27', '2024-03-27', 0),
       (null, 27, '운영체제', '메모리 관리 기법', '운영체제의 메모리 관리 기법이 궁금합니다.', '질문답변', '2024-03-28', '2024-03-28', 0),
       (null, 28, '프로그래밍', 'Git의 기본 사용법', 'Git을 사용하는 방법이 궁금합니다.', '자유 게시판', '2024-03-29', '2024-03-29', 0),
       (null, 29, '컴퓨터 비전', '이미지 필터링 기법', '이미지 필터링의 원리를 알고 싶습니다.', '질문답변', '2024-03-30', '2024-03-30', 0),
       (null, 30, '데이터 분석', '데이터 시각화 도구', '데이터 시각화에 사용되는 도구가 궁금합니다.', '질문답변', '2024-03-31', '2024-03-31', 0),
       (null, 31, '프로그래밍', 'Java와 Kotlin 비교', 'Java와 Kotlin의 차이점을 알고 싶습니다.', '질문답변', '2024-04-01', '2024-04-01', 0),
       (null, 32, '알고리즘', '버블 정렬과 선택 정렬', '두 정렬 알고리즘의 차이점을 설명해주세요.', '자유 게시판', '2024-04-02', '2024-04-02', 0),
       (null, 33, '네트워크', 'IPSec과 SSL 차이', 'IPSec과 SSL의 차이점이 궁금합니다.', '질문답변', '2024-04-03', '2024-04-03', 0),
       (null, 34, '머신러닝', '머신러닝의 과적합 해결법', '과적합을 방지하는 방법이 궁금합니다.', '질문답변', '2024-04-04', '2024-04-04', 0),
       (null, 35, '보안', '암호화 알고리즘의 종류', '다양한 암호화 알고리즘이 궁금합니다.', '자유 게시판', '2024-04-05', '2024-04-05', 0),
       (null, 36, '프론트엔드', 'SPA와 MPA의 차이', '단일 페이지 애플리케이션과 다중 페이지 애플리케이션의 차이를 알고 싶습니다.', '질문답변', '2024-04-06',
        '2024-04-06', 0),
       (null, 37, '백엔드', 'JWT 토큰의 작동 원리', 'JWT 토큰이 어떻게 작동하는지 알고 싶습니다.', '자유 게시판', '2024-04-07', '2024-04-07', 0),
       (null, 38, '컴퓨터 그래픽스', '2D와 3D 렌더링의 차이', '2D와 3D 렌더링의 차이를 알고 싶습니다.', '질문답변', '2024-04-08', '2024-04-08', 0),
       (null, 39, '프로그래밍', '파이썬에서 멀티스레드 구현', '파이썬에서 멀티스레드를 구현하는 방법을 알고 싶습니다.', '질문답변', '2024-04-09', '2024-04-09', 0),
       (null, 40, '운영체제', '스케줄링 알고리즘의 종류', '운영체제에서 사용하는 스케줄링 알고리즘에 대해 알고 싶습니다.', '자유 게시판', '2024-04-10', '2024-04-10',
        0);

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

    -- 추가된 다양한 분야 태그
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
    (40, '법학');

INSERT INTO question_tag (qid, tid)
VALUES (1, 2),
       (1, 3),
       (2, 1),
       (2, 4),
       (3, 1),
       (3, 5),
       (4, 3),
       (4, 6),
       (5, 2),
       (5, 4),
       (6, 3),
       (6, 5),
       (7, 1),
       (7, 6),
       (8, 2),
       (8, 3),
       (9, 4),
       (9, 5),
       (10, 6),
       (10, 1),
       (11, 3),
       (11, 2),
       (12, 4),
       (12, 5),
       (13, 6),
       (13, 1),
       (14, 2),
       (14, 3),
       (15, 4),
       (15, 5);

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
       (null, 15, 38, '더 많은 정보 부탁드려요.', '2024-05-18', '2024-05-18');

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
       q.uid as question_uid,
       q.content as question_content,
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
    group by uid;
end //
delimiter ;

-- 사용자가 작성한 질문의 개수
drop procedure if exists get_user_question_count;
delimiter //
create procedure get_user_question_count(in p_uid int, out question_count int)
begin
    select count(*)
    into question_count
    from question
    where uid = p_uid;
end //
delimiter ;

SET @question_count = 0;
CALL get_user_question_count(2, @question_count);
SELECT @question_count;

-- 사용자가 작성한 코멘트 개수
drop procedure if exists get_user_comment_count;
delimiter //
create procedure get_user_comment_count(in p_uid int)
begin
    select count(*)
    from comment
    where uid = p_uid;
end //
delimiter ;

-- 사용자별 평균 질문 or 코멘트 개수
drop procedure if exists getAverageCount;

-- 질문, 코멘트를 입력받아 가장 많이 작성한 사용자 분석
drop procedure if exists getTopUserByCnt;
delimiter //
create procedure getTopUserByCnt(
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
            'select u.uid, u.name, u.company, count(*) as ', p_tableName, '_cnt ',
            'from ', p_tableName, ' as q ',
            'join user as u on q.uid = u.uid ',
            'group by u.uid ',
        -- 질문 갯수 기준으로 내림차순 정렬
            'order by ', p_tableName, '_cnt desc'
                 );

    -- 동적 쿼리 실행
    prepare stmt from @query;
    execute stmt;
    deallocate prepare stmt;
end //
delimiter ;

-- 특정 회사 내 최다 질문 또는 코멘트를 작성한 사용자
-- 회사 이름과 질문 or 코멘트 테이블을 입력받아 가장 많이 작성한 회사를 내림차순으로 출력
drop procedure if exists getTopUserCompanyByCnt;
delimiter //
create procedure getTopUserCompanyByCnt(
    in p_company varchar(10),
    in p_tableName varchar(20)
)
begin
    set @query = concat(
        'select u.company, count(*) as ', p_tableName, '_cnt',
        'from ', p_tableName , ' as tname ',
        'join user as u on tname.uid = u.uid ',
        'group by u.company ',
        'order by ', p_tableName, '_cnt'
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
call get_popular_topics();

-- 소속 회사별 활동 현황 분석
drop procedure if exists get_activity_by_company;
delimiter //
create procedure get_activity_by_company()
begin
    select u.company, count(q.qid) as question_cnt, count(c.cid) as comment_cnt
    from user as u
             join question as q on u.uid = q.uid
             join comment as c on u.uid = c.uid
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