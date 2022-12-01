<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">New retrun book record</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="Book number" prop="bookNo">
        <el-select v-model="form.bookNo" clearable filterable placeholder="Select" @change="selBook">
          <el-option
              v-for="item in books"
              :key="item.id"
              :label="item.bookNo"
              :value="item.bookNo">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="book name" prop="bookName">
        <el-input v-model="form.bookName" disabled></el-input>
      </el-form-item>
      <el-form-item label="Point required" prop="score">
        <el-input v-model="form.score" disabled></el-input>
      </el-form-item>
      <el-form-item label="book number" prop="nums">
        <el-input v-model="form.nums" disabled></el-input>
      </el-form-item>
      <br />
      <el-form-item label="user number" prop="userNo">
        <el-select v-model="form.userNo" filterable placeholder="Select" @change="selUser">
          <el-option
              v-for="item in users"
              :key="item.id"
              :label="item.username"
              :value="item.username">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="user name" prop="userName">
        <el-input disabled v-model="form.userName"></el-input>
      </el-form-item>
      <el-form-item label="phone" prop="userPhone">
        <el-input disabled v-model="form.userPhone" ></el-input>
      </el-form-item>
      <el-form-item label="user point " prop="account">
        <el-input disabled v-model="form.account" ></el-input>
      </el-form-item>
      <el-form-item label="days of lent" prop="days">
        <el-input-number v-model="form.days" :min="1" :max="30" label="days of lent"></el-input-number>
      </el-form-item>
    </el-form>

    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">submit</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: 'AddBook',
  data() {
    return {
      form: {days: 1},
      books: [],
      users: [],
      rules: {
        bookNo: [
          { required: true, message: 'enter book number', trigger: 'blur'}
        ],
        userNo: [
          { required: true, message: 'enter user number', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    request.get('/book/list').then(res => {
      this.books = res.data
    })

    request.get('/user/list').then(res => {
      this.users = res.data.filter(v => v.status)
    })
  },
  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/borrow/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('add successful')
              this.$refs['ruleForm'].resetFields()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    },
    selBook() {
      const book = this.books.find(v => v.bookNo === this.form.bookNo)
      request.get('/book/' + book.id).then(res => {
        this.$set(this.form, 'bookName', res.data.name)
        this.form.score = res.data.score
        this.form.nums = res.data.nums
      })
    },
    selUser() {
      const user = this.users.find(v => v.username === this.form.userNo)
      request.get('/user/' + user.id).then(res => {
        this.$set(this.form, 'userName', res.data.name)
        this.form.userPhone = res.data.phone
        this.form.account = res.data.account
      })
    }
  }
}

</script>
