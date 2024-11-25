/*
[Basic SELECT] 
1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" 
���� ǥ���ϵ��� �Ѵ�.  
*/
SELECT DEPARTMENT_NAME "�а� ��", CATEGORY "�迭"
FROM TB_DEPARTMENT;

/*
2.  �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�. 
*/
SELECT DEPARTMENT_NAME || '�� ������ ' || CAPACITY || '�� �Դϴ�.'
FROM TB_DEPARTMENT;

/*
 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� 
���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� 
ã�� ������ ����) 
*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 001
        AND SUBSTR(STUDENT_SSN, 8, 1) = '2' 
        AND ABSENCE_YN = 'Y';
        
/*
4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ��� 
�й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;

/*
5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
*/
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 10 AND 30;

/*
 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.  �׷� �� 
������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�. 
*/
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

/*
7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����. 
��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�. 
*/
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

/*
 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� 
������� � �������� �����ȣ�� ��ȸ�غ��ÿ�. 
*/
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

/*
9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�. 
*/
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;

/*
10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ �������� 
�л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '%����%'
            AND EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002
            AND ABSENCE_YN = 'N';
            
/*
[Additional SELECT - �Լ�] 
1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� 
������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" �� 
ǥ�õǵ��� ����.) 
*/
SELECT STUDENT_NO �й�, STUDENT_NAME �̸�, TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') ���г⵵
FROM TB_STUDENT
ORDER BY ENTRANCE_DATE;

/*
2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������ 
�̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL 
������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��) 
*/
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

/*
3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. �� 
�̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� �� 
2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ���������� 
�������.)
*/
SELECT PROFESSOR_NAME, (TO_CHAR(EXTRACT(YEAR FROM SYSDATE)) - ('19' || SUBSTR(PROFESSOR_SSN, 1, 2))) + 1 "����"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY ����;

/*
4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� ����� 
?�̸�? �� �������� ����. (���� 2���� ���� ������ ���ٰ� �����Ͻÿ�) 
*/
SELECT SUBSTR(PROFESSOR_NAME, 2) �̸�
FROM TB_PROFESSOR;

/*
5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�?  �̶�, 
19�쿡 �����ϸ� ����� ���� ���� ������ �A������. 
*/
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE (TO_NUMBER(EXTRACT(YEAR FROM ENTRANCE_DATE)) - TO_NUMBER(19 || SUBSTR(STUDENT_SSN, 1, 2))) +1 > 20;

/*
6. 2020�� ũ���������� ���� �����ΰ�?
*/
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'DAY') FROM DUAL;

/*
7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')  �� ���� �� �� �� 
�� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'), 
TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����? 
*/
-- TO_DATE('99/10/11','YY/MM/DD') => 2000���� �ν�.  2099/10/11
-- TO_DATE('49/10/11','YY/MM/DD') => 2000���� �ν�. 2049/10/11
-- TO_DATE('49/10/11','RR/MM/DD') => 1900���� �ν�. 1949/10/11

/*
8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�. 2000�⵵ 
�̠� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�. 
*/
 SELECT STUDENT_NO, STUDENT_NAME
 FROM TB_STUDENT
 WHERE SUBSTR(STUDENT_NO, 1, 1) != 'A';
 
 /*
 9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
�̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� 
�ڸ������� ǥ������.
 */
 SELECT ROUND(AVG(POINT), 1) ����
 FROM TB_GRADE
 WHERE STUDENT_NO = 'A517178';
 
 /*
 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� 
��µǵ��� �Ͻÿ�.
 */
 SELECT DEPARTMENT_NO �а���ȣ, COUNT(*) "�л���(��)"
 FROM TB_STUDENT
 GROUP BY DEPARTMENT_NO
 ORDER BY DEPARTMENT_NO;
 
 /*
 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� 
�ۼ��Ͻÿ�.
 */
 SELECT COUNT(*)
 FROM TB_STUDENT
 WHERE COACH_PROFESSOR_NO IS NULL;
 
 /*
 12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
�̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� 
�Ҽ��� ���� �� �ڸ������� ǥ������. 
 */
SELECT SUBSTR(TERM_NO, 1, 4) "�⵵", ROUND(AVG(POINT), 1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4);

