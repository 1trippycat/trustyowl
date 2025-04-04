#!/bin/bash
                   
# Define the root directory (handle spaces)
ROOT_DIR="/storage/trustyowl/frontend"

# --- Create Directory Structure ---
echo "Creating directory structure..."
mkdir -p "$ROOT_DIR/src/assets"
mkdir -p "$ROOT_DIR/src/components"
mkdir -p "$ROOT_DIR/src/router"
mkdir -p "$ROOT_DIR/src/views" # For the Home view component

# --- Create Vite index.html ---
echo "Creating root index.html..."
cat <<EOF > "$ROOT_DIR/index.html"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trusty Owl - Workflow Automation & AI Integration for SMBs</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
  </head>
  <body class="bg-[#f8f9fa] text-[#2c3e50]">
    <div id="app"></div>
    <script type="module" src="/src/main.ts"></script>
  </body>
</html>
EOF

# --- Create src/style.css ---
echo "Creating src/style.css..."
cat <<EOF > "$ROOT_DIR/src/style.css"
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
    font-family: 'Poppins', sans-serif;
    overflow-x: hidden;
    scroll-behavior: smooth;
}
h1, h2, h3 {
    font-family: 'Playfair Display', serif;
}
.panel {
    /* min-height: 100vh; */ /* Adjusted for component structure */
    padding-top: 8rem; /* Add padding to avoid content hiding under fixed nav */
    padding-bottom: 4rem;
    width: 100%;
    position: relative;
    overflow: hidden;
    display: flex;
    align-items: center;
}
.legal-page-container {
    padding-top: 8rem; /* Add padding to avoid content hiding under fixed nav */
    min-height: 100vh;
}
.parallax-bg {
    position: absolute;
    width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
    will-change: transform;
    z-index: -1;
}
.split-container {
    display: flex;
    width: 100%;
    align-items: center;
}
.split-left, .split-right {
    flex: 1;
    padding: 2rem;
}
.owl-logo {
    transition: all 0.5s ease;
}
.owl-logo:hover {
    transform: rotate(-5deg) scale(1.05);
}
.fade-in {
    opacity: 0;
    transform: translateY(20px); /* Optional: Add slight upward movement */
    transition: opacity 0.8s ease, transform 0.8s ease;
}
.fade-in.visible {
    opacity: 1;
    transform: translateY(0);
}
.gear {
    animation: spin 20s linear infinite;
}
@keyframes spin {
    100% { transform: rotate(360deg); }
}
.pulse {
    animation: pulse 2s infinite;
}
@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}
.float {
    animation: float 6s ease-in-out infinite;
}
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-20px); }
    100% { transform: translateY(0px); }
}
.blink {
    animation: blink 5s infinite;
}
@keyframes blink {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.8; }
}
.legal-page {
    max-width: 800px;
    margin: 0 auto;
    padding: 4rem 2rem;
}
@media (max-width: 768px) {
    .split-container {
        flex-direction: column;
    }
    .panel {
        min-height: auto;
        padding-top: 6rem; /* Adjust padding for smaller screens */
        padding-bottom: 2rem;
    }
    .split-left, .split-right {
       padding: 1rem;
    }
}

/* Specific style for mobile nav */
.mobile-nav-active {
  display: flex !important;
  flex-direction: column;
  position: absolute;
  top: 100%; /* Position below the navbar */
  left: 0;
  right: 0;
  background-color: white;
  padding: 1rem;
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  space-y: 1rem;
  z-index: 40; /* Ensure it's below the main nav bar (z-50) but above content */
}
EOF

# --- Create src/main.ts ---
echo "Creating src/main.ts..."
cat <<EOF > "$ROOT_DIR/src/main.ts"
import './style.css'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router' // Import the router

const app = createApp(App)

app.use(router) // Use the router

app.mount('#app')
EOF

# --- Create src/router/index.ts ---
echo "Creating src/router/index.ts..."
cat <<EOF > "$ROOT_DIR/src/router/index.ts"
import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import HomeView from '../views/HomeView.vue'; // Use a specific Home view
import PrivacyPolicy from '../components/PrivacyPolicy.vue';
import TermsConditions from '../components/TermsConditions.vue';

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'home',
    component: HomeView, // Component containing all main sections
    // Add meta for scrolling or handling main sections if needed
  },
  {
    path: '/privacy',
    name: 'privacy',
    component: PrivacyPolicy,
  },
  {
    path: '/terms',
    name: 'terms',
    component: TermsConditions,
  },
  // Redirect old hash links if necessary, or handle scrolling within HomeView
  // Example redirect (optional):
  // { path: '/#problem', redirect: '/' },
  // { path: '/#solutions', redirect: '/' },
  // { path: '/#contact', redirect: '/' },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (to.hash) {
      // Scroll to anchor if hash exists
      return {
        el: to.hash,
        behavior: 'smooth',
      };
    } else if (savedPosition) {
      // Go to saved position (browser back/forward)
      return savedPosition;
    } else {
      // Go to top of page for new routes
      return { top: 0 };
    }
  },
});

