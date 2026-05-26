<script setup lang="ts">
const year = new Date().getFullYear();
</script>

<template>
    <section id="contact" class="bg-white">
        <!-- Contact block -->
        <div class="mx-auto max-w-2xl px-6 py-24 text-center lg:py-32">
            <p class="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-plum">Contact</p>
            <h2 class="font-serif text-4xl font-bold text-charcoal lg:text-5xl">
                Let's Talk
            </h2>
            <p class="mx-auto mt-5 max-w-md text-charcoal-soft leading-relaxed">
                Whether you're looking to co-invest, bring a deal, or explore a partnership — reach out directly.
            </p>

            <div class="mt-10 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
                <a
                    href="mailto:hello@ksventures.com"
                    class="rounded-full bg-plum px-8 py-3.5 text-sm font-medium text-white transition-colors hover:bg-plum-dark"
                >
                    hello@ksventures.com
                </a>
                <a
                    href="#"
                    class="rounded-full border border-gray-200 px-8 py-3.5 text-sm font-medium text-charcoal-soft transition-colors hover:border-plum hover:text-plum"
                >
                    LinkedIn
                </a>
            </div>
        </div>

        <!-- Footer -->
        <div class="border-t border-gray-100">
            <div class="mx-auto flex max-w-6xl flex-col items-center justify-between gap-4 px-6 py-6 sm:flex-row">
                <div class="flex items-center gap-2">
                    <div class="relative h-6 w-6 flex-shrink-0">
                        <svg viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-full w-full">
                            <rect x="8" y="8" width="20" height="20" rx="2"
                                  transform="rotate(45 18 18)"
                                  stroke="#6B3FA0" stroke-width="1.5" fill="#EDE0F7" />
                        </svg>
                        <span class="absolute inset-0 flex items-center justify-center font-serif text-[7px] font-bold leading-none text-plum">KS</span>
                    </div>
                    <span class="font-serif text-sm font-semibold text-charcoal">KS Ventures</span>
                </div>
                <p class="text-xs text-muted">© {{ year }} KS Ventures. All rights reserved.</p>
            </div>
        </div>
    </section>
</template>
