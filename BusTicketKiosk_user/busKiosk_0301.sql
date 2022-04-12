	
    /***************************************************************/
    /* ������ ��� */
	drop table bus_station;
	create table bus_station (
        city VARCHAR2(20),
        station VARCHAR2(50) primary key
	);
	desc bus_station;
	
	/*[tomcat]��û Ÿ�ٿ��� ��ȿ���� ���� ���ڰ� �߰ߵǾ����ϴ�. ��ȿ�� ���ڵ��� RFC 7230�� RFC 3986�� ���ǵǾ� �ֽ��ϴ�.*/
	/* ��Ĺ server.xml�� Connector�� relaxedQueryChars="[]()^|&quot;" �߰� */
	insert into bus_station (city, station) values ('����', '[����]��������');
	insert into bus_station (city, station) values ('����', '[����]������');
	insert into bus_station (city, station) values ('����', '[����]���');
	insert into bus_station (city, station) values ('����', '[����]���ﳲ��');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]���ذ���');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]�λ굿��(����)');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]�λ꼭��');
	insert into bus_station (city, station) values ('�뱸', '[�뱸]�뱸�Ϻ�');
	insert into bus_station (city, station) values ('�뱸', '[�뱸]�뱸����');
	insert into bus_station (city, station) values ('��õ', '[��õ]��õ');
	insert into bus_station (city, station) values ('��õ', '[��õ]��õ�۵�');
	insert into bus_station (city, station) values ('����', '[����]����(��������)');
	insert into bus_station (city, station) values ('����', '[����]��������');
	commit;
	
	select * from bus_station;
	
	/***************************************************************/
	/* ���� �ð�ǥ : �����ڵ� ��߽ð� �����ð� ���(���/�Ϲ�) �ܿ��� ȸ��*/
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
    /* ���±� */
    insert into bus_timetable values ('ex1b1', '[����]��������', '[�λ�]���ذ���', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 20, 12, '�Ϲ�', '�¾���');
	insert into bus_timetable values ('ex2b1', '[����]��������', '[�뱸]�뱸�Ϻ�',  to_date('2022-02-11 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 19:00', 'yyyy-MM-dd HH24:MI'), 15, 15, '���', '�鸶���');
    insert into bus_timetable values ('ex3b1', '[����]��������', '[��õ]��õ',  to_date('2022-02-11 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 16:00', 'yyyy-MM-dd HH24:MI'), 30, 30, '�Ϲ�', '�������');
	/* ���±� */
    insert into bus_timetable values ('ex1b1', '[�λ�]���ذ���', '[����]��������', to_date('2022-02-12 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 13:30', 'yyyy-MM-dd HH24:MI'), 20, 20, '�Ϲ�', '�¾���');
	insert into bus_timetable values ('ex2b1', '[�뱸]�뱸�Ϻ�', '[����]��������',  to_date('2022-02-12 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 19:00', 'yyyy-MM-dd HH24:MI'), 15, 10, '���', '�鸶���');
    insert into bus_timetable values ('ex3b1', '[��õ]��õ', '[����]��������',  to_date('2022-02-12 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 16:00', 'yyyy-MM-dd HH24:MI'), 30, 22, '�Ϲ�', '�������');

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
    and dpt_st='[����]��������'
    and arrv_st='[�λ�]���ذ���';
   
    commit;
    
    /***************************************************************/
	/* ����ǥ : ���� �߰��(19���̸�) : 20%���� ����(13���̸�) : 50%���� */
    drop table ticket_price;
    
	create table ticket_price (
	    type VARCHAR2(10),
	    price NUMBER(5)
	);
	insert into ticket_price values('���', 60000);
	insert into ticket_price values('�Ϲ�', 30000);
	
	select * from ticket_price;
	
	/* �߰��(19���̸�) : 20%���� */
	select type, price*0.8 from ticket_price;
	/* ����(13���̸�) : 50%���� */
	select type, price*0.5 from ticket_price;
	commit;
	
    /*����, �߰��, ���� 3���϶� ���ݵ��� ����*/
    select 
        price*1 as adult,  
        price*0.8*0 as student, 
        price*0.5*0 as kid 
    from ticket_price; 
	
    
    select sum((price*1)+(price*0.8*0)+(price*0.5*0)) as total from ticket_price where type='���'; 
    
    
    /***************************************************************/
    drop SEQUENCE b_seq;
    /*������ ����*/
    create SEQUENCE b_seq 
      INCREMENT BY 1 
      START WITH 1
      MINVALUE 1
      NOMAXVALUE
      NOCYCLE;

    /***************************************************************/  
    drop table bus_ticket;
	/* �������� : �����ȣ(sequence), ��߿�, ������, ��߽ð�, ���, ȸ��, ����(����/�߰��/����), ž���ο�, ����, �¼���ȣ*/
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
    '[����]��������',
    '[�λ�]���ذ���',
    to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
    '���',
    '�¾���', 2, 1, 0, 3, 26400, 'b1 b2 b4'
    );
	
    select * from bus_ticket;
    /* ���� ���� ���μ��� : ���� ������ ���ڵ� ��� ����(�������� ���)*/
    select * from (select * from bus_ticket order by rownum desc) where rownum = 1; 
    /* ���� ���� Ȯ�� ���� */
    select * from bus_ticket where bcode=2;
    select * from bus_ticket where bcode=1;
    commit;
    
    /* ���� ��� */
    delete from bus_ticket where bcode=2;
    
    
    /***************************************************************/
    drop table bus_seat_ex1b1_20220211_0930;
    /* ���� �¼� ���̺�(�ܿ��¼� Ȯ��): �������� ���� */
    /* �����ڵ� : ex1b1(�¾���) �ð� : 2022-02-11 09:30 */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo VARCHAR2(10) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220211_0930;
    select * from bus_seat_ex1b1_20220211_0930;
    
    /* �������� : 1 / ������� : 0 */
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
    /*�����ڵ� : ex1b1(�¾���) �ð� : 2022-02-12 09:30 */
     create table bus_seat_ex1b1_20220212_0930 (
        seatNo VARCHAR2(10) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220212_0930;

    /* �������� : 1 / ������� : 0 */
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
    
    
    /* ���Ž�, �¼� ���� ������Ʈ */
    Update bus_seat_taeyang_01181500 set booking = 1 where seatNo = 'e1';
    
    /* ������ҽ�, �¼� ��� ������Ʈ */
    Update bus_seat_taeyang_01181500 set booking = 1 where seatNo = 'a1';
    
    
    select * from ticket_price; /*���� ����ǥ*/
    select * from bus_timetable; /*���� �ð�ǥ*/
    select * from bus_ticket order by rownum desc; /*���� ����*/
    
    select * from (select * from bus_ticket order by rownum desc) where rownum = 1;
    select * from (select * from bus_ticket order by rownum desc) where rownum = 2;
