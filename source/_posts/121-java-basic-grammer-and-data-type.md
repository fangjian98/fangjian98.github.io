---
title: Java技能树-基本语法和变量及常量
categories: Java
tags:
  - Java
  - Variable
  - Annotation
abbrlink: d37d704e
date: 2022-05-14 18:12:32
---

> 基本语法和变量及常量：Java的语法格式、注释、关键字、数据类型、常量和变量的声明及其作用域。

<!-- more -->

##  Java的基本语法

###  Java的基本语法格式

每一种编程语言都有一套自己的语法规范,Java 语言也不例外,同样需要遵从一定的语法规范,如代码的书写、标识符的定义、关键字的应用等。因此要学好 Java 语言,首先需要熟悉它的基本语法。本节将针对 Java 的基本语法进行详细讲解。

Java 的基本语法格式

编写 Java 程序代码必须先声明一个类然后在类中编写实现需求的业务代码。类需变使用 class 关键字定鸟,在 class 前面可以有一些修饰符,其语法格式如下:

```java
[修饰符] class 类名 {
    程序代码
}
```

在编写 Java 程序代码时,需要特别注意几个关键点,具体如下。

(1) Java 中的程序可分为结构定义语句和功能执行语句。其中,结构定义语句用于声明一个类或方法,功能执行语句用于实现具体的功能。每条功能执行语句的结尾都必须用

英文分号(;)结束。如下面的语句:

```java
System.out.println("这是第一个Java程序");
```

值得注意的是,在程序中不要将英文的分号(;)误写成中文的分号(;)。如果写成中文的分号,编译器会报告“Invalid Character(无效字符)”错误信息。

(2) Java 语言是严格区分大小写的。例如,在程序中定义一个 computer 的同时,还有以定义一个 Computer,computer 和 Computer 是两个完全不同的符号,在使用时务必注意

(3)在编写 Java 代码时,为了便于阅读,通常会使用一种良好的格式进行排版,但这并不是必需的,也可以在两个单词或符号之间任意地换行,例如下面这段代码的编排方式也是可以的。

虽然 Javn 没有严格要求用什么样的格式来编排程序代码,但是,出于程序可读性和美观性的考虑,应该让自己编写的程序代码整齐美观、层次清晰,通常会使用下面这种形式:

```java
public class HelloWorld {

   public static void main (string[] args){

       System.out.println("这是第一个 Java 程序!");
   }
}
```

(4)Java 程序中一个连续的字符串不能分开在两行中书写,例如,下面这条语句在编译时将会出错：

```java
System.out.println("这是第一个
                    Java 程序！");
```

如果为了便于阅读,想将一个太长的字符串分开在两行中书写,可以先将这个字符串分成两个字符串,然后用加号(十)将这两个字符串连起来,在加号(十)处断行,上面的语句可以修改成如下形式：

```java
System.out,println("这是第一个"+"Java 程序!");
```

小提示：Java 代码基本格式中涉及的类、修饰符、编译器等专业性的词汇,读者可以先不必深究其具体含义,在本节只需要重点掌握 Java 代码的基本格式即可，在后续学习 Java 的过程中,会对这些专业词汇进行详细讲解。

###  Java中的注释

Java中的注释

在编写程序时,为了使代码易于阅读,通常会在实现功能的同时为代码添加一些注释。注释是对程序的某个功能或者某行代码的解释说明,它能够让开发者在后期阅读和使用代码时能更容易理解代码的作用。

注释只在Java 源文件中有效,在编译程序时编译器会忽略这些注释信息,不会将其编译到 class 字节码文件中。

Java 中的注释有三种类型,具体如下。

1.单行注释

单行注释通常用于对程序中的某一行代码进行注释，用符号”//“表示，"//"后面为注释说明的内容，具体示例如下：

```java
int c=10;   //定义一个整型变量c
```

2.多行注释

多行注释顾名思义就是可以同时注释多行内容，它以符号”/*“开头，并以符号”*/“结尾，具体示例如下：

```java
/*定义一个整型变量x
将5赋值给变量x*/
int x;
x=5;
```

3.文档注释

文档注释通常是对程序中某个类或类中的方法进行的系统性的解释说明,开发人员可以使用 JDK 提供的 javadoc 工具将文档注释提取出来生成一份 API 帮助文档。文档注释以符号“/**”开头,并以符号“*/”结尾,具体示例如下:

