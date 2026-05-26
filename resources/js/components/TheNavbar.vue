<script setup lang="ts">
import { ref } from 'vue';

const menuOpen = ref(false);

const links = [
    { label: 'About', href: '#about' },
    { label: 'Portfolio', href: '#ventures' },
    { label: 'Contact', href: '#contact' },
];
</script>

<template>
    <nav class="fixed inset-x-0 top-0 z-50 border-b border-gray-100 bg-white">
        <div class="mx-auto flex max-w-6xl items-center justify-between px-6 py-5">
            <!-- Logo -->
            <a href="#" class="flex items-center gap-3">
                <!-- Diamond mark: geometric rotated square with KS serif overlay -->
                <div class="relative h-9 w-9 flex-shrink-0">
                    <svg viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-full w-full">
                        <rect x="8" y="8" width="20" height="20" rx="2"
                              transform="rotate(45 18 18)"
                              stroke="#6B3FA0" stroke-width="1.5" fill="#EDE0F7" />
                    </svg>
                    <span class="absolute inset-0 flex items-center justify-center font-serif text-[10px] font-bold leading-none text-plum">
                        KS
                    </span>
                </div>
                <!-- Two-line wordmark -->
                <div class="flex flex-col leading-none">
                    <span class="font-serif text-[15px] font-semibold leading-none text-charcoal">KS Ventures</span>
                    <span class="mt-[3px] text-[9px] font-medium uppercase tracking-[0.22em] text-muted">Investments</span>
                </div>
            </a>

            <!-- Desktop nav -->
            <div class="hidden items-center gap-7 md:flex">
                <a
                    v-for="link in links"
                    :key="link.href"
                    :href="link.href"
                    class="text-sm font-medium text-charcoal-soft transition-colors duration-200 hover:text-plum"
                >
                    {{ link.label }}
                </a>
                <a
                    href="#contact"
                    class="rounded-full bg-plum px-5 py-2 text-sm font-medium text-white transition-colors duration-200 hover:bg-plum-dark"
                >
                    Get in Touch
                </a>
            </div>

            <!-- Mobile toggle -->
            <button
                @click="menuOpen = !menuOpen"
                class="p-1 text-charcoal md:hidden"
                aria-label="Toggle menu"
            >
                <svg v-if="!menuOpen" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
                <svg v-else class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <!-- Mobile menu -->
        <Transition
            enter-active-class="transition duration-150 ease-out"
            enter-from-class="-translate-y-1 opacity-0"
            enter-to-class="translate-y-0 opacity-100"
            leave-active-class="transition duration-100 ease-in"
            leave-from-class="translate-y-0 opacity-100"
            leave-to-class="-translate-y-1 opacity-0"
        >
            <div v-if="menuOpen" class="border-t border-lavender bg-white md:hidden">
                <div class="flex flex-col gap-0 px-6 py-4">
                    <a
                        v-for="link in links"
                        :key="link.href"
                        :href="link.href"
                        @click="menuOpen = false"
                        class="border-b border-lavender py-3.5 text-sm font-medium text-charcoal-soft last:border-0 hover:text-plum"
                    >
                        {{ link.label }}
                    </a>
                    <a
                        href="#contact"
                        @click="menuOpen = false"
                        class="mt-4 rounded-full bg-plum py-3 text-center text-sm font-medium text-white"
                    >
                        Get in Touch
                    </a>
                </div>
            </div>
        </Transition>
    </nav>
</template>