export default router;
EOF

# --- Create src/views/HomeView.vue ---
echo "Creating src/views/HomeView.vue..."
cat <<EOF > "$ROOT_DIR/src/views/HomeView.vue"
<template>
  <div>
    <TheChallenge />
    <EnterTheGuide />
    <WorkflowAutomation />
    <AIIntegration />
    <TheTransformation />
    </div>
</template>

<script setup lang="ts">
import TheChallenge from '../components/TheChallenge.vue';
import EnterTheGuide from '../components/EnterTheGuide.vue';
import WorkflowAutomation from '../components/WorkflowAutomation.vue';
import AIIntegration from '../components/AIIntegration.vue';
import TheTransformation from '../components/TheTransformation.vue';
// ConnectFooter is handled by BaseLayout
</script>
EOF


# --- Create src/App.vue ---
echo "Creating src/App.vue..."
cat <<EOF > "$ROOT_DIR/src/App.vue"
<template>
  <BaseLayout>
    <router-view />
    </BaseLayout>
</template>

<script setup lang="ts">
import BaseLayout from './components/BaseLayout.vue';
// Components like TheChallenge, EnterTheGuide etc. are now managed by views/HomeView.vue via the router
</script>
EOF


# --- Create Component: BaseLayout.vue ---
echo "Creating src/components/BaseLayout.vue..."
cat <<EOF > "$ROOT_DIR/src/components/BaseLayout.vue"
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
            <a href="/#problem" @click="scrollToSection('problem', $event)" class="hover:text-[#4db6ac] transition">The Challenge</a>
            <a href="/#solutions" @click="scrollToSection('solutions', $event)" class="hover:text-[#4db6ac] transition">Solutions</a>
            <a href="/#contact" @click="scrollToSection('contact', $event)" class="hover:text-[#4db6ac] transition">Contact</a>
            <router-link to="/privacy" class="hover:text-[#4db6ac] transition">Privacy</router-link>
        </div>

        <button @click="toggleMobileMenu" class="md:hidden z-50">
            <svg viewBox="0 0 24 24" class="w-6 h-6">
                <path fill="currentColor" d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z" />
            </svg>
        </button>

        <div :class="['mobile-nav-active', { 'hidden': !isMobileMenuOpen }]" class="md:hidden">
            <a href="/#problem" @click="scrollToSection('problem', $event, true)" class="block py-2 px-4 hover:bg-gray-100">The Challenge</a>
            <a href="/#solutions" @click="scrollToSection('solutions', $event, true)" class="block py-2 px-4 hover:bg-gray-100">Solutions</a>
            <a href="/#contact" @click="scrollToSection('contact', $event, true)" class="block py-2 px-4 hover:bg-gray-100">Contact</a>
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
EOF

# --- Create Component: TheChallenge.vue ---
echo "Creating src/components/TheChallenge.vue..."
cat <<EOF > "$ROOT_DIR/src/components/TheChallenge.vue"
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
EOF

# --- Create Component: EnterTheGuide.vue ---
echo "Creating src/components/EnterTheGuide.vue..."
cat <<EOF > "$ROOT_DIR/src/components/EnterTheGuide.vue"
<template>
  <section
    ref="sectionRef"
    class="panel bg-gradient-to-br from-[#e3f2fd] to-white"
    :class="{ 'fade-in': true, 'visible': isVisible }"
    >
    <div class="container mx-auto px-6">
      <div class="split-container">
          <div class="split-left">
              <div class="relative h-96">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                      <div class="owl-logo w-64 h-64 bg-gradient-to-br from-[#2a4f4b] to-[#4db6ac] rounded-full flex items-center justify-center shadow-xl">
                          <svg viewBox="0 0 24 24" class="w-32 h-32 text-white blink">
                              <path fill="currentColor" d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13C13.1,13 14,13.9 14,15C14,16.1 13.1,17 12,17M18,15.22C18,14.1 18.25,13.03 18.68,12.05L19.86,8.93C19.94,8.68 20,8.4 20,8.09C20,6.94 19.08,6 17.93,6H6.07C4.92,6 4,6.94 4,8.09C4,8.4 4.06,8.68 4.14,8.93L5.32,12.05C5.75,13.03 6,14.1 6,15.22V17A2,2 0 0,1 4,19V20A1,1 0 0,0 5,21H19A1,1 0 0,0 20,20V19A2,2 0 0,1 18,17V15.22M12,6C10.5,6 9.15,6.67 8.24,7.76L9.66,9.17C10.28,8.42 11.11,8 12,8C12.89,8 13.72,8.42 14.34,9.17L15.76,7.76C14.85,6.67 13.5,6 12,6Z" />
                          </svg>
                      </div>
                  </div>
              </div>
          </div>
          <div class="split-right">
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
EOF

