# paddleImageStyleTransfer 帮助文档

<p align="center" class="flex justify-center">
    <a href="https://www.serverless-devs.com" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=paddleImageStyleTransfer&type=packageType">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=paddleImageStyleTransfer" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=paddleImageStyleTransfer&type=packageVersion">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=paddleImageStyleTransfer" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=paddleImageStyleTransfer&type=packageDownload">
  </a>
</p>

<description>

> ***本应用基于百度开源的 PaddlePaddle 项目，AnimeGAN V2 图像风格转换模型, 可将输入的图像转换成宫崎骏动漫风格。***

</description>

<table>

## 前期准备
使用该项目，推荐您拥有以下的产品权限 / 策略：

| 服务/业务 | 函数计算 |     
| --- |  --- |   
| 权限/策略 | AliyunFCFullAccess</br>AliyunContainerRegistryFullAccess |     


</table>

<codepre id="codepre">

# 代码 & 预览

- [:smiley_cat: 源代码](https://github.com/duolabmeng6/paddleImageStyleTransfer)

        

</codepre>

<deploy>

## 部署 & 体验

<appcenter>

- :fire: 通过 [Serverless 应用中心](https://fcnext.console.aliyun.com/applications/create?template=paddleImageStyleTransfer) ，
[![Deploy with Severless Devs](https://img.alicdn.com/imgextra/i1/O1CN01w5RFbX1v45s8TIXPz_!!6000000006118-55-tps-95-28.svg)](https://fcnext.console.aliyun.com/applications/create?template=paddleImageStyleTransfer)  该应用。 

</appcenter>

- 通过 [Serverless Devs Cli](https://www.serverless-devs.com/serverless-devs/install) 进行部署：
    - [安装 Serverless Devs Cli 开发者工具](https://www.serverless-devs.com/serverless-devs/install) ，并进行[授权信息配置](https://www.serverless-devs.com/fc/config) ；
    - 初始化项目：`s init paddleImageStyleTransfer -d paddleImageStyleTransfer`   
    - 进入项目，并进行项目部署：`cd paddleImageStyleTransfer && s deploy -y`

</deploy>

<appdetail id="flushContent">

# 应用详情

## 调用方法

```python
import requests
import json
import cv2
import base64


def cv2_to_base64(image):
    data = cv2.imencode('.jpg', image)[1]
    return base64.b64encode(data.tostring()).decode('utf8')


def getResult(imagePath):
    data = json.dumps({'images': [cv2_to_base64(cv2.imread(imagePath))]})
    r = requests.post("http://127.0.0.1:9000/predict/animegan_v2_hayao_99", data=data,
                      headers={'Content-Type': 'application/json'})
    return r.json()["results"]


print(getResult("./test.png"))
```


## 调用失败的请看这里

* 500x300 分辨率 需要 7秒   2.6gb内存 所以函数设置 3gb 运行内存才可以
* 720x500 分辨率 需要 15秒  5.76gb内存 所以函数设置 8gb 运行内存才可以
* 2000x1280 分辨率 需要 30秒 6.77g内存 所以设置 8gb 运行内存才可以

我是直接设置了16gb内存测试的

## 本应用的镜像开发教程

https://github.com/duolabmeng6/paddlehub_ppocr

阅读本文你将学会：

在 Serverless 架构中 docker 镜像制作的最佳实践，游刃有余的部署复杂场景下的深度学习模型

熟练的使用各厂商提供的 Serverless 服务，部署。

制作小巧精良的 docker 镜像

</appdetail>

<devgroup>

## 开发者社区

您如果有关于错误的反馈或者未来的期待，您可以在 [Serverless Devs repo Issues](https://github.com/serverless-devs/serverless-devs/issues) 中进行反馈和交流。如果您想要加入我们的讨论组或者了解 FC 组件的最新动态，您可以通过以下渠道进行：

<p align="center">

| <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407298906_20211028074819117230.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407044136_20211028074404326599.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407252200_20211028074732517533.png" width="130px" > |
|--- | --- | --- |
| <center>微信公众号：`serverless`</center> | <center>微信小助手：`xiaojiangwh`</center> | <center>钉钉交流群：`33947367`</center> | 

</p>

</devgroup>