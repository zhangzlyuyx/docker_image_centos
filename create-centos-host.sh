read -t 30 -p "input centos port:" centosPort
echo -e "\n"
echo "centos port:$centosPort"
docker run -dit --name centos$centosPort --hostname centos$centosPort --net=host --restart=unless-stopped  -v /home/data/centos/$centosPort:/usr/local/app --privileged=true zhangzlyuyx/centos76:1.0 /etc/rc.local
docker logs centos$centosPort