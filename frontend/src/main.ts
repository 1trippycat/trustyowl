// filepath: /storage/trustyowl/frontend/src/main.ts
import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import './assets/base.css'
import HomePage from './components/HomePage.vue'
import PrivacyPolicy from './components/PrivacyPolicy.vue'
import TermsConditions from './components/TermsConditions.vue'

// Create the app instance
const app = createApp(App)

// Create router instance with routes
const router = createRouter({
  history: createWebHistory(),
  routes: [
    { 
      path: '/', 
      component: HomePage 
    },
    {
      path: '/privacy',
      component: PrivacyPolicy
    },
    {
      path: '/terms',
      component: TermsConditions
    }
  ],
  scrollBehavior(to, from, savedPosition) {
    // If the route has a hash, scroll to the element with that id
    if (to.hash) {
      return {
        el: to.hash,
        behavior: 'smooth'
      }
    }
    
    // Otherwise return to top of page
    return { top: 0 }
  }
})

// Global error handler for debugging
app.config.errorHandler = (err, instance, info) => {
  console.error('Vue Error:', err)
  console.error('Error Info:', info)
}

// Use the router and mount the app
app.use(router)
app.mount('#app')