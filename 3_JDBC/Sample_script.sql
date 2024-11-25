-- JDBC�� ���� : (USERNAME/PWD) C##JDBC / JDBC
-- * ���� ����
CREATE USER C##JDBC IDENTIFIED BY JDBC;

-- * ���� �ο�
GRANT CONNECT, RESOURCE TO C##JDBC;

-- * ���̺� �����̽� ����
ALTER USER C##JDBC DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-- ������ �������� ���� ���� ���� --------------------------------------
---------------------------------------------------------------
-- ȸ�� ������ ������ ���̺� (MEBER)
DROP TABLE MEMBER;
CREATE TABLE MEMBER (
        USERNO NUMBER PRIMARY KEY,      -- ȸ����ȣ
        USERID VARCHAR2(20) NOT NULL UNIQUE,      -- ȸ�����̵�
        USERPW VARCHAR2(20) NOT NULL,     -- ȸ�� ��й�ȣ
        USERNAME VARCHAR2(20) NOT NULL,     -- �̸�
        GENDER CHAR(1) CHECK(GENDER IN ('M', 'F')),      -- ���� ('M', 'F')
        AGE NUMBER,      -- ����
        EMAIL VARCHAR(30),      -- �̸���
        ADDRESS VARCHAR2(100),        -- �ּ�
        PHONE VARCHAR2(13),      -- ����ó
        HOBBY VARCHAR2(50),     -- ���
        ENROLLDATE DATE DEFAULT SYSDATE NOT NULL     -- ������
);

-- * ȸ����ȣ�� ����� ������ ����
DROP SEQUENCE SEQ_USERNO;
CREATE SEQUENCE SEQ_USERNO
NOCACHE;

-- * ���õ����� 2�� �߰�
INSERT INTO MEMBER
        VALUES (SEQ_USERNO.NEXTVAL, 'admin', '1234', '������', 'M', 20, 'admin@kh.or.kr', '����', '010-1010-0101', NULL, '2020-07-30');
INSERT INTO MEMBER
        VALUES (SEQ_USERNO.NEXTVAL, 'leehi', '1234', '������', NULL, 20, 'leehi@kh.or.kr', '����', '010-1234-5678', NULL, DEFAULT);

SELECT * FROM MEMBER;

COMMIT;
-------------------------------------------------------------

-- �׽�Ʈ�� ���̺� (TEST)
CREATE TABLE TEST (
        TNO NUMBER,
        TNAME VARCHAR(30),
        TDATE DATE
);

SELECT * FROM TEST;

INSERT INTO TEST VALUES (1, '��ٿ�', SYSDATE);
COMMIT;
