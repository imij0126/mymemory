
CREATE TABLE USERS(
USERS_ID VARCHAR2(20) NOT NULL UNIQUE,
USERS_PASSWORD VARCHAR2(100) NOT NULL,
USERS_NAME VARCHAR2(30) NOT NULL,
EMAIL VARCHAR2(30) NOT NULL UNIQUE,
JOIN_DATE DATE DEFAULT SYSDATE NOT NULL,
WITHDRAWAL_DATE DATE,
USERS_STATE VARCHAR2(1) CHECK (USERS_STATE IN ('y', 'n')) NOT NULL ,
USERS_TYPE VARCHAR2(9) DEFAULT '����' NOT NULL,
CONSTRAINT chk_user_type CHECK (USERS_TYPE IN ('����', '����'))
);

InSERT INTO USERS VALUES(
'imij0126' ,
'imij6414',
'����â' ,
'imij@naver.com'
,sysdate, null, 'y', '����'
);

InSERT INTO USERS VALUES(
'JKW456' ,
'damgarak123!',
'���ǿ�' ,
'JKW456@naver.com'
,sysdate, null, 'y', '����'
);

InSERT INTO USERS VALUES(
'YMW456' ,
'damgarak123!',
'��ο�' ,
'YMW456@naver.com'
,sysdate, null, 'y', '����'
);

INSERT INTO EMPLOYEE (
    USERS_ID, EMPLOYEE_NAME, PHONE, ADDRESS, DEPT_CODE, JOB_CODE, SALARY,EMPLOYEE_TYPE
) VALUES ('imij0126', '����â', '010-8888-0780','����� ���۱� ��絿', 'D01', 'J02',1000000,'����');

INSERT INTO EMPLOYEE (
    USERS_ID, EMPLOYEE_NAME, PHONE, ADDRESS, DEPT_CODE, JOB_CODE, SALARY,EMPLOYEE_TYPE
) VALUES ('JKW456', '���ǿ�', '010-8888-4444','��õ�� ��õ�� �߰���', 'D01', 'J02',1000000,'����');

INSERT INTO EMPLOYEE (
    USERS_ID, EMPLOYEE_NAME, PHONE, ADDRESS, DEPT_CODE, JOB_CODE, SALARY,EMPLOYEE_TYPE
) VALUES ('YMW456', '��ο�', '010-2222-4444','����� ��� ���', 'D01', 'J02',1000000,'����');

UPDATE USERS
   SET USERS_STATE = 'y'
 WHERE USERS_NAME = '������';

commit;

delete from employee where employee_name = '��ο�';
---

---

CREATE TABLE MENU_CATEGORY (
MENU_CATEGORY_CODE VARCHAR2(2) NOT NULL,
MENU_CATEGORY_NAME VARCHAR2(15) NOT NULL,
PRIMARY KEY (MENU_CATEGORY_CODE)
);
INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('01', '���̷�');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('02', '������');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('03', '���');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('04', '������');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('05', '�Ľ�');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('06', '������');

CREATE TABLE MENU (
MENU_NO NUMBER NOT NULL,
MENU_NAME VARCHAR2(50) NULL,
PRICE NUMBER DEFAULT 0 NOT NULL,
MENU_TYPE VARCHAR2(2) NULL CHECK (MENU_TYPE IN ('r','l','a')),
MENU_IMAGE VARCHAR2(200) NULL,
MENU_DESCRIPTION VARCHAR2(150) NULL,
CALORIE NUMBER NOT NULL,
MENU_CATEGORY_CODE VARCHAR2(2 ) NOT NULL,
MENU_COUNT NUMBER DEFAULT 0,
PRIMARY KEY (MENU_NO),
FOREIGN KEY (MENU_CATEGORY_CODE)
REFERENCES MENU_CATEGORY (MENU_CATEGORY_CODE)
);

---------------------------------���̷�------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1001, '���� ����', 14000, 'a', 'menu_01_1001.jpg', '�븩�븩�ϰ� ���� �ѵ� ����', 650, '01', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1002, '����� ����', 13000, 'a', 'menu_01_1002.jpg', '��ݱ��� ����ִ� ����� ����', 300, '01', 5);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1003, '���� ������', 8000, 'a', 'menu_01_1003.jpg', '���̾��͸� ���� ���� ������', 250, '01', 2000);
---------------------------------���̷�------------------------------------------

