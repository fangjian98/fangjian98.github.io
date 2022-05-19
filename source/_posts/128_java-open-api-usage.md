---
title: OpenAPI的介绍及其使用
categories: Java
tags:
  - Java
abbrlink: f7f06827
date: 2022-05-19 10:16:29
---

> API的全称是应用编程接口（Application Programming Interface），这并不是一个新概念，在计算机操作系统出现的早期就已经存在了。在互联网时代，把网站的服务封装成一系列计算机易识别的数据接口开放出去，供第三方开发者使用，这种行为就叫做开放网站的API，与之对应的，所开放的API就被称作openAPI。

<!-- more -->

# OpenAPI的使用

## 1.OSCHINA API

OSCHINA API：https://www.oschina.net/openapi/docs

```bash
- 什么是token
token（令牌）是一串唯一的字符串，通常由服务端生成，在注册完成时返回给客户端，用来标识此用户，客户端将此字符串存储在本地。在以后的网络请求时，客户端先查询本地的token，如果有则直接使用此令牌进行网络请求，没有则提示未登录，转到登陆注册界面。
此外，还可以在服务端或者客户端添加过期判别机制。

- token的作用
token可以显著减少服务端对用户表的查询，同时使用户不必每次都登陆，提高了系统的可用性与健壮性。

- 使用SharedPreferences保存token
```

1.创建应用

```bash
状态		正在审核
应用ID	GCqPUbrIaoe7nUScRlet
应用私钥	YFJDhiYsnyI6qW8nzdAHYIPocZsPEff1
应用首页	https://fangjian98.github.io/
回调地址	http://192.168.0.106/
```

2.OAuth2 获取 AccessToken，应用通过 AccessToken 访问 OpenApi 使用用户数据。
采用 OAuth2 协议 认证，开放 osc 移动 app 版本所有接口

```bash
1.
# 用户授权码的回调地址直接获取code
# 构造Uri：/action/oauth2/authorize
# client_id(应用ID)和redirect_uri(回调地址)
https://www.oschina.net/action/oauth2/authorize?response_type=code&client_id=GCqPUbrIaoe7nUScRlet&redirect_uri=http://192.168.0.106/
# 返回用户授权码code
http://192.168.0.106/?code=bWay1O&state=

//iap9LL

2.
# 应用服务器使用 oauth2_token API 向 OSChina 认证服务器发送用户授权码以及回调地址，OSChina 认证服务器返回 AccessToken
# 构造Uri:/action/openapi/token
# client_id(应用ID)和redirect_uri(回调地址)和client_secret(应用私钥)和code(用户授权码)
https://www.oschina.net/action/openapi/token?client_id=GCqPUbrIaoe7nUScRlet&client_secret=YFJDhiYsnyI6qW8nzdAHYIPocZsPEff1&grant_type=authorization_code&code=pZ6Ye2&redirect_uri=http://192.168.0.106/&dataType=json
# 返回AccessToken
{"access_token":"6983b81e-5e2e-4685-888f-36abcf3f2da7","refresh_token":"2c033acf-2171-4d4a-a451-1d9509ce73c3","uid":4470181,"token_type":"bearer","expires_in":604799}

//{"access_token":"09a10176-7772-4577-8856-1b396f86e83b","refresh_token":"da728b79-3b0d-4062-961b-bd67c09ecbcd","uid":4470181,"token_type":"bearer","expires_in":604799}

3.使用AccessToken请求：参考OpenAPI文档即可
# 新闻news_list
# 构造Uri:/action/openapi/news_list
# access_token catalog page pageSize dataType
https://www.oschina.net/action/openapi/news_list?access_token=6983b81e-5e2e-4685-888f-36abcf3f2da7&catalog=2&page=1&pageSize=10&dataType=json

				必选	类型及范围	说明				默认值
access_token	true	string	oauth2_token获取的access_token	
catalog			true	int		1-所有|2-综合新闻|3-软件更新		1
page/pageIndex	true	int		页数	1
pageSize		true	int		每页条数	20
dataType		true	string	返回数据类型['json'|'jsonp'|'xml']	json


# 新闻news_detail
# 构造Uri:/action/openapi/news_detail
# id access_token
https://www.oschina.net/action/openapi/news_detail?id=188164&access_token=6983b81e-5e2e-4685-888f-36abcf3f2da7&dataType=json

				必选	类型及范围	说明	默认值
id				true	long	新闻编号	空
access_token	false	string	oauth2_token获取的access_token 传则显示是否收藏 用户未登录则不传	
dataType		false	string	返回数据类型 ['json'|'jsonp'|'xml']	json
```

## 2.其他平台开放API

- CODING OPEN API：https://help.coding.net/openapi
- 有道云笔记API：http://note.youdao.com/open/index.html
- [常用精品API接口汇总](https://www.cnblogs.com/trackingmore/p/7156877.html)

ApiPost

PostMan

## 3.Json解析

org.json库、fastjson、gson

Android给我们提供的Json解析类

```java
官方提供的JSONArray与JSONObject
这些API都存在于org.json包下，而我们用到的类有下面这些：
JSONObject： Json对象，可以完成Json字符串与Java对象的相互转换
JSONArray： Json数组，可以完成Json字符串与Java集合或对象的相互转换
JSONStringer： Json文本构建类，这个类可以帮助快速和便捷的创建JSON text， 每个
JSONStringer实体只能对应创建一个JSON text
JSONTokener：Json解析类
JSONException：Json异常
```

Java解析json字符串的几种方法
https://www.cnblogs.com/lushimei/p/13436096.html