```java
/**
*Title:HelloNorid类

*@author srx

*@version 1.0

*/

public class Helloworld {

/**
*这是一个 main ()方法人口

* @param args 参数名

*/

    public static void main(String[] args){

        System.out .printitln("这是第一个 Java程序!");

    }

}
```

留心：

在java中，有的注释可以嵌套使用，有的则不可以，下面列举两种具体的情况。

（1）多行注释"/*....*/"中可以嵌套使用单行注释"//"，具体示例如下：

```java
/*int c=10;    //定义一个整型的c

  int x=5;*/
```

(2)多行注释"/*.....*/"中不能嵌套多行注释"/*...*/",具体示例如下：

```java
/*
  
    /*int c=10;*/

*/
```

4.如果编写java源代码的过程中添加了文档注释吗，然后通过JDK提供的javac工具可以直接将源代码里的文档注释提取程一份系统的API文档。

javadoc 工具软件识别以下标签：

| **标签**      | **描述**                                               | **示例**                                                     |
| :------------ | :----------------------------------------------------- | :----------------------------------------------------------- |
| @author       | 标识一个类的作者                                       | @author description                                          |
| @deprecated   | 指名一个过期的类或成员                                 | @deprecated description                                      |
| {@docRoot}    | 指明当前文档根目录的路径                               | Directory Path                                               |
| @exception    | 标志一个类抛出的异常                                   | @exception exception-name explanation                        |
| {@inheritDoc} | 从直接父类继承的注释                                   | Inherits a comment from the immediate surperclass.           |
| {@link}       | 插入一个到另一个主题的链接                             | {@link name text}                                            |
| {@linkplain}  | 插入一个到另一个主题的链接，但是该链接显示纯文本字体   | Inserts an in-line link to another topic.                    |
| @param        | 说明一个方法的参数                                     | @param parameter-name explanation                            |
| @return       | 说明返回值类型                                         | @return explanation                                          |
| @see          | 指定一个到另一个主题的链接                             | @see anchor                                                  |
| @serial       | 说明一个序列化属性                                     | @serial description                                          |
| @serialData   | 说明通过writeObject( ) 和 writeExternal( )方法写的数据 | @serialData description                                      |
| @serialField  | 说明一个ObjectStreamField组件                          | @serialField name type description                           |
| @since        | 标记当引入一个特定的变化时                             | @since release                                               |
| @throws       | 和 @exception标签一样.                                 | The @throws tag has the same meaning as the @exception tag.  |
| {@value}      | 显示常量的值，该常量必须是static属性。                 | Displays the value of a constant, which must be a static field. |
| @version      | 指定类的版本                                           | @version info                                                |

javadoc 输出什么?

javadoc 工具将你 Java 程序的源代码作为输入，输出一些包含你程序注释的HTML文件。

每一个类的信息将在独自的HTML文件里。javadoc 也可以输出继承的树形结构和索引。

由于 javadoc 的实现不同，工作也可能不同，你需要检查你的 Java 开发系统的版本等细节，选择合适的 Javadoc 版本。


###  java中的关键字

2.1.3 Java 中的关键字

关键字(keyword)是编程语言里事先定义好并赋予了特殊含义的单词,也称作保留字。和其他语言一样,Java 中保留了许多关键字.例如 class.public等。JDK 8 中有 50 个关键字,这些关键字都是小写的，具体如表：

| abstract   | assert       | boolean   | break      | byte   |
| ---------- | ------------ | --------- | ---------- | ------ |
| case       | catch        | char      | class      | const  |
| continue   | default      | do        | double     | else   |
| enum       | extends      | final     | finally    | float  |
| for        | goto         | if        | implements | import |
| instanceof | int          | interface | long       | native |
| new        | package      | private   | protected  | public |
| return     | strictfp     | short     | static     | super  |
| switch     | synchronized | this      | throw      | throws |
| transient  | try          | void      | volatile   | while  |

上面列举的关键字中.每个关键字都有特殊的作用,例如 package美键字用于包的声明，import 关键字用于引人包，class 关键字用于类的声明。

### 关键字总结

#### 1.abstract

- 修饰类：

abstract修饰类，这个类就是抽象类，抽象类中可以有非抽象变量和成员变量，也可以有普通方法、构造方法。但是不能实例化，只能被子类继承。
如果子类不是抽象类，则必须重写父类的抽象方法。

```java
public abstract class AbstractList<E> extends AbstractCollection<E> implements List<E> {
    ...
}
```

