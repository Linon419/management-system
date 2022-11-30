<template>
  <div>
    <!-- header -->
    <div style="height: 60px; line-height: 60px; background-color: white; margin-bottom: 2px; display: flex">
      <div style="width: 300px">
        <img src="@/assets/logo.png" alt="" style="width: 40px; position: relative; top: 10px; left: 20px">
        <span style="margin-left: 25px; font-size: 24px">Library-Admin</span>
      </div>
      <div style="flex: 1; text-align: right; padding-right: 20px">
        <el-dropdown size="medium">
          <span class="el-dropdown-link" style="cursor: pointer">
            {{ admin.username }}<i class="el-icon-arrow-down el-icon--right"></i>
          </span>
          <el-dropdown-menu slot="dropdown" style="margin-top: -5px">
            <el-dropdown-item><div style="width: 50px; text-align: center;" @click="logout">Logout</div></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!-- sidebar and body -->
    <div style="display: flex">
      <!-- sidebar -->
      <div style="width: 200px; min-height: calc(100vh - 62px); overflow: hidden; margin-right: 2px; background-color: white">
        <el-menu :default-active="$route.path" router class="el-menu-demo" style="margin-bottom: 10px">
          <el-menu-item index="/">
            <i class="el-icon-eleme"></i>
            <span>Home</span>
          </el-menu-item>
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-question"></i>
              <span>Members management</span>
            </template>
            <el-menu-item index="/addUser">add member</el-menu-item>
            <el-menu-item index="/userList">member list</el-menu-item>
          </el-submenu>
          <el-submenu index="admin">
            <template slot="title">
              <i class="el-icon-user"></i>
              <span>Admin management</span>
            </template>
            <el-menu-item index="/addAdmin">add admin</el-menu-item>
            <el-menu-item index="/adminList">admin list</el-menu-item>
          </el-submenu>
          <el-submenu index="category">
            <template slot="title">
              <i class="el-icon-s-operation"></i>
              <span>Category</span>
            </template>
            <el-menu-item index="/addCategory">add category</el-menu-item>
            <el-menu-item index="/categoryList">category list</el-menu-item>
          </el-submenu>
          <el-submenu index="book">
            <template slot="title">
              <i class="el-icon-notebook-1"></i>
              <span>Books</span>
            </template>
            <el-menu-item index="/addBook">add books</el-menu-item>
            <el-menu-item index="/bookList">book list</el-menu-item>
          </el-submenu>
          <el-submenu index="borrow">
            <template slot="title">
              <i class="el-icon-document-copy"></i>
              <span>Borrow</span>
            </template>
            <el-menu-item index="/addBorrow">add</el-menu-item>
            <el-menu-item index="/borrowList">list</el-menu-item>
          </el-submenu>
          <el-submenu index="retur">
            <template slot="title">
              <i class="el-icon-document"></i>
              <span>Return</span>
            </template>
            <el-menu-item index="/returList">return list</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>

      <!-- body -->
      <div style="flex: 1; width: 0; background-color: white; padding: 10px">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Cookies from 'js-cookie'

export default {
  name: "Layout.vue",
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
    }
  },
  methods: {
    logout() {
      Cookies.remove('admin')
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>

</style>