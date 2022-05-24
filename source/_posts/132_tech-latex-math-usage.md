---
title: LaTeX数学表达式
categories: 技术流
tags:
  - LaTeX
  - KaTeX
abbrlink: f107c406
date: 2022-05-23 16:39:29
---

> 作为一个作者，在博客中公式的编辑总是难免的。markdown并不支持数学公式编辑，这些公式仅靠编辑器自带的排版功能是难以表示的，所以需要我们掌握网页公式编辑方案。目前比较流行的网页公式编辑方案是采用TEX/LATEX语法编辑，知名的有MathJax、KATEX。

<!-- more -->

### 关于KaTeX

[KaTex](https://katex.org/) - The fastest math typesetting library for the web.

可汗学院出品，号称“最快”的数学公式渲染库，支持主流的浏览器：Chrome, Firefox, Safari, Opera和 IE8~IE11。

KaTex的优势

- 快速：并发渲染，无需重排页面。根据这个测试，性能绝对秒杀MathJax。

- 渲染效果好：采用TeX语法，渲染效果达到印刷出版级别。

- 无依赖：不依赖其它库。

- 支持服务器端渲染：例如，服务器端的Node.js程序调用KaTeX，把渲染好的HTML片段直接发送给客户端。

KaTeX官方文档

[Supported Functions · KaTeX](https://katex.org/docs/supported.html)

[Support Table · KaTeX](https://katex.org/docs/support_table.html)

overleaf数学表达式

https://cn.overleaf.com/learn/latex/Mathematical_expressions

MyScript手绘公式

https://webdemo.myscript.com/

Tex 科学公式语言 (TeX/LaTeX)示例

https://pandao.github.io/editor.md/examples/katex.html

LaTeX 数学表达式

http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference

### LaTeX示例

Gamma公式展示 $\Gamma(n) = (n-1)!\quad\forall
n\in\mathbb N$ 是通过欧拉积分

![CodeCogsEqn](https://www.zhihu.com/equation?tex=%5CGamma(z)%20=%20%5Cint_0%5E%5Cinfty%20t%5E%7Bz-1%7De%5E%7B-t%7Ddt%5C,.)

渲染LaTeX数学表达式：

```bash
$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
$$
```

### LaTeX书籍

https://mirrors.tuna.tsinghua.edu.cn/CTAN/info/lshort/chinese/lshort-zh-cn.pdf

https://www.latex-project.org/help/documentation/amsldoc.pdf

### LATEX语法

在LaTeX数学模式中，公式有两种形式——行内公式和行间公式。前者公式嵌入在行内，适用于简单短小的公式；后者居中独占一行，适用于比较长或重要的公式。科学公式 TeX(KaTeX)

**行内公式**

```text
$ f(x) = a+b $
```

效果： ![[公式]](https://www.zhihu.com/equation?tex=f%28x%29+%3D+a%2Bb)

**行间公式**

```text
$$ f(x) = a+b $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=f%28x%29+%3D+a%2Bb+)

**手动编号**

```text
$$ f(x) = a - b \tag{1.1} $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=f%28x%29+%3D+a+-+b+%5Ctag%7B1.1%7D)

**公式组合**

通过cases环境实现公式的组合，&分隔公式和条件，还可以通过\limits来让x→0位于lim的正下方而非默认在lim符号的右下方显示

```text
$$D(x) = \begin{cases}
\lim\limits_{x \to 0} \frac{a^x}{b+c}, & x<3 \\
\pi, & x=3 \\
\int_a^{3b}x_{ij}+e^2 \mathrm{d}x,& x>3 \\
\end{cases}$$
```

效果：

![[公式]](https://gitcode.net/weixin_44008788/images/-/raw/master/hexo/equation.svg)

**拆分单个公式**

通过split环境实现公式拆分

```text
$$\begin{split}
\cos 2x &= \cos^2x - \sin^2x \\
&=2\cos^2x-1
\end{split}$$
```

效果：

![[公式]](https://gitcode.net/weixin_44008788/images/-/raw/master/hexo/equation_split.svg)

**简单运算**

拉丁字母、阿拉伯数字和 +-*/= 运算符均可以直接输入获得，命令\cdot表示乘法的圆点，命令\neq表示不等号，命令\equiv表示恒等于，命令\bmod表示取模

```text
$$ x+2-3*4/6=4/y + x\cdot y $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=x%2B2-3%2A4%2F6%3D4%2Fy+%2B+x%5Ccdot+y)

```text
$$ 0 \neq 1 \quad x \equiv x \quad 1 = 9 \bmod 2 $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=0+%5Cneq+1+%5Cquad+x+%5Cequiv+x+%5Cquad+1+%3D+9+%5Cbmod+2)

**上下标**

语法_表示下标、^表示上标，但上下标内容不止一个字符时，需用大括号括起来。单引号'表示求导

```text
$$ a_{ij}^{2} + b^3_{2}=x^{t} + y' + x''_{12} $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=a_%7Bij%7D%5E%7B2%7D+%2B+b%5E3_%7B2%7D%3Dx%5E%7Bt%7D+%2B+y%27+%2B+x%27%27_%7B12%7D)

**根号、分式**

命令：\sqrt表示平方根，\sqrt[n]表示n次方根，\frac表示分式

```text
$$\sqrt{x} + \sqrt{x^{2}+\sqrt{y}} = \sqrt[3]{k_{i}} - \frac{x}{m}$$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Csqrt%7Bx%7D+%2B+%5Csqrt%7Bx%5E%7B2%7D%2B%5Csqrt%7By%7D%7D+%3D+%5Csqrt%5B3%5D%7Bk_%7Bi%7D%7D+-+%5Cfrac%7Bx%7D%7Bm%7D)

**上下标记**

命令：\overline, \underline 分别在表达式上、下方画出水平线

```text
$$\overline{x+y} \qquad \underline{a+b}$$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Coverline%7Bx%2By%7D%5Cqquad%5Cunderline%7Ba%2Bb%7D)

命令：\overbrace, \underbrace 分别在表达式上、下方给出一个水平的大括号

```text
$$\overbrace{1+2+\cdots+n}^{n个} \qquad \underbrace{a+b+\cdots+z}_{26}$$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Coverbrace%7B1%2B2%2B%5Ccdots%2Bn%7D%5E%7Bn%E4%B8%AA%7D+%5Cqquad+%5Cunderbrace%7Ba%2Bb%2B%5Ccdots%2Bz%7D_%7B26%7D)

**向量**

命令：\vec表示向量，\overrightarrow表示箭头向右的向量，\overleftarrow表示箭头向左的向量

```text
$$\vec{a} + \overrightarrow{AB} + \overleftarrow{DE}$$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Cvec%7Ba%7D+%2B+%5Coverrightarrow%7BAB%7D+%2B+%5Coverleftarrow%7BDE%7D)

**积分、极限、求和、乘积**

命令：\int表示积分，\lim表示极限， \sum表示求和，\prod表示乘积，^、_表示上、下限

```text
$$  \lim_{x \to \infty} x^2_{22} - \int_{1}^{5}x\mathrm{d}x + \sum_{n=1}^{20} n^{2} = \prod_{j=1}^{3} y_{j}  + \lim_{x \to -2} \frac{x-2}{x} $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Clim_%7Bx+%5Cto+%5Cinfty%7D+x%5E2_%7B22%7D+-+%5Cint_%7B1%7D%5E%7B5%7Dx+%5Cmathrm%7Bd%7D+x+%2B+%5Csum_%7Bn%3D1%7D%5E%7B20%7D+n%5E%7B2%7D+%3D+%5Cprod_%7Bj%3D1%7D%5E%7B3%7D+y_%7Bj%7D++%2B+%5Clim_%7Bx+%5Cto+-2%7D+%5Cfrac%7Bx-2%7D%7Bx%7D)

**三圆点**

命令：\ldots点位于基线上，\cdots点设置为居中，\vdots使其垂直，\ddots对角线排列

```text
$$ x_{1},x_{2},\ldots,x_{5}  \quad x_{1} + x_{2} + \cdots + x_{n} $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=x_%7B1%7D%2Cx_%7B2%7D%2C%5Cldots%2Cx_%7B5%7D++%5Cquad+x_%7B1%7D+%2B+x_%7B2%7D+%2B+%5Ccdots+%2B+x_%7Bn%7D)

**重音符号**

常用命令如下：

```text
$ \hat{x} $
```

效果： ![[公式]](https://www.zhihu.com/equation?tex=%5Chat%7Bx%7D)

```text
$ \bar{x} $
```

效果： ![[公式]](https://www.zhihu.com/equation?tex=%5Cbar%7Bx%7D)

```text
$ \tilde{x} $
```

效果： ![[公式]](https://www.zhihu.com/equation?tex=%5Ctilde%7Bx%7D)

**矩阵**

其采用矩阵环境实现矩阵排列，常用的矩阵环境有matrix、bmatrix、vmatrix、pmatrix，其区别为在于外面的括号不同：

![img](https://pic1.zhimg.com/80/v2-684e48900e810dff360c23b4ffe99680_720w.jpg)

下列代码中，&用于分隔列，\用于分隔行

```text
$$\begin{bmatrix}
1 & 2 & \cdots \\
67 & 95 & \cdots \\
\vdots  & \vdots & \ddots \\
\end{bmatrix}$$
```

效果：

![[公式]](https://gitcode.net/weixin_44008788/images/-/raw/master/hexo/matrix.svg)

**希腊字母**

希腊字母无法直接通过美式键盘输入获得。在LaTeX中通过反斜杠\加上其字母读音实现，将读音首字母大写即可输入其大写形式，详见下表

```text
$$ \alpha^{2} + \beta = \Theta  $$
```

效果：

![[公式]](https://www.zhihu.com/equation?tex=%5Calpha%5E%7B2%7D+%2B+%5Cbeta+%3D+%5CTheta)



![img](https://pic1.zhimg.com/80/v2-da3e717cf670582fbfbdddee33073524_720w.jpg)

**三角函数**

![img](https://pic4.zhimg.com/80/v2-2527327da18ba3cd4d9cfa9483bcbe1f_720w.jpg)

**设置颜色**

字体颜色：{\color{色调} 表达式}

背景颜色：{\pagecolor{色调} 表达式}

示例：

```text
$\color{red}{\text red}$
$\color{#FF0000}{\text 红色字\;}$
$\color{rgb(255,255,0)}{黄色字\;}$
```




> https://blog.csdn.net/m0_53793870/article/details/122514409
>
> https://zhuanlan.zhihu.com/p/110756681
>
> https://zhuanlan.zhihu.com/p/261750408?utm_source=wechat_session
>
> https://blog.csdn.net/mingzhuo_126/article/details/82722455
>
> https://blog.csdn.net/PolarisRisingWar/article/details/121333303
>
> https://blog.csdn.net/u013210620/article/details/81938733
>
> LaTeX数学公式 https://blog.csdn.net/qq_20602929/article/details/50983697
>
> Markdown 中 LaTex 数学公式命令 https://www.jianshu.com/p/0ea47ae02262
>
> LaTeX新手入门教程（3）数学公式 https://www.cnblogs.com/GarfieldEr007/p/5536138.html
>
> online latex editor http://latex.codecogs.com/eqneditor/editor.php





