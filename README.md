## Create Container

- Create a docker container based on ubuntu/lunar (23.04). 
- Give it a specific name. 
- Map a directory inside of it called **/var/temp** to the current working directory: 

``` shell
docker run --name elfa -v ${PWD}:/var/tmp -it ubuntu:lunar /bin/bash
```