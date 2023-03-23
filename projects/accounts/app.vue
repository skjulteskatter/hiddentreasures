<template>
    <NuxtLayout name="default">
        <NuxtPage />
    </NuxtLayout>
</template>
<script setup lang="ts">
useHead({
    bodyAttrs: {
        class: "bg-white text-black dark:bg-black dark:text-white",
    },
});
</script>
