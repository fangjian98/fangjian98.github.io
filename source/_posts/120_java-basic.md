---
title: Java技能树-Java概述
categories: Java
tags:
  - Java
  - JDK
  - Maven
abbrlink: 761b2c7d
date: 2022-05-14 18:07:16
---

> Java概述：Java程序的Hello World、JDK安装和环境配置、Java的编译和运行、JVM虚拟机、Maven管理工具

<!-- more -->

## 编辑Java源代码

```
public class HelloWord{
    //java程序的入口方法，程序将从这里开始执行
    public static void main (String[] args){
        //向控制台打印一条语句
        System.out.println("Hello World!");
    }
}
```

## 编译Java程序

```
javac HelloWorld.java
```

## Java的运行机制

> 🍎Java程序运行时,必须经过编译和运行两个步骤。
> 🍊 首先将后缀名为.java的源文件进行编译,最终生成后缀名为.class的字节码文件。然后Java虚拟机将字节码文件进行解释执行,并将结果显示出来
> 🍉Java程序的运行过程详细解释
> 🍋1、编写一个HelloWorld.java文件
> 🍋2、使用javac HelloWorld.java 命令开启Java编译器并进行编译。编译结束后,会自动生成一个HelloWorld.class的字节码文件
> 🍋3、使用java HelloWorld 命令启动Java虚拟机运行程序,Java虚拟机首先将编译好的字节码文件加载到内存,**这个过程被称为类加载**,它是由类加载器完成的,然后虚拟机针对加载到内存中的Java类进行解释执行,便可看到运行结果

以下关于Java的运行机制中描述正确的是：

1. ClassLoader 是 JVM 实现的一部分
2. Java 编译器会将程序编译为 Java 虚拟机可以执行的字节码
3. Java 虚拟机（Java Virutal Machine）简称 JVM ，用于执行 Java 字节码
4. Java 运行时环境（Java Runtime Evironment）简称 JRE ，用于运行 Java 程序，包含 JVM
5. Java 开发工具包（Java Development Kit）用于开发Java程序，包含JRE和 Java 编译工具等

> Java语言具有"一次编写,到处运行(Write one , run anywhere)"的特点,有效地解释了程序设计语言在不同操作系统编译时产生不同机器代码的问题,大大降低了程序开发和维护的成本。需要注意的是,Java程序通过Java虚拟机可以达到跨平台特性,但Java虚拟机并不是跨平台的,也就是说,不同操作系统上的Java虚拟机是不同的,即Windows平台上的Java虚拟机不能使用在Linux平台上。

## Java程序的环境配置

安装完JDK(Java Development Kit，Java开发套件)之后，可以在安装目录下找到两个子目录(bin目录和lib目录)。bin目录中包含着Java编译器等可执行文件。

如果要运行执行java命令，必须得执行java命令对应的可执行文件的路径，通常有两种方式：

- 在%JAVA_HOME%目录下执行。
- 执行命令的时候，指明路径%JAVA_HOME%/bin/java

但是，这样不是特别方便，这就是为什么配置环境变量。

JAVA_HOME环境变量

```
C:\Program Files\Java\jdk1.8.0_51\
```

通常将下面的内容加到PATH环境变量的最左侧：

```
%JAVA_HOME%/bin/;%JAVA_HOME%/jre/bin
```

和PATH变量不同，CLASSPATH环境变量的作用是指定Java类所在的目录(或许它的意思就是`PATH of Class`)。

Java中通常将环境变量CLASSPATH配置为`.;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\dt.jar`。其中为何包含`.`，

dt.jar：运行环境类库，主要是Swing包，这一点通过用压缩软件打开dt.jar也可以看到。如果在开发时候没有用到Swing包，那么可以不用将dt.jar添加到CLASSPATH变量中。

tools.jar：工具类库，它跟我们程序中用到的基础类库没有关系。我们注意到在Path中变量值bin目录下的各个exe工具的大小都很小，一般都在27KB左右，这是因为它们实际上仅仅相当于是一层代码的包装，这些工具的实现所要用到的类库都在tools.jar中，用压缩软件打开tools.jar,你会发现有很多文件是和bin目录下的exe工具相对性的

```
c:\test>type HelloWorld.java   #查看文本文件的内容
public class HelloWorld{
        public static void main(String[] args) {
                // TODO Auto-generated method stub
                System.out.println("Hello World!!");
        }
}
c:\test>javac HelloWorld.java   #因为配置了PATH环境变量，在任意目录下都可执行javac

c:\test>dir   #查看编译生成的class文件
2016/03/28  22:13               427 HelloWorld.class
2016/03/28  22:08               152 HelloWorld.java
c:\test>java HelloWorld   #运行HelloWorld(注意，不能加.class后缀)
错误: 找不到或无法加载主类 HelloWorld
```

## Maven基础

Maven的作用

maven本质上是一个项目管理工具，是将项目开发和管理过程抽象成一个项目对象模型（POM:project object model）

maven可以为我们进行项目构建(提供标准化，跨平台的zi’dong话项目构建方式)，依赖管理(方便快捷的管理项目的依赖资源jar包，避免资源及版本的冲突)，同意开发结构：提供标准统一的项目结构。

Maven的安装：maven属于是绿色软件，解压即安装

https://maven.apache.org/download.cgi

Maven文件结构：

- bin:maven的核心运行文件
- boot：mavem的类加载器
- conf：maven的核心配置
- lib：maven的依赖jar包

Maven环境变量配置

- 依赖于java，需要配置JAVA_HOME
- 设置Maven自身的MAVEN_HOME
- 运行cmd输入mvn检测是否安装成功

Maven的基础概念

**仓库**：用于存储各种资源，包含各种jar包

