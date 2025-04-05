<template>
    <section
      id="solutions"
      ref="sectionRef"
      class="min-h-screen pt-32 pb-16 w-full relative overflow-hidden flex items-center bg-gradient-to-br from-white to-[#f0f4f8]"
      :class="{ 'opacity-0 translate-y-5': !isVisible, 'opacity-100 translate-y-0': isVisible, 'transition-all duration-700 ease-in-out': true }"
    >
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-playfair">Unlock Efficiency with Workflow Automation</h2>
            <p class="text-lg mb-8 font-poppins">Transform your manual processes into streamlined workflows that save time, reduce errors, and free your team to focus on what matters most.</p>
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