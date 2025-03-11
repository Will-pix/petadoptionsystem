-- 清空现有宠物数据
DELETE FROM pets;

-- 插入狗狗数据
INSERT INTO pets (name, type, age, gender, breed, description, status, image_url) VALUES
('阳阳', 'DOG', 2, 'MALE', '金毛', '活泼开朗的金毛，喜欢和人互动，适合有小孩的家庭。', 'AVAILABLE', 'https://images.unsplash.com/photo-1587300003388-59208cc962cb'),
('雪球', 'DOG', 1, 'MALE', '哈士奇', '活力十足的哈士奇，喜欢户外活动，需要有足够的运动空间。', 'AVAILABLE', 'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8'),
('豆豆', 'DOG', 1.5, 'FEMALE', '柯基', '威尔士柯基，活泼可爱，喜欢和人玩耍，已接种疫苗。', 'AVAILABLE', 'https://images.unsplash.com/photo-1583301286816-f4f05e1e8b25'),
('贝贝', 'DOG', 3, 'MALE', '拉布拉多', '温顺友好的拉布拉多，适合家庭饲养，已完成基础训练。', 'AVAILABLE', 'https://images.unsplash.com/photo-1552053831-71594a27632d'),
('旺财', 'DOG', 2, 'MALE', '边牧', '聪明敏捷的边牧，需要大量的运动和智力训练。', 'AVAILABLE', 'https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47'),
('可可', 'DOG', 4, 'FEMALE', '泰迪', '泰迪犬，不掉毛，性格温顺，适合公寓饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1591946614720-90a587da4a36'),
('小黑', 'DOG', 1, 'MALE', '法国斗牛犬', '法国斗牛犬，性格活泼，适合家庭饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1583511655826-05700d52f4d9'),
('多多', 'DOG', 2, 'FEMALE', '萨摩耶', '萨摩耶，性格友好，喜欢与人互动，需要定期梳理毛发。', 'AVAILABLE', 'https://images.unsplash.com/photo-1565708097881-9eeaad6d1c7a'),
('乐乐', 'DOG', 5, 'MALE', '比熊', '比熊犬，性格温顺，适合家庭饲养，需要定期美容。', 'AVAILABLE', 'https://images.unsplash.com/photo-1591946614666-90cc1e0838e8'),
('毛毛', 'DOG', 3, 'FEMALE', '博美', '博美犬，性格活泼，警觉性高，适合家庭饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1582456891925-a53965520520');

-- 插入猫咪数据
INSERT INTO pets (name, type, age, gender, breed, description, status, image_url) VALUES
('小橘', 'CAT', 3, 'MALE', '橘猫', '温顺亲人的橘猫，喜欢安静的环境，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba'),
('灰灰', 'CAT', 2, 'FEMALE', '英国短毛猫', '英国短毛猫，性格独立，但也喜欢与人互动，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce'),
('咪咪', 'CAT', 4, 'FEMALE', '美国短毛猫', '美国短毛猫，性格温顺，喜欢安静的环境，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1548802673-380ab8ebc7b7'),
('奶茶', 'CAT', 1, 'FEMALE', '布偶猫', '布偶猫，性格温顺，喜欢与人互动，毛发柔软。', 'AVAILABLE', 'https://images.unsplash.com/photo-1543852786-1cf6624b9987'),
('黑豆', 'CAT', 2, 'MALE', '黑猫', '黑猫，性格独立，但也喜欢与人互动，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1557246565-8a3d3ab5d7f6'),
('雪花', 'CAT', 3, 'FEMALE', '波斯猫', '波斯猫，性格温顺，需要定期梳理毛发，适合安静的家庭。', 'AVAILABLE', 'https://images.unsplash.com/photo-1518791841217-8f162f1e1131'),
('花花', 'CAT', 1, 'FEMALE', '三花猫', '三花猫，性格活泼，喜欢玩耍，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1573865526739-10659fec78a5'),
('小白', 'CAT', 2, 'MALE', '白猫', '白猫，性格温顺，喜欢安静的环境，已绝育。', 'AVAILABLE', 'https://images.unsplash.com/photo-1520315342629-6ea920342047'),
('豆豆', 'CAT', 1, 'MALE', '加菲猫', '加菲猫，性格慵懒，喜欢吃和睡，适合家庭饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1574144113084-b6f450cc5e0c'),
('米米', 'CAT', 4, 'FEMALE', '暹罗猫', '暹罗猫，性格活泼，喜欢与人互动，声音较大。', 'AVAILABLE', 'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8');

-- 插入其他宠物数据
INSERT INTO pets (name, type, age, gender, breed, description, status, image_url) VALUES
('小白兔', 'OTHER', 1, 'FEMALE', '荷兰垂耳兔', '荷兰垂耳兔，性格温顺，适合小户型家庭饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1425082661705-1834bfd09dca'),
('花花鼠', 'OTHER', 1, 'FEMALE', '布丁仓鼠', '布丁仓鼠，性格活泼，适合有耐心的主人饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1518288774672-b94e808873ff'),
('豆豆猪', 'OTHER', 2, 'MALE', '荷兰猪', '荷兰猪，性格温顺，适合家庭饲养，喜欢吃蔬菜。', 'AVAILABLE', 'https://images.unsplash.com/photo-1548767797-d8c844163c4c'),
('小灰', 'OTHER', 1, 'MALE', '龙猫', '龙猫，性格温顺，适合安静的家庭饲养，需要定期洗澡。', 'AVAILABLE', 'https://images.unsplash.com/photo-1425082362708-76af6a0e9320'),
('跳跳', 'OTHER', 3, 'FEMALE', '侏儒兔', '侏儒兔，体型小巧，性格活泼，适合小户型家庭饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308'),
('小黄', 'OTHER', 2, 'MALE', '黄金鼠', '黄金鼠，性格活泼，适合有耐心的主人饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1566484659339-74a8e4ade4e7'),
('毛毛猪', 'OTHER', 1, 'FEMALE', '豚鼠', '豚鼠，性格温顺，适合家庭饲养，喜欢吃蔬菜。', 'AVAILABLE', 'https://images.unsplash.com/photo-1548767797-d8c844163c4c'),
('小绿', 'OTHER', 2, 'MALE', '鹦鹉', '鹦鹉，性格活泼，能学人说话，适合有耐心的主人饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1552728089-57bdde30beb3'),
('小蓝', 'OTHER', 1, 'FEMALE', '蜥蜴', '蜥蜴，性格温顺，适合有爬虫饲养经验的主人。', 'AVAILABLE', 'https://images.unsplash.com/photo-1504450874802-0ba2bcd9b5ae'),
('小红', 'OTHER', 3, 'MALE', '乌龟', '乌龟，性格温顺，寿命长，适合长期饲养。', 'AVAILABLE', 'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f');