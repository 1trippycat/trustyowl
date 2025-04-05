<!-- filepath: /storage/trustyowl/frontend/src/components/TheTransformation.vue -->
<template>
    <section
      ref="sectionRef"
      class="min-h-screen pt-32 pb-16 w-full relative overflow-hidden flex items-center bg-gradient-to-br from-white to-[#e3f2fd]"
      :class="{ 'opacity-0 translate-y-5': !isVisible, 'opacity-100 translate-y-0': isVisible, 'transition-all duration-700 ease-in-out': true }"
    >
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b]">Transform Your Operations, Grow Your Business</h2>
            <p class="text-lg mb-8">By combining workflow automation with AI-powered insights, Trusty Owl helps businesses like yours achieve remarkable transformations.</p>
            <div class="bg-white p-6 rounded-lg shadow-sm mb-6">
              <div class="flex items-center mb-4">
                <div class="w-10 h-10 mr-4 bg-[#4db6ac] rounded-full flex items-center justify-center flex-shrink-0">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M13,2.03V2.05L13,4.05C17.39,4.59 20.5,8.58 19.96,12.97C19.5,16.61 16.64,19.5 13,19.93V21.93C18.5,21.38 22.5,16.5 21.95,11C21.5,6.25 17.73,2.5 13,2.03M11,2.06C9.05,2.25 7.19,3 5.67,4.26L7.1,5.74C8.22,4.84 9.57,4.26 11,4.06V2.06M4.26,5.67C3,7.19 2.25,9.04 2.05,11H4.05C4.24,9.58 4.8,8.23 5.69,7.1L4.26,5.67M2.06,13C2.26,14.96 3.03,16.81 4.27,18.33L5.69,16.9C4.81,15.77 4.24,14.42 4.06,13H2.06M7.1,18.37L5.67,19.74C7.18,21 9.04,21.79 11,22V20C9.58,19.82 8.23,19.25 7.1,18.37M12.5,7V12.25L17,14.33L16.28,15.54L11,13V7H12.5Z" />
                  </svg>
                </div>
                <h3 class="text-xl font-bold">Typical Results</h3>
              </div>
              <div class="grid grid-cols-3 gap-4 text-center">
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">40-60%</div>
                  <div class="text-sm">Time Savings</div>
                </div>
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">30-50%</div>
                  <div class="text-sm">Error Reduction</div>
                </div>
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">20-35%</div>
                  <div class="text-sm">Revenue Growth</div>
                </div>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2">
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
                    <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b]">
                      <path fill="currentColor" d="M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M11,16.5L18,9.5L16.5,8L11,13.5L7.5,10L6,11.5L11,16.5Z" />
                    </svg>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-16 h-16 text-[#fbc02d]">
                      <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
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