SET NAMES UTF8;
DROP DATABASE IF EXISTS yg;
CREATE DATABASE yg CHARSET=UTF8;
USE yg;


/**全部生鲜分类**/
CREATE TABLE yg_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**生鲜**/
CREATE TABLE yg_fresh(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属生鲜分类编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #优惠信息
  lsize VARCHAR(32),          #单果规格
  status VARCHAR(32),       #商品状态
  details VARCHAR(1024),      #产品详细说明
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**生鲜图片**/
CREATE TABLE yg_fresh_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  fresh_id INT,              #生鲜编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE yg_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE yg_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE yg_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE yg_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE yg_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE yg_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE yg_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**全部生鲜分类**/
INSERT INTO yg_family VALUES
(NULL,'进口水果'),
(NULL,'国产水果'),
(NULL,'精选肉类'),
(NULL,'禽类蛋品'),
(NULL,'海鲜水产'),
(NULL,'即烹美食'),
(NULL,'乳品糕点'),
(NULL,'新鲜蔬菜'),
(NULL,'方便速食'),
(NULL,'粮油杂货'),
(NULL,'食品饮料');


/**生鲜**/
INSERT INTO xz_laptop VALUES
(1,1,'越南红心火龙果5个410g以上/个(大果)','嫩滑多汁 清甜回味',119,'更多商品优惠，尽在易果生鲜APP','410g以上/个','冷藏','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150123456789,2968,true),

(43,10,'神舟(HASEE)战神Z6-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050 1080P)黑色','预约享5499抢！【128G SSD+1T HDD】双硬盘，春风“十”里，期待是你！',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i7 128G+1T GTX1050】','神舟战神Z6-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',156123456789,1844,true);

/**笔记本电脑图片**/
INSERT INTO xz_laptop_pic VALUES
(NULL, 1, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 4, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 4, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 5, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 5, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 5, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 5, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 5, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 5, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 5, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 6, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 6, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 6, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 6, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 6, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 6, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 6, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 7, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 7, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 7, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 7, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 7, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 7, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 7, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 8, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 8, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 8, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 8, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 8, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 8, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 8, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 9, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 9, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 9, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 9, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 9, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 9, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 9, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 9, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 10, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 10, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 10, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 10, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 10, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 10, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 10, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 10, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 11, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 11, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 11, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 11, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 11, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 11, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 11, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 11, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 12, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 12, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 12, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 12, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 12, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 12, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 12, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 12, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 13, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 13, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 13, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 13, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 13, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 13, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 14, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 14, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 14, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 14, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 14, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 14, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 15, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 15, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 15, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 15, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 15, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 15, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 16, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 16, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 16, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 16, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 16, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 16, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 17, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 17, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 17, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 17, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 17, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 17, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 17, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 18, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 18, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 18, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 18, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 18, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 18, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 18, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 19, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 19, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 19, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 19, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 19, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 20, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 20, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 20, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 20, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 20, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 21, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 21, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 21, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 21, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 21, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 22, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 22, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 22, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 22, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 22, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 22, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 22, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 23, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 23, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 23, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 23, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 23, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 23, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 23, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 24, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 24, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 24, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 24, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 24, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 24, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 24, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 25, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 25, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 25, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 25, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 25, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 25, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 25, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 26, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 26, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 26, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 26, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 26, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 26, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 26, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 27, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 27, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 27, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 27, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 27, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 27, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 27, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 28, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 28, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 28, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 28, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 28, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 28, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 28, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 28, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 29, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 29, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 29, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 29, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 29, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 29, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 29, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 29, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 30, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 30, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 30, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 30, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 30, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 30, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 30, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 30, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 31, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 31, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 31, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 31, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 31, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 31, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 31, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 31, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 32, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 32, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 32, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 32, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 32, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 32, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 32, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 32, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 33, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 33, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 33, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 33, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 33, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 33, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 33, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 34, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 34, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 34, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 34, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 34, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 34, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 34, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 35, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 35, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 35, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 35, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 35, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 35, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 35, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 36, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 36, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 36, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 36, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 36, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 36, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 36, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 37, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 37, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 37, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 37, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 37, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 37, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 37, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 38, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 38, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 38, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 38, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 39, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 39, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 39, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 39, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 40, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 40, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 40, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 40, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 41, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 41, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 41, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 41, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 42, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 42, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 42, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 42, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 43, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 43, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 43, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 43, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg');

/**用户信息**/
INSERT INTO xz_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO xz_index_carousel VALUES
(NULL, 'img/index/banner1.png','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/banner2.png','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/banner3.png','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/banner4.png','轮播广告商品4','lookforward.html');

/****首页商品****/
INSERT INTO xz_index_product VALUES
(NULL, 'Apple MacBook Air系列', '酷睿双核i5处理器|256GB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img1.png', 6988, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '小米Air 金属超轻薄', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD独立显卡', 'img/index/study_computer_img2.png', 3488, 'product_details.html?lid=5', 2, 2, 2),
(NULL, '联想E480C 轻薄系列', '酷睿双核i7处理器|256GB SSD|4GB内存|英特尔HD显卡680M', 'img/index/study_computer_img3.png', 5399, 'product_details.html?lid=9', 3, 3, 3),
(NULL, '华硕RX310 金属超极本', '酷睿双核i5处理器|512GB SSD|4GB内存|英特尔HD游戏级显卡', 'img/index/study_computer_img4.png', 4966, 'product_details.html?lid=13', 4, 4, 4),
(NULL, '联想小新700 电竞版游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img5.png', 6299, 'product_details.html?lid=17', 5, 5, 5),
(NULL, '戴尔灵越燃7000 轻薄窄边', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD显卡', 'img/index/study_computer_img3.png', 5199, 'product_details.html?lid=19', 6, 6, 6),
(NULL, '神州战神Z7M 高性价比游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD游戏机独立显卡', 'img/index/study_computer_img4.png', 5799, 'product_details.html?lid=38', 0, 0, 0);

