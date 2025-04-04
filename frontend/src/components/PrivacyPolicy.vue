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