- 修饰方法:

abstract修饰方法，这个方法就是抽象方法。抽象方法必须存在于抽象类中。抽象方法不能有具体实现。

```java
abstract public E get(int index);
```

#### 2.assert

assert表示“断言”，有两种使用方法：

```java
assert 表达式;
```

若表达式为真，程序继续执行；若表达式为假，则抛出一个AssertionError异常。

```java
assert 表达式:错误信息;
```

与第一种方法相同，只是异常中带有错误信息。
使用assert时不能在表达式中完成任何程序实际所需的行为（只能做判断）。因为正常发布的代码都是断言无效的，即正常发布的代码中断言语句都不不执行的。

#### 3.boolean

boolean是Java的基本类型之一（默认值false）。只有两个值：true和false。区别C的判断句，Java不能直接使用1和0来表示真假，且boolean类型也不能强转到其他基本类型。

```java
boolean a = true;
boolean b = false;
```

#### 4.break

1. break在switch中用于跳出switch块，停止switch向下穿透的现象。

```java
case value:expression;
    break;
```

1. break在循环中用于跳出循环。

```java
while(...){
    ...
    break;
}
```

1. break也可以在后面接标签，用来跳出一些嵌套比较复杂的循环中。

```java
flag:
for(...){
    for(...){
        break flag;
    }
}
```

#### 5.byte

byte是Java的基本类型之一（默认值0）。表示8位有符号整数。

范围：-128~127

```java
byte a = 100;
```

#### 6.case

case用于switch中，用于判断和执行语句。用法：

```java
case 变量值:语句;
```

若变量值和switch(变量值)
中的变量值相等，就执行后面的语句。执行完后继续执行下一个case语句。

#### 7.catch

catch用于捕获异常。
用法：

```java
catch(异常类型 异常){...}
```

在try/catch语句块中，catch捕获发生的异常，并应对错误做一些处理。
当catch捕获到异常后，try中执行的语句终止，并跳到catch后的语句中。

#### 8.char

char是Java的基本类型之一（默认值\u000）。表示16位、在Unicode编码表中的字符。使用单引号来表示字符常量，例如’A’。

范围：0-65535

```java
char a = 'A';
```

#### 9.class

class表示类。用于声明一个类。

```java
[访问控制] (abstract) class 类名 (implements){...}
```

#### 10.const

const是Java的一个保留关键字，没有实际意义，但是不能用于做变量名（因为被保留作为关键字了）。在C语言中表示常量，类似Java的final。

#### 11.continue

1. continue用于在循环中跳过本次循环。

```java
while(...){
    ...
    continue;
}
```

1. continue也可以在后面接标签，在一些嵌套比较复杂的循环中跳过一次循环。

```java
flag:
for(...){
    for(...){
        continue flag;
    }
}
```

#### 12.default

default关键字：

1. 用于switch做默认分支：

```java
default:语句；
```

1. 用于接口,让接口实现具体的方法：

```java
public interface a{
    default void b(){
        具体方法;
    }
}
```

default用于接口时，必须要有具体实现。
(API>=24)

#### 13. do

do用于和while组成循环，do/while循环不同于while循环，属于先执行循环体再判断。

```java
do{
	循环体;
}while(...)
```

#### 14.double

double是Java的基本类型之一（默认值0.0d），表示双精度、64位的浮点数。

```java
double a = 0.1d;
```

#### 15.else

else用于分支结构中的判断。例如：

```java
if(判断1){
    语句1;
}else if(判断2){
    语句2;
}else{
    语句3;
}
```

#### 16.enum

enum表示枚举，用于限制变量值的类型，例如：

```java
public enum Alpha (implements 接口){
    (public static final)a,b,c,d
}
```

规定Color的实例只能为a,b,c,d其中之一。

**枚举类中可以有成员变量和方法。**

#### 17.extends

extends表示继承。例如：

```java
class 子类 extends父类{}
```

Java中的继承是单继承，即子类只能有一个直接父类。
除了private，子类可以访问父类的方法和成员变量。

#### 18.final

1. 修饰变量：
   将变量变为常量，在初始化变量后不能再改变值。
2. 修饰方法：
   被final修饰的方法不能被子类重写。
3. 修饰类：
   被final修饰的类不能被继承。

#### 19.finally

finally在try/catch语句块中处理一些后续的工作。例如关闭网络连接和输入输出流等。

