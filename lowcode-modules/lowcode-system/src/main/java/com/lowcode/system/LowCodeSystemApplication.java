package com.lowcode.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.lowcode.common.security.annotation.EnableCustomConfig;
import com.lowcode.common.security.annotation.EnableRyFeignClients;
import com.lowcode.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 系统模块
 * 
 * @author vicene
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class LowCodeSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(LowCodeSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
