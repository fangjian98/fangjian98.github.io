---
title: 企业项目开发流程
abbrlink: a73689f8
date: 2022-05-16 23:26:51
categories: 技术流
tags:
  - Web
  - App
---

> 一般情况下，企业开发软件时会按照基线和定制两块并行方式执行项目开发工作。无论什么公司，都需要遵从一套成熟的产品研发过程体系，才能做出质量较好的产品。因此，如果出现项目较多的情况，应该合理地安排基线和定制之前的里程碑，让基线产品能够尽量多地收集用户的通用型需求，为定制项目进度实现技术支撑，减少定制项目中大量更改代码、需要新增模块情况发生。此外，产品研发过程体系也需要按照业务实际时间要求变化，不要拘泥于一定要按照瀑布方式，或是敏捷方式进行管理，凡事都需要找到契合自己的方式。

<!-- more -->

### Web项目流程
1.需求分析
2.设计（概要设计、详细设计)
3.技术选型
4.初始化/引入需要的技术
5.写Demo
6.写代码（实现业务逻辑)
7.测试(单元测试)
8.代码提交&代码评审
9.部署
10.发布

**关于技术选型**
前端:三件套＋React +组件库Ant Design + Umi + Ant Design Pro(现成的管理系统)

> Umi 自动生成代码工具
> packages.json 依赖和脚本
> yarn 包管理器：//npm install -g yarn //yarn --version

后端: java +spring + springmvc + mybatis + mybatis-plus + springboot + mysql
部署:服务器/容器（平台)

>mvnrepository:https://mvnrepository.com/
> https://search.maven.org/
> mybatis-plus https://baomidou.com/
> springboot官方生成器：https://start.spring.io/

**关于依赖：**
Spring Boot DevTools //热更新
Lombok 注解
Spring Configuration Processor
mysql 数据库
spring web //接口
mybatis //数据库访问
junit //单元测试swagger //api文档


### App开发流程
1.产品经理:功能需求，竞品分析，抄同类产品的好功能
2.UI设计：寻找灵感，抄同类产品设计
3.程序员：代码审查，百度论坛找解决办法
4.测试：测试体验，多种手机对比