- --------------------------------������-------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2001, '��ġ�', 9000, 'r', 'menu_02_2001', '��ġ�� ���� ���� �־� ����� ���� ������ ���� �����丮', 450, '02', 70);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2002, '���κ��', 8500, 'l', 'menu_02_2002', '���κθ� ���� �ְ� ����� �� �����丮', 450, '02', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2003, '�����', 8000, 'l', 'menu_02_2003', '������ �ְ� �κθ� �־ ������ ���� �� �����丮', 300, '02', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2004, '�δ��', 12000, 'r', 'menu_02_2004', '�������� �ܵ��� �ְ� ���縮�� ���� �����丮', 600, '02', 80);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2005, '�����', 11000, 'r', 'menu_02_2005', '���¿� �������� ��ä�� �־� �ÿ��� ���� �� �����丮', 550, '02', 55);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2006, '�����', 12000, 'r', 'menu_02_2006', '���� �� �׸��� �־� �λ�� ���� �丮�� �����丮', 600, '02', 90);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2007, '���뱹', 9000, 'l', 'menu_02_2007', '���븦 �ְ� �丮�� �����丮', 600, '02', 95);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2008, '������', 9000, 'l', 'menu_02_2008', '�Ұ���� ���縮 �� ���� ��ä�� �ְ� ���� �����丮', 480, '02', 83);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2009, '������', 12000, 'l', 'menu_02_2009', '���� �ְ� �ÿ��ϰ� ���� �����丮', 630, '02', 73);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2010, '�ſ���', 11000, 'r', 'menu_02_2010', '������ �ع��� �ְ� ���� ��ä�� �ְ� �ʰ� ���� �����丮', 700, '02', 80);
---------------------------------------------������-------------------------------

- --------------------------------------------��---------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3001, '������', 50000, 'r', 'menu_03_3001.jpg', '���ִ� ������', 2000, '03', 5);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3002, '��ġ��', 50000, 'r', 'menu_03_3002.jpg', '���ִ� ��ġ��', 3000, '03', 2);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3003, '�ع���', 50000, 'r', 'menu_03_3003.jpg', '���ִ� ������', 100, '03', 21);
---------------------------------------------��---------------------------------------------------------
- ----------------------------------------------����------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4001, '��������', 210000, 'r', 'menu_04_4001.jpg', '���ִ� ��������', 2, '04', 80);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4002, '�Ұ��� ��������', 220000, 'r', 'menu_04_4002.jpg', '���ִ� �Ұ��� ��������', 60, '04', 60);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4003, '��������', 230000, 'r', 'menu_04_4003.jpg', '���ִ� ��������', 900, '04', 1);
-----------------------------------------------����------------------------------------------------------
- ------------------------------------------�Ľ�---------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5001, '������', 3000,'r', 'MENU_05_5001.jpg', '�ε巯�� �����̰� �����Ѳ��� ����', 340, '05', 30);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5002, '����', 2400, 'l', 'MENU_05_5002.jpg', '�۰� ��� ���� ���߸��ø� ������ ����', 240, '05', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5003, '����������', 2500, 'a', 'MENU_05_5003.jpg', '�߸��� ������ �۰� ��� �Բ����� ���޴����� ����������', 200, '05', 30);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5004, '�簻', 2500, 'a', 'MENU_05_5004', '�پ��� ���� ���� �ִ� �������� �簻', 250, '05', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5005, '���ޱⶱ', 3000, 'a', 'MENU_05_5005.jpeg', '�ܹ��ϰ� �پ��� �������� ���� �����ִ� �������� ���� ��', 150, '05', 20);
-------------------------------------------�Ľ�---------------------------------------------------------

- -------------------------------------------������------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6001, '�ѿ���̺���', 4000,'r', 'MENU_06_6001.jpg', '���ڽ����� �ѿ����� ��ŭ�� ������ ����', 140, '06', 80);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6002, '������.', 3400, 'l', 'MENU_06_6002.jpg', '������ ������ �����ϴ� ������', 110, '06', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6003, '��¡��ä', 2500, 'a', 'MENU_06_6003.jpg', '�����ϰ� �ε巯�� ���ι��� ��¡��ä', 210, '06', 40);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6004, '�������', 2500, 'a', 'MENU_06_6004.jpg', '�ε巴�� ¬¬�� ���� ����� �������', 250, '06', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6005, '��Ÿ����������', 3000, 'a', 'MENU_06_6005.jpg', '¬���� �����', 150, '06', 20);
-----------------------------------������----------------------------------------------------

