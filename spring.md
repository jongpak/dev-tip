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

### tiles 설정