/*
13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ 
�ۼ��Ͻÿ�.
*/
SELECT DEPARTMENT_NO �а��ڵ��, SUM(DECODE(ABSENCE_YN, 'Y', 1, 'N', 0)) "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

/*
14.  �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL 
������ ����ϸ� �����ϰڴ°�? 
*/
SELECT STUDENT_NAME �����̸�, COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY STUDENT_NAME;

/*
15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , �� 
������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� 
ǥ������.)        
*/
SELECT SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5), ROUND(AVG(POINT), 1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP (SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5))
ORDER BY 1;

/*
[Additional SELECT - Option] 
1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�, 
������ �̸����� �������� ǥ���ϵ��� ����. 
*/
SELECT STUDENT_NAME "�л� �̸�", STUDENT_ADDRESS "�ּ���"
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

/*
2.  �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�. 
*/
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

/*
3. �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸��� �й�, 
�ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�", 
"������ �ּ�" �� ��µǵ��� ����. 
*/
SELECT STUDENT_NAME, STUDENT_NO
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '������%' OR STUDENT_ADDRESS LIKE '��⵵%'
ORDER BY STUDENT_NAME;

/*
4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������ 
�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� 
������ ����) 
*/
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = 005
ORDER BY PROFESSOR_SSN;

/*
5. 2004��2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������ 
���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ 
�ۼ��غ��ÿ�. 
*/
SELECT STUDENT_NO, TO_CHAR(POINT, '9.00')
FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO ASC;

/*
6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL 
���� �ۼ��Ͻÿ�.  
*/
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

/*
7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
        
/*
8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ���� 
�ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
        JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
        JOIN TB_PROFESSOR USING (PROFESSOR_NO);

/*
9. 8���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿� 
�ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�. 
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
        JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
        JOIN TB_PROFESSOR P USING (PROFESSOR_NO)
        JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO = P.DEPARTMENT_NO)
WHERE CATEGORY  = '�ι���ȸ';

/*
10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�", 
"��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1�ڸ������� 
�ݿø��Ͽ� ǥ������.) 
*/
SELECT STUDENT_NO "�й�", STUDENT_NAME "�л� �̸�", ROUND(AVG(POINT), 1) "��ü ����"
FROM TB_STUDENT
        JOIN TB_GRADE USING (STUDENT_NO)
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME;

