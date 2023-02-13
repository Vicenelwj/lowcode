package com.lowcode.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.lowcode.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 * 
 * @author vicene
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class LowCodeAuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(LowCodeAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