- 如果在try/catch中使用return，则finally会撤销这个return，无论如何都会执行finally中的语句。

#### 20.float

float是Java的基本类型之一（默认值0.0f）。表示单精度、32位的浮点数。

```java
float a = 0.1f;
```

#### 21.for

for用于循环:

```java
for(初始化循环变量; 判断执行条件;更新循环变量){
    语句
}
for(变量:数组){
    语句
}
```

#### 22.goto

Java中的保留关键字，没有实际意义，但是不能用做变量名。在C中表示无条件跳转语句。

#### 23.if

if用于分支结构中的判断。常与else和else if使用。

```java
if(表达式){语句}
```

若表达式为真，则执行后面的语句。

#### 24.implements

implements用于接入接口。接上接口的类必须实现接口的抽象方法（可以不实现默认方法和静态方法）。

```java
class A implements B{
    @Override
    do(){
        ...
    }
}
```

#### 25.import

用于导入包。

```java
import android.content.Intent;
```

#### 26.instanceof

instanceof用于判断类与对象的关系。例如：

```java
a instanceof b
```

若a是b的一个实例(或子类对象)，则整个表达式的结果是true，否则结果为false。

#### 27.int

int是Java的基本类型之一（默认值为0）。表示32位、有符号的整数。

范围：[-231,231-1)

```java
int a = 1;
```

#### 28.interface

interface用于声明一个接口，例如：

```java
public interface A{
    void b();
}
```

声明a为一个接口，若接上该接口，则必须实现其中的抽象方法b。
接口中的成员变量是static、final、public的。接口中的方法为静态方法或默认方法和静态方法(API>=24)。

#### 29.long

long是Java的基本类型之一（默认值为0L），表示64位、有符号的整数。

范围：[-263,263)

```java
long a = 3216846849646L;
```

#### 30.native

native可以让Java运行非Java实现的方法。例如c语言，要编译后用javah产生一个.h文件。导入该.h文件并且实现native方法，编译成动态链接库文件。在Java加载动态链接库文件，这个native方法就可以在Java中使用了。

```java
public native void aVoid();
```

#### 31.new

new用于生成类的实例。

```java
Object a = new Object()；
```

#### 32.package

package用于规定当前文件的包。

```java
package com.example.zhangyijun.testdefactivity;
```

#### 33.private

访问控制的一种。
私有的方法和变量只能在本类中访问。类和接口不能为私有。

```java
private int a = 1;
private void b(){
    ...
}
```

#### 34.protected

访问控制的一种。
受保护的方法和变量只能给子类和基类访问。

```java
protected int a = 1;
protected void b(){
    ...
}
```

#### 35.public

访问控制的一种。
公有的方法、类、变量、接口能够被任何其他类访问。

#### 36.return

方法中返回数据，并结束方法。

#### 37.strictfp

使用strictfp关键字来声明一个类、接口或者方法时，那么该类、接口或者方法会遵循IEEE-754标准来执行，提高浮点运算的精度，并且减少不同硬件平台之间由于浮点运算带来的差异。

```java
public strictfp double aDouble(){
    return 0d;
}
```

#### 38.short

short是Java的基本类型之一（默认值0）,表示16位、有符号的整数。

范围：[-215,215)

```java
short a = 0;
```

#### 39.static

static修饰的语句块存放在堆的方法区中。

1. 静态变量：依附在类中的变量，可以被类的所有的实例共用。

```java
static int a = 0;
```

1. 静态方法：依附在类中的方法。静态方法只能访问类中的静态变量和静态方法。

```java
publlic static void b(){
    ...
}
```

1. 静态块：在类加载的时候执行块中的语句，块中不能访问非静态变量。

```java
static{
    ...
}
```

1. 静态内部类：用static修饰内部类。

#### 40.super

super即超类

1. 引用父类的的成员：

```java
super.xxx
```

1. 变量或方法重名时用super调用父类的成员或方法。
2. 调用父类的构造方法:

```java
super(xxx);
```

#### 41.switch

switch用于分支结构，判断某个变量与一系列值是否相等。switch 语句中的变量类型可以是： byte、short、int 、char、String、enum。

```java
switch(变量){
	case value1:语句1;
		break;
	case value2:语句2;
		break;
	...
	default:语句;
}
```

1. 若变量和case后的值相等则执行语句。
2. 当语句执行到break时跳到switch块后，如果没有break会产生穿透现象。
3. default分支必须为最后一个分支，在没有值和case变量相等时执行该语句。