# --- Create Component: WorkflowAutomation.vue ---
echo "Creating src/components/WorkflowAutomation.vue..."
cat <<EOF > "$ROOT_DIR/src/components/WorkflowAutomation.vue"
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
EOF

# --- Create Component: AIIntegration.vue ---
echo "Creating src/components/AIIntegration.vue..."
cat <<EOF > "$ROOT_DIR/src/components/AIIntegration.vue"
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
EOF

# --- Create Component: TheTransformation.vue ---
echo "Creating src/components/TheTransformation.vue..."
cat <<EOF > "$ROOT_DIR/src/components/TheTransformation.vue"
<template>
  <section
    ref="sectionRef"
    class="panel bg-gradient-to-br from-white to-[#e3f2fd]"
    :class="{ 'fade-in': true, 'visible': isVisible }"
  >
    <div class="container mx-auto px-6">
      <div class="split-container">
          <div class="split-left">
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
EOF

# --- Create Component: ConnectFooter.vue (Content now moved to BaseLayout) ---
# echo "Creating src/components/ConnectFooter.vue..."
# Content moved to BaseLayout.vue

# --- Create Component: PrivacyPolicy.vue ---
echo "Creating src/components/PrivacyPolicy.vue..."
cat <<EOF > "$ROOT_DIR/src/components/PrivacyPolicy.vue"
<template>
 <div class="legal-page-container bg-[#f8f9fa]">
  <section id="privacy" class="legal-page">
    <div class="container mx-auto px-6">
        <router-link to="/" class="text-[#4db6ac] hover:underline mb-6 inline-block">← Back to Home</router-link>
        <h1 class="text-3xl font-bold mb-8 text-[#2a4f4b]">Privacy Policy</h1>

        <div class="bg-white p-8 rounded-lg shadow-sm text-[#2c3e50]">
            <p class="mb-6">Last updated: {{ formattedDate }}</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">1. Introduction</h2>
            <p class="mb-6">Trusty Owl ("us", "we", or "our") operates the trustyowl.com website (the "Service"). This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">2. Information Collection And Use</h2>
            <p class="mb-6">We collect several different types of information for various purposes to provide and improve our Service to you.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">3. Types of Data Collected</h2>
            <p class="mb-4"><strong>Personal Data</strong></p>
            <p class="mb-6">While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:</p>
            <ul class="list-disc pl-6 mb-6 space-y-2">
                <li>Email address</li>
                <li>First name and last name</li>
                <li>Phone number</li>
                <li>Cookies and Usage Data</li>
            </ul>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">4. Use of Data</h2>
            <p class="mb-6">Trusty Owl uses the collected data for various purposes:</p>
            <ul class="list-disc pl-6 mb-6 space-y-2">
                <li>To provide and maintain our Service</li>
                <li>To notify you about changes to our Service</li>
                <li>To allow you to participate in interactive features of our Service when you choose to do so</li>
                <li>To provide customer support</li>
                <li>To gather analysis or valuable information so that we can improve our Service</li>
                <li>To monitor the usage of our Service</li>
                <li>To detect, prevent and address technical issues</li>
            </ul>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">5. Changes To This Privacy Policy</h2>
            <p class="mb-6">We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "last updated" date at the top of this Privacy Policy.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">6. Contact Us</h2>
            <p>If you have any questions about this Privacy Policy, please contact us:</p>
            <ul class="list-disc pl-6 mt-4 space-y-2">
                <li>By email: info@trustyowl.com</li>
            </ul>
        </div>
    </div>
  </section>
 </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';

const today = ref(new Date());
const options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'long', day: 'numeric' };
const formattedDate = computed(() => today.value.toLocaleDateString('en-US', options));

</script>
EOF

