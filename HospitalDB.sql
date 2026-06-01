create database HospitalDB
go

USE HospitalDB;
GO

INSERT INTO users
(
full_name,
email,
password,
phone,
address,
enabled,
role,
created_at
)
VALUES
(
'Administrator',
'admin@hospital.com',
'$2a$10$Q7zrx4.JNgiIq1RR.tz8ZubOxmam535e6X/xokB73oYMs.n6fxs.S',
'0123456789',
'Ho Chi Minh',
1,
'ROLE_ADMIN',
GETDATE()
);

INSERT INTO users
(
    full_name,
    email,
    password,
    phone,
    address,
    enabled,
    role,
    created_at
)
VALUES
(
    N'Nguyễn Văn An',
    'doctor1@hospital.com',
    '$2a$10$Q7zrx4.JNgiIq1RR.tz8ZubOxmam535e6X/xokB73oYMs.n6fxs.S',
    '0901111111',
    N'TP. Hồ Chí Minh',
    1,
    'ROLE_DOCTOR',
    GETDATE()
);
GO

INSERT INTO doctors
(
    user_id,
    specialization,
    experience,
    description,
    image_url
)
VALUES
(
    (SELECT id FROM users WHERE email = 'doctor1@hospital.com'),
    N'Nội tổng quát',
    8,
    N'Bác sĩ chuyên khoa Nội tổng quát, có nhiều kinh nghiệm khám và điều trị bệnh lý thường gặp.',
    'https://via.placeholder.com/400x250'
);
GO

INSERT INTO users
(
    full_name,
    email,
    password,
    phone,
    address,
    enabled,
    role,
    created_at
)
VALUES
(
    N'Trần Thị Bình',
    'doctor2@hospital.com',
    '$2a$10$Q7zrx4.JNgiIq1RR.tz8ZubOxmam535e6X/xokB73oYMs.n6fxs.S',
    '0902222222',
    N'Hà Nội',
    1,
    'ROLE_DOCTOR',
    GETDATE()
);
GO

INSERT INTO doctors
(
    user_id,
    specialization,
    experience,
    description,
    image_url
)
VALUES
(
    (SELECT id FROM users WHERE email = 'doctor2@hospital.com'),
    N'Nhi khoa',
    6,
    N'Bác sĩ chuyên khám và tư vấn các bệnh lý trẻ em, chăm sóc sức khỏe nhi khoa.',
    'https://via.placeholder.com/400x250'
);
GO

INSERT INTO users
(
    full_name,
    email,
    password,
    phone,
    address,
    enabled,
    role,
    created_at
)
VALUES
(
    N'Lê Minh Cường',
    'doctor3@hospital.com',
    '$2a$10$Q7zrx4.JNgiIq1RR.tz8ZubOxmam535e6X/xokB73oYMs.n6fxs.S',
    '0903333333',
    N'Đà Nẵng',
    1,
    'ROLE_DOCTOR',
    GETDATE()
);
GO

INSERT INTO doctors
(
    user_id,
    specialization,
    experience,
    description,
    image_url
)
VALUES
(
    (SELECT id FROM users WHERE email = 'doctor3@hospital.com'),
    N'Tim mạch',
    10,
    N'Bác sĩ chuyên khoa Tim mạch, tư vấn và điều trị các bệnh về huyết áp, tim mạch.',
    'https://via.placeholder.com/400x250'
);
GO

INSERT INTO patients
(
    user_id,
    gender,
    age,
    birth_date,
    blood_group
)
SELECT 
    u.id,
    N'Chưa cập nhật',
    NULL,
    NULL,
    NULL
FROM users u
WHERE u.role = 'ROLE_PATIENT'
  AND NOT EXISTS (
      SELECT 1
      FROM patients p
      WHERE p.user_id = u.id
  );
GO

ALTER TABLE appointments
ALTER COLUMN appointment_time TIME;
GO

ALTER TABLE appointments
ALTER COLUMN appointment_date DATE;
GO

ALTER TABLE users
ADD avatar NVARCHAR(255);
GO
