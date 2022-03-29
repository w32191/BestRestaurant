package com.BestRestaurant.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

// 相當於mvc-servlet.xml的java程式組態
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.BestRestaurant")
public class WebMvcAppConfig implements WebMvcConfigurer {

  @Override
  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
    configurer.enable();
  }

  @Bean
  public InternalResourceViewResolver viewResolver() {
    InternalResourceViewResolver irv1 = new InternalResourceViewResolver();
    irv1.setPrefix("/WEB-INF/pages/");
    irv1.setSuffix(".jsp");
    irv1.setOrder(6);
    return irv1;
  }


  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("static/images/**")
        .addResourceLocations("/WEB-INF/resources/images/");
    registry.addResourceHandler("static/css/**").addResourceLocations("/WEB-INF/resources/css/");
    registry.addResourceHandler("static/fonts/**")
        .addResourceLocations("/WEB-INF/resources/fonts/");
    registry.addResourceHandler("static/jquery-ui-1.13.1.custom/**")
        .addResourceLocations("/WEB-INF/resources/jquery-ui-1.13.1.custom/");
    registry.addResourceHandler("static/jqvmap/**")
        .addResourceLocations("/WEB-INF/resources/jqvmap/");
    registry.addResourceHandler("static/js/**").addResourceLocations("/WEB-INF/resources/js/");

  }

  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    registry.addRedirectViewController("/manageU", "memberController.manage");
    registry.addViewController("/login").setViewName("login");
    registry.addViewController("/").setViewName("login");
  }

}
