---
title: 开源许可协议 Open Source License
categories: 技术流
tags:
  - Open Source License
  - MIT
  - Apache2.0
abbrlink: b86684bd
date: 2022-05-04 17:14:45
---

>开源许可证是计算机软件和其他产品的一种许可证，允许在定义的条款和条件下使用、修改和/或共享源代码、蓝图或设计。这允许最终用户和商业公司根据自己的定制、好奇心或故障排除需求来审查和修改源代码、蓝图或设计。

<!-- more -->

### 关于开源许可证 Open Source License

开源许可证是计算机软件和其他产品的一种许可证，允许在定义的条款和条件下使用、修改和/或共享源代码、蓝图或设计。这允许最终用户和商业公司根据自己的定制、好奇心或故障排除需求来审查和修改源代码、蓝图或设计。

我们接触到的开源软件一般都有对应的开源许可证对软件的使用、复制、修改和再发布等进行限制。许可证即授权条款，开源许可证就是保证开源软件这些限制的法律文件，目的在于规范受著作权保护的软件的使用或者分发行为。**开源许可证是开源软件生态系统的基础，可以促进软件的协同开发。**

>常见的开源许可证主要有 Apache、MIT、BSD、GPL、LGPL、MPL、SSPL 等，可以大致分为两大类：
>**1. 宽松自由软件许可协议 Permissive Free Software Licence**
>是一种对软件的使用、修改、传播等方式采用最低限制的自由软件许可协议条款类型。这种类型的软件许可协议将不保证原作品的派生作品会继续保持与原作品完全相同的相关限制条件，从而为原作品的自由使用、修改和传播等提供更大的空间。
>**2.著佐权许可证 Copyleft License**
>是在有限空间内的自由使用、修改和传播，且不得违背原作品的限制条款。如果一款软件使用 Copyleft 类型许可协议规定软件不得用于商业目的，且不得闭源，那么后续的衍生子软件也必须得遵循该条款。
>**两者最大的差别在于**：在软件被修改并再发行时， Copyleft License 仍然强制要求公开源代码（衍生软件需要开源），而Permissive Free Software Licence 不要求公开源代码（衍生软件可以变为专有软件）。
>**其中**，Apache、MIT、BSD 都是宽松许可证，GPL 是典型的强著佐权（Copyleft ）许可证，LGPL、MPL 是弱著佐权（Copyleft ）许可证。SSPL 则是近年来 MongoDB 创建的一个新许可证，存在较大争议，开放源代码促进会 OSI 甚至认为 SSPL 就不是开源许可协议。


### 如何选择开源许可证
如何为代码选择开源许可证，这是一个问题。世界上的开源许可证，大概有上百种，很少有人能弄清楚它们的区别。即使在最流行的六种开源许可证：[GPL](https://en.wikipedia.org/wiki/GNU_General_Public_License)、[BSD](https://en.wikipedia.org/wiki/BSD_licenses)、[MIT](https://en.wikipedia.org/wiki/MIT_License)、[Mozilla](https://www.mozilla.org/MPL/)、[Apache](https://www.apache.org/licenses/LICENSE-2.0)和[LGPL](https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License)，在这些中做出选择也很复杂。

乌克兰程序员Paul Bagwell 画了一张分析图，说明应该怎么选择，这是我见过的最简单的讲解，只用两分钟，你就能搞清楚这六种许可证之间的最大区别。
![开源许可证](/images/assets/licenses.png)


### 常见开源许可证声明方式

- [MIT](https://opensource.org/licenses/MIT)

```
MIT License

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice (including the next paragraph) shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

- [Apache2.0](https://www.apache.org/licenses/LICENSE-2.0)

```
Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

- [GPL3.0](https://www.gnu.org/licenses/gpl-3.0.html)

```
<one line to give the program's name and a brief idea of what it does.>

Copyright (C) <year>  <name of author>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```
