	
    /***************************************************************/
    /* 버스역 목록 */
	drop table bus_station;
	create table bus_station (
        city VARCHAR2(20),
        station VARCHAR2(50) primary key
	);
	desc bus_station;
	
	/*[tomcat]요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.*/
	/* 톰캣 server.xml의 Connector에 relaxedQueryChars="[]()^|&quot;" 추가 */
	insert into bus_station (city, station) values ('서울', '[서울]김포공항');
	insert into bus_station (city, station) values ('서울', '[서울]동서울');
	insert into bus_station (city, station) values ('서울', '[서울]상봉');
	insert into bus_station (city, station) values ('서울', '[서울]서울남부');
	insert into bus_station (city, station) values ('부산', '[부산]김해공항');
	insert into bus_station (city, station) values ('부산', '[부산]부산동부(노포)');
	insert into bus_station (city, station) values ('부산', '[부산]부산서부');
	insert into bus_station (city, station) values ('대구', '[대구]대구북부');
	insert into bus_station (city, station) values ('대구', '[대구]대구서부');
	insert into bus_station (city, station) values ('인천', '[인천]인천');
	insert into bus_station (city, station) values ('인천', '[인천]인천송도');
	insert into bus_station (city, station) values ('광주', '[광주]광주(유스퀘어)');
	insert into bus_station (city, station) values ('대전', '[대전]대전서부');
	commit;
	
	select * from bus_station;
	
	/***************************************************************/
	/* 버스 시간표 : 버스코드 출발시간 도착시간 등급(우등/일반) 잔여석 회사*/
	drop table bus_timetable;
	create table bus_timetable (
        busNo VARCHAR2(10),
        dpt_st VARCHAR2(50) not null,
        arrv_st VARCHAR2(50) not null,
	    ddate date not null,
	    adate date not null,
        seat NUMBER(5) not null,
	    unBookedSeat NUMBER(5) not null,
	    grade VARCHAR2(10) not null,
	    company VARCHAR2(30) not null,
        constraint timetable_pk primary key(busNo, ddate)
	);
	desc bus_timetable;
    /* 가는길 */
    insert into bus_timetable values ('ex1b1', '[서울]김포공항', '[부산]김해공항', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 20, 12, '일반', '태양고속');
	insert into bus_timetable values ('ex2b1', '[서울]김포공항', '[대구]대구북부',  to_date('2022-02-11 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 19:00', 'yyyy-MM-dd HH24:MI'), 15, 15, '우등', '백마고속');
    insert into bus_timetable values ('ex3b1', '[서울]김포공항', '[인천]인천',  to_date('2022-02-11 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 16:00', 'yyyy-MM-dd HH24:MI'), 30, 30, '일반', '보람고속');
	/* 오는길 */
    insert into bus_timetable values ('ex1b1', '[부산]김해공항', '[서울]김포공항', to_date('2022-02-12 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 13:30', 'yyyy-MM-dd HH24:MI'), 20, 20, '일반', '태양고속');
	insert into bus_timetable values ('ex2b1', '[대구]대구북부', '[서울]김포공항',  to_date('2022-02-12 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 19:00', 'yyyy-MM-dd HH24:MI'), 15, 10, '우등', '백마고속');
    insert into bus_timetable values ('ex3b1', '[인천]인천', '[서울]김포공항',  to_date('2022-02-12 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 16:00', 'yyyy-MM-dd HH24:MI'), 30, 22, '일반', '보람고속');

	select * from bus_timetable;
	commit;
	
	select (to_char(ddate, 'HH24:MI')) from bus_timetable;
	select (to_char(adate, 'HH24:MI')) from bus_timetable;
	
   
	select to_char(ddate, 'yyyy-MM-dd HH24:MI'), 
            to_char(adate, 'yyyy-MM-dd HH24:MI'), 
			unBookedSeat, 
			grade, 
			company 
	from bus_timetable 
	where to_char(ddate, 'yyyy-MM-dd') >= '2022-01-18' 
         and to_char(ddate, 'HH24:MI') >= '11:00';
    
    
    select ddate, adate, unBookedSeat, grade, company 
    from bus_timetable 
    where to_char(ddate, 'yyyy-MM-dd') >= '2022-01-18' 
    and to_char(ddate, 'HH24:MI') >= '09:00'
    and dpt_st='[서울]김포공항'
    and arrv_st='[부산]김해공항';
   
    commit;
    
    /***************************************************************/
	/* 가격표 : 성인 중고생(19세미만) : 20%할인 유아(13세미만) : 50%할인 */
    drop table ticket_price;
    
	create table ticket_price (
	    type VARCHAR2(10),
	    price NUMBER(5)
	);
	insert into ticket_price values('우등', 60000);
	insert into ticket_price values('일반', 30000);
	
	select * from ticket_price;
	
	/* 중고생(19세미만) : 20%할인 */
	select type, price*0.8 from ticket_price;
	/* 유아(13세미만) : 50%할인 */
	select type, price*0.5 from ticket_price;
	commit;
	
    /*성인, 중고생, 유아 3명일때 가격도출 쿼리*/
    select 
        price*1 as adult,  
        price*0.8*0 as student, 
        price*0.5*0 as kid 
    from ticket_price; 
	
    
    select sum((price*1)+(price*0.8*0)+(price*0.5*0)) as total from ticket_price where type='우등'; 
    
    
    /***************************************************************/
    drop SEQUENCE b_seq;
    /*시퀀스 생성*/
    create SEQUENCE b_seq 
      INCREMENT BY 1 
      START WITH 1
      MINVALUE 1
      NOMAXVALUE
      NOCYCLE;

    /***************************************************************/  
    drop table bus_ticket;
	/* 예약정보 : 예약번호(sequence), 출발역, 도착역, 출발시간, 등급, 회사, 나이(성인/중고생/유아), 탑승인원, 가격, 좌석번호*/
	create table bus_ticket (
	    bcode number(5),
        dpt_st VARCHAR2(30),
        arrv_st VARCHAR2(30),
	    ddate date,
	    grade VARCHAR2(10),
	    company VARCHAR2(30),
        adult number(2),
        student number(2),
        kid number(2),
        pnum number(3),
        price number(10),
        seatNo varchar2(10),
        constraint ticket_pk primary key(bcode, seatNo)
	);
	desc bus_ticket;
	commit;
    
    insert into bus_ticket values (
    b_seq.NEXTVAL, 
    '[서울]김포공항',
    '[부산]김해공항',
    to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
    '우등',
    '태양고속', 2, 1, 0, 3, 26400, 'b1 b2 b4'
    );
	
    select * from bus_ticket;
    /* 예매 최종 프로세스 : 가장 마지막 레코드 출력 쿼리(서브쿼리 사용)*/
    select * from (select * from bus_ticket order by rownum desc) where rownum = 1; 
    /* 예약 내역 확인 쿼리 */
    select * from bus_ticket where bcode=2;
    select * from bus_ticket where bcode=1;
    commit;
    
    /* 예약 취소 */
    delete from bus_ticket where bcode=2;
    
    
    /***************************************************************/
    drop table bus_seat_ex1b1_20220211_0930;
    /* 버스 좌석 테이블(잔여좌석 확인): 버스마다 따로 */
    /* 버스코드 : ex1b1(태양고속) 시간 : 2022-02-11 09:30 */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo VARCHAR2(10) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220211_0930;
    select * from bus_seat_ex1b1_20220211_0930;
    
    /* 예약있음 : 1 / 예약없음 : 0 */
    insert into bus_seat_ex1b1_20220211_0930 values ('a1', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('a2', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('a3', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('a4', 0);
   
    insert into bus_seat_ex1b1_20220211_0930 values ('b1', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('b2', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('b3', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('b4', 1);
    
    insert into bus_seat_ex1b1_20220211_0930 values ('c1', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('c2', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('c3', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('c4', 1);
    
    insert into bus_seat_ex1b1_20220211_0930 values ('d1', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('d2', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('d3', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('d4', 0);
    
    insert into bus_seat_ex1b1_20220211_0930 values ('e1', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('e2', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('e3', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('e4', 0);
    
    
    select count(*) as cnt from bus_seat_ex1b1_20220211_0930 where booking=1;
    select count(*) as cnt from bus_seat_ex1b1_20220211_0930 where booking=0;
    
    
    /*********************************************************/
    /*버스코드 : ex1b1(태양고속) 시간 : 2022-02-12 09:30 */
     create table bus_seat_ex1b1_20220212_0930 (
        seatNo VARCHAR2(10) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220212_0930;

    /* 예약있음 : 1 / 예약없음 : 0 */
    insert into bus_seat_ex1b1_20220212_0930 values ('a1', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('a2', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('a3', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('a4', 0);
   
    insert into bus_seat_ex1b1_20220212_0930 values ('b1', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('b2', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('b3', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('b4', 0);
    
    insert into bus_seat_ex1b1_20220212_0930 values ('c1', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('c2', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('c3', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('c4', 0);
    
    insert into bus_seat_ex1b1_20220212_0930 values ('d1', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('d2', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('d3', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('d4', 0);
    
    insert into bus_seat_ex1b1_20220212_0930 values ('e1', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('e2', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('e3', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('e4', 0);
    
    select * from bus_seat_ex1b1_20220212_0930;
    commit;
    
    
    /* 예매시, 좌석 예약 업데이트 */
    Update bus_seat_taeyang_01181500 set booking = 1 where seatNo = 'e1';
    
    /* 예매취소시, 좌석 취소 업데이트 */
    Update bus_seat_taeyang_01181500 set booking = 1 where seatNo = 'a1';
    
    
    select * from ticket_price; /*버스 가격표*/
    select * from bus_timetable; /*버스 시간표*/
    select * from bus_ticket order by rownum desc; /*예약 정보*/
    
    select * from (select * from bus_ticket order by rownum desc) where rownum = 1;
    select * from (select * from bus_ticket order by rownum desc) where rownum = 2;
