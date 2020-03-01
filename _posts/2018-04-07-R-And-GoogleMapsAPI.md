---
title: R语言中使用 Google Maps API 进行搜索、统计、分析
date: 2018-04-07
categories: Study
tags :
- R
- Google Maps API
---
---
Google Maps API 简单介绍
---
<!-- more -->
## Google Maps API 故事的由来



由于工作需要，要求得出某一个地点的【地点】信息，比如周有哪些公共设施：比如公园、商场、餐厅、商店、最近的公共交通站点等信息。当老板给我提出这个要求时，我首先就想到了Google Maps应该有API，果不其然，Stack Overflow 上很快就找到了。

## 一些重要的说明和相关链接

1. 要使用Google Maps API，需要到此API的官方网站查找一切相关信息：[Google Maps API](https://developers.google.com/maps/).

2. Google Maps API 兼容各个平台，有Android, iOS, Web APIs, Web Service APIs， 具体看文档。在使用Google Maps API之前，都需要用Google账号登录并获取相应API的key以向Google 服务器发送请求，免费用户每天可发送1000次请求，付费用户没有这个限制，关于收费，具体参看：[Google Maps API定价和计划](https://developers.google.com/maps/pricing-and-plans/)


3. 将一个地址坐标化，也就是获取任意一个地点的纬度和经度，比如埃菲尔铁塔的纬度经度为：48.8583701,2.2922926。为达到此目的，需要用到[Geocoding API](https://developers.google.com/maps/documentation/geocoding/start), 具体参看这个API的文档。

4. 如果要返回一个地点的相信信息，比如周边的商场、超市、咖啡馆、餐馆、公共交通等，可使用[Google Places API](https://developers.google.com/places/web-service/intro)

5. 如果要返回两个或者两个以上地点的行程距离和时间，可以[使用Google Maps Distance Matrix API](https://developers.google.com/maps/documentation/distance-matrix/intro)。

## 如何使用R进行Google Maps API的计算

R中包含了诸多的库，其中大部分都是开源的，代码也大多数放在Github，具体如下：



| Name of R Package | Liens                                                        | Functionality                                        |
| ----------------- | ------------------------------------------------------------ | ---------------------------------------------------- |
| Googleway         | [Googleway](https://cran.r-project.org/web/packages/googleway/index.html) | google_geocode，google_places，                      |
| gmapsdistance     | [gmapsdistance](https://cran.r-project.org/web/packages/gmapsdistance/README.html) | gmapsdistance                                        |
| geosphere         | [geosphere](https://cran.r-project.org/web/packages/geosphere/index.html) | destPointRhumb，求两点之间的鸟瞰距离，也就是球面距离 |



---

_感谢Google Maps提供这么好的服务给大家使用，让写代码变得如此简单方便。_

_本站第一篇真正意义上的文章，发现自己总结归纳能力很弱，希望看到这篇文章的行业同仁有建议的知无不言，大家互相交流互相学习_

