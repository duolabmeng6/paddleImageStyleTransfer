# 基于 Serverless 图像转换为宫崎骏动漫风格案例

大家可以通过本项目提供的镜像，快速发布成可调用的Restful API服务。

# animegan_v2_hayao_99

[使用模型 animegan_v2_hayao_99](https://github.com/PaddlePaddle/PaddleHub/tree/release/v2.2/modules/image/Image_gan/style_transfer/animegan_v2_hayao_99)

|模型名称|animegan_v2_hayao_99|
| :--- | :---: |
|类别|图像 - 图像生成|
|网络|AnimeGAN|
|数据集|The Wind Rises|
|是否支持Fine-tuning|否|
|模型大小|9.4MB|
|最新更新日期|2021-07-30|
|数据指标|-|

## 一、模型基本信息

- ### 应用效果展示
  - 样例结果示例：
    <p align="center">
    <img src="./test.png"  width = "450" height = "300" hspace='10'/>
    <br />
    输入图像
    <br />
    <img src="result.png"  width = "450" height = "300" hspace='10'/>
    <br />
    输出图像
     <br />
    </p>


- ### 模型介绍

  - AnimeGAN V2 图像风格转换模型, 模型可将输入的图像转换成宫崎骏动漫风格，模型权重转换自[AnimeGAN V2官方开源项目](https://github.com/TachibanaYoshino/AnimeGANv2)。

# 部署方法

# 1. 在阿里云函数计算应用中心里立即创建

[阿里云Serverless 应用中心一键体验 ](https://fcnext.console.aliyun.com/applications/create?template=paddleImageStyleTransfer)

# 2. 终端上输入命令创建

```shell

s init paddleImageStyleTransfer  # 初始化项目
s deploy  # 部署项目

```

# 调用方法

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

# 本应用的镜像开发教程

https://github.com/duolabmeng6/paddlehub_ppocr

阅读本文你将学会：

在 Serverless 架构中 docker 镜像制作的最佳实践，游刃有余的部署复杂场景下的深度学习模型

熟练的使用各厂商提供的 Serverless 服务，部署。

制作小巧精良的 docker 镜像

# 常用命令
```shell
s cli registry login # 登录授权 一次就行
s cli registry publish # 发布包
s cli registry list # 查看子机已发布的包

s init paddleImageStyleTransfer # 自己测试应用的效果
s deploy # 部署项目试试
```