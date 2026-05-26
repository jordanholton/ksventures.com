<script setup lang="ts">
const stats = [
    { value: '12+', label: 'Investments Completed' },
    { value: '$1.4M+', label: 'Total Returns' },
    { value: '3', label: 'Active Markets' },
    { value: '8 yrs', label: 'Track Record' },
];
</script>

<template>
    <section class="bg-charcoal">
        <div class="mx-auto max-w-6xl px-6 lg:px-8">
            <div class="grid grid-cols-2 divide-x divide-y divide-white/10 lg:grid-cols-4 lg:divide-y-0">
                <div
                    v-for="stat in stats"
                    :key="stat.label"
                    class="flex flex-col items-center justify-center gap-1.5 px-8 py-14 text-center"
                >
                    <span class="font-serif text-4xl font-bold text-plum-light lg:text-5xl">
                        {{ stat.value }}
                    </span>
                    <span class="text-xs font-medium uppercase tracking-widest text-white/40">
                        {{ stat.label }}
                    </span>
                </div>
            </div>
        </div>
    </section>
</template>
