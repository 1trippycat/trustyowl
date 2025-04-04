<template>
  <div>
    <nav class="fixed top-0 left-0 right-0 bg-white bg-opacity-90 shadow-sm z-50">
      <div class="container mx-auto px-6 py-4 flex justify-between items-center">
        <router-link to="/" class="flex items-center">
          <div class="w-10 h-10 mr-2 bg-[#2a4f4b] rounded-full flex items-center justify-center">
              <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                  <path fill="currentColor" d="M12,3C6.95,3 3.15,4.85 0,7.23L12,22L24,7.25C20.85,4.87 17.05,3 12,3M12,5C15.87,5 19.14,6.56 21.34,8.67L12,18.56L2.66,8.67C4.86,6.56 8.13,5 12,5Z" />
              </svg>
          </div>
          <span class="text-xl font-bold text-[#2a4f4b]">Trusty Owl</span>
        </router-link>

        <div class="hidden md:flex space-x-8">
            <a href="/#problem" @click="scrollToSection('problem', )" class="hover:text-[#4db6ac] transition">The Challenge</a>
            <a href="/#solutions" @click="scrollToSection('solutions', )" class="hover:text-[#4db6ac] transition">Solutions</a>
            <a href="/#contact" @click="scrollToSection('contact', )" class="hover:text-[#4db6ac] transition">Contact</a>
            <router-link to="/privacy" class="hover:text-[#4db6ac] transition">Privacy</router-link>
        </div>

        <button @click="toggleMobileMenu" class="md:hidden z-50">
            <svg viewBox="0 0 24 24" class="w-6 h-6">
                <path fill="currentColor" d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" />
            </svg>
        </button>

        <div :class="['mobile-nav-active', { 'hidden': !isMobileMenuOpen }]" class="md:hidden">
            <a href="/#problem" @click="scrollToSection('problem', , true)" class="block py-2 px-4 hover:bg-gray-100">The Challenge</a>
            <a href="/#solutions" @click="scrollToSection('solutions', , true)" class="block py-2 px-4 hover:bg-gray-100">Solutions</a>
            <a href="/#contact" @click="scrollToSection('contact', , true)" class="block py-2 px-4 hover:bg-gray-100">Contact</a>
            <router-link to="/privacy" @click="closeMobileMenu" class="block py-2 px-4 hover:bg-gray-100">Privacy</router-link>
            <router-link to="/terms" @click="closeMobileMenu" class="block py-2 px-4 hover:bg-gray-100">Terms & Conditions</router-link>
        </div>
      </div>
    </nav>

    <main>
      <slot /> </main>

    <section id="contact" class="panel bg-gradient-to-br from-[#e3f2fd] to-[#2a4f4b] text-white !pt-12 !pb-8">
        <div class="container mx-auto px-6">
            <div class="max-w-4xl mx-auto text-center">
                <h2 class="text-4xl md:text-5xl font-bold mb-8">Ready to Streamline Your Success?</h2>
                <p class="text-xl mb-12">Let's discuss how Trusty Owl can help your business work smarter, not harder.</p>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
                    <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-blur-sm">
                        <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                            <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"><path fill="currentColor" d="M22 6C22 4.9 21.1 4 20 4H4C2.9 4 2 4.9 2 6V18C2 19.1 2.9 20 4 20H20C21.1 20 22 19.1 22 18V6M20 6L12 11L4 6H20M20 18H4V8L12 13L20 8V18Z" /></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2">Email Us</h3>
                        <a href="mailto:info@trustyowl.com" class="hover:text-[#4db6ac] transition">info@trustyowl.com</a>
                    </div>
                    <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-blur-sm">
                        <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                           <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"><path fill="currentColor" d="M6.62,10.79C8.06,13.62 10.38,15.94 13.21,17.38L15.41,15.18C15.69,14.9 16.08,14.82 16.43,14.93C17.55,15.3 18.75,15.5 20,15.5A1,1 0 0,1 21,16.5V20A1,1 0 0,1 20,21A17,17 0 0,1 3,4A1,1 0 0,1 4,3H7.5A1,1 0 0,1 8.5,4C8.5,5.25 8.7,6.45 9.07,7.57C9.18,7.92 9.1,8.31 8.82,8.59L6.62,10.79Z" /></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2">Call Us</h3>
                        <p>(555) 123-4567</p> </div>
                    <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-blur-sm">
                        <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                            <svg viewBox="0 0 24 24" class="w-6 h-6 text-white"><path fill="currentColor" d="M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z" /></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2">Visit Us</h3>
                        <p>Colorado Springs, CO</p>
                    </div>
                </div>

                <div class="flex justify-center mb-12">
                    <a href="mailto:info@trustyowl.com" class="bg-[#4db6ac] hover:bg-[#3da89e] text-white font-bold py-3 px-8 rounded-full text-lg transition duration-300 transform hover:scale-105 shadow-lg">
                        Contact Us
                    </a>
                </div>

                <div class="border-t border-white border-opacity-20 pt-8">
                    <div class="flex flex-col md:flex-row justify-center items-center space-y-4 md:space-y-0 md:space-x-8 mb-6">
                        <router-link to="/privacy" class="hover:text-[#4db6ac] transition">Privacy Policy</router-link>
                        <router-link to="/terms" class="hover:text-[#4db6ac] transition">Terms & Conditions</router-link>
                    </div>
                    <p class="text-sm opacity-70">© {{ currentYear }} Trusty Owl. All Rights Reserved.</p>
                     </div>
            </div>
        </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const currentYear = ref(new Date().getFullYear());
const isMobileMenuOpen = ref(false);
const router = useRouter();

function toggleMobileMenu() {
  isMobileMenuOpen.value = !isMobileMenuOpen.value;
}

function closeMobileMenu() {
  isMobileMenuOpen.value = false;
}

// Function to handle scrolling to sections on the home page
function scrollToSection(sectionId: string, event: MouseEvent, closeMenu = false) {
    if (closeMenu) closeMobileMenu();

    // Check if we are already on the home page
    if (router.currentRoute.value.path === '/') {
      event.preventDefault(); // Prevent default anchor jump
      const element = document.getElementById(sectionId);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth' });
      }
    } else {
      // If not on home page, navigate to home first then scroll
      // The router's scrollBehavior will handle the hash
      // No event.preventDefault() here, let router handle navigation
    }
}

</script>
