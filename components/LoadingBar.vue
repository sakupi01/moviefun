<template>
  <div v-if="loading" class="loading-page">
    <div class="loading"></div>
  </div>
  
</template>
<script>
  export default {
    data: () => ({
      loading: false,
    }),
    methods: {
      start() {
        this.loading = true
      },
      finish() {
        this.loading = false
      },
    },
  }
</script>

<style scoped>
  .loading-page {
    position: fixed;
    top: 0;
    right: 0;
    z-index: 1000;
    padding: 1rem;
    text-align: center;
    font-size: 3rem;
    font-family: sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: rgb(0, 0, 0);
    width: 100vw;
    height: 100vh;
  }
  .loading {
    display: inline-block;
    width: 4rem;
    height: 4rem;
    border: 8px solid rgba(57, 52, 210, 0.848);
    border-radius: 20%;
    border-top-color: #9286f18f;
    border-bottom-color: #9286f18f;
    animation: spin 1s ease-in-out infinite;
  }
  @keyframes spin {
    to {
      -webkit-transform: rotate(360deg);
    }
  }
</style>