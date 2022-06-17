docker build -f ./Dockerfile -t pyramidbox_lite_mobile:1.0 .
docker rm -f pyramidbox_lite_mobile
docker run -itd --name pyramidbox_lite_mobile -p 9022:9000 pyramidbox_lite_mobile:1.0
docker logs pyramidbox_lite_mobile
docker diff pyramidbox_lite_mobile

#没问题的话就可以执行推送命令
docker tag pyramidbox_lite_mobile:1.0 registry.cn-shenzhen.aliyuncs.com/duolabmeng/pyramidbox_lite_mobile:1.2
docker push registry.cn-shenzhen.aliyuncs.com/duolabmeng/pyramidbox_lite_mobile:1.2


