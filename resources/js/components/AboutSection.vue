<script setup lang="ts">
const focus = [
    'Value-add acquisitions in high-growth markets',
    'Full-cycle renovations from contract to close',
    'Buy-and-hold portfolio for long-term appreciation',
    'Capital allocation strategy & investor relations',
];
</script>

<template>
    <section id="about" class="bg-white py-24 lg:py-32">
        <div class="mx-auto max-w-6xl px-6 lg:px-8">
            <div class="grid grid-cols-1 gap-16 lg:grid-cols-2 lg:gap-20 lg:items-center">

                <!-- Image -->
                <div class="aspect-[4/5] overflow-hidden rounded-2xl">
                    <img
                        src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=700&q=80&auto=format&fit=crop"
                        alt="Katey Shea"
                        class="h-full w-full object-cover"
                    />
                </div>

                <!-- Text -->
                <div>
                    <p class="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-plum">About</p>
                    <h2 class="font-serif text-4xl font-bold text-charcoal lg:text-5xl">
                        Katey Shea
                    </h2>

                    <div class="mt-6 space-y-4 text-charcoal-soft leading-relaxed">
                        <p>
                            Katey Shea is an independent real estate investor focused on identifying
                            undervalued assets and converting them into high-performing investments across
                            multiple U.S. markets.
                        </p>
                        <p>
                            Her strategy combines rigorous market analysis with hands-on operational
                            execution — from acquisition and renovation to disposition and portfolio
                            management — delivering consistent above-market returns.
                        </p>
                        <p>
                            With a disciplined approach to capital deployment and a vetted network of
                            contractors, agents, and lenders, Katey moves quickly on opportunities
                            while maintaining strict investment criteria.
                        </p>
                    </div>

                    <!-- Investment focus list -->
                    <ul class="mt-8 space-y-3">
                        <li
                            v-for="item in focus"
                            :key="item"
                            class="flex items-start gap-3 text-sm text-charcoal-soft"
                        >
                            <span class="mt-1.5 h-1.5 w-1.5 flex-shrink-0 rounded-full bg-plum" />
                            {{ item }}
                        </li>
                    </ul>

                    <a
                        href="#contact"
                        class="mt-10 inline-flex items-center gap-2 text-sm font-medium text-plum hover:text-plum-dark transition-colors"
                    >
                        Inquire about partnering
                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </section>
</template>
