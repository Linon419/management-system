<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">New category</div>
    <el-form :inline="true" :rules="rules" ref="ruleForm" :model="form" label-width="100px">
      <el-form-item label="name" prop="name">
        <el-input v-model="form.name" placeholder="name"></el-input>
      </el-form-item>
      <el-form-item label="remark" prop="remark">
        <el-input v-model="form.remark" placeholder="remark"></el-input>
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
  name: 'AddCategory',
  data() {
    return {
      form: {},
      rules: {
        name: [
          { required: true, message: 'category name', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          request.post('/category/save', this.form).then(res => {
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