#### 42.synchronized

synchronized关键字用于保证线程安全。由这个关键字修饰的方法或者代码块保证了同一时刻只有一个线程执行该代码。

```java
synchronized(obj){...}
```

当一个线程访问同步代码块时，检查obj是否有锁，如果有就挂起。如果没有就获得这个obj的锁，也就是把其他线程锁在了外面。当代码执行完毕时释放该锁，其他线程获得锁继续执行代码。

#### 43.this

1. 指向当前对象：[this.xxx](http://this.xxx/)
2. 形参和成员名字重名时时用this区分。
3. 引用构造函数。

#### 44.throw

用于抛出一个异常。

```java
throw (Exception);
```

#### 45.throws

在方法中将发生的异常抛出。

```java
[控制访问](返回类型)(方法名)([参数列表])[throws(异常类)]{...}
```

#### 46.transient

类接上序列化接口后，可以通过transient关键字将某些变量变得无法序列化。

```java
transient int a = 1;
```

#### 47.try

在try/catch中，将可能出现异常的语句放在try{}块中，出现异常之后代码将会终止并跳到catch中继续执行。

```java
try{
    ...
}catch(Exception e){
    ...
}finally{
    ...
}
```

#### 48.void

修饰方法，表示方法没有返回值。

#### 49.volatile

volatile关键字修饰的变量在多线程中保持同步。相比synchronized效率要高，不会阻塞线程。但只能保证数据的可见性，不能保证数据的原子性。例如在处理i++的时候另外一个线程修改i的值，那么i的值将会发生错误，这是原子性导致的。

```java
volatile int a;
```

#### 50.while

while用于两种循环结构：

```java
while(判读语句){
    循环体...
}

do{
	循环体...
}while(判读语句)
```

###  java中的标识符

在编程过程中，经常需要在程序中定义一些符号来标记一些名称，如包名、类名、方法名、参数名、变量名等，这些符号被称为标识符。标识符可以由任意顺序的大小写字母、数字、下画线(_)和美元符号($ )组成，但标识符不能以数字开头，也不能是Java 中的关键字。

下面的这些标识符都是合法的：

```java
username

username123

user_name

_username

$username
```

下面的这些标识符是不合法的：

```java
123username       //不能以数字开头

class             //不能是关键字

Hello World       //不能包含空格特殊字符
```

在Java程序中,定义的标识符必须严格遵守上面列出的规范,否则程序在编译时会报错。

为了增强代码的可读性和美观性。除了要求初学者要严格按照上面列出的规范来定义标识符外,还建议初学者在定义标识符时要遵循以下几点规范。

1.包名所有字母一律小写,例如 com.itheima. example01。

2.类名和接口名每个单词的首字母都要大写,例如 ArrayList、Iterator。

3.常量名所有字母都大写,单词之间用下画线连接,例如 DAY_OF_MONTH。

4.变量名和方法名的第一个单词首字母小写,从第二个单词开始每个单词首字母大写,例如 lineNumber、getLineNumber。

5.在程序中,应该尽量使用有意义的英文单词来定义标识符,使得程序便于阅读,例如,使用 userName 表示用户名.password 表示密码。



## Java中的变量和常量

### 常量定义

在Java语言中，主要是利用final关键字（在Java类中灵活使用Static关键字）来定义常量。

一是常量在定义的时候，就需要对常量进行初始化。

二是final关键字使用的范围。这个final关键字不仅可以用来修饰基本数据类型的常量，还可以用来修饰对象的引用或者方法。

三是需要注意常量的命名规则。如在给常量取名的时候，一般都用大写字符。在Java语言中，大小写字符是敏感的。之所以采用大写字符，主要是跟变量进行区分。虽然说给常量取名时采用小写字符，也不会有语法上的错误。但是，为了在编写代码时能够一目了然的判断变量与常量，最好还是能够将常量设置为大写字符。另外，在常量中，往往通过下划线来分隔不同的字符。而不想对象名或者类名那样，通过首字符大写的方式来进行分隔。

> 当利用static这个关键字来修饰一个变量的时候，在创建对象之前就会为这个变量在内存中创建一个存储空间。以后创建对对象如果需要用到这个静态变量，那么就会共享这一个变量的存储空间。也就是说，在创建对象的时候，如果用到这个变量，那么系统不会为其再分配一个存储空间，而只是将这个内存存储空间的地址赋值给他。如此做的好处就是可以让多个对象采用相同的初始变量。当需要改变多个对象中变量值的时候，只需要改变一次即可。

常量：在程序运行期间，固定不变的量。

常量的分类：
1.字符串常量：凡是用双引号引起来的部分，叫做字符串常量。例如：“abc”、“Hello”、“123”。
2.整数常量：直接写上数字，没有小数点。例如：100，200,0，-250。
3.浮点数常量：直接写上的数字，有小数点。例如：2.5、-3.14、0.0。
4.字符常量：凡是用单引号引起来的单个字符，就是字符常量。例如：‘A’、‘b’、‘9’、‘中’。
5.布尔常量：只有两种取值。true、false。
6.空常量：null。代表没有任何数据。

注意：
1.两个单引号中间必须有且仅有一个字符，没有不行。
2.两个单引号中间必须有且仅有一个字符，有两个不行。
3.空常量不能直接用来打印输出。

### 变量的数据类型

Java数据类型图：

![这里写图片描述](https://img-blog.csdn.net/20160826103646745)

#### 1.基本数据类型

　　基本数据类型，也称内置类型，是可以在栈直接分配内存的，Java保留基本数据类型最大的原因也在此：性能。关于这一点可以参考：[Java为什么需要保留基本数据类型](http://www.importnew.com/11915.html)。
　　另外，要注意，Java是基于JVM的，所以，其所占字节固定，与机器平台无关，所有地方统一占用内存大小（除了boolean，以及byte/short/boolean数组的时候每个单元所占的内存是由各个JVM自己实现的）。
　　总共有四类八种基本数据类型（注1）：
1).整型：全部是有符号类型。
1.**byte**：1字节（8bit），高位为符号位，其余7位为数据位，范围：-2的7次方~2的7次方-1（1111,1111~0111,1111），即-128~127（下面的计算方式相同）；

```
注意：byte类型虽然在语义（逻辑）上是占用1字节，但实际上，JVM中是将其当做int看
的，也就是事实上是占用了32位，4字节的，所以其运算效率和int没区别，short也一样。
之所以要有byte/short类型，一是因为某些地方要明确使用这些范围类型，二是，
在byte[]数组中，JVM存储的则是真的1字节，short[]2字节。（但也有的JVM其byte[]
数组也是4字节1位）
```

2.**short**：2字节（16bit），高位为符号位，其余15位为数据位，范围：-2的15次方~2的15次方-1，即-32768~32767；

3.**int**：4字节（32bit），范围-2的31次方~2的31次方-1；Java默认的整型类型，即：

```
long l = 0xfffffffffff;//0x表示这个数是16进制数，0表示8进制。
//编译器报错，因为右边默认是int，但其超出了范围（没超出int范围的话
//编译器会隐式将int转为long），故报错（同样的错误也会出现在float）。
```

同样的还有：

```
short s = 123;//（这个123也是int类型，这里，= 操作编译器能隐式转换） 
s = s + 123;//编译器报错，那是因为s+1是int类型（编译器先将s转化为int，再+1），
//这里，+ 操作编译器不能隐式转换（会提示失真，即精度可能会受损），正确的做法：
s = (short)(s + 123)//注意，不是(short)s + 123。
```

类型转化详见：[Java 数据类型转化](http://blog.csdn.net/a327369238/article/details/52367968)。
4.**long**：8字节（64bit），范围：-2的63次方~2的63次方-1；声明大的long方法：

```
long l = 0xfffffffffffL;//即在后面加上L或l。
//（强制转化：long l = (long)0xfffffffffff也没用）
```

2).浮点型
5.**float**：4字节（32bit），单精度，数据范围：(-2^128)~(-2^(-23-126))-(0)-(2^-149)~2^128。浮点数，通俗来说就是小数，但是，这是有精度要求的，即在这区间float可不是能表达任意小数的，而是在一定精度下，比如float有效位7~8位（包括整数位和小数位，有效小数位是6~7位，这里为什么是7~8（6~7），参考：[Java中float/double取值范围与精度](http://blog.csdn.net/a327369238/article/details/52354811)），即0.123456789后面的9JVM是不认识的（8能认识，整数位为0则不算是有效位，例如12.1234567后面的7也不认识，只有6位有效小数位（注意，看的是有效位，不是有效小数位，float有7~8位有效位）），即：

```
if(0.123456781f == 0.123456789f){//注意后面加f/F，否则就是double
    System.out.println("true");
}else{
    System.out.println("false");
}
//打印结果：true
//事实上，浮点数值的比较是不能直接用==判断的，这里原因就要追究到浮点数的内存结构
//浮点数比较可以用一个差值，但这种情况只是近似的比较
//如果想要精确，可以使用BigDecimal
System.out.println(Float.MIN_VALUE);//1.4E-45 = 2^-149
//这里的“最小值”意味float能表示的最小小数，实际上float最小值等于最大值取负
System.out.println(Float.MAX_VALUE);//3.4028235E38 = 2^128
```

6.**double**：8字节（64bit），双精度，范围：-2^1024~(-2^(-1022-52))-0-(2^－1074)~2^1024，Java默认的浮点类型，即若后面不加f/F，默认是double类型，即：

```
float f = 1.23;//编译报错，因为
float f = 1.23f;//或float f = 1.23F;
//默认是double，1.23(double)转成float，做隐式转换，但是double转成float是
//取值范围大的转成取值范围小的会损失精度，因此不能转换（详见Java数据类型转换）
//那为什么，int可以转换成byte、short，int范围更大不是？
//前面已经说过了，byte、short实际在JVM上就是int，因此编译器是不会认为会损失精度的
//但是int是不能转换成boolean，虽然boolean也是4字节（一般JVM），但在JVM认为这
//两者完全是两个东西，当然不能转换（强制也不行，你不能把猫强制转换成鸟，完全两个物种），而byte、short都是整型，同int是一个类型
```

3).字符型
7.**char**：2字节（16bit），表示一个字符（可以是汉字），字符编码采用Unicode（说的更准确点，字符集（charset）采用UCS-2，编码（encoding）采用UTF-16），实际上就是一个16位的无符号整型，但是，要注意的是，因为随着发展，char所能代表的字符个数（UCS-2字符集）被限定死了，所以并不推荐使用。（更多内容，以及关于Unicode、UTF8/16参考：Unicode、UTF8以及Java char。）

```
char c = 3+5;//正确，char是无符号整型，但不能这样
int a1 = 3;int a2 = 5;char c0 = a1+a2;//这里需要强制转换才行
char c1 = -3;//编译错误，char不能表示负数，即使
char c2 = (char)-3;//编译正确，但无意义（乱码）
char c3 = '3';//正确，输出字符3
char c4 = "3";//编译错误，双引号，表示的是字符串
char c5 = '65';//编译错误，这里65是两个字符
```

4).布尔型
8.**boolean**：逻辑上：1bit，但是实际上，boolean并没有具体规定，完全是看各个JVM实现，不过《Java虚拟机规范》给出了4个字节（同byte解释）和boolean数组一个字节的定义。

注1：
(1).这种分法是一种比较流行的分法，事实上应该为两种：数值类型与布尔型。数值类型分为整型和浮点型。整型包括：byte、short、int、long、char；浮点型：float、double；布尔型boolean。之所以将char认为是整型是因为char在JVM就是以无符号整型存在的。
(2).事实上Java中除去这8种以及对象类型，还有一种比较特殊的类型存在，那就是Void。java.lang.Void，是一个占位符类，不可实例化，保存着Java关键字void的Class对象。为什么说它特殊呢？明明是一个类，难道不是对象类型？那是因为void.class.isPrimitive()（这个方法是用来判断一个Class对象是否是基本类型的）返回的是true，所以Void也算是基本类型的一个了（错了），只不过它比较特殊，不能算是一种数据，只是一种象征。
20160921 改：上面弄错了，把Void和void两个混为一体了，事实上，可以简单的把这两者的关系看成类似包装类和基本类型的关系，像Integer和int的关系，java.lang.Void是一个不可实例化的占位符类来保存一个引用代表了Java关键字void的Class对象：

```
public static final Class<Void> TYPE = Class.getPrimitiveClass("void");
```

而Integer也有类似的语句：

```
public static final Class<Integer>  TYPE = (Class<Integer>) Class.getPrimitiveClass("int");
```

区别只是，Void仅仅是为void服务，即所谓的占位符类，不做他用。所以Void类只是一个普通类，而void则可以认作为如同int一样的基本类型。

#### 2.引用数据类型

简要提一下引用数据类型：字符串、数组、类、接口、Lambda。

也称对象变量类型，复合数据类型，包含类、接口、数组（除了基本类型外，就是引用类型）。引用类型与基本类型最大的区别在于：

```
int a = 5;//这里的a是对象（严格来说不算是对象，只是个符号标识），5是数值
Integer a = 5;//这里的a是一个引用，5才是一个对象，更形象常见的是：
Object o = new Object();//o是引用（栈中），new Object()是对象（堆中）
//第二行代码中，5被自动包装成Integer对象
```

这里的引用有点像C/C ++中的指针，但是同指针不同的是，你不能通过改变它的值从而去改变它所指向的值。即

```
ClassA p = new ClassA();//C++中，这个时候是可以这样操作的：
p = p + 1;//向前移动一个单元，Java则不能
//这种操作，其实是对内存直接的操作，很显然，Java是不允许程序员做这种操作的
```

　　其实质就是，Java的引用不支持对内存直接操作，而指针则可以，所以，Java用起来更安全，但不够灵活，而指针，自由度大，但同时，要更加小心因为指针操作不当而引起的各种内存问题。在Java中，任何对象都需要通过引用才能访问到，没有引用指向的对象被视为垃圾对象，将会被回收（GC）。
　　引用，其实质同指针一样（可以理解为受限制的指针），存放的是一个地址，至于是实例对象的地址，还是一个指向句柄池的地址（这里可以参考：[(3) Java内存结构](http://blog.csdn.net/a327369238/article/details/52094738)），完全是看各个JVM的实现了。
　　Java中的枚举类型，都是Enum类的子类，算是类中的一种，也是引用类型。
　　引用类型又称为对象变量类型，是相对于基本数据类型来说的（基本数据类型不是对象），而又被称为复合数据类型，可以这样理解，引用类型的数据最终都是由基本数据类型构成的。而像接口，接口是不能实例化的，最终的实现还是由类实现的；数组在JVM中的实现也是通过类实现的，每个类型的一维数组，二维数组……都是一个类，只是这是一个特殊的类，它的对象头有别于一般对象的对象头（最主要的就是，数组对象头有对象长度）。
　　另外，关于Java引用可以参考：[Java中的引用](http://blog.csdn.net/a327369238/article/details/52384649)。



取值范围与内存占用不相关，就比如说图中的long占用8个字节而单精度浮点数float只占用四个字节，但是float的取值范围却比long的取值范围大很多，这是因为float采用的是科学计数法计算省空间。

注意事项：
1.字符串不是基本类型，而是引用类型。
2.浮点型可能只是一个近似值，并非精确值。
3.数据范围与字节数不一定相关。例如：float数据范围比long更加广泛，但是float是4字节，long是8字节。
4.浮点数当中默认类型是double。如果一定要使用float类型，需要加上一个后缀F。
如果是整数，默认为int类型，如果一定要使用long类型，需要加上一个后缀L。大小写后缀都可以，推荐使用大写字母后缀。

### 变量的定义

变量：程序运行期间，内容可以发生改变的量。

创建一个变量并且使用的格式：数据类型 变量名称; 变量名称 = 数据值;

一步到位的格式：数据类型 变量名称 = 数据值;//在创建一个变量的同时，立刻放入指定的数据值。

用long 和 float时要加后缀。例如：long num = 30000000000L; float num = 2.5F;

### 数据类型转换

当数据类型不一样时，将会发生数据类型转换。

数据类型转换分为两类：

 自动类型转换（隐式）
  1.特点：代码不需要进行特殊处理，自动完成。
  2.规则：数据范围从小到大。

 强制类型转换（显式）
  1.特点：代码需要进行特殊的格式处理，不能自动完成。
  2.格式：范围小的数据类型 范围小的变量名 = （范围小的类型）原本范围大的数据; 例如：int num = (int) 100L;


### 变量的作用域

规定了变量所能使用的范围，只有在作用域范围内变量才能被使用。根据变量声明地点的不同，变量的作用域也不同。
根据作用域的不同，一般将变量分为不同的类型：类变量、局部变量、方法参数变量及异常处理参数变量。

- 类变量
  类变量也称为成员变量，声明在类中，不属于任何一个方法，作用域是整个类。
- 局部变量
  局部变量是指在方法或者方法代码块中定义的变量，其作用域是其所在的代码块。
- 方法参数变量
  作为方法参数声明的变量的作用域是整个方法。
- 异常处理参数变量
  异常处理参数变量的作用域是在异常处理块中，该变量是将异常处理参数传递给异常处理块，与方法参数变量类似。
