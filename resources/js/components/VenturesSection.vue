<script setup lang="ts">
import { ref, computed } from 'vue';

type Status = 'sold' | 'active' | 'upcoming';
type Strategy = 'Flip' | 'Buy & Hold' | 'Rental';

interface Deal {
    id: number;
    address: string;
    city: string;
    state: string;
    strategy: Strategy;
    status: Status;
    image: string;
    year: number;
    purchasePrice: number;
    salePrice?: number;
    returnPct?: number;
    note: string;
}

const deals: Deal[] = [
    {
        id: 1,
        address: '2847 Maple Grove Dr',
        city: 'Austin', state: 'TX',
        strategy: 'Flip', status: 'sold',
        image: 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800&q=80&auto=format&fit=crop',
        year: 2024,
        purchasePrice: 325000, salePrice: 498000, returnPct: 53,
        note: 'Full gut renovation — sold in 11 days.',
    },
    {
        id: 2,
        address: '7841 Sunset Ranch Ct',
        city: 'Scottsdale', state: 'AZ',
        strategy: 'Flip', status: 'sold',
        image: 'https://images.unsplash.com/photo-1605146769289-440113cc3d00?w=800&q=80&auto=format&fit=crop',
        year: 2023,
        purchasePrice: 680000, salePrice: 942000, returnPct: 32,
        note: 'Luxury contemporary renovation, record comp set.',
    },
    {
        id: 3,
        address: '1102 Highland Ave',
        city: 'Denver', state: 'CO',
        strategy: 'Flip', status: 'sold',
        image: 'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800&q=80&auto=format&fit=crop',
        year: 2023,
        purchasePrice: 410000, salePrice: 559000, returnPct: 22,
        note: 'Bungalow restoration in desirable Highland.',
    },
    {
        id: 4,
        address: '415 Riverside Blvd',
        city: 'Nashville', state: 'TN',
        strategy: 'Flip', status: 'active',
        image: 'https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=800&q=80&auto=format&fit=crop',
        year: 2025,
        purchasePrice: 285000,
        note: 'East Nashville mid-century renovation in progress.',
    },
    {
        id: 5,
        address: '3309 Park View Ln',
        city: 'Charlotte', state: 'NC',
        strategy: 'Buy & Hold', status: 'active',
        image: 'https://images.unsplash.com/photo-1576941089067-2de3c901e126?w=800&q=80&auto=format&fit=crop',
        year: 2024,
        purchasePrice: 395000,
        note: 'Cash-flowing rental in high-appreciation corridor.',
    },
    {
        id: 6,
        address: '228 Elmwood Terrace',
        city: 'Nashville', state: 'TN',
        strategy: 'Flip', status: 'upcoming',
        image: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800&q=80&auto=format&fit=crop',
        year: 2025,
        purchasePrice: 265000,
        note: 'Under contract — renovation starts Q2 2025.',
    },
];

type Filter = 'all' | Status | Strategy;

const filters: { label: string; value: Filter }[] = [
    { label: 'All', value: 'all' },
    { label: 'Active', value: 'active' },
    { label: 'Sold', value: 'sold' },
    { label: 'Flip', value: 'Flip' },
    { label: 'Buy & Hold', value: 'Buy & Hold' },
];

const active = ref<Filter>('all');

const visible = computed(() =>
    active.value === 'all'
        ? deals
        : deals.filter((d) => d.status === active.value || d.strategy === active.value),
);

const statusStyle: Record<Status, string> = {
    sold:     'bg-emerald-50 text-emerald-700 ring-1 ring-emerald-200',
    active:   'bg-lavender text-plum ring-1 ring-plum/20',
    upcoming: 'bg-white text-muted ring-1 ring-gray-200',
};

const statusLabel: Record<Status, string> = {
    sold: 'Sold', active: 'Active', upcoming: 'Upcoming',
};

const fmt = (n: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', maximumFractionDigits: 0 }).format(n);
</script>

<template>
    <section id="ventures" class="bg-brand py-24 lg:py-32">
        <div class="mx-auto max-w-6xl px-6 lg:px-8">

            <!-- Header -->
            <div class="mb-12 flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
                <div>
                    <p class="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-plum">Portfolio</p>
                    <h2 class="font-serif text-4xl font-bold text-charcoal lg:text-5xl">
                        Investment Track Record
                    </h2>
                </div>

                <!-- Filters -->
                <div class="flex flex-wrap gap-2">
                    <button
                        v-for="f in filters"
                        :key="f.value"
                        @click="active = f.value"
                        :class="[
                            'rounded-full border px-4 py-1.5 text-sm font-medium transition-all',
                            active === f.value
                                ? 'border-plum bg-plum text-white'
                                : 'border-gray-200 bg-white text-charcoal-soft hover:border-plum hover:text-plum',
                        ]"
                    >
                        {{ f.label }}
                    </button>
                </div>
            </div>

            <!-- Grid -->
            <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
                <article
                    v-for="deal in visible"
                    :key="deal.id"
                    class="overflow-hidden rounded-xl bg-white shadow-sm"
                >
                    <!-- Photo -->
                    <div class="relative aspect-video overflow-hidden">
                        <img
                            :src="deal.image"
                            :alt="deal.address"
                            class="h-full w-full object-cover transition-transform duration-500 hover:scale-105"
                        />
                        <span
                            :class="['absolute top-3 right-3 rounded-full px-2.5 py-1 text-[11px] font-semibold', statusStyle[deal.status]]"
                        >
                            {{ statusLabel[deal.status] }}
                        </span>
                    </div>

                    <!-- Body -->
                    <div class="p-5">
                        <div class="flex items-start justify-between gap-2">
                            <div>
                                <p class="font-medium text-charcoal">{{ deal.address }}</p>
                                <p class="text-sm text-muted">{{ deal.city }}, {{ deal.state }}</p>
                            </div>
                            <span class="flex-shrink-0 rounded-full bg-lavender px-2.5 py-0.5 text-xs font-medium text-plum">
                                {{ deal.strategy }}
                            </span>
                        </div>

                        <p class="mt-3 text-sm leading-relaxed text-charcoal-soft">{{ deal.note }}</p>

                        <!-- Financials -->
                        <div class="mt-4 border-t border-gray-100 pt-4">
                            <div class="flex items-end justify-between">
                                <div>
                                    <p class="text-xs text-muted">Acquired</p>
                                    <p class="text-sm font-semibold text-charcoal">{{ fmt(deal.purchasePrice) }}</p>
                                </div>
                                <div v-if="deal.salePrice" class="text-right">
                                    <p class="text-xs text-muted">Sold</p>
                                    <p class="text-sm font-semibold text-charcoal">{{ fmt(deal.salePrice) }}</p>
                                </div>
                                <div v-if="deal.returnPct" class="text-right">
                                    <p class="text-xs text-plum font-medium">Return</p>
                                    <p class="text-base font-bold text-plum">+{{ deal.returnPct }}%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>

            <!-- Empty -->
            <p v-if="visible.length === 0" class="py-16 text-center text-muted">
                No deals match this filter.
            </p>
        </div>
    </section>
</template>
