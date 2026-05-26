<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import TheNavbar from '@/components/TheNavbar.vue';
import HeroSection from '@/components/HeroSection.vue';
import AboutSection from '@/components/AboutSection.vue';
import StatsSection from '@/components/StatsSection.vue';
import VenturesSection from '@/components/VenturesSection.vue';
import ContactSection from '@/components/ContactSection.vue';
</script>

<template>
    <Head title="KS Ventures | Real Estate Investments by Katey Shea">
        <meta
            name="description"
            content="KS Ventures — Real estate investments and property transformations by Katey Shea."
        />
    </Head>

    <div class="min-h-screen bg-brand pt-[4.5rem] text-charcoal">
        <TheNavbar />
        <HeroSection />
        <AboutSection />
        <StatsSection />
        <VenturesSection />
        <ContactSection />
    </div>
</template>
