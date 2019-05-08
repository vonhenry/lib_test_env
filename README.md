# lib_test_env
BOSCore LIB Test Environment


### 使用手册
``` 
Step 1. 配置环境变量
配置./chain/env.sh 和 ./lib-test/env.sh中的环境变量


Step 1: 启动链
$ cd ./chain
$ ./cluster.sh init        初始化，或重新初始化
$ ./cluster.sh start

操作节点
$ ./cluster.sh down 1,2,3  停止编号1，2，3的节点
$ ./cluster.sh up 1,2,3    重新启动编号1，2，3的节点

Step 2: 部署系统合约，创建BP并投票
$ cd ./lib-test
$ . chain_run.sh




```