---
title: Java的反射机制
categories: Java
tags:
  - Java
  - Reflection
  - JVM
abbrlink: 5337b80a
date: 2022-05-18 19:40:14
---

> Reflection 是 Java 程序开发语言的特征之一，它允许运行中的 Java 程序对自身进行检查，或者说“自审”，并能直接操作程序的内部属性。Java 的这一能力在实际应用中也许用得不是很多，但是在其它的程序设计语言中根本就不存在这一特性。
>

[编辑](https://github.com/fangjian98/fangjian98.github.io/blob/hexo/source/_posts/127_java-reflection.md)

<!-- more -->

## Java的类加载
- 编译：java文件编译后生成class字节码文件
- 类加载机制：JVM把class文件加载到内存，并对数据进行校验、准备、解析、初始化，最终形成JVM可以直接使用的Java类型的过程。
![类加载机制](https://img-blog.csdnimg.cn/cc40b19fbce5410f877a062d3f225fca.png)
## Java的反射机制
Java反射机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意一个方法，这种动态获取、调用对象方法的功能称为Java语言的反射机制。

Java的反射就是利用上面第二步加载到JVM中的.class文件来进行操作的。.class文件中包含java类的所有信息，当你不知道某个类具体信息时，可以使用反射获取class，然后进行各种操作。要想解剖一个类,必须先要获取到该类的字节码文件对象。而解剖使用的就是Class类中的方法，所以先要获取到每一个字节码文件对应的Class类型的对象。

总体来说，反射就是把java类中的各种成分映射成一个个的Java对象，并且可以进行操作。例如一个类有成员变量、方法、构造方法、包等等信息，利用反射技术可以对一个类进行解剖，把个个组成部分映射成一个个对象。

>反射的必要性：
>1.反射机制是很多java框架的基石。
>2.有时候要适应某些需求，Java类里面不一定能直接调用另外的方法，这时候也可以通过反射机制来实现。
>
>反射的缺点：
>反射的代码比正常调用的代码更多，性能也慢，所以应避免使用反射。

## Java反射获取对象
>Class类：代表一个类
>Constructor类：代表类的构造方法
>Field类：代表类的成员变量（类的属性）
>Method类：代表类的方法
### 1.获取Class对象
```java
获取Class对象的三种方式
1.通过对象获取      对象名.getClass()
2.通过类名获取      类名.class 
3.通过全类名获取    Class.forName(全类名)   

三种方式常用第三种，第一种对象都有了还要反射干什么。第二种需要导入类的包，依赖太强，不导包就抛编译错误。一般都第三种，一个字符串可以传入也可写在配置文件中等多种方法。

//第三中方式获取Class对象
Class stuClass = Class.forName("com.example.Student");//注意此字符串必须是真实路径，就是带包名的类路径，包名.类名
System.out.println(stuClass.getName());
```
### 2.获取Constructor构造方法对象
```java
通过Class对象可以获取某个类中的：构造方法、成员变量、成员方法；并访问成员；

1.获取构造方法：
1).批量的方法：
public Constructor[] getConstructors()：所有"公有的"构造方法
public Constructor[] getDeclaredConstructors()：获取所有的构造方法(包括私有、受保护、默认、公有)
     
2).获取单个的方法，并调用：
public Constructor getConstructor(Class... parameterTypes):获取单个的"公有的"构造方法：
public Constructor getDeclaredConstructor(Class... parameterTypes):获取"某个构造方法"可以是私有的，或受保护、默认、公有；

调用构造方法：
Constructor-->newInstance(Object... initargs)

2.newInstance是 Constructor类的方法（管理构造函数的类）
api的解释为：newInstance(Object... initargs)
使用此 Constructor 对象表示的构造方法来创建该构造方法的声明类的新实例，并用指定的初始化参数初始化该实例。
它的返回值是T类型，所以newInstance是创建了一个构造方法的声明类的新实例对象。并为之调用

3.Constructor con = clazz.getConstructor(null);
1)因为是无参的构造方法所以类型是一个null,不写也可以：这里需要的是一个参数的类型，切记是类型
2)返回的是描述这个无参构造函数的类对象。
    
//1.加载Class对象
Class clazz = Class.forName("com.example.Student");
Constructor  con = clazz.getDeclaredConstructor(char.class);
System.out.println(con);
//调用构造方法
con.setAccessible(true);//暴力访问(忽略掉访问修饰符)
Object obj = con.newInstance('男');
System.out.println("obj = " + obj);
//Student stu = (Student)obj;
```
### 3.获取Field成员变量对象    
```java
获取成员变量并调用：
1.批量的
Field[] getFields():获取所有的"公有字段"
Field[] getDeclaredFields():获取所有字段，包括：私有、受保护、默认、公有；
2.获取单个的：
public Field getField(String fieldName):获取某个"公有的"字段；
public Field getDeclaredField(String fieldName):获取某个字段(可以是私有的)

设置字段的值：
Field --> public void set(Object obj,Object value):
第一个参数：要传入设置的对象，第二个参数：要传入实参
参数说明：
1.obj:要设置的字段所在的对象；
2.value:要为字段设置的值；
    
//1.获取Class对象
Class stuClass = Class.forName("com.example.Student");
Field f = stuClass.getDeclaredField("name");
//获取一个对象
Object obj = stuClass.getConstructor().newInstance();//产生Student对象--》Student stu = new Student();
f.setAccessible(true);//暴力反射，解除私有限定
//为字段设置值
f.set(obj, "刘德华");//为Student对象中的name属性赋值--》stu.name = "刘德华"
//验证
Student stu = (Student)obj;
System.out.println("验证姓名：" + stu.name);
```
### 4.获取Method成员方法对象  
```java
获取成员方法并调用：
1.批量的：
public Method[] getMethods():获取所有"公有方法"；（包含了父类的方法也包含Object类）
public Method[] getDeclaredMethods():获取所有的成员方法，包括私有的(不包括继承的)
2.获取单个的：
public Method getMethod(String name,Class<?>... parameterTypes):
参数：
name : 方法名；
Class ... : 形参的Class类型对象
public Method getDeclaredMethod(String name,Class<?>... parameterTypes)

调用方法：
Method --> public Object invoke(Object obj,Object... args):
参数说明：
obj : 要调用方法的对象；
args:调用方式时所传递的实参；
    
//1.获取Class对象
Class stuClass = Class.forName("com.example.Student");
Method m = stuClass.getMethod("show1", String.class);
System.out.println(m);
//m.setAccessible(true);//解除私有限定
//实例化一个Student对象
Object obj = stuClass.getConstructor().newInstance();
Object result = m.invoke(obj, "刘德华");
System.out.println("返回值：" + result);
```

> [1] https://www.cnblogs.com/tech-bird/p/3525336.html
