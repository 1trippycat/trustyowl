<template>
  <div class="app-container">
    <router-view v-slot="{ Component }">
      <transition name="fade" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
  </div>
</template>

<script setup lang="ts">
// Root app component - serves as a container for router views
</script>

<style>
.app-container {
  @apply relative min-h-screen;
}

.fade-enter-active,
.fade-leave-active {
  @apply transition-opacity duration-200 ease-in;
}

.fade-enter-from,
.fade-leave-to {
  @apply opacity-0;
}

/* Import additional fonts if needed */
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap');
</style>
