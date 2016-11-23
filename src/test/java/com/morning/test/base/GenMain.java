package com.morning.test.base;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GenMain {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomGenerator.class);
   
    private GenMain() {
    }
    
    public static void main(String[] args) throws URISyntaxException, InterruptedException {
        List<String> warnings = new ArrayList<>();
        boolean overwrite = true;
        String genCfg = GenMain.class.getResource("/generatorConfig.xml").getFile();
        String path = new URI(genCfg).getPath();
        File configFile = new File(path);
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = null;
        try {
            config = cp.parseConfiguration(configFile);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (XMLParserException e) {
            e.printStackTrace();
        }
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = null;
        try {
            myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        } catch (InvalidConfigurationException e) {
        	LOGGER.error("GenMain.main.InvalidConfigurationException:{}", e);
        }
        try {
            myBatisGenerator.generate(null);
        } catch (SQLException e) {
        	LOGGER.error("GenMain.main.SQLException:{}", e);
        } catch (IOException e) {
        	LOGGER.error("GenMain.main.IOException:{}", e);
        } catch (InterruptedException e) {
        	LOGGER.error("GenMain.main.InterruptedException:{}", e);
        }
    }
}