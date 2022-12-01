<template>
  <div>
    <!--    search form-->
    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="book name" v-model="params.name"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="book number" v-model="params.bookNo"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> Search</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> Reset</el-button>
    </div>

    <el-table :data="tableData" stripe row-key="id"  default-expand-all>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="name" label="book name"></el-table-column>
      <el-table-column prop="bookNo" label="book number"></el-table-column>
      <el-table-column prop="description" width="200" label="description"></el-table-column>
      <el-table-column prop="publishDate" label="publishDate"></el-table-column>
      <el-table-column prop="author" label="author"></el-table-column>
      <el-table-column prop="publisher" label="publisher"></el-table-column>
      <el-table-column prop="category" label="category"></el-table-column>
      <el-table-column prop="score" label="points"></el-table-column>
      <el-table-column prop="nums" label="number"></el-table-column>
      <el-table-column prop="cover" label="cover">
        <template v-slot="scope">
          <el-image :src="scope.row.cover" :preview-src-list="[scope.row.cover]"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="createtime" label="create time"></el-table-column>
      <el-table-column prop="updatetime" label="update time"></el-table-column>
      <el-table-column label="operation" width="140">
        <template v-slot="scope">
          <!--          scope.row 就是当前行数据-->
          <el-button type="primary" @click="$router.push('/editBook?id=' + scope.row.id)">Edit</el-button>
          <el-popconfirm
              style="margin-left: 5px"
              title="do you want deelte this？"
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
  name: 'BookList',
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
      request.get('/book/page', {
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
        name: '',
        bookNo: ''
      }
      this.load()
    },
    handleCurrentChange(pageNum) {
      // 点击分页按钮触发分页
      this.params.pageNum = pageNum
      this.load()
    },
    del(id) {
      request.delete("/book/delete/" + id).then(res => {
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