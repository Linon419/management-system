<template>
  <div style="width: 80%">
    <div style="margin-bottom: 30px">Edit User</div>
    <el-form :inline="true" :model="form" label-width="100px">
      <el-form-item label="card number">
        <el-input v-model="form.username" disabled></el-input>
      </el-form-item>
      <el-form-item label="name">
        <el-input v-model="form.name" placeholder="Name"></el-input>
      </el-form-item>
      <el-form-item label="age">
        <el-input v-model="form.age" placeholder="Age"></el-input>
      </el-form-item>
      <el-form-item label="gender">
        <el-input v-model="form.sex" placeholder="Gender"></el-input>
      </el-form-item>
      <el-form-item label="Phone">
        <el-input v-model="form.phone" placeholder="Phone"></el-input>
      </el-form-item>
      <el-form-item label="address">
        <el-input v-model="form.address" placeholder="Address"></el-input>
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
  name: 'EditUser',
  data() {
    return {
      form: {}
    }
  },
  created() {
    const id = this.$route.query.id
    request.get("/user/" + id).then(res => {
      this.form = res.data
    })
  },
  methods: {
    save() {
      request.put('/user/update', this.form).then(res => {
        if (res.code === '200') {
          this.$notify.success('update successful')
          this.$router.push("/userList")
        } else {
          this.$notify.error(res.msg)
        }
      })
    }
  }
}

</script>
