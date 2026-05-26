<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue';

const slides = [
    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1920&q=80&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=1920&q=80&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=1920&q=80&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1560185007-cde436f6a4d0?w=1920&q=80&auto=format&fit=crop',
];

const current = ref(0);
let timer: ReturnType<typeof setInterval> | null = null;

const goTo = (i: number) => { current.value = i; restart(); };
const restart = () => {
    if (timer) clearInterval(timer);
    timer = setInterval(() => { current.value = (current.value + 1) % slides.length; }, 5500);
};

onMounted(() => { timer = setInterval(() => { current.value = (current.value + 1) % slides.length; }, 5500); });
onUnmounted(() => { if (timer) clearInterval(timer); });
</script>

<template>
    <section class="relative h-[calc(100vh-4.5rem)] w-full overflow-hidden">
        <!-- Slides -->
        <img
            v-for="(src, i) in slides"
            :key="i"
            :src="src"
            alt=""
            class="absolute inset-0 h-full w-full object-cover transition-opacity duration-1000"
            :class="i === current ? 'opacity-100' : 'opacity-0'"
        />

        <!-- Overlay -->
        <div class="absolute inset-0 bg-black/50" />

        <!-- Content -->
        <div class="relative z-10 flex h-full flex-col items-center justify-center px-6 text-center text-white">
            <p class="mb-4 text-xs font-medium uppercase tracking-[0.3em] text-white/50">
                Real Estate &nbsp;·&nbsp; Investments
            </p>

            <h1 class="font-serif text-6xl font-bold leading-none sm:text-7xl lg:text-8xl">
                KS Ventures
            </h1>

            <p class="mt-4 text-lg font-light text-white/70">
                Strategic Investments. Exceptional Returns.
            </p>

            <div class="mt-8 flex gap-3">
                <a
                    href="#ventures"
                    class="rounded-full bg-plum px-7 py-3 text-sm font-medium text-white transition-colors hover:bg-plum-dark"
                >
                    View Portfolio
                </a>
                <a
                    href="#about"
                    class="rounded-full border border-white/30 px-7 py-3 text-sm font-medium text-white backdrop-blur-sm transition-colors hover:bg-white/10"
                >
                    About Katey
                </a>
            </div>

            <!-- Slide dots -->
            <div class="absolute bottom-8 flex gap-1.5">
                <button
                    v-for="(_, i) in slides"
                    :key="i"
                    @click="goTo(i)"
                    :class="['h-1 rounded-full transition-all duration-300',
                             i === current ? 'w-6 bg-white' : 'w-3 bg-white/35 hover:bg-white/55']"
                />
            </div>
        </div>
    </section>
</template>
