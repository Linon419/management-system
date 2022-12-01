<template>
  <div>
    <!--    搜索表单-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="book name" v-model="params.bookName"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="book number" v-model="params.bookNo"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="user name" v-model="params.userName"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset</el-button>
    </div>

    <el-table :data="tableData" stripe row-key="id"  default-expand-all>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="bookName" label="book name"></el-table-column>
      <el-table-column prop="bookNo" label="book number"></el-table-column>
      <el-table-column prop="userNo" label="user number"></el-table-column>
      <el-table-column prop="userName" label="user name"></el-table-column>
      <el-table-column prop="userPhone" label="user phone"></el-table-column>
      <el-table-column prop="score" label="required of points"></el-table-column>
      <el-table-column prop="createtime" label="date of lent"></el-table-column>
      <el-table-column prop="status" label="status"></el-table-column>
      <el-table-column prop="days" label="days of lent"></el-table-column>
      <el-table-column prop="returnDate" label="date of return"></el-table-column>
      <el-table-column prop="note" label="expired reminder">
        <template v-slot="scope">
          <el-tag type="success" v-if="scope.row.note === 'normal'">{{ scope.row.note }}</el-tag>
          <el-tag type="primary" v-if="scope.row.note === 'expire soon'">{{ scope.row.note }}</el-tag>
          <el-tag type="warning" v-if="scope.row.note === 'expires'">{{ scope.row.note }}</el-tag>
          <el-tag type="danger" v-if="scope.row.note === 'outdated'">{{ scope.row.note }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="management">
        <template v-slot="scope">
          <el-button type="primary" @click="returnBooks(scope.row)" v-if="scope.row.status === 'lent'">return books</el-button>
        </template>
      </el-table-column>
      <el-table-column label="operation">
        <template v-slot="scope">
          <!--          scope.row 就是当前行数据-->
          <!--          <el-button type="primary" @click="$router.push('/editBorrow?id=' + scope.row.id)">编辑</el-button>-->
          <el-popconfirm
              style="margin-left: 5px"
              title="do you want delete this？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">delete</el-button>
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
  name: 'BorrowList',
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
      request.get('/borrow/page', {
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
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/borrow/delete/" + id).then(res => {
        if (res.code === '200') {
          this.$notify.success('delete successful')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
    returnBooks(row) {
      request.post("/borrow/saveRetur", row).then(res => {
        if (res.code === '200') {
          this.$notify.success('return successful')
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