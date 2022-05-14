---
title: 122_java-important-features
date: 2022-05-14 19:27:23
categories: Java
tags:
  - Java
---

> Java应用中的几个重要特性：多态、泛型、反射、集合、正则、引用分类。

<!-- more -->

### 1.多态

多态就是同一个行为，使用不同的实例而发生不同的作用。在使用多态调用方法的时候，编译器检查父类中是否有该方法，如果有才能编译通过，例如：

```java
public class Animals{
    void voice(){动物叫}
}

class Cat extends Animals{
    void voice(){猫叫}
}

public static void testVoice(Animals a){
    a.voice();
}

public static void main(String[] args) {
    testVoice(new Cat())；

    Animals a = new Cat();
    a.voice();
}
```

猫继承自动物这个类，Animals a = new Cat()是向上转型（父类引用指向子类对象），实际的**运行时类型**还是Cat，也就是说a instanceof Cat 表达式为真，因此调用a的voice()方法是猫叫。结合C的指针和内存分析来理解多态。

### 2.泛型

1. 类型通配符

- <? extends T>表示该通配符所代表的类型是T类型的子类。
- <? super T>表示该通配符所代表的类型是T类型的父类

```java
public static <T extends Closable> void close(T... a){
    for(T temp:a){
        try{
            if(temp!=null){
                temp.close();
            }
        }catch(IOException e){
            e.printStackTrace();
        }
    }
}
```

1. 泛型不能用在静态属性上
2. 指定的类型不能为基本类型

### 3.反射

1. 获取目标类型的Class对象

```java
Class<?> a = Object.getClass();
Class<?> b = T.class;
Class<?> c = Class.forName(...);
```

1. 通过 Class 对象分别获取Constructor类对象、Method类对象 & Field 类对象
   - 不带 "Declared"的方法支持取出包括继承、公有（Public） & 不包括有（Private）的构造函数
   - 带 "Declared"的方法是支持取出包括公共（Public）、保护（Protected）、默认（包）访问和私有（Private）的构造方法，但不包括继承的构造函数

- Constructor

```java
//a.获取指定的构造函数（公共/继承）
Constructor<T> getConstructor(Class<?>... parameterTypes);
//b.获取所有的构造函数（公共/继承） 
Constructor<?>[] getConstructors(); 
//c.获取指定的构造函数（不包括继承）
Constructor<T> getDeclaredConstructor(Class<?>... parameterTypes);
//d.获取所有的构造函（不包括继承）
Constructor<?>[] getDeclaredConstructors(); 
```

- Field

```java
//a.获取指定的属性（公共/继承）
Field getField(String name);
//b.获取所有的属性（公共/继承）
Field[] getFields();
//c.获取指定的所有属性（不包括继承）
Field getDeclaredField(String name);
//d.获取所有的所有属性（不包括继承）
Field[] getDeclaredFields();
```

- Method

```java
//a.获取指定的方法（公共/继承）
Method getMethod(String name, Class<?>... parameterTypes);
//b.获取所有的方法（公共/继承）
Method[] getMethods();
//c.获取指定的方法 （不包括继承）
Method getDeclaredMethod(String name, Class<?>... parameterTypes);
//d.获取所有的方法（不包括继承）
Method[] getDeclaredMethods();
```

### 4. 集合

1. 迭代器遍历ArrayList

```java
Iterator<String> iterator = list.iterator();
while(ite.hasNext()){
    Log.d("TAG",ite.next());
}
```

1. 遍历Map

```java
//第一种：map.keySet()
for (String key : map.keySet()) {
    System.out.println("key= "+ key + " value= " + map.get(key));
}

//第二种：map.entrySet().iterator()
Iterator<Map.Entry<String, String>> iterator = map.entrySet().iterator();
while (it.hasNext()) {
    Map.Entry<String, String> entry = it.next();
    System.out.println("key= " + entry.getKey() + " value= " + entry.getValue());
}
      
//第三种：map.entrySet()
for (Map.Entry<String, String> entry : map.entrySet()){
    System.out.println("key= " + entry.getKey() + " value= " + entry.getValue());
}
    
//第四种：map.values()
for (String v : map.values()) {
    System.out.println("value= " + v);
}
```

1. 遍历 hashMap() 时 entrySet() 方法是将 key 和 value 全部取出来,所以性能开销是可以预计的, 而 keySet() 方法进行遍历的时候是根据取出的 key 值去查询对应的 value 值, 所以如果 key 值是比较简单的结构(如 1,2,3…)的话性能消耗上是比 entrySet() 方法低, 但随着 key 值得复杂度提高 entrySet() 的优势就会显露出来。
2. 在只遍历 key 的时候使用 keySet(), 在只遍历 value 的时候使用 values(), 在遍历 key-value 的时候使用 entrySet()。

### 5.正则

RegexBuddy

1. 转义字符

```
\n  \t  \\  \^  \$  \(  \)  \{  
\}  \?  \+  \*  \|  \[  \]
```

1. 标准字符集合（大写取反）

| \d       | 0~9的任意一个数字                                   |
| :------- | :-------------------------------------------------- |
| \w       | A~Z, a~z, 0~9, _中任意一个                          |
| \s       | 空格、制表符、换行符等空白符的任意一个              |
| .        | 匹配任意一个字符                                    |
| []       | 匹配方括号中任意一个字符                            |
| ^        | 方括号取反                                          |
| -        | 方括号中表示范围                                    |
| {}       | 花括号前正则表达式的重复次数，{m,n}至少m次，最多n次 |
| ?        | 花括号后加，非贪婪模式。非花括号后加，相当于{0,1}   |
| +        | 前面的正则表达式至少出现一次，相当于{1,}            |
| *        | 表达式不出现或出现多次，相当于{0,}                  |
| ^        | 与字符串开始的地方匹配                              |
| $        | 与字符串结束的地方匹配                              |
| \b       | 匹配一个字符边界                                    |
| \|       | 匹配左边或者右边                                    |
| (?=exp)  | 断言自身出现的位置的后面能匹配表达式exp             |
| (?<=exp) | 断言自身出现的位置的前面能匹配表达式exp             |
| (?!exp)  | 断言此位置的后面不能匹配表达式exp                   |
| (?<!exp) | 断言此位置的前面不能匹配表达式exp                   |

### 6.引用分类

1. 强引用:StrongReference:引用指向对象，gc运行时不回收
2. 软引用:SoftReference:gc运行时回收，（jvm内存不够）
3. 弱引用:WeakReference:gc运行时立即回收
4. 虚引用:PhantomReference:跟踪对象被回收的状态，必须与ReferenceQueue一起使用
