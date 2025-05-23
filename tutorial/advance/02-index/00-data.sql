CREATE TABLE `tb_sku` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `sn` varchar(100) NOT NULL COMMENT '商品条码',
    `name` varchar(200) NOT NULL COMMENT 'SKU名称',
    `price` int(20) NOT NULL COMMENT '价格（分）',
    `num` int(10) NOT NULL COMMENT '库存数量',
    `alert_num` int(11) DEFAULT NULL COMMENT '库存预警数量',
    `image` varchar(200) DEFAULT NULL COMMENT '商品图片',
    `images` varchar(2000) DEFAULT NULL COMMENT '商品图片列表',
    `weight` int(11) DEFAULT NULL COMMENT '重量（克）',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    `category_name` varchar(200) DEFAULT NULL COMMENT '类目名称',
    `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
    `spec` varchar(200) DEFAULT NULL COMMENT '规格',
    `sale_num` int(11) DEFAULT '0' COMMENT '销量',
    `comment_num` int(11) DEFAULT '0' COMMENT '评论数',
    `status` char(1) DEFAULT '1' COMMENT '商品状态 1-正常，2-下架，3-删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

SET GLOBAL LOCAL_INFILE=1;

load data local infile '/root/sql/tb_sku1.sql' into table `tb_sku` fields terminated by ',' lines terminated by '\n';
