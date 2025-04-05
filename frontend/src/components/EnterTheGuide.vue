<!-- filepath: /storage/trustyowl/frontend/src/components/EnterTheGuide.vue -->
<template>
  <section
    ref="sectionRef"
    class="min-h-screen pt-32 pb-16 w-full relative overflow-hidden flex items-center bg-gradient-to-br from-[#e3f2fd] to-white border-gradient"
    :class="{ 'opacity-0 translate-y-5': !isVisible, 'opacity-100 translate-y-0': isVisible, 'transition-all duration-700 ease-in-out': true }"
  >
    <div class="container mx-auto px-6">
      <div class="flex flex-wrap items-center">
        <div class="w-full md:w-1/2 relative h-96">
          <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
            <div class="w-64 h-64 bg-gradient-to-br from-[#2a4f4b] to-[#4db6ac] rounded-full flex items-center justify-center shadow-xl">
              <svg viewBox="0 0 24 24" class="w-32 h-32 text-white animate-blink">
                <path
                  fill="currentColor"
                  d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13C13.1,13 14,13.9 14,15C14,16.1 13.1,17 12,17M18,15.22C18,14.1 18.25,13.03 18.68,12.05L19.86,8.93C19.94,8.68 20,8.4 20,8.09C20,6.94 19.08,6 17.93,6H6.07C4.92,6 4,6.94 4,8.09C4,8.4 4.06,8.68 4.14,8.93L5.32,12.05C5.75,13.03 6,14.1 6,15.22V17A2,2 0 0,1 4,19V20A1,1 0 0,0 5,21H19A1,1 0 0,0 20,20V19A2,2 0 0,1 18,17V15.22M12,6C10.5,6 9.15,6.67 8.24,7.76L9.66,9.17C10.28,8.42 11.11,8 12,8C12.89,8 13.72,8.42 14.34,9.17L15.76,7.76C14.85,6.67 13.5,6 12,6Z"
                />
              </svg>
            </div>
          </div>
        </div>
        <div class="w-full md:w-1/2">
          <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b]">Meet Trusty Owl: Your Guide to Smarter Business</h2>
          <p class="text-lg mb-8">In the complex forest of business operations, you need a wise guide. Trusty Owl combines deep expertise with innovative technology to help SMBs navigate challenges and soar to new heights.</p>
          <div class="flex items-center">
            <div class="w-12 h-12 mr-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
              <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                <path fill="currentColor" d="M12,2L4,12L12,22L20,12L12,2Z" />
              </svg>
            </div>
            <p class="font-semibold">Trusted by businesses across industries</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useIntersectionObserver } from '@vueuse/core';

const sectionRef = ref<HTMLElement | null>(null);
const isVisible = ref(false);

useIntersectionObserver(
  sectionRef,
  ([{ isIntersecting }]) => {
    if (isIntersecting) {
      isVisible.value = true;
    }
  },
  { threshold: 0.2 }
);
</script>

<style>
/* Add the gradient border utility class */
.border-gradient {
  border: 8px solid transparent; /* Adjust border width as needed */
  border-image: linear-gradient(45deg, #ff7e5f, #feb47b, #6a11cb, #2575fc, #43cea2, #185a9d) 1;
  border-radius: 12px; /* Optional: Add rounded corners */
}
</style>