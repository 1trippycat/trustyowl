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
