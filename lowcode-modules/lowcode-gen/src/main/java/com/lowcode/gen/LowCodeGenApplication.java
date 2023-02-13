package com.lowcode.gen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.lowcode.common.security.annotation.EnableCustomConfig;
import com.lowcode.common.security.annotation.EnableRyFeignClients;
import com.lowcode.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 代码生成
 * 
 * @author vicene
 */
@EnableCustomConfig
@EnableCustomSwagger2   
@EnableRyFeignClients
@SpringBootApplication
public class LowCodeGenApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(LowCodeGenApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成模块启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
