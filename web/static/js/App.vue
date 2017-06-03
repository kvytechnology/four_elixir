<template>
  <el-menu :default-active="activeIndex2" class="el-menu-demo" mode="horizontal">
    <el-menu-item class="logoname">
      <a href="/">4Elixir</a>
    </el-menu-item>
  </el-menu>
</template>

<script>
export default {
  data () {
    return {
    }
  }
}
</script>

<style scoped>
.logoname {
  font-size: 26px;
}
a {
  text-decoration: none;
}
</style>