- -------------------------��õ �޴�------------------------------------------------------------
INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (1003, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (2008, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (3001, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (4002, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (5005, 'y');
--------------------------��õ �޴�------------------------------------------------------------

CREATE TABLE SUGGEST_MENU (
MENU_NO NUMBER NOT NULL,
SUGGEST_STATUS VARCHAR2(1) NOT NULL CHECK (SUGGEST_STATUS IN ('y','n')),
PRIMARY KEY (MENU_NO),
FOREIGN KEY (MENU_NO)
REFERENCES MENU (MENU_NO)
);

commit;
rollback;

DROP TABLE **USERS**;

CREATE TABLE USERS(
USERS_ID VARCHAR2(20) NOT NULL UNIQUE,
USERS_PASSWORD VARCHAR2(100) NOT NULL,
USERS_NAME VARCHAR2(30) NOT NULL,
EMAIL VARCHAR2(30) NOT NULL UNIQUE,
JOIN_DATE DATE DEFAULT SYSDATE NOT NULL,
WITHDRAWAL_DATE DATE,
USERS_STATE VARCHAR2(1) CHECK (USERS_STATE IN ('y', 'n')) NOT NULL ,
USERS_TYPE VARCHAR2(9) DEFAULT '����' NOT NULL,
CONSTRAINT chk_user_type CHECK (USERS_TYPE IN ('����', '����'))
);

InSERT INTO USERS VALUES(
'whdrns456' ,
'damgarak123!',
'������' ,
'whdrns456@naver.com'
,sysdate, null, 'n', '����'
);

---

---

CREATE TABLE MENU_CATEGORY (
MENU_CATEGORY_CODE VARCHAR2(2) NOT NULL,
MENU_CATEGORY_NAME VARCHAR2(15) NOT NULL,
PRIMARY KEY (MENU_CATEGORY_CODE)
);
INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('01', '���̷�');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('02', '������');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('03', '���');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('04', '������');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('05', '�Ľ�');

INSERT INTO MENU_CATEGORY (MENU_CATEGORY_CODE, MENU_CATEGORY_NAME)
VALUES ('06', '������');

CREATE TABLE MENU (
MENU_NO NUMBER NOT NULL,
MENU_NAME VARCHAR2(50) NULL,
PRICE NUMBER DEFAULT 0 NOT NULL,
MENU_TYPE VARCHAR2(2) NULL CHECK (MENU_TYPE IN ('r','l','a')),
MENU_IMAGE VARCHAR2(200) NULL,
MENU_DESCRIPTION VARCHAR2(150) NULL,
CALORIE NUMBER NOT NULL,
MENU_CATEGORY_CODE VARCHAR2(2 ) NOT NULL,
MENU_COUNT NUMBER DEFAULT 0,
PRIMARY KEY (MENU_NO),
FOREIGN KEY (MENU_CATEGORY_CODE)
REFERENCES MENU_CATEGORY (MENU_CATEGORY_CODE)
);

---------------------------------���̷�------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1001, '���� ����', 14000, 'a', 'menu_01_1001.jpg', '�븩�븩�ϰ� ���� �ѵ� ����', 650, '01', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1002, '����� ����', 13000, 'a', 'menu_01_1002.jpg', '��ݱ��� ����ִ� ����� ����', 300, '01', 5);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (1003, '���� ������', 8000, 'a', 'menu_01_1003.jpg', '���̾��͸� ���� ���� ������', 250, '01', 2000);
---------------------------------���̷�------------------------------------------

- --------------------------------������-------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2001, '��ġ�', 9000, 'r', 'menu_02_2001', '��ġ�� ���� ���� �־� ����� ���� ������ ���� �����丮', 450, '02', 70);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2002, '���κ��', 8500, 'l', 'menu_02_2002', '���κθ� ���� �ְ� ����� �� �����丮', 450, '02', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2003, '�����', 8000, 'l', 'menu_02_2003', '������ �ְ� �κθ� �־ ������ ���� �� �����丮', 300, '02', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2004, '�δ��', 12000, 'r', 'menu_02_2004', '�������� �ܵ��� �ְ� ���縮�� ���� �����丮', 600, '02', 80);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2005, '�����', 11000, 'r', 'menu_02_2005', '���¿� �������� ��ä�� �־� �ÿ��� ���� �� �����丮', 550, '02', 55);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2006, '�����', 12000, 'r', 'menu_02_2006', '���� �� �׸��� �־� �λ�� ���� �丮�� �����丮', 600, '02', 90);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2007, '���뱹', 9000, 'l', 'menu_02_2007', '���븦 �ְ� �丮�� �����丮', 600, '02', 95);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2008, '������', 9000, 'l', 'menu_02_2008', '�Ұ���� ���縮 �� ���� ��ä�� �ְ� ���� �����丮', 480, '02', 83);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2009, '������', 12000, 'l', 'menu_02_2009', '���� �ְ� �ÿ��ϰ� ���� �����丮', 630, '02', 73);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (2010, '�ſ���', 11000, 'r', 'menu_02_2010', '������ �ع��� �ְ� ���� ��ä�� �ְ� �ʰ� ���� �����丮', 700, '02', 80);
---------------------------------------------������-------------------------------

