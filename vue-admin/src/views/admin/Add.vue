<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">add new admins</div>
    <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm" label-width="100px">
      <el-form-item label="user name" prop="username">
        <el-input v-model="form.username" placeholder="user name"></el-input>
      </el-form-item>
      <el-form-item label="phone" prop="phone">
        <el-input v-model="form.phone" placeholder="phone"></el-input>
      </el-form-item>
      <el-form-item label="email" prop="email">
        <el-input v-model="form.email" placeholder="email"></el-input>
      </el-form-item>
    </el-form>

    <div style="text-align: center; margin-top: 30px">
      <el-button type="primary" @click="save" size="medium">Submit</el-button>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: 'AddAdmin',
  data() {
    const checkPhone = (rule, value, callback) => {
      if (!/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(value)) {
        callback(new Error('Wrong number'));
      }
      callback()
    };
    return {
      form: {},
      rules: {
        username: [
          { required: true, message: 'Enter username', trigger: 'blur'},
          { min: 3, max: 10, message: '3-10 characters', trigger: 'blur'}
        ],
        phone: [
          // { validator: checkPhone, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/admin/save', this.form).then(res => {
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