# --- Create Component: TermsConditions.vue ---
echo "Creating src/components/TermsConditions.vue..."
cat <<EOF > "$ROOT_DIR/src/components/TermsConditions.vue"
<template>
<div class="legal-page-container bg-[#f8f9fa]">
  <section id="terms" class="legal-page">
    <div class="container mx-auto px-6">
        <router-link to="/" class="text-[#4db6ac] hover:underline mb-6 inline-block">← Back to Home</router-link>
        <h1 class="text-3xl font-bold mb-8 text-[#2a4f4b]">Terms & Conditions</h1>

        <div class="bg-white p-8 rounded-lg shadow-sm text-[#2c3e50]">
            <p class="mb-6">Last updated: {{ formattedDate }}</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">1. Introduction</h2>
            <p class="mb-6">These Terms and Conditions ("Terms") govern your use of the trustyowl.com website (the "Service") operated by Trusty Owl ("us", "we", or "our"). Please read these Terms carefully before using the Service.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">2. Intellectual Property</h2>
            <p class="mb-6">The Service and its original content, features, and functionality are and will remain the exclusive property of Trusty Owl and its licensors. The Service is protected by copyright, trademark, and other laws of both the United States and foreign countries. Our trademarks and trade dress may not be used in connection with any product or service without the prior written consent of Trusty Owl.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">3. Links To Other Web Sites</h2>
            <p class="mb-6">Our Service may contain links to third-party web sites or services that are not owned or controlled by Trusty Owl. Trusty Owl has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Trusty Owl shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">4. Termination</h2>
            <p class="mb-6">We may terminate or suspend access to our Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">5. Limitation Of Liability</h2>
            <p class="mb-6">In no event shall Trusty Owl, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from (i) your access to or use of or inability to access or use the Service; (ii) any conduct or content of any third party on the Service; (iii) any content obtained from the Service; and (iv) unauthorized access, use or alteration of your transmissions or content, whether based on warranty, contract, tort (including negligence) or any other legal theory, whether or not we have been informed of the possibility of such damage, and even if a remedy set forth herein is found to have failed of its essential purpose.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">6. Changes</h2>
            <p class="mb-6">We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.</p>

            <h2 class="text-xl font-bold mb-4 text-[#2a4f4b]">7. Contact Us</h2>
            <p>If you have any questions about these Terms, please contact us:</p>
            <ul class="list-disc pl-6 mt-4 space-y-2">
                <li>By email: info@trustyowl.com</li>
            </ul>
        </div>
    </div>
  </section>
</div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';

const today = ref(new Date());
const options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'long', day: 'numeric' };
const formattedDate = computed(() => today.value.toLocaleDateString('en-US', options));
</script>
EOF

# --- Add Placeholder package.json if not running create vite ---
if [ ! -f "$ROOT_DIR/package.json" ]; then
  echo "Creating placeholder package.json (Run 'npm install' after this script)..."
  cat <<EOF > "$ROOT_DIR/package.json"
{
  "name": "trustyowl-site",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vue-tsc && vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "vue": "^3.4.21"
     // Dependencies like vue-router, @vueuse/core will be added by npm install
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^5.0.4",
    "typescript": "^5.2.2",
    "vite": "^5.2.0",
    "vue-tsc": "^2.0.6"
    // Tailwind dev dependencies will be added by npm install
  }
}
EOF
fi

# --- Add Placeholder vite.config.ts if not running create vite ---
if [ ! -f "$ROOT_DIR/vite.config.ts" ]; then
 echo "Creating placeholder vite.config.ts..."
 cat <<EOF > "$ROOT_DIR/vite.config.ts"
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
})
EOF
fi

# --- Add Placeholder tsconfig.json if not running create vite ---
if [ ! -f "$ROOT_DIR/tsconfig.json" ]; then
 echo "Creating placeholder tsconfig.json..."
 cat <<EOF > "$ROOT_DIR/tsconfig.json"
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "module": "ESNext",
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "skipLibCheck": true,

    /* Bundler mode */
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "preserve",

    /* Linting */
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,

    /* Paths */
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["src/**/*.ts", "src/**/*.d.ts", "src/**/*.tsx", "src/**/*.vue"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF
fi

# --- Add Placeholder tsconfig.node.json if not running create vite ---
if [ ! -f "$ROOT_DIR/tsconfig.node.json" ]; then
 echo "Creating placeholder tsconfig.node.json..."
 cat <<EOF > "$ROOT_DIR/tsconfig.node.json"
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true
  },
  "include": ["vite.config.ts"]
}
EOF
fi

echo "---"
echo "Script finished!"
echo "IMPORTANT NEXT STEPS:"
echo "1. cd \"$ROOT_DIR\""
echo "2. npm install"
echo "3. npm install vue-router @vueuse/core"
echo "4. npm install -D tailwindcss postcss autoprefixer"
echo "5. npx tailwindcss init -p"
echo "6. Configure tailwind.config.js (add './src/**/*.{vue,js,ts,jsx,tsx}' to content)"
echo "7. npm run dev"
echo "---"

exit 0
