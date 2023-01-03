<template>
  <div>
    <input v-model="msg">
    <!-- このフィールドとcomputedが同期 -->
    <p>・変数valueの中身： {{value}}</p>
  </div>
</template>

<script>
export default {
  data(){
    return {
      value: 'Default message'
    }
  },
  computed:{
    msg:{
      get(){
        // フィールドで受け取った値がsetの引数となる
        return this.value
      },
      set(value){
        console.log(value);
        this.value = value
      }
    }
  }
}
</script>