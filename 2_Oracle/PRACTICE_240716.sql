-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT * FROM JOB;

-- 2. JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME FROM JOB;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT * FROM DEPARTMENT;

-- 4. EMPLOYEE���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE FROM EMPLOYEE;

-- 5. EMPLOYEE���̺��� �����, ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE �����, EMP_NAME "��� �̸�", SALARY ���� 
FROM EMPLOYEE;

-- 6. EMPLOYEE���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME �̸�, SALARY*12 ����, (SALARY  + (SALARY*BONUS))*12 �Ѽ��ɾ�,
                        (SALARY + (SALARY*BONUS))*12  - (SALARY*12*0.03) �Ǽ��ɾ�
FROM EMPLOYEE;
-- BONUS �÷��� ���� NULL�� ������ �Ѽ��ɾ�, �Ǽ��ɾ� ������ NULL�� ǥ�õ�! (����Ŀ� NULL���� ������ ����� NULL�� ǥ�õ�)

-- 7. EMPLOYEE���̺��� �Ǽ��ɾ�(6�� ����)�� 5õ���� �̻��� ����� �̸�, ����, �Ǽ��ɾ�, ����� ��ȸ
SELECT EMP_NAME �̸�, SALARY ����, (SALARY + (SALARY*BONUS))*12  - (SALARY*12*0.03) �Ǽ��ɾ�, HIRE_DATE �����
FROM EMPLOYEE
WHERE ((SALARY + (SALARY*BONUS))*12  - (SALARY*12*0.03)) >= 50000000;
-- WHERE �Ǽ��ɾ� >= 50000000; -- ���� �߻�! ( WHERE�������� SELECT���� ��Ī ������ �� �� ����!)
-- * ������� : FROM�� -> WHERE�� -> SELECT��

-- 8. EMPLOYEE���̺� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

-- 9. EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5') AND HIRE_DATE < '2002/01/01';