-- Leave Management System
-- Created by Mohammed Al Asmar

-- Table 1: Employees
CREATE TABLE LMS_EMPLOYEES (
  EMP_ID     NUMBER PRIMARY KEY,
  EMP_NAME   VARCHAR2(100),
  DEPARTMENT VARCHAR2(50),
  EMAIL      VARCHAR2(100)
);

-- Table 2: Leave Requests
CREATE TABLE LMS_LEAVES (
  LEAVE_ID   NUMBER PRIMARY KEY,
  EMP_ID     NUMBER,
  LEAVE_TYPE VARCHAR2(50),
  START_DATE DATE,
  END_DATE   DATE,
  STATUS     VARCHAR2(20) DEFAULT 'PENDING',
  REASON     VARCHAR2(500)
);

-- =============================================
-- Additional Tables
-- =============================================

-- Projects table (Many-to-Many with Employees)
CREATE TABLE PROJECTS (
  PROJECT_ID   NUMBER PRIMARY KEY,
  PROJECT_NAME VARCHAR2(100),
  DEPARTMENT   VARCHAR2(50)
);

-- Junction table (Employee-Project relationship)
CREATE TABLE EMPLOYEE_PROJECTS (
  EMP_ID     NUMBER,
  PROJECT_ID NUMBER
);

-- =============================================
-- Indexes for Performance Optimization
-- =============================================

CREATE INDEX idx_leave_status ON LMS_LEAVES(STATUS);
CREATE INDEX idx_leave_type ON LMS_LEAVES(LEAVE_TYPE);
CREATE INDEX idx_leave_emp ON LMS_LEAVES(EMP_ID);
