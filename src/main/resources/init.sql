-- 创建数据库
CREATE DATABASE IF NOT EXISTS pet_adoption DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE pet_adoption;

-- 用户表
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL, -- ADMIN, ADOPTER, VOLUNTEER
    is_banned BOOLEAN DEFAULT FALSE,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_username (username)
);

-- 宠物表
CREATE TABLE IF NOT EXISTS pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20) NOT NULL, -- DOG, CAT, OTHER
    age INT,
    gender VARCHAR(10),
    breed VARCHAR(50),
    `character` TEXT,
    health TEXT,
    description TEXT,
    image_url VARCHAR(255),
    volunteer_id INT,
    found_location VARCHAR(255),
    found_time DATETIME,
    status VARCHAR(20) DEFAULT 'AVAILABLE', -- AVAILABLE, PENDING, ADOPTED
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (volunteer_id) REFERENCES users(id)
);

-- 领养申请表
CREATE TABLE IF NOT EXISTS adoption_applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT NOT NULL,
    adopter_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING', -- PENDING, APPROVED, REJECTED
    living_condition TEXT,
    adoption_reason TEXT,
    contact_info TEXT,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pet_id) REFERENCES pets(id),
    FOREIGN KEY (adopter_id) REFERENCES users(id)
);

-- 社区帖子表
CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 帖子评论表
CREATE TABLE IF NOT EXISTS comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 捐赠记录表
CREATE TABLE IF NOT EXISTS donations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    status VARCHAR(20) DEFAULT 'PENDING', -- PENDING, COMPLETED, FAILED
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 志愿者活动表
CREATE TABLE IF NOT EXISTS volunteer_activities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    activity_time DATETIME,
    max_participants INT,
    current_participants INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'UPCOMING', -- UPCOMING, ONGOING, COMPLETED
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 志愿者活动报名表
CREATE TABLE IF NOT EXISTS activity_registrations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT NOT NULL,
    user_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'REGISTERED', -- REGISTERED, CANCELLED
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES volunteer_activities(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 插入默认管理员账号
INSERT INTO users (username, password, email, role, is_banned)
VALUES ('admin', 'admin123', 'admin@example.com', 'ADMIN', FALSE); 