package com.morning.test.base;
import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.ConfigGenerator;

/**
 * mybatisplus 代码生成器配置
 */
public class CustomGenerator {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomGenerator.class);

    /* 生成代码包名 */
    private static final String PACKAGE_NAME = "com.morning";
    
    private CustomGenerator() {
    }

    public static void main(String[] args) {

        /* 获取 JDBC 配置文件 */
        Properties props = getProperties();

        /* 配置 Mybatis-Plus 代码生成器 */
        ConfigGenerator cg = new ConfigGenerator();

        /* Mysql 数据库相关配置 */
        cg.setDbDriverName(props.getProperty("jdbc.driver"));
        cg.setDbUrl(props.getProperty("jdbc.url"));
        cg.setDbUser(props.getProperty("jdbc.username"));
        cg.setDbPassword(props.getProperty("jdbc.password"));

        /* 设置数据库前缀（例如`mp_user`生成实体类，false 为 MpUser.java , true 为 User.java）*/
        cg.setDbPrefix(true);

         /*
         * true 表示数据库设置全局下划线命名规则，默认 false
         * ------------------------------------------------------------------------------------
         * 【 开启该设置实体可无 @TableId(value = "test_id") 字段映射，启动配置对应也要开启 true 设置 】
         */
        cg.setDbColumnUnderline(false);

        /*
         * 表主键 ID 生成类型, 自增该设置无效。
         * <p>
         * IdType.AUTO             数据库ID自增
         * IdType.INPUT            用户输入ID
         * IdType.ID_WORKER        全局唯一ID，内容为空自动填充（默认配置）
         * IdType.UUID            全局唯一ID，内容为空自动填充
         * </p>
         */
        cg.setIdType(IdType.AUTO);
        
        /*	
         *  类型：String[]
         *  描述：要生成代码的表名称（若为空就直接指定所有表，格式为逗号分割）
         */
        String[] tableNames = {"tb_goods_favorites"}; 
        cg.setTableNames(tableNames);
        
        /* 生成文件保存位置 */
        cg.setSaveDir(".\\src\\main\\java");

        /* 生成代码包路径 */
        cg.setEntityPackage(PACKAGE_NAME + ".entity"); //entity 实体包路径
        cg.setMapperPackage(PACKAGE_NAME + ".dao"); //mapper 映射文件路径
        cg.setServicePackage(PACKAGE_NAME + ".service"); //service 层路径
        cg.setXmlPackage("mybatis"); //xml层路径
        
        
        /* 生成代码 */
        AutoGenerator.run(cg);
    }

    /**
     * 获取配置文件
     *
     * @return 配置Props
     */
    private static Properties getProperties() {
        // 读取配置文件
        Resource resource = new ClassPathResource("/properties/jdbc.properties");
        Properties props = new Properties();
        try {
            props = PropertiesLoaderUtils.loadProperties(resource);
        } catch (IOException e) {
        	LOGGER.error("CustomGenerator.getProperties:{}", e);
        }
        return props;
    }

}