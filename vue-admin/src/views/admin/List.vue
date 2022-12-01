<template>
  <div>
    <!--    Search form-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="user name" v-model="params.username"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="phone" v-model="params.phone"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="email" v-model="params.email"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset</el-button>
    </div>

    <el-table :data="tableData" stripe>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="username" label="user name"></el-table-column>
      <el-table-column prop="phone" label="phone"></el-table-column>
      <el-table-column prop="email" label="email"></el-table-column>
      <el-table-column prop="createtime" label="create time"></el-table-column>
      <el-table-column prop="updatetime" label="update time"></el-table-column>
      <el-table-column label="status" width="230">
        <template v-slot="scope">
          <el-switch
              v-model="scope.row.status"
              @change="changeStatus(scope.row)"
              active-color="#13ce66"
              inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column label="operation" width="230">
        <template v-slot="scope">
          <!--          scope.row 就是当前行数据-->
          <el-button type="primary" @click="$router.push('/editAdmin?id=' + scope.row.id)">Edit</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="Do you want delete this data？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">Delete</el-button>
          </el-popconfirm>
          <el-button style="margin-left: 5px" type="warning" @click="handleChangePass(scope.row)">Change password</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--    pagination-->
    <div style="margin-top: 20px">
      <el-pagination
          background
          :current-page="params.pageNum"
          :page-size="params.pageSize"
          layout="prev, pager, next"
          @current-change="handleCurrentChange"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="change password" :visible.sync="dialogFormVisible" width="30%">
      <el-form :model="form" label-width="100px" ref="formRef" :rules="rules">
        <el-form-item label="new password" prop="newPass">
          <el-input v-model="form.newPass" autocomplete="off" show-password></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="savePass">Confirm</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import request from "@/utils/request";
import Cookies from 'js-cookie'

export default {
  name: 'AdminList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      form: {},
      dialogFormVisible: false,
      params: {
        pageNum: 1,
        pageSize: 10,
        username: '',
        phone: '',
        email: ''
      },
      rules: {
        newPass: [
          {required: true, message: 'enter new password', trigger: 'blur'},
          {min: 3, max: 10, message: '3-10 characters', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeStatus(row) {
      if (this.admin.id === row.id && !row.status) {
        row.status = true
        this.$notify.warning('wrong operation')
        return
      }
      request.put('/admin/update', row).then(res => {
        if (res.code === '200') {
          this.$notify.success('successful')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    handleChangePass(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    savePass() {
      this.$refs['formRef'].validate((valid) => {
        if (valid) {
          request.put('/admin/password', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success("edit successful")
              if (this.form.id === this.admin.id) {   // 当前修改的用户id 等于当前登录的管理员id，那么修改成功之后需要重新登录
                Cookies.remove('admin')
                this.$router.push('/login')
              } else {
                this.load()
                this.dialogFormVisible = false
              }
            } else {
              this.$notify.error("edit failure")
            }
          })
        }
      })
    },
    load() {
      request.get('/admin/page', {
        params: this.params
      }).then(res => {
        if (res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },
    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        username: '',
        phone: '',
        email: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/admin/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success('delete successful')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}
</script>

<style scoped>

</style>