package com.lowcode.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 * 
 * @author vicene
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class LowCodeGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(LowCodeGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  网关启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
