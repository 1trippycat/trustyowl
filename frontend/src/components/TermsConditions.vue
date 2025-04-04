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
