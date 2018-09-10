package com.review.intercepter;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author wuyongqiang
 * @date 2018/09/10
 */
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //要拦截的路径
        String[] addPathPatterns ={
                "/review/**"
        };
        //不拦截的路径
        String[] excludePathPatterns ={
                "/review/login",
                "/review/loginCheck"
        };
        //注册登陆拦截器
        registry.addInterceptor(new LoginIntercepter()).addPathPatterns(addPathPatterns).excludePathPatterns(excludePathPatterns);


    }
}
