@echo off
set /p centosPort="input centos port:" 
echo centos port:%centosPort%
docker run -dit --name centos%centosPort% --hostname centos%centosPort% --net=host --restart=unless-stopped  -v /home/data/centos/%centosPort%:/usr/local/app --privileged=true centos76:1.0 /etc/rc.local
docker logs centos%centosPort%
@echo on