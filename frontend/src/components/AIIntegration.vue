<template>
  <section
    ref="sectionRef"
    class="panel bg-gradient-to-br from-[#f0f4f8] to-white"
    :class="{ 'fade-in': true, 'visible': isVisible }"
  >
    <div class="container mx-auto px-6">
      <div class="split-container">
          <div class="split-left">
              <div class="relative h-96">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-64 h-64 bg-[#fbc02d] rounded-full opacity-10"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-56 h-56 bg-[#fbc02d] rounded-full opacity-20"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="w-48 h-48 bg-[#fbc02d] rounded-full opacity-30"></div>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="relative w-40 h-40">
                          <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                              <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b] float">
                                  <path fill="currentColor" d="M12,3A9,9 0 0,0 3,12A9,9 0 0,0 12,21A9,9 0 0,0 21,12A9,9 0 0,0 12,3M12,19A7,7 0 0,1 5,12A7,7 0 0,1 12,5A7,7 0 0,1 19,12A7,7 0 0,1 12,19M12.5,11H11V7H13V9.3L14.5,7.1L16,9.3L13.5,11H12.5Z" />
                              </svg>
                          </div>
                          <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                              <div class="w-16 h-16 bg-[#4db6ac] rounded-full flex items-center justify-center pulse">
                                  <svg viewBox="0 0 24 24" class="w-10 h-10 text-white">
                                      <path fill="currentColor" d="M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" />
                                  </svg>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <div class="split-right">
              <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b]">Make Smarter Decisions with AI Integration</h2>
              <p class="text-lg mb-8">We make artificial intelligence accessible and actionable for SMBs, turning your data into strategic insights that drive growth.</p>
              <div class="space-y-6">
                  <div class="flex items-start">
                      <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                          <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"> <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>
                      </div>
                      <div>
                          <h3 class="font-bold mb-2">Predictive Analytics</h3>
                          <p>Anticipate trends and customer needs before they emerge.</p>
                      </div>
                  </div>
                  <div class="flex items-start">
                      <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                           <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"> <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>
                      </div>
                      <div>
                          <h3 class="font-bold mb-2">Customer Insights</h3>
                          <p>Understand your customers at a deeper level to serve them better.</p>
                      </div>
                  </div>
                  <div class="flex items-start">
                      <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                           <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"> <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" /></svg>
                      </div>
                      <div>
                          <h3 class="font-bold mb-2">Operational Intelligence</h3>
                          <p>Identify bottlenecks and opportunities in your workflows.</p>
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
