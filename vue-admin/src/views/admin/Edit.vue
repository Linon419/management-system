<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Edit admin</div>
    <el-form :inline="true" :model="form" label-width="100px">
      <el-form-item label="user name" prop="username">
        <el-input v-model="form.username" placeholder="user name"></el-input>
      </el-form-item>
      <el-form-item label="phone" prop="phone">
        <el-input v-model="form.phone" placeholder="phone"></el-input>
      </el-form-item>
      <el-form-item label="email" prop = "email">
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
  name: 'EditAdmin',
  data() {
    return {
      form: {}
    }
  },
  created() {
    const id = this.$route.query.id
    request.get("/admin/" + id).then(res => {
      this.form = res.data
    })
  },
  methods: {
    save() {
      request.put('/admin/update', this.form).then(res => {
        if (res.code === '200') {
          this.$notify.success('update successful')
          this.$router.push("/adminList")
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}

</script>
