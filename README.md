I had trouble getting boot2docker 1.7 start on Yosemite b/c of weird TLS stuff.  Here's what fixed it for me:

```
boot2docker start
boot2docker shellinit
boot2docker ssh sudo /etc/init.d/docker restart
```
