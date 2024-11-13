import typography from '@tailwindcss/typography'

/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			fontFamily: {
        josefin: ['"Josefin Sans"', 'sans-serif'],
      },
			screens: {
        'xs': '350px',  // Nuevo breakpoint para 350px
      },
		},
	},
	plugins: [typography],
}
