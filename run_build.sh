docker build -f ./Dockerfile -t animegan_v2_hayao_99:1.0 .
docker rm -f animegan_v2_hayao_99
docker run -itd --name animegan_v2_hayao_99 -p 9022:9000 animegan_v2_hayao_99:1.0
docker logs animegan_v2_hayao_99
docker diff animegan_v2_hayao_99

#没问题的话就可以执行推送命令
docker tag animegan_v2_hayao_99:1.0 registry.cn-shenzhen.aliyuncs.com/duolabmeng/animegan_v2_hayao_99:1.1
docker push registry.cn-shenzhen.aliyuncs.com/duolabmeng/animegan_v2_hayao_99:1.1


