<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Add new book</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="name" prop="name">
        <el-input v-model="form.name" placeholder="name"></el-input>
      </el-form-item>
      <el-form-item label="description" prop="description">
        <el-input style="width: 400px" type="textarea" v-model="form.description" placeholder="description"></el-input>
      </el-form-item>
      <el-form-item label="publish Date" prop="publishDate">
        <el-date-picker
            v-model="form.publishDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="select publishDate">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="author" prop="author">
        <el-input v-model="form.author" placeholder="author"></el-input>
      </el-form-item>
      <el-form-item label="publisher" prop="publisher">
        <el-input v-model="form.publisher" placeholder="publisher"></el-input>
      </el-form-item>
      <el-form-item label="category" prop="category">
        <el-cascader
            style="width: 220px"
            :props="{ value: 'name', label: 'name'}"
            v-model="form.categories"
            :options="categories"></el-cascader>
      </el-form-item>
      <el-form-item label="bookNo" prop="bookNo">
        <el-input v-model="form.bookNo" placeholder="bookNo"></el-input>
      </el-form-item>
      <el-form-item label="points" prop="score">
        <el-input-number v-model="form.score" :min="10" :max="30" label="required points"></el-input-number>
      </el-form-item>
      <el-form-item label="numbers" prop="nums">
        <el-input v-model="form.nums" placeholder="numbers"></el-input>
      </el-form-item>
      <br>
      <el-form-item label="cover" prop="cover">
        <el-upload
            class="avatar-uploader"
            :action="'http://localhost:9090/api/book/file/upload?token=' + this.admin.token"
            :show-file-list="false"
            :on-success="handleCoverSuccess"
        >
          <img v-if="form.cover" :src="form.cover" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
    </el-form>

    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">Submit</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";
import Cookies from "js-cookie";

export default {
  name: 'AddBook',
  data() {
    const checkNums = (rule, value, callback) => {
      value = parseInt(value)
      if (value < 0 || value >= 1000) {
        callback(new Error('Wrong number'));
      }
      callback()
    };
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      form: {  score: 10, cover: '' },
      categories: [],
      rules: {
        name: [
          { required: true, message: 'Book name required', trigger: 'blur'}
        ],
        bookNo: [
          { required: true, message: 'Book number required', trigger: 'blur'}
        ],
        score: [
          { validator: checkNums, trigger: 'blur' }
        ],
        nums: [
          { required: true, message: 'number required', trigger: 'blur'},
          { validator: checkNums, trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    request.get('/category/tree').then(res => {
      this.categories = res.data
    })
  },
  methods: {
    handleCoverSuccess(res) {
      if (res.code === '200') {
        console.log(res.data)
        // this.$set(this.form, 'cover', res.data)
        this.form.cover = res.data
      }
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/book/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('add successful')
              this.$refs['ruleForm'].resetFields()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    }
  }
}

</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>