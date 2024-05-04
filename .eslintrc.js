module.exports = {
  extends: [
    'eslint:recommended',
    'airbnb-base',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    prject: './tsconfig.json',
  },
  plugins: ['@typescript-eslint'],
};