- --------------------------------------------��---------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3001, '������', 50000, 'r', 'menu_03_3001.jpg', '���ִ� ������', 2000, '03', 5);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3002, '��ġ��', 50000, 'r', 'menu_03_3002.jpg', '���ִ� ��ġ��', 3000, '03', 2);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (3003, '�ع���', 50000, 'r', 'menu_03_3003.jpg', '���ִ� ������', 100, '03', 21);
---------------------------------------------��---------------------------------------------------------
- ----------------------------------------------����------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4001, '��������', 210000, 'r', 'menu_04_4001.jpg', '���ִ� ��������', 2, '04', 80);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4002, '�Ұ��� ��������', 220000, 'r', 'menu_04_4002.jpg', '���ִ� �Ұ��� ��������', 60, '04', 60);
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (4003, '��������', 230000, 'r', 'menu_04_4003.jpg', '���ִ� ��������', 900, '04', 1);
-----------------------------------------------����------------------------------------------------------
- ------------------------------------------�Ľ�---------------------------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5001, '������', 3000,'r', 'MENU_05_5001.jpg', '�ε巯�� �����̰� �����Ѳ��� ����', 340, '05', 30);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5002, '����', 2400, 'l', 'MENU_05_5002.jpg', '�۰� ��� ���� ���߸��ø� ������ ����', 240, '05', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5003, '����������', 2500, 'a', 'MENU_05_5003.jpg', '�߸��� ������ �۰� ��� �Բ����� ���޴����� ����������', 200, '05', 30);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5004, '�簻', 2500, 'a', 'MENU_05_5004', '�پ��� ���� ���� �ִ� �������� �簻', 250, '05', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (5005, '���ޱⶱ', 3000, 'a', 'MENU_05_5005.jpeg', '�ܹ��ϰ� �پ��� �������� ���� �����ִ� �������� ���� ��', 150, '05', 20);
-------------------------------------------�Ľ�---------------------------------------------------------

- -------------------------------------------������------------------------------------
INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6001, '�ѿ���̺���', 4000,'r', 'MENU_06_6001.jpg', '���ڽ����� �ѿ����� ��ŭ�� ������ ����', 140, '06', 80);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6002, '������.', 3400, 'l', 'MENU_06_6002.jpg', '������ ������ �����ϴ� ������', 110, '06', 50);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6003, '��¡��ä', 2500, 'a', 'MENU_06_6003.jpg', '�����ϰ� �ε巯�� ���ι��� ��¡��ä', 210, '06', 40);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6004, '�������', 2500, 'a', 'MENU_06_6004.jpg', '�ε巴�� ¬¬�� ���� ����� �������', 250, '06', 60);

INSERT INTO MENU (MENU_NO, MENU_NAME, PRICE, MENU_TYPE, MENU_IMAGE, MENU_DESCRIPTION, CALORIE, MENU_CATEGORY_CODE, MENU_COUNT)
VALUES (6005, '��Ÿ����������', 3000, 'a', 'MENU_06_6005.jpg', '¬���� �����', 150, '06', 20);
-----------------------------------������----------------------------------------------------

- -------------------------��õ �޴�------------------------------------------------------------
INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (1003, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (2008, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (3001, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (4002, 'y');

INSERT INTO SUGGEST_MENU (MENU_NO, SUGGEST_STATUS)
VALUES (5005, 'y');
--------------------------��õ �޴�------------------------------------------------------------

CREATE TABLE SUGGEST_MENU (
MENU_NO NUMBER NOT NULL,
SUGGEST_STATUS VARCHAR2(1) NOT NULL CHECK (SUGGEST_STATUS IN ('y','n')),
PRIMARY KEY (MENU_NO),
FOREIGN KEY (MENU_NO)
REFERENCES MENU (MENU_NO)
);

commit;
rollback;