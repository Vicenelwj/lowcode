package com.lowcode.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.lowcode.common.security.annotation.EnableCustomConfig;
import com.lowcode.common.security.annotation.EnableRyFeignClients;
import com.lowcode.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 定时任务
 * 
 * @author vicene
 */
@EnableCustomConfig
@EnableCustomSwagger2   
@EnableRyFeignClients
@SpringBootApplication
public class LowCodeJobApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(LowCodeJobApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}
