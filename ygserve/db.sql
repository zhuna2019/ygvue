#(1)进入数据 yg
USE yg;
#(2)创建表  yg_index_product
CREATE TABLE yg_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  details VARCHAR(50),
  price  VARCHAR(32),
  spe_img_url VARCHAR(50),
  imgs_url VARCHAR(50),
);
#(3)添加二条测试数据11:40
INSERT INTO yg_index_product VALUES(null,'礼品礼券','心中甜幸福礼赞礼盒',158,'gift_banner.png','01.jpg');
INSERT INTO yg_index_product VALUES(null,'礼品礼券','心中甜幸福礼赞礼盒',158,'gift_banner.png','01.jpg');
INSERT INTO yg_index_product VALUES(null,'礼品礼券','心中甜幸福礼赞礼盒',158,'gift_banner.png','01.jpg');
INSERT INTO yg_index_product VALUES(null,'礼品礼券','心中甜幸福礼赞礼盒',158,'gift_banner.png','01.jpg');
