DELETE FROM owner;
DELETE FROM cafes;
DELETE FROM tag;

INSERT INTO tag(tag_id,tag_name)
VALUES ('1', '감성적'),
('2', '낭만적'),
('3', '자연뷰'),
('4', '한강뷰'),
('5', '마운틴뷰'),
('6', '루프탑'),
('7', '힙함'),
('8', '트렌디'),
('9', '브런치맛집'),
('10', '편리함'),
('11', '조용함'),
('12', '로맨틱'),
('13', '넓음'),
('14', '북카페'),
('15', '올드감성'),
('16', '청결함'),
('17', '동네카페'),
('18', '다락방'),
('19', '한옥'),
('20', '플라워카페'),
('21', '빈티지'),
('22', '모던'),
('23', '아늑함'),
('24', '화려함'),
('25', '작업공간'),
('26', '야외테라스');

INSERT INTO owner(OWNER_ID, createdAt, updatedAt, OWNER_DISPLAYNAME, OWNER_EMAIL, OWNER_STATUS, OWNER_PASSWORD)
VALUES ('1', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주1', 'onwer1@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('2', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주2', 'onwer2@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('3', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주3', 'onwer3@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('4', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주4', 'onwer4@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('5', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주5', 'onwer5@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('6', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주6', 'onwer6@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('7', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주7', 'onwer7@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC'),
('8', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '점주8', 'onwer8@gmail.com', 'OWNER_ACTIVE', '{bcrypt}$2a$10$Ifs9a2ctQLTVKYX11Sso1.ZrnOzpFsThiYMhWCZnFIQL9z9Wg1qDC');


INSERT INTO cafes(cafe_id, owner_id, cafe_name, createdAt, updatedAt, address, contact, latitude, longitude, short_address, notice, rating, open_time, close_time, is_open_all_time, is_charging_available, has_parking, is_pet_friendly, has_dessert)
VALUES ('1', '1', '커피볶는제임스', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울특별시 강서구 내발산동 648-15', '02-2063-4045', '126.843752', '37.5574425', '강서구', '공지사항', '5', '8:00', '22:00', 'false', 'true', 'true', 'false', 'true'),
('2', '2', '카페넬비콜로', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울특별시 강서구 내발산동 공항대로42길 16', '070-7781-4389', '126.843582', '37.5572171', '강서구', '공지사항', '5', '8:00', '22:30', 'false', 'true', 'true', 'false', 'true'),
('3', '3', '스마일빈', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울특별시 양천구 중앙로36길 30', '0507-1366-2035', '126.857349', '37.5196362', '양천구', '공지사항', '5', '10:00', '21:00', 'false', 'true', 'false', 'false', 'true'),
('4', '4', '커피별녹색잔', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울특별시 양천구 신정4동 988-14', '02-2696-3337', '126.860834', '37.5252626', '양천구', '공지사항', '5', '11:00', '22:30', 'false', 'true', 'false', 'false', 'true'),
('5', '5', '로스톤', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울 영등포구 대림로31가길 13 1-4층', '0507-1388-1820', '126.896623', '37.4956028', '영등포구', '공지사항', '5', '10:00', '23:00', 'false', 'true', 'false', 'false', 'true'),
('6', '6', '버터하이', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울 영등포구 여의대방로53길 30 1층', '0507-1339-4488', '126.921506', '37.5121466', '영등포구', '공지사항', '5', '11:00', '21:00', 'false', 'true', 'true', 'false', 'true'),
('7', '7', '커피 벌스데이', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울 마포구 와우산로29길 26-33 1층 커피 벌스데이', '0507-1449-2353', '126.928737', '37.5555162', '마포구', '공지사항', '5', '11:00', '21:00', 'false', 'true', 'false', 'true', 'true'),
('8', '8', '잼잼', '2023-07-20 14:40:56', '2023-07-20 14:40:56', '서울 마포구 성미산로29길 24 지하1층', '0507-1346-3176', '126.922367', '37.5650446', '마포구', '공지사항', '5', '8:00', '22:00', 'false', 'true', 'false', 'true', 'true');