![img](https://img-blog.csdnimg.cn/c67076183eeb4a2394e5ee869ffecc44.png)

仓库分类：

- 本地仓库：自己电脑上存储资源的仓库，连接远程仓库获取资源
- 远程仓库：非自己电脑上的仓库，为本地仓库提供资源
- - 中央仓库：Maven团队维护，存储所有资源的仓库
  - 私服：部门/公司范围内存储的仓库，从中央仓库获取资源
- 私服的作用：
- - 保存具有版权的资源，包含自主研发或购买的jar(中央仓库的的jar包都是开源的，不能存储具有版权的资源)
  - 一定范围内共享资源，仅对内部开放，不对外共享。

#### 坐标

坐标是用来在仓库中资源的位置的。

https://repo1.maven.org/maven2/该链接中是maven中央仓库资源。

maven坐标的组成：

- groupId:定义当前Maven项目隶属于组织的名称（通常是域名反写）
- artifactld:定义当前Maven项目的名称（通常是模块名称，例如：CRM,SMS）
- version:定义当前项目的版本号
- packaging:定义当前项目的打包方式

#### 本地仓库配置

1. 进入Maven的conf文件夹中的setting文件

   - 默认的仓库配置

     ```Maven
     ${user.home}/.m2/repository
     ```

   - 自定义自己的仓库位置

     ```Maven
     <settings>
     <localRepository>D:\maven\repository</localRepository>
     </settings>
     ```

   - 中央仓库的配置位置

     在lib文件中随便找一个jar包用winrar打开，然后返回上一级目录搜索pom*.*,找到pom-4.0.0.xml文件，定位到。将文件拖出后打开。

   ![[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-3LTSJRym-1638532754173)(D:\Document\note\框架\maven\远程仓库.png)]](https://img-blog.csdnimg.cn/9f4df60aad1443bca569a9a81a7a0763.png)

   - 远程镜像仓库的配置（当需要访问中央仓库的时候，就会去访问镜像仓库。ps:中央仓库在国外，访问速度慢）

     ```Maven
     <!-- 配置具体仓库的下载镜像 -->
     <mirror>
         <!-- 此镜像的唯一标识符，用来区分不同的mirror元素 -->
         <id>ali-maven</id>
         <!-- 对哪种仓库进行镜像，简单说就是代替哪个仓库 -->
         <mirrorOf>central</mirrorOf>
         <!-- 镜像的名称 -->
         <name>aliyun maven</name>
         <!-- 镜像的URL -->
         <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
     </mirror>
     ```

#### Maven项目构建命令

后面的命令在执行的时候都会执行前面的命令，如：在执行install的时候前面的生命周期都会执行。

- mvn -v 查看版本

- mvn compile 编译(在src同级目录下生成一个target文件)
- mvn clean 清理(删除target文件)
- mvn test 测试(会在编译同时将test的部分也编译，并执行test内测试方法的内容，在surefile-reports中生成报告内容)
- mvn package 打包(target文件中生成一个jar包)
- mvn install 安装到自己本地仓库
- mvn archetype: generate生成maven项目

#### idea使用maven命令

 在idea的右边有一个maven选项，打开后点击声明周期可以运行maven的命令（与命令效果相同）

也可以点击上方的锤子选择Maven，添加命令在执行达到一样的效果（**优点**：可以使用debug模式运行）

#### 依赖配置

```java
<dependencies>
    //单个依赖
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.11</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```

#### 排除依赖

```
//排除包含
    <exclusions>
    //具体排除的依赖
        <exclusion>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
        </exclusion>
    </exclusions>
```

#### 依赖的范围

- 依赖的jar默认可以在任何地方使用，可以通过scope标签设定其作用的范围
- 作用范围
- - 主程序范围内有效(main文件范围内)
  - 测试程序范围内有效(test文件范围内)
  - 是否参与打包(package指令范围内)

| scope          | 主代码 | 测试代码 | 打包 | 范例        |
| :------------- | :----- | :------- | :--- | :---------- |
| compolie(默认) | Y      | Y        | Y    | log4j       |
| test           |        | Y        |      | junit       |
| provided       | Y      | Y        |      | servlet-api |
| runtime        |        |          | Y    | jdbc        |

### 项目的构建生命周期

 Maven对项目构建生命周期分为三个阶段,不同阶段有不同的过程事件

- clean:清理工作
- - pre-clean :执行一些需要在clean之前完成的工作
  - clean:移除上一次构建生成的文件
  - post-clean:执行一些在clean之后立即完成的工作
- defult:核心工作，例如编译，测试，打包，部署等

![img](https://img-blog.csdnimg.cn/cc6ab85acf374e68a5cd5f1fda5348d6.png)

- site:产生报告，发布站点
- - pre-site:执行一些在生成站点文件前要完成的工作
  - site:生成项目的站点文件
  - post-site:执行一些需要在生成站点文件后完成的工作，为部署做准备
  - site-deploy:将生成的站点文档部署到特定的服务器上

#### 插件

- 插件与生命周期内的阶段绑定，在执行到对应生命周期时执行对应插件功能
- 默认Maven的各个生命周期上绑定有预定的预设功能
- 通过插件可以自定义其他功能

```java
<!--具体插件：对test区域源代码的打jar-->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <version>3.2.0</version>
    <!--插件的行为-->
    <executions>
        <!--具体行为-->
        <execution>
            <goals>
                <!--目标：执行的结果，这里时打jar包，并未所有的插件都有-->
                <goal>jar</goal>
     			 <!--可以打多个jar包-->
    			<goal>test-jar</goal>
            </goals>
            <!--在哪个阶段执行-->
            <phase>generate-test-sources</phase>
        </execution>
    </executions>
</plugin>
```

