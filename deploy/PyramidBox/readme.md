# 基于 Serverless 人脸关键点检测

大家可以通过本项目提供的镜像，快速发布成可调用的Restful API服务。

# 部署方法

# 1. 在阿里云函数计算应用中心里立即创建

[阿里云Serverless 应用中心一键体验 ](https://fcnext.console.aliyun.com/applications/create?template=paddlePyramidBox)


# 2. 终端上输入命令创建

```shell

s init paddlePyramidBox  # 初始化项目
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
    r = requests.post("http://127.0.0.1:9000/predict/pyramidbox_lite_mobile", data=data,
                      headers={'Content-Type': 'application/json'})
    return r.json()["results"]


print(getResult("./test.png"))
```


# 调用失败的请看这里

* 500x300 分辨率 需要 7秒   2.6gb内存 所以函数设置 3gb 运行内存才可以
* 720x500 分辨率 需要 15秒  5.76gb内存 所以函数设置 8gb 运行内存才可以
* 2000x1280 分辨率 需要 30秒 6.77g内存 所以设置 8gb 运行内存才可以

我是直接设置了16gb内存测试的

# 本应用的镜像开发教程

https://github.com/duolabmeng6/paddlehub_ppocr

阅读本文你将学会：

在 Serverless 架构中 docker 镜像制作的最佳实践，游刃有余的部署复杂场景下的深度学习模型

熟练的使用各厂商提供的 Serverless 服务，部署。

制作小巧精良的 docker 镜像