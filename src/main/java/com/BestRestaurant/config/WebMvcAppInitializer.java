package com.BestRestaurant.config;

import javax.servlet.Filter;
import org.springframework.orm.hibernate5.support.OpenSessionInViewFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


// 相當於web.xml的java程式
public class WebMvcAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  // 設定設定相當於beans.config.xml(application.xml)的java程式組態
  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class[] {RootAppConfig.class};
  }

  // 設定設定相當於mvc-servlet.xml的java程式組態
  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class[] {WebMvcAppConfig.class};
  }

  // 設定url-pattern mapping路徑的位置
  @Override
  protected String[] getServletMappings() {
    return new String[] {"/"};
  }

  @Override
  protected Filter[] getServletFilters() {
    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
    characterEncodingFilter.setEncoding("UTF-8");
    characterEncodingFilter.setForceEncoding(true);

//    OpenSessionInViewFilter osivf = new OpenSessionInViewFilter();


    return new Filter[] {characterEncodingFilter};
  }

}
