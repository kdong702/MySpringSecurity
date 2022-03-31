package kr.co.lotson.config;

import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan("kr.co.lotson.dao")
public class DataSourceConfig {
    
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource dataSource() {
        return (DataSource) DataSourceBuilder.create().build();
    }
    
    
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource)throws Exception{
            SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
            sessionFactory.setDataSource(dataSource);
            
            Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml");
            sessionFactory.setMapperLocations(res);
            sessionFactory.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
            
            
            return sessionFactory.getObject();
    }
 
}
