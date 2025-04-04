<script setup>
import { ref } from 'vue'

defineProps({
  msg: String,
})

const count = ref(0)
</script>

<template>
  <div class="p-6 max-w-sm mx-auto bg-white rounded-xl shadow-md space-y-4">
    <h1 class="text-2xl font-bold">Hello, Tailwind CSS!</h1>
    <p class="text-gray-500">This is a test component to verify Tailwind CSS integration.</p>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
};
</script>

<style scoped>
/* Scoped styles can be added here if needed */
</style>
