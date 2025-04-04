<template>
  <BaseLayout>
    <router-view />
    </BaseLayout>
</template>

<script setup lang="ts">
import BaseLayout from './components/BaseLayout.vue';
// Components like TheChallenge, EnterTheGuide etc. are now managed by views/HomeView.vue via the router
</script>