/*
11. �й��� A313047�� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� 
���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ���� 
�ۼ��Ͻÿ�.  ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?���� 
��µǵ��� ����.
*/
SELECT DEPARTMENT_NAME �а��̸�, STUDENT_NAME �л��̸�, PROFESSOR_NAME ���������̸�
FROM TB_DEPARTMENT
        JOIN TB_STUDENT USING(DEPARTMENT_NO)
        JOIN TB_PROFESSOR ON(PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

/*
12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ� 
SQL ������ �ۼ��Ͻÿ�.  
*/
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
        JOIN TB_GRADE USING(STUDENT_NO)
        JOIN TB_CLASS USING(CLASS_NO)
WHERE SUBSTR(TERM_NO, 1, 4) = '2007' AND CLASS_NAME = '�ΰ������'
ORDER BY STUDENT_NAME;


/*
13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ���� 
�̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
        LEFT JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
WHERE CATEGORY = '��ü��' AND PROFESSOR_NO IS NULL;

/*
14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� ����. �л��̸��� 
�������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������?���� 
ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��,  �������� ?�л��̸�?, ?��������?�� 
ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� ����. 
*/
SELECT STUDENT_NAME �л��̸�, NVL(PROFESSOR_NAME, '�������� ������')
FROM TB_STUDENT
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        LEFT JOIN TB_PROFESSOR ON (PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE DEPARTMENT_NAME = '���ݾƾ��а�'
ORDER BY STUDENT_NO;

/*
15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а� 
�̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.  
*/
SELECT STUDENT_NO �й�, STUDENT_NAME �̸�, DEPARTMENT_NAME "�а��̸�", ROUND(AVG(POINT), 8) ����
FROM TB_STUDENT
        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
        JOIN TB_GRADE USING(STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING ROUND(AVG(POINT), 8) >= 4.0
ORDER BY STUDENT_NO;

/*
16. �Q�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�. 
*/
SELECT CLASS_NO, CLASS_NAME, ROUND(AVG(POINT), 8)
FROM TB_CLASS
        JOIN TB_GRADE USING(CLASS_NO)
        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�' AND CLASS_TYPE LIKE '����%'
GROUP BY CLASS_NO, CLASS_NAME;

/*
17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� 
SQL ���� �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                                                FROM TB_STUDENT
                                                WHERE STUDENT_NAME = '�ְ���');
                                                
/*
18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL���� 
�ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME, STUDENT_NO
FROM ( SELECT STUDENT_NAME, STUDENT_NO
                FROM TB_STUDENT
                        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
                         JOIN TB_GRADE USING (STUDENT_NO)
                WHERE DEPARTMENT_NAME = '������а�'
                GROUP BY STUDENT_NAME, STUDENT_NO
                ORDER BY AVG(POINT) DESC )
WHERE ROWNUM <= 1;

/*
19. �� ������б��� "�Q�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������ 
�ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�. ��, �������� "�迭 �а���", 
"��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ��� 
����. 
*/
SELECT DEPARTMENT_NAME, ROUND(AVG(POINT), 1)
FROM TB_DEPARTMENT
            JOIN TB_CLASS USING (DEPARTMENT_NO)
            JOIN TB_GRADE USING (CLASS_NO)
WHERE CATEGORY = ( SELECT CATEGORY
                                            FROM TB_DEPARTMENT
                                            WHERE DEPARTMENT_NAME = 'ȯ�������а�' )
                AND CLASS_TYPE LIKE '����%'
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;

/*
[DDL] 
1. �迭 ������ ������ ī�װ� ���̺��� ������� ����. ������ ���� ���̺��� 
�ۼ��Ͻÿ�.
*/
CREATE TABLE TB_CATEGORY (
        NAME VARCHAR2(10),
        USE_YN CHAR(1) DEFAULT 'Y'
);

/*
2. ���� ������ ������ ���̺��� ������� ����. ������ ���� ���̺��� �ۼ��Ͻÿ�.
*/
CREATE TABLE TB_CLASS_TYPE (
        NO VARCHAR2(5) PRIMARY KEY,
        NAME VARCHAR2(10)
);

/*
3. TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY�� �����Ͻÿ�. 
(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� ���ٸ� �̸��� ������ 
�˾Ƽ� ������ �̸��� �������.)
*/
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY (NAME);

/*
4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�. 
*/
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

/*
5. �� ���̺��� �÷� ���� NO�� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷����� 
NAME �� ���� ���C������ ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
*/
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(20);

/*
6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_ �� ������ ���̺� �̸��� �տ� 
���� ���·� ��������. 
(ex. CATEGORY_NAME)
*/
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;

/*
7. TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ���� 
�����Ͻÿ�. 
Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )
*/
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C008543 TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C008542 TO PK_CLASS_TYPE;

/*
8. ������ ����INSERT ���� ��������.
*/
INSERT INTO TB_CATEGORY VALUES ('����','Y'); 
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y'); 
INSERT INTO TB_CATEGORY VALUES ('����','Y'); 
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y'); 
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y'); 
COMMIT; 

/*
9.TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ� 
������ �����ϵ��� FOREIGN KEY�� �����Ͻÿ�. �� �� KEY �̸��� 
FK_���̺��̸�_�÷��̸����� ��������. (ex. FK_DEPARTMENT_CATEGORY )
*/
ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY (CATEGORY) REFERENCES TB_CATEGORY;

/*
10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW�� ������� ����. 
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. 
�� �̸� 
VW_�л��Ϲ����� 
�÷� 
�й� 
�л��̸� 
�ּ� 
*/
-- GRANT CREATE VIEW TO C##WORKBOOK;
CREATE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT;

/*
11. �� ������б��� 1�⿡ �� ���� �а����� �л��� ���������� ���� ����� ��������. 
�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW �� ����ÿ�. 
�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ� SELECT 
���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.) 
*/
CREATE VIEW VW_�������
AS SELECT STUDENT_NAME �л��̸�, DEPARTMENT_NAME �а��̸�, NVL(COACH_PROFESSOR_NO, '�������� ������') ���������̸�
FROM TB_STUDENT
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
ORDER BY DEPARTMENT_NAME;

/*
12. ��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����. 
*/
CREATE VIEW VW_�а����л���
AS SELECT DEPARTMENT_NAME, COUNT(*) "STUDENT_COUNT"
FROM TB_DEPARTMENT
        JOIN TB_STUDENT USING (DEPARTMENT_NO)
        GROUP BY DEPARTMENT_NAME;

/*
13. ������ ������ �л��Ϲ����� View�� ���ؼ� �й��� A213046�� �л��� �̸��� ���� 
�̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
*/
UPDATE VW_�л��Ϲ�����
        SET STUDENT_NAME = '������'
        WHERE STUDENT_NO = 'A213046';
        
/*
14. 13 �������� ���� VIEW�� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW�� 
��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.
*/
CREATE OR REPLACE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WITH READ ONLY;

/*
15. �� ������б��� �ų� ������û ��A�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ���� 
������ �ǰ� �ִ�. �ֱ� 3���� �������� �����ο��� ���� ���Ҵ� 3 ������ ã�� ������ 
�ۼ��غ��ÿ�.
*/
SELECT  �����ȣ, �����̸�, "������������(��)"
FROM ( SELECT CLASS_NO �����ȣ, CLASS_NAME �����̸�, COUNT(*) "������������(��)"
                FROM TB_CLASS
                        JOIN TB_GRADE USING (CLASS_NO)
                        WHERE SUBSTR(TERM_NO, 1, 4) IN ( SELECT �⵵
                                                                                            FROM ( SELECT SUBSTR(TERM_NO, 1, 4) �⵵
                                                                                                            FROM TB_GRADE
                                                                                                              GROUP BY SUBSTR(TERM_NO, 1, 4)
                                                                                                              ORDER BY SUBSTR(TERM_NO, 1, 4) DESC )
                                                                                                                WHERE ROWNUM <= 5 )
                                                                                            
                        GROUP BY CLASS_NO, CLASS_NAME
                        ORDER BY 3 DESC )
WHERE ROWNUM <= 3;

/*
[DML] 
 1. �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�. 
 ��ȣ, �����̸� ------------ 
01, �����ʼ� 
02, �������� 
03, �����ʼ� 
04, ���缱�� 
05. ������ 
*/
INSERT INTO TB_CLASS_TYPE VALUES (01, '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES (02, '��������');
INSERT INTO TB_CLASS_TYPE VALUES (03, '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES (04, '���缱��');
INSERT INTO TB_CLASS_TYPE VALUES (05, '������');

/*
 2. �� ������б� �л����� ������ ���ԵǾ� �ִ� �л��Ϲ����� ���̺��� ������� ����. 
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�) 
���̺��̸� 
  TB_�л��Ϲ����� 
�÷� 
   �й� 
   �л��̸� 
   �ּ�  
*/
CREATE TABLE TB_�л��Ϲ�����
AS ( SELECT STUDENT_NO �й�, STUDENT_NAME �л��̸�, STUDENT_ADDRESS �л��ּ�
        FROM TB_STUDENT
);

SELECT * FROM TB_�л��Ϲ�����;

/*
3. ������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� ����. 
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ� 
�ۼ��Ͻÿ�) 
*/
CREATE TABLE TB_������а�
AS (  SELECT STUDENT_NO �й�, STUDENT_NAME �л��̸�, '19' || SUBSTR(STUDENT_SSN, 1, 2) ����⵵, PROFESSOR_NAME �����̸�
                FROM TB_STUDENT 
                        LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO ) );

SELECT * FROM TB_������а�;

/*
4. �� �а����� ������ 10% ������Ű�� �Ǿ���. �̿� ����� SQL ���� �ۼ��Ͻÿ�. (��, 
�ݿø��� ����Ͽ� �Ҽ��� �ڸ����� ������ �ʵ��� ����) 

-- ������ �ǵ帮�� �Ⱦ COPY ���̺� ���Ƿ� �ۼ�...

*/
CREATE TABLE COPY_TB_DEPARTMENT
AS ( SELECT * FROM TB_DEPARTMENT);

SELECT * FROM COPY_TB_DEPARTMENT;

UPDATE COPY_TB_DEPARTMENT
            SET CAPACITY = ROUND(CAPACITY * 1.1);
            
/*
5. �й� A413042 �� �ڰǿ� �л��� �ּҰ� "����� ���α� ���ε� 181-21 "�� ����Ǿ��ٰ� 
����. �ּ����� �����ϱ� ���� ����� SQL ���� �ۼ��Ͻÿ�.
*/
CREATE TABLE COPY_TB_STUDENT
AS (SELECT * FROM TB_STUDENT);

SELECT * FROM COPY_TB_STUDENT WHERE STUDENT_NAME = '�ڰǿ�';

UPDATE COPY_TB_STUDENT
        SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE STUDENT_NAME = '�ڰǿ�';

/*
6. �ֹε�Ϲ�ȣ ��ȣ���� ���� �л����� ���̺��� �ֹι�ȣ ���ڸ��� �������� �ʱ�� 
�����Ͽ���. �� ������ �ݿ��� ������ SQL ������ �ۼ��Ͻÿ�. 
(��. 830530-2124663 ==> 830530 ) 
*/
UPDATE COPY_TB_STUDENT
        SET STUDENT_SSN = SUBSTR(STUDENT_SSN, 1, 6);
        
SELECT * FROM COPY_TB_STUDENT;

/*
7. ���а� ����� �л��� 2005�� 1�б⿡ �ڽ��� ������ '�Ǻλ�����' ������ 
�߸��Ǿ��ٴ� ���� �߰��ϰ�� ������ ��û�Ͽ���. ��� ������ Ȯ�� ���� ��� �ش� 
������ ������ 3.5�� ����Ű�� �����Ǿ���. ������ SQL ���� �ۼ��Ͻÿ�. 
*/
CREATE TABLE COPY_TB_GRADE
AS ( SELECT * FROM TB_GRADE );

SELECT POINT
        FROM COPY_TB_GRADE
                JOIN TB_CLASS USING (CLASS_NO)
                JOIN TB_STUDENT USING (STUDENT_NO)
WHERE STUDENT_NAME = '�����' AND CLASS_NAME = '�Ǻλ�����';

-- ��
UPDATE COPY_TB_GRADE
        SET POINT = 3.5
WHERE (CLASS_NO, STUDENT_NO, TERM_NO) IN ( SELECT CLASS_NO, STUDENT_NO, TERM_NO
                FROM COPY_TB_GRADE
                     JOIN TB_CLASS USING (CLASS_NO)
                      JOIN TB_STUDENT S USING (STUDENT_NO)
                      JOIN TB_DEPARTMENT D ON(D.DEPARTMENT_NO = S.DEPARTMENT_NO)
                 WHERE STUDENT_NAME = '�����' 
                            AND CLASS_NAME = '�Ǻλ�����'
                            AND TERM_NO = '200501'
                            AND DEPARTMENT_NAME = '���а�'
                            ); 
                            
UPDATE COPY_TB_GRADE
        SET POINT = 3.5
WHERE (CLASS_NO, STUDENT_NO, TERM_NO) IN ( SELECT CLASS_NO, STUDENT_NO, TERM_NO
                FROM COPY_TB_GRADE
                     JOIN TB_CLASS USING (CLASS_NO)
                      JOIN TB_STUDENT S USING (STUDENT_NO)
                      JOIN TB_DEPARTMENT D ON(D.DEPARTMENT_NO = S.DEPARTMENT_NO)
                 WHERE STUDENT_NAME = '�����' 
                            AND CLASS_NAME = '�Ǻλ�����'
                            AND TERM_NO = '200501'
                            AND DEPARTMENT_NAME = '���а�'
                            ); 

-- ???... �̸��� ������̰� �Ǻλ������� 200501�� ����µ� ���а��� �ƴ� ����� �ִٸ�?
-- UPDATE������ JOIN �Ұ���...

/*
8. ���� ���̺�(TB_GRADE) ���� ���л����� �����׸��� �����Ͻÿ�. 
*/
SELECT STUDENT_NO
FROM COPY_TB_GRADE
        JOIN TB_STUDENT USING (STUDENT_NO)
WHERE ABSENCE_YN = 'Y';

-- ��
DELETE FROM COPY_TB_GRADE
WHERE STUDENT_NO IN ( SELECT STUDENT_NO
                                FROM COPY_TB_GRADE
                                     JOIN TB_STUDENT USING (STUDENT_NO)
                                WHERE ABSENCE_YN = 'Y');

ROLLBACK;