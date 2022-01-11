const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  plugins: [require('@tailwindcss/typography'), require('daisyui')],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: require('daisyui/colors'),
    },
  },
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],

  daisyui: {
    themes: ['dracula'],
  },
}
