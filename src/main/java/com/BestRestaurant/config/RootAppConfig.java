package com.BestRestaurant.config;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


// 相當於beans.config.xml(application.xml)的java程式組態
@Configuration
@ComponentScan(basePackages = "com.BestRestaurant")
@EnableTransactionManagement
@EnableWebMvc
public class RootAppConfig {

  @Bean
  public LocalSessionFactoryBean sessionFactory() {
    LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
    sessionFactory.setDataSource(datasource());
    sessionFactory.setHibernateProperties(hibernateProperties());
    sessionFactory.setPackagesToScan("com.BestRestaurant"); // 掃描hibernate的Entity
    return sessionFactory;
  }

  // 讓Hibernate使用Spring提供的管理交易機制
  @Bean
  @Autowired
  public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
    HibernateTransactionManager txManger = new HibernateTransactionManager();
    txManger.setSessionFactory(sessionFactory);
    return txManger;
  }

  // 設定DataSource
  public HikariDataSource datasource() {
    HikariConfig confing = new HikariConfig();
    confing.setJdbcUrl("jdbc:sqlserver://localhost:1433;database=eeit40DB");
    confing.setUsername("sa");
    confing.setPassword("Passw0rd!");
    confing.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    confing.setMaximumPoolSize(5);

    HikariDataSource ds = new HikariDataSource(confing);
    return ds;
  }

  // 設定hibernate properties
  public Properties hibernateProperties() {
    Properties p = new Properties();
    p.put("hibernate.dialect", org.hibernate.dialect.SQLServer2016Dialect.class);
    p.put("hibernate.show_sql", Boolean.TRUE);
    p.put("hibernate.format_sql", Boolean.TRUE);
    // p.put("hibernate.current_session_context_class", "thread");

    // p.put("hibernate.hbm2ddl.auto", "update"); //是否要由hibernate 創建table
    return p;
  }

}
