# java

> 學習

- [JAVA guide (這是干貨，必須看完)](https://github.com/Snailclimb/JavaGuide)

> `jiapan` 小打小鬧實作系列

- [縮網址服務](https://github.com/justintien/url-shortener)
- [加密解密編碼練習 (go/java/nodejs)](https://github.com/justintien/encrypt-decrypt)

> 2019年, 列出幾個當下流行的框架:

- [spring](https://github.com/spring-projects/spring-framework)

## 開發

- (optional) IntelliJ IDEA: 很好的提供多種編譯器 `Ant` `Grade` `Groovy`... 個人目前是選用 `Maven`

```sh
# brew cask install intellij-idea # 付費版
brew cask install intellij-idea-ce # 免費版
```

- (optional) IDEA 編譯器設定: add configurations > maven

```md
Working directory: 選擇你的專案目錄
command line: clean install -Dmaven.test.skip=true
```

- (optional) use docker maven to build

```sh
# 以下指令，將 mount 本機的 .m2 目錄 (build complete 的檔案會產生在這裡)
docker run -it --rm \
-u root \
-v ~/.m2:/root/.m2 \
-v $(pwd):/usr/src/mymaven \
-w /usr/src/mymaven \
maven:3.5.3 \
mvn clean install -Dmaven.test.skip=true
```

## spring

> 2019年, 當今JAVA框架無庸置疑，選用 spring 得永生 http://spring.io/

- spring 入門: https://juejin.im/post/5d5261e8f265da03d316b684
- 學 spring 其實直接看官網已足矣 http://spring.io/

> spring.xml

- property-placeholder 設置: 掃描所有 namespace 底下的 resources/*.config 會被 spring 加載

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.0.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.0.xsd http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.0.xsd">
    <aop:aspectj-autoproxy proxy-target-class="true"/>
    <context:component-scan base-package="com.nuts"/>
    <context:property-placeholder location="classpath*:*.config"/>
</beans>
```

```java
// 註入 config property 
@Value( "${jdbc.url}" )
private String jdbcUrl;
```

### study

> 什麼是註釋裝配

- https://juejin.im/post/5b1b841de51d4506d47df108
- https://juejin.im/post/5b1fcf386fb9a01e615ed6c4
- Spring中 @Autowired, @Resource 和 @Inject有何差异？ https://zhuanlan.zhihu.com/p/70071870

> Java语言使用@interface语法来定义注解（Annotation），它的格式如下：

https://www.liaoxuefeng.com/wiki/1252599548343744/1265102803921888
@Repository注解：用于标注数据访问组件，即DAO组件
@Service注解：用于标注业务层组件
@Controller注解：用于标注控制层组件（如struts中的action）
@Component注解：泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。

> HashMap? ConcurrentHashMap? 相信看完这篇没人能难住你！

- https://crossoverjie.top/2018/07/23/java-senior/ConcurrentHashMap/

#### Other

- [聊聊 Servlet、Struts1、Struts2以及SpringMvc中的线程安全](https://zhuanlan.zhihu.com/p/35728034)
- [Java进阶（一）Annotation（注解）](http://www.jasongj.com/2016/01/17/Java1_注解Annotation/)
- [SSM三大框架整合详细总结（Spring+SpringMVC+MyBatis）](https://cloud.tencent.com/developer/article/1041053?fromSource=waitui)