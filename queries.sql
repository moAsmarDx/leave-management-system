-- =============================================
-- Leave Management System - Key Queries
-- Author: Mohammed Al Asmar
-- =============================================

-- 1. View all leave requests with employee names
SELECT e.EMP_NAME, e.DEPARTMENT, l.LEAVE_TYPE, 
       l.START_DATE, l.END_DATE, l.STATUS, l.REASON
FROM LMS_LEAVES l
JOIN LMS_EMPLOYEES e ON l.EMP_ID = e.EMP_ID;

-- 2. View only pending requests
SELECT e.EMP_NAME, l.LEAVE_TYPE, l.START_DATE, l.END_DATE,
       ROUND(SYSDATE - l.START_DATE) AS DAYS_PENDING
FROM LMS_LEAVES l
JOIN LMS_EMPLOYEES e ON l.EMP_ID = e.EMP_ID
WHERE l.STATUS = 'PENDING';

-- 3. Count leaves per department
SELECT e.DEPARTMENT, COUNT(*) AS TOTAL_LEAVES
FROM LMS_LEAVES l
JOIN LMS_EMPLOYEES e ON l.EMP_ID = e.EMP_ID
GROUP BY e.DEPARTMENT
ORDER BY TOTAL_LEAVES DESC;

-- 4. Leave duration classification
SELECT e.EMP_NAME, l.LEAVE_TYPE,
       (l.END_DATE - l.START_DATE) AS DAYS,
       CASE 
         WHEN (l.END_DATE - l.START_DATE) < 5 THEN 'Short'
         WHEN (l.END_DATE - l.START_DATE) <= 10 THEN 'Medium'
         ELSE 'Long'
       END AS DURATION_TYPE
FROM LMS_LEAVES l
JOIN LMS_EMPLOYEES e ON l.EMP_ID = e.EMP_ID;
