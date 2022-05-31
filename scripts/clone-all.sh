rm -rf ./common
###
 # @Author: zhangsh0907 44243174@qq.com
 # @Date: 2022-05-30 10:07:35
 # @LastEditors: zhangsh0907 44243174@qq.com
 # @LastEditTime: 2022-05-30 15:39:58
 # @FilePath: \project-qiankun\scripts\clone-all.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
# rm -rf ./all-project
rm -rf ./pc-web
rm -rf ./tunnel_2.0
# rm -rf ./main

# git clone https://gitee.com/qiankun-demo/common.git
# git clone https://gitee.com/qiankun-demo/app1.git
# git clone https://gitee.com/qiankun-demo/app2.git
# git clone https://gitee.com/qiankun-demo/main.git
# mkdir all-project
# cd all-project

git clone https://gitlab.bimwinner.com/dip/pc/pc-web
git svn clone  -rHEAD https://win-5ohtj3tigh0:8443/svn/03智慧隧道运维管理平台/03源代码/source-code-client/tunnel_2.0/


# SUB_SERVICE_GIT=(
#     "https://gitlab.bimwinner.com/dip/pc/pc-web"
#     "https://win-5ohtj3tigh0:8443/svn/03智慧隧道运维管理平台/03源代码/source-code-client/tunnel_2.0/"
# )
# SUB_SERVICE_NAME=('pc-web' 'tunnel_2')
# if [ ! -d "all-project" ]; then
#    echo '创建'
#    mkdir all-project
# fi 
#     echo '进入'
#     cd all-project
    
# for i in ${!SUB_SERVICE_NAME[@]}

# do
# echo 'one'${!SUB_SERVICE_NAME[@]}
# echo 'two'${SUB_SERVICE_NAME[@]}
# echo 'three'${SUB_SERVICE_NAME[$1]}
# echo '99999999'${SUB_SERVICE_NAME[$1]}==pc-web
# if [${SUB_SERVICE_NAME[$1]} == pc-web]; then
# echo 'ok11'${SUB_SERVICE_NAME[$1]}
# git clone -rHEAD ${SUB_SERVICE_GIT[$i]}
# else 
# echo 'ok22'${SUB_SERVICE_NAME[$1]}
# git svn clone -rHEAD ${SUB_SERVICE_GIT[$i]}
#  fi
#  done 

#  echo '脚本结束...'





# for i in ${!SUB_SERVICE_NAME[@]}

# do
# echo '克隆微服务项目'${!SUB_SERVICE_NAME[@]}
# echo '克隆微服务项目非'${SUB_SERVICE_NAME[@]}
# echo '${SUB_SERVICE_NAME[$1]'${SUB_SERVICE_NAME[$1]}
# if [! -d ${SUB_SERVICE_NAME[$1]}]; then
#  echo '${SUB_SERVICE_NAME[$1]---'${SUB_SERVICE_NAME[$1]}
#  git clone -rHEAD ${SUB_SERVICE_GIT[$i]}
#  fi
#  done 

#  echo '脚本结束...'