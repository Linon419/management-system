<template>
  <div>
    <!--    search form-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="category name" v-model="params.name"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset</el-button>
    </div>

    <el-table :data="tableData" stripe row-key="id"  default-expand-all>
      <el-table-column prop="id" label="id" width="80"></el-table-column>
      <el-table-column prop="name" label="name"></el-table-column>
      <el-table-column prop="remark" label="remark"></el-table-column>
      <el-table-column prop="createtime" label="create time"></el-table-column>
      <el-table-column prop="updatetime" label="update time"></el-table-column>
      <el-table-column label="操作" width="280">
        <template v-slot="scope">
          <!--          scope.row 就是当前行数据-->
          <el-button type="success" v-if="!scope.row.pid" @click="handleAdd(scope.row)">Add secondary category</el-button>
          <el-button type="primary" @click="$router.push('/editCategory?id=' + scope.row.id)">Edit</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="Do you want delete this data？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">Delete</el-button>
          </el-popconfirm>
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

    <el-dialog title="Add secondary category" :visible.sync="dialogFormVisible" width="30%">
      <el-form :model="form" label-width="100px" ref="ruleForm" :rules="rules" style="width: 85%">
        <el-form-item label="category name" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="category remark" prop="remark">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="save">Confirm</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import request from "@/utils/request";
import Cookies from 'js-cookie'

export default {
  name: 'CategoryList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      dialogFormVisible: false,
      form: {},
      pid: null,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
      },
      rules: {
        name: [
          {required: true, message: 'Category name', trigger: 'blur'}
        ]
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/category/page', {
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
        name: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/category/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success('delete successful')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    handleAdd(row) {
      // 将当前行的id作为二级分类的pid
      this.pid = row.id
      this.dialogFormVisible = true
    },
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          // 给二级分类赋值 pid
          this.form.pid = this.pid
          request.post('/category/save', this.form).then(res => {
            if (res.code === '200') {
              this.$notify.success('Add secondary category successful')
              this.$refs['ruleForm'].resetFields()
              this.dialogFormVisible = false
              this.load()
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

<style scoped>

</style>