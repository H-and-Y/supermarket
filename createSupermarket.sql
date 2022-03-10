CREATE DATABASE supermarketDatabase;

USE supermarketDatabase;

CREATE TABLE goodsClassify(#商品类别
	classNumber INT AUTO_INCREMENT,#类别号
	NAME VARCHAR(50) CHARACTER SET gb2312,#类别名称
	PRIMARY KEY(classNumber)
);

CREATE TABLE goods(#商品
	goods_id CHAR(50),#商品标识号
	goods_name VARCHAR(50) CHARACTER SET gb2312,#商品名称
	goods_price FLOAT,#价格
	goods_made VARCHAR(60) CHARACTER SET gb2312,#制造商
	goods_pic VARCHAR(60) CHARACTER SET gb2312,#图片
	goods_mess VARCHAR(600) CHARACTER SET gb2312,#商品介绍
	classNumber INT NOT NULL,#所属类别
	inventory INT DEFAULT 0,#库存
	PRIMARY KEY(goods_id),
	FOREIGN KEY(classNumber) REFERENCES goodsClassify(classNumber)
);

CREATE TABLE USER(#用户
	account CHAR(30),#账号
	PASSWORD VARCHAR(30) CHARACTER SET utf8,#密码
	nickName VARCHAR(30) CHARACTER SET gb2312,#昵称
	phone CHAR(20),#号码
	address CHAR(50) CHARACTER SET gb2312,#地址
	realName CHAR(60) CHARACTER SET gb2312,#真实姓名
	PRIMARY KEY(account)
);

CREATE TABLE shoppingCart(#购物车
	account CHAR(30),#账号
	goods_id CHAR(30),#商品标识号
	goods_name VARCHAR(50) CHARACTER SET gb2312,#商品名称
	goods_price FLOAT,#价格
	goods_number INT,#商品数量
	FOREIGN KEY(account) REFERENCES USER(account)
);

CREATE TABLE goodsOrder(#订单信息
	orderNumber INT AUTO_INCREMENT,
	account CHAR(30),#账号
	mess VARCHAR(500) CHARACTER SET gb2312,#订单信息
	PRIMARY KEY(orderNumber)
);

