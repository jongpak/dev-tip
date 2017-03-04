# 스프링 웹개발

## 환경 세팅

### 인코딩 설정

#### server.xml에 URIEncoding 설정
```xml
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1" redirectPort="8443" URIEncoding="UTF-8" />
```

#### web.xml에 필터 설정
```xml
<filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
        <param-name>encoding</param-name>
        <param-value>utf-8</param-value>
    </init-param>
</filter>

<filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

#### JSP 파일
```jsp
<%@ page contentType="text/html;charset=utf-8" %>
```

### JSP 설정
#### servlet-context.xml 설정
```xml
<beans:bean
    class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <beans:property name="prefix" value="/WEB-INF/views/" />
    <beans:property name="suffix" value=".jsp" />
</beans:bean>
```

### tiles 설정
#### pom.xml 설정
```xml
<dependency>
    <groupId>org.apache.tiles</groupId>
    <artifactId>tiles-core</artifactId>
    <version>3.0.7</version>
</dependency>
<dependency>
    <groupId>org.apache.tiles</groupId>
    <artifactId>tiles-jsp</artifactId>
    <version>3.0.7</version>
</dependency>
```

#### servlet-context.xml 설정
- tiles의 order를 1로 주고, JSP의 order를 2로 설정한다
- 그 이유는 tiles가 먼저 레이아웃을 구성해주고 그 이후에 JSP 렌더링을 수행한다
- UrlBasedViewResolver은 뷰이름을 URL기반으로 사용하게 해주는 뷰 리졸버다
- tiles 설정은 /WEB-INF/tiles.xml 으로 설정한다
```xml
<beans:bean
    class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <beans:property name="prefix" value="/WEB-INF/views/" />
    <beans:property name="suffix" value=".jsp" />
    <beans:property name="order" value="2" />
</beans:bean>

<beans:bean class="org.springframework.web.servlet.view.UrlBasedViewResolver">
    <beans:property name="viewClass" value="org.springframework.web.servlet.view.tiles3.TilesView" />
    <beans:property name="order" value="1" />
</beans:bean>

<beans:bean id="tilesConfigurer"
    class="org.springframework.web.servlet.view.tiles3.TilesConfigurer">
    <beans:property name="definitions">
        <beans:list>
            <beans:value>/WEB-INF/tiles.xml</beans:value>
        </beans:list>
    </beans:property>
</beans:bean>
```

#### tiles.xml 설정
**참고**
- 타일즈 뷰 파일: https://github.com/jongpak/spring_web/tree/master/src/main/webapp/WEB-INF/tiles
```xml
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE tiles-definitions PUBLIC
    "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
    "http://tiles.apache.org/dtds/tiles-config_3_0.dtd">

<tiles-definitions>
    <definition name="layout" template="/WEB-INF/tiles/layout.jsp">
        <put-attribute name="title" value="Jongpak spring web" />
        
        <put-attribute name="header" value="/WEB-INF/tiles/header.jsp" />
        <put-attribute name="menu" value="/WEB-INF/tiles/menu.jsp" />
        <put-attribute name="body" value="" />
        <put-attribute name="footer" value="/WEB-INF/tiles/footer.jsp" />
    </definition>
    
    <definition name="/tiles/*" extends="layout">
        <put-attribute name="body" value="/WEB-INF/views/{1}.jsp" />
    </definition>

</tiles-definitions>
```

## properties 사용
### application-context.xml 설정
```xml
<util:properties id="dataSourceConfig" location="classpath:dataSource.properties" />
```

### 사용법
#### xml 파일에서
```
#{dataSourceConfig['dataSource.driverClassName']}
```

#### SpEL
```java
@Value("#{dataSourceConfig['dataSource.driverClassName']}")
private String driverClassName;
```
