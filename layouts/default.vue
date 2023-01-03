<template>
  <v-app dark>
    <!-- <v-if ref =  "show === false">
      <Loading />

    </v-if> -->
    <!-- <else>  -->
      
      <v-app-bar
        style = "position: sticky;top: 0px; z-index:1;"
        color="#6A76AB"
        dark
        shrink-on-scroll
        prominent
        src="https://picsum.photos/1920/1080?random"
        fade-img-on-scroll
        scroll-target="#scrolling-techniques-3"
      >
        <template v-slot:img="{ props }">
          <v-img
            v-bind="props"
            gradient="to top right, rgba(100,115,201,.7), rgba(25,32,72,.7)"
          ></v-img>
        </template>

        <button style="font-family: 'Tangerine', cursive; font-size:2.5rem;">{{title}}</button>

        <v-spacer></v-spacer>

        <v-btn icon to = '/find_movies'>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
        <v-btn icon to="/">
          <v-icon>mdi-home</v-icon>
        </v-btn>

        <template v-slot:extension>
          <v-tabs align-with-title>
            <v-tab to = '/popular_movies' style="font-family: 'Marcellus SC', serif;">🔥Popular</v-tab>
            <v-tab to = '/top_2021' style="font-family: 'Marcellus SC', serif;">👑Best 2021</v-tab>
            <v-tab to = '/watchable' style="font-family: 'Marcellus SC', serif;">🎞In Theatres</v-tab>
            <v-tab to = '/find_movies' style="font-family: 'Marcellus SC', serif;">👀Search</v-tab>
          </v-tabs>
        </template>
      </v-app-bar>
      <v-sheet
        id="scrolling-techniques-3"
        class="overflow-y-auto"
        max-height="100vh"
      >
        <v-container style="height: 100vh; width:100vw;" >
          <v-main>
        <v-container>
          <Nuxt />
        </v-container>
      </v-main>
        </v-container>
      </v-sheet>
    
    <template>
    <v-footer
      color="primary lighten-1"
      padless
    >
      <v-row
        justify="center"
        no-gutters
      >

        <v-col
          class="primary lighten-2 py-4 text-center white--text"
          cols="12"
        >
         🌸　{{ new Date().getFullYear() }} — <strong>Sakura Aadachi</strong> all rights reserved　🌸
        </v-col>
      </v-row>
    </v-footer>
  </template>
    <!-- </else> -->
  </v-app>
</template>

<script>
import Loading from '~/components/LoadingBar.vue'
export default {
  components :{
    Loading,
  },
  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      // show: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Moviefun🎥✨',
      links: ['/popular_movies']
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.$nuxt.$loading.start()
      setTimeout(() => this.$nuxt.$loading.finish(), 3000)
    })
  }
}
</script>

