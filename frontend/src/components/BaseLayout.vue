<!-- filepath: /storage/trustyowl/frontend/src/components/BaseLayout.vue -->
<template>
  <header class="bg-white shadow">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <div class="flex h-16 justify-between">
        <div class="flex">
          <div class="flex shrink-0 items-center">
            <img class="h-8 w-auto" src="../assets/logos/trustyowl-wide.svg" alt="Trusty Owl Logo">
          </div>
          <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
            <a href="/#problem" @click.prevent="scrollToSection('problem', true)" class="inline-flex items-center border-b-2 border-indigo-500 px-1 pt-1 text-sm font-medium text-gray-900">The Challenge</a>
            <a href="/#solutions" @click="scrollToSection('solutions', true)" class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">Solutions</a>
            <a href="/#contact" @click="scrollToSection('contact', true)" class="inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium text-gray-500 hover:border-gray-300 hover:text-gray-700">Contact</a>
          </div>
        </div>
        <div class="hidden sm:ml-6 sm:flex items-center">
          <!-- Profile dropdown -->
          <div class="relative ml-3">
            <div>
              <button type="button" class="relative flex max-w-xs items-center rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                <span class="sr-only">Open user menu</span>
                <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf49823?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
              </button>
            </div>
          </div>
        </div>
        <div class="-mr-2 flex items-center sm:hidden">
          <!-- Mobile menu button -->
          <button @click="toggleMobileMenu" type="button" class="relative inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" aria-controls="mobile-menu" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg v-if="!isMobileMenuOpen" class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
            </svg>
            <svg v-else class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div :class="['mobile-menu', { 'hidden': !isMobileMenuOpen }]" class="sm:hidden" id="mobile-menu">
      <div class="space-y-1 px-2 pb-3 pt-2">
        <a href="/#problem" @click="scrollToSection('problem', true)" class="block py-2 px-4 hover:bg-gray-100">The Challenge</a>
        <a href="/#solutions" @click="scrollToSection('solutions', true)" class="block py-2 px-4 hover:bg-gray-100">Solutions</a>
        <a href="/#contact" @click="scrollToSection('contact', true)" class="block py-2 px-4 hover:bg-gray-100">Contact</a>
      </div>
    </div>
  </header>

  <main class="py-10">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <!-- Example usage of BaseCard -->
      <BaseCard>
        <h1 class="text-xl font-semibold font-playfair">The Challenge</h1>
        <p class="text-gray-600 font-poppins">
          This is a description of the challenge.
        </p>
        <p class="text-gray-600 font-poppins last:mb-0">
          Additional information about the challenge.
        </p>
      </BaseCard>

      <!-- More content can be added here -->
    </div>
  </main>
</template>
<script setup lang="ts">
import { ref } from 'vue';
import BaseCard from './BaseCard.vue';

const isMobileMenuOpen = ref(false);

function toggleMobileMenu() {
  isMobileMenuOpen.value = !isMobileMenuOpen.value;
}

function scrollToSection(sectionId: string, isMobile: boolean = false) {
  const element = document.getElementById(sectionId);
  if (element) {
    element.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });
  }

  if (isMobile) {
    toggleMobileMenu();
  }
}
</script>

<style scoped>
.mobile-menu {
  display: none;
}

.mobile-nav-active {
  display: flex;
  flex-direction: column;
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background-color: white;
  padding: 1rem;
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  z-index: 40;
}
</style>