<template>
<div>
  <v-container fluid>
      <v-row dense>
        <!-- *************************************************************** -->
        <v-col
          :cols="cards[0].flex"
          class="mb-16"
        >
          <v-card @click="changetoFAV">
            <v-img
              src= "/smiling.jpeg"
              position= '0% 25%'
              class="white--text align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="200px"
            >
              <v-card-title v-text="cards[0].title"></v-card-title>
            </v-img>

             <v-card-subtitle v-text="cards[0].subtitle"></v-card-subtitle>
          </v-card>
           </v-col>
           <v-spacer></v-spacer>
          <v-col>
            <Rate />
           </v-col>
      </v-row>
    </v-container>
</div>
</template>

<script>
import Rate from '~/components/highRate.vue'
  export default {
    components: {
      Rate
    },
    data () {
      return{
        cards: [
          { title: 'Find your favorite', flex: 12, to: 'changePage', subtitle: '今の気分にピッタリな１作を診断👁'},
        ],
      }
    },
    methods: {
      changetoPOP () {
          console.log(this.cards[0]);
            this.$router.push('/popular_movies')
      },
      changetoFAV () {
            console.log(this.cards[0]);
            this.$router.push('/favorite_movies')
      },
      changetoFIND () {
        console.log(this.cards[0]);
        this.$router.push('/find_movies')
      }
  }
  }
</script>