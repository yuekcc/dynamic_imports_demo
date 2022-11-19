<script setup>
import { ref } from 'vue';

const name = ref('Tom');
</script>

<template>
  <el-card>
    <h1>App Name Card</h1>
    <div>My name is {{ name }}.</div>
  </el-card>
</template>
