<template>
  <div class="home">


  </div>
</template>

<script>
import Cookies from 'js-cookie'
export default {
  name: "Layout.vue",
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')) : {}
    }
  },
  methods: {
    logout() {
      // clear cookies
      Cookies.remove('admin')
      this.$router.push('/login')
    }
  }
}
</script>
