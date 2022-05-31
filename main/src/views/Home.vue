<!--
 * @Description:
 * @Author: lishifeng
 * @Date: 2022-01-26 15:14:48
 * @LastEditors: zhangsh0907 44243174@qq.com
 * @LastEditTime: 2022-05-31 15:15:01
-->
<template>
  <el-container style="height: 100%">
    <el-aside width="200px">
      <div class="logo-container">后台管理系统</div>
      <el-menu :default-active="activeMenu">
        <!-- 子应用路由切换 -->
        <el-menu-item
          v-for="(item, index) in asideMenu"
          :key="index"
          :index="index + ''"
          @click="switchSubApp(item)"
        >
          <i class="el-icon-menu"></i><span slot="title">{{ item.title }}</span>
        </el-menu-item>
      </el-menu>
    </el-aside>

    <el-container>
      <el-header>
        <el-menu
          mode="horizontal"
          default-active="0"
          background-color="transparent"
          active-text-color="#409EFF"
        >
          <!-- 主应用路由切换 -->
          <el-menu-item
            index="0"
            @click="
              switchSubApp({ type: 'main', activeRule: '/home/main-app' })
            "
          >
            首页
          </el-menu-item>
        </el-menu>

        <div class="header-right">
          <el-dropdown>
            <el-avatar
              src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png"
            ></el-avatar>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item @click.native="logout()"
                >退出登录</el-dropdown-item
              >
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-header>

      <el-main>
        <div class="home">
          <router-view />
          <!-- 子应用容器 -->
          <div id="subapp-viewport"></div>
        </div>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import { start } from 'qiankun'

export default {
  data () {
    return {
      asideMenu: Object.freeze([
        { title: '主应用', type: 'main', activeRule: '/home/main-app' },
        { title: 'sub-vue', type: 'sub', activeRule: '/home/sub-vue' },
        { title: 'sub-react', type: 'sub', activeRule: '/home/sub-react' },
        { title: 'sub-html', type: 'sub', activeRule: '/home/sub-html' }
      ]),
      activeMenu: '0'
    }
  },
  mounted () {
    start()
  },
  methods: {
    switchSubApp (item) {
      if (this.$router.currentRoute.path === item.activeRule) return

      switch (item.type) {
        case 'main':
          this.$router.push({ path: item.activeRule })
          break
        case 'sub':
          history.pushState(null, item.activeRule, item.activeRule)
          break
      }
    },
    logout () {
      this.$router.replace({ name: 'login' })
    }
  }
}
</script>

<style lang="scss" scoped>
.el-aside {
  display: flex;
  flex-direction: column;
  .logo-container {
    box-sizing: border-box;
    height: 60px;
    line-height: 60px;
    text-align: center;
    border-bottom: solid 1px #e6e6e6;
  }
  .el-menu {
    flex: 1;
  }
}
.el-header {
  border-bottom: solid 1px #e6e6e6;
  display: flex;
  align-items: stretch;
  .el-menu {
    flex: 1;
    border: none;
    .el-menu-item:hover {
      background-color: #ecf5ff !important;
    }
  }
  .header-right {
    display: flex;
    align-items: center;
  }
}
</style>
