I had trouble getting boot2docker 1.7 start on Yosemite b/c of weird TLS stuff.  Here's what fixed it for me:

```
boot2docker start
boot2docker shellinit
boot2docker ssh sudo /etc/init.d/docker restart
```

## To build it

```
docker build -t mapr-drill .
```

## To start it

```
docker run -it \
  -p 8888:8888 \
  -p 8047:8047 \
  -v $(pwd):/usr/home \
  -w /usr/home \
  mapr-drill \
  /bin/bash
```

Then, once you're at the shell, run start script

```
./start.sh
```
