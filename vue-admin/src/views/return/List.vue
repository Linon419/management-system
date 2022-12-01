<template>
  <div>
    <!--    search form-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="Book name" v-model="params.name"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="Book number" v-model="params.bookNo"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="User name" v-model="params.userName"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset</el-button>
    </div>

    <el-table :data="tableData" stripe row-key="id"  default-expand-all>
      <el-table-column prop="id" label="book id" width="80"></el-table-column>
      <el-table-column prop="bookName" label="book name"></el-table-column>
      <el-table-column prop="bookNo" label="book number"></el-table-column>
      <el-table-column prop="userNo" label="user number"></el-table-column>
      <el-table-column prop="userName" label="user name"></el-table-column>
      <el-table-column prop="userPhone" label="phone"></el-table-column>
      <el-table-column prop="score" label="Credit used"></el-table-column>
      <el-table-column prop="createtime" label="Date of lent"></el-table-column>
      <el-table-column prop="status" label="Status"></el-table-column>
      <el-table-column prop="days" label="number of days lent"></el-table-column>
      <el-table-column prop="returnDate" label="Date of return"></el-table-column>
      <el-table-column prop="realDate" label="Actual date of return"></el-table-column>
      <el-table-column label="operation">
        <template v-slot="scope">
          <el-popconfirm
              style="margin-left: 5px"
              title="are you sure you want delete this"
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

  </div>
</template>

<script>
import request from "@/utils/request";
import Cookies from 'js-cookie'

export default {
  name: 'ReturList',
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {},
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        name: '',
        bookNo: ''
      }
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      request.get('/borrow/pageRetur', {
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
        bookName: '',
        bookNo: '',
        userName: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {

      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/borrow/deleteRetur/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success('delete successful')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    returnBooks(row) {

    }
  }
}
</script>

<style scoped>

</style>