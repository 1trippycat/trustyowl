<template>
  <section
    id="solutions"
    ref="sectionRef"
    class="panel bg-gradient-to-br from-white to-[#f0f4f8]"
    :class="{ 'fade-in': true, 'visible': isVisible }"
    >
    <div class="container mx-auto px-6">
      <div class="split-container">
          <div class="split-left">
              <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b]">Unlock Efficiency with Workflow Automation</h2>
              <p class="text-lg mb-8">Transform your manual processes into streamlined workflows that save time, reduce errors, and free your team to focus on what matters most.</p>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div class="bg-white p-6 rounded-lg shadow-sm">
                      <div class="w-10 h-10 mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                          <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                              <path fill="currentColor" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                          </svg>
                      </div>
                      <h3 class="font-bold mb-2">Process Optimization</h3>
                      <p class="text-sm">Identify and automate repetitive tasks to maximize efficiency.</p>
                  </div>
                  <div class="bg-white p-6 rounded-lg shadow-sm">
                      <div class="w-10 h-10 mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                           <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                              <path fill="currentColor" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                          </svg>
                      </div>
                      <h3 class="font-bold mb-2">Error Reduction</h3>
                      <p class="text-sm">Minimize human error with automated data handling.</p>
                  </div>
              </div>
          </div>
          <div class="split-right">
              <div class="relative h-96">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-64 h-64 bg-[#4db6ac] rounded-full opacity-10"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-56 h-56 bg-[#4db6ac] rounded-full opacity-20"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-48 h-48 bg-[#4db6ac] rounded-full opacity-30"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="relative w-40 h-40">
                          <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                              <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b] gear">
                                  <path fill="currentColor" d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                              </svg>
                          </div>
                          <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                              <svg viewBox="0 0 24 24" class="w-16 h-16 text-[#ff8a65] gear" style="animation-direction: reverse;">
                                  <path fill="currentColor" d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                              </svg>
                          </div>
                      </div>
                  </div>
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
