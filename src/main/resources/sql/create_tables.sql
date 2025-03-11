-- 创建宠物表
CREATE TABLE IF NOT EXISTS pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20) NOT NULL,
    age FLOAT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    breed VARCHAR(50),
    `character` VARCHAR(100),
    health VARCHAR(100),
    description TEXT,
    image_url VARCHAR(255),
    volunteer_id INT,
    found_location VARCHAR(100),
    found_time VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'AVAILABLE',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 