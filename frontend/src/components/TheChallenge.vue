<template>
 <section
   id="problem"
   ref="sectionRef"
   class="panel bg-gradient-to-br from-[#f8f9fa] to-[#e3f2fd]"
   :class="{ 'fade-in': true, 'visible': isVisible }"
 >
   <div class="container mx-auto px-6">
     <div class="split-container">
       <div class="split-left">
         <h1 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b]">Is Your Business Bogged Down?</h1>
         <p class="text-lg mb-8">Small and medium businesses today face overwhelming operational challenges. Manual processes, disconnected systems, and data silos create inefficiencies that drain your time and resources.</p>
         <div class="space-y-4">
             <div class="flex items-center">
                 <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                     <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                         <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                     </svg>
                 </div>
                 <span>Time wasted on repetitive tasks</span>
             </div>
             <div class="flex items-center">
                 <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                     <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                         <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                     </svg>
                 </div>
                 <span>Errors from manual data entry</span>
             </div>
             <div class="flex items-center">
                 <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                     <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                         <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                     </svg>
                 </div>
                 <span>Missed opportunities from lack of insights</span>
             </div>
         </div>
       </div>
       <div class="split-right">
         <div class="relative h-96">
             <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                 <div class="w-64 h-64 bg-[#2a4f4b] rounded-full opacity-10"></div>
             </div>
             <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                 <div class="w-56 h-56 bg-[#2a4f4b] rounded-full opacity-20"></div>
             </div>
             <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                 <div class="w-48 h-48 bg-[#2a4f4b] rounded-full opacity-30"></div>
             </div>
             <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                 <div class="w-40 h-40 bg-[#ff8a65] rounded-full flex items-center justify-center">
                     <svg viewBox="0 0 24 24" class="w-24 h-24 text-white">
                         <path fill="currentColor" d="M12,2C6.48,2 2,6.48 2,12C2,17.52 6.48,22 12,22C17.52,22 22,17.52 22,12C22,6.48 17.52,2 12,2M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20,12C20,16.41 16.41,20 12,20M13,12V7H11V13H17V11H13Z" />
                     </svg>
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
      // Optional: stop observing once visible if animation only runs once
      // stop();
    }
  },
  {
    threshold: 0.2, // Trigger when 20% of the element is visible
  }
);
</script>
