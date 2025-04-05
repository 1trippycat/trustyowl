<!-- filepath: /storage/trustyowl/frontend/src/components/BaseCard.vue -->
<template>
    <div class="max-w-[620px] mx-auto p-4 border border-gray-300 rounded-lg">
      <slot></slot>
    </div>
  </template>
  
  <style scoped>
  .card p:last-child {
    margin-bottom: 0;
  }
  </style>