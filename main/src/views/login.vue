<!--
 * @Description:
 * @Author: lishifeng
 * @Date: 2022-01-26 15:14:48
 * @LastEditors: zhangsh0907 44243174@qq.com
 * @LastEditTime: 2022-05-31 14:50:25
-->
<template>
  <div class="login">
    <div class="login-form">
      <div class="title">后台管理系统</div>

      <el-form
        ref="loginForm"
        :model="formData"
        :rules="dataRule"
        status-icon
        @keyup.enter.native="login()"
      >
        <el-form-item prop="username">
          <span class="icon-wrap"><i class="icon el-icon-user-solid"></i></span>
          <el-input v-model="formData.username" placeholder="请输入用户名" />
        </el-form-item>
        <el-form-item prop="password">
          <span class="icon-wrap"><i class="icon el-icon-lock"></i></span>
          <el-input
            v-model="formData.password"
            type="password"
            placeholder="请输入密码"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      formData: {
        username: 'admin',
        password: '123456'
      },
      dataRule: Object.freeze({
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' }
        ],
        password: [{ required: true, message: '密码不能为空', trigger: 'blur' }]
      })
    }
  },
  methods: {
    login () {
      this.$refs.loginForm.validate((isPassed) => {
        if (!isPassed) return

        const loading = this.$loading({
          lock: true,
          text: '请求中'
        })
        setTimeout(() => {
          loading.close()
          this.$message.success('登录成功')
          this.$router.replace({ name: 'home' })
        }, 2000)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.login {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.25);
  .login-form {
    width: 500px;
    height: 400px;
    background: #fff;
    position: fixed;
    top: 50%;
    right: 10%;
    transform: translateY(-50%);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
    border-radius: 12px;
    .title {
      font-size: 26px;
      color: #409eff;
      text-align: center;
      height: 40px;
      line-height: 40px;
      margin-top: 50px;
    }
    .el-form {
      width: 360px;
      margin: 50px auto 0;
      .el-form-item {
        position: relative;
        .icon-wrap {
          position: absolute;
          top: 50%;
          transform: translateY(-50%);
          z-index: 9;
          padding: 0 10px;
          ::after {
            display: inline-block;
            content: '';
            width: 1px;
            height: 14px;
            background: #ccc;
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
          }
          .icon {
            font-size: 14px;
            color: #333;
          }
        }
        .el-input {
          ::v-deep input {
            padding-left: 45px;
          }
        }
      }
      .el-button {
        width: 100%;
        margin-top: 20px;
      }
    }
  }
}
</style>
