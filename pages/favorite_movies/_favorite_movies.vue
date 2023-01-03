<template>
  <div>
    <v-row justify="center" align="center">
      <div v-if= "flag === true">
      <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "button in buttons" :key="button.id">
        <v-btn color="button.color" @click="feelSelect(button.key.key)">
          {{button.key.name}}
        </v-btn>
      </v-col>
      </div>

      <div v-else-if = "flag_2 === true">
        <div v-if=" userfeel.feeling === 'learnful'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[0].states" :key="state.id">
          <v-btn  @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'cry'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[1].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'lovely'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[2].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'laugh'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[3].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'refleshed'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[4].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'cheered'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[5].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
        <div v-else-if=" userfeel.feeling === 'horror'">
        <v-col cols="12" xs="4" sm="4" md="4" lg="2" v-for= "state in buttons[6].states" :key="state.id">
          <v-btn @click="feelState(state.tag)"> {{state.show}}</v-btn>
        </v-col>
        </div>
      </div>
      
      <div v-else-if = "flag_3 === true" style="height:100vh; display:flex;">
        <v-row no-gutters style=" align-items:center;">
          <v-col
            v-for= "genre in item_genreList" :key="genre.id"
            cols="12"
            sm="4"
            style="display:flex; justify-content:center;"
          >
           <v-btn @click="decideGenre(genre.id)">
            {{genre.name}}
          </v-btn>
          </v-col>
        </v-row>
      </div>

      <div v-else-if= "flag_4 === true" style="height:100vh; display:flex; align-items:center; justify-content:center;">
        <v-btn @click="finalAnswer()">
            Are you ready?
        </v-btn>
      </div>

      <div v-else>
      <v-col cols="12" sm="8" md="6" v-for= "(data, index) in finalResults" :key="index" style="display:flex; justify-content:center; margin:0 auto;">
        <v-card class="logo py-4 d-flex justify-space-between" shaped style=" width:90vw; margin:auto auto;">
          <div class="d-flex justify-center">
            <v-avatar
                class="ma-3"
                size="125"
                tile
              >
                <v-img :src="data.poster_path"></v-img>
              </v-avatar>
            <div style="width:100%;" >
              <v-card-title style="1rem"  class="text-left">
                {{index+1}} : {{data.title}}
              </v-card-title>
              <v-card-subtitle v-text="data.id">

              </v-card-subtitle>

            </div>

          </div>

          <v-card-actions>
            <v-spacer />
             <v-btn
              color="#F5F5F5"
              depressed
              elevation="9"
              fab
              large
              text
              @click="toURL(data)"
            >
            Visit
            </v-btn>
          </v-card-actions>

            </v-card>
      </v-col>
      </div>
    </v-row>
  </div>
</template>
 
<script>
const axios = require('axios')
const home = 'https://api.themoviedb.org/3'
const key = '874b2c31cd678740afe326baa8408862'
const language = '&language=ja-JA'
const query = 'heart warming'
const url = home + '/search/keyword' +'?api_key=' +key + '&query=' + query + language // /search/XX-> でid取得できる
const genre_url = home + '/genre/movie/list' + '?api_key=' +key + language
export default {
  data () {
    return {
      title : 'Moviefun🔍✨❤️',
      row_1: 'Popular',
      json_data: {},
      json_image: {},
      flag: true,
      flag_2: false,
      flag_3: false,
      flag_4: false,
      buttons: [
        {
         key: {key: 'learnful', name : '冷静になりたい'},
         color:'blue',
         states: [
                {
                  show: 'ITに興味がある',
                  tag: ['thought provoking','scien']
                },
                {
                  show: '食べ物が好き',
                  tag: ['thought provoking','food']
                },
                {
                  show: 'おしゃべり',
                  tag: ['thought provoking','human']
                },
                {
                  show: '芸術的．',
                  tag: ['thought provoking','musical']
                },
                {
                  show: 'ファッションが好き',
                  tag: ['thought provoking','fashion']
                }
            ]
       },
       {
         key: {key: 'cry', name : '泣きたい'},
         color:'blue',
         states: [
                {
                  show: '心あったまる感じ？',
                  tag: ['heartwarming','cry']
                },
                {
                  show: 'バッドエンド？',
                  tag: ['depressed','cry']
                },
                {
                  show: '考えさせられる感じ？',
                  tag: ['thought provoking','cry']
                }
            ]
       },
        {
         key: {key: 'lovely', name : 'キュンとしたい'},
         color:'blue',
         states: [
                {
                  show: '洋服が好き',
                  tag: ['fashion','love']
                },
                {
                  show: '青春を取り戻したい',
                  tag: ['palpitation','love']
                },
                {
                  show: 'バッドエンド',
                  tag: ['depressed','love']
                },
                 {
                  show: 'ハッピーエンド',
                  tag: ['happy','love']
                }
            ]
       },
        {
          key: {key: 'laugh', name : '笑いたい'},
          color:'blue',
          states: [
                {
                  show: 'アニメ好き？',
                  tag: ['anime','laugh']
                },
                {
                  show: '恋愛は必要？',
                  tag: ['love','laugh']
                },
                {
                  show: '学びもほしい',
                  tag: ['thought provoking','laugh']
                }
            ]
       },
       {
         key: {key: 'refleshed', name : '疲れた．．．'},
         color:'blue',
         states: [
                {
                  show: '食欲が欲しい',
                  tag: ['food','relax']
                },
                {
                  show: '音楽が聴きたい',
                  tag: ['dance','relax']
                },
                {
                  show: '旅がしたい．いい景色が見たい',
                  tag: ['travel','relax']
                }
            ]
       },
        {
         key: {key: 'cheered', name : '元気付けられたい'},
         color:'blue',
         states: [
                {
                  show: '笑いたい',
                  tag: ['passion','laugh']
                },
                {
                  show: '食べたい',
                  tag: ['passion','food']
                },
                {
                  show: '恋したい',
                  tag: ['passion','love']
                },
                {
                  show: 'ノリたい',
                  tag: ['passion','dance']
                },
                {
                  show: '慰めてほしい',
                  tag: ['cheer','sadness']
                }

            ]
       },
       {
         key: {key: 'horror', name : 'ホラーな気分'},
         color:'blue',
         states: [
                {
                  show: '見た目がホラー',
                  tag: ['horror','blood']
                },
                {
                  show: '心理的にホラー',
                  tag: ['horror','paranoia']
                }
            ]
       }
      ],
      userfeel:{
        feeling: '',
        state: [],
        genre: ''
      },
      keyidList: {},
      genreList: {},
      item_genreList: [],
      wordQuery: '',
      finalResults: {}
    }
  },
  created () {
    axios.get(genre_url).then((res) => {
        console.log(res)
        this.genreList = res.data.genres
      }).catch((error) => {
        console.log(error)
        this.message = 'Sorry, we could\'t fetch the data.'
        this.json_data = {}
      })

  },
  methods: {
     toURL(data){
      window.location.href = data.url;
    },
    feelSelect (buttonkey) {
      if (buttonkey === 'learnful') {
        this.userfeel.feeling = 'learnful'
        this.flag = false
        this.flag_2 = true
      }
      else if (buttonkey === 'cry' ){
        this.userfeel.feeling = 'cry'
        this.flag = false
        this.flag_2 = true
      }
      else if (buttonkey === 'lovely'){
        this.userfeel.feeling = 'lovely'
        this.flag = false
        this.flag_2 = true

      }
      else if (buttonkey === 'laugh'){
        this.userfeel.feeling = 'laugh'
        this.flag = false
        this.flag_2 = true

      }
      else if (buttonkey === 'refleshed' ){
        this.userfeel.feeling = 'refleshed'
        this.flag = false
        this.flag_2 = true 
      }
      else if (buttonkey === 'cheered'){
        this.userfeel.feeling = 'cheered'
        this.flag = false
        this.flag_2 = true
      }
      else if (buttonkey === 'horror'){
        this.userfeel.feeling = 'horror'
        this.flag = false
        this.flag_2 = true
      }
    },
    feelState (state) {
      for (let i = 0; i < state.length; i++) {
        this.userfeel.state.push(state[i])
      }
        const id_query = this.userfeel.state[0]
        const id_url = home + '/search/keyword' +'?api_key=' +key + '&query=' + id_query + language
          // 👇keyword ID 取得**************************************************************
          axios.get(id_url).then((res) => {
             console.log(res)
            this.keyidList = res.data.results
             for (let i = 0; i < Object.keys(this.keyidList).length; i++) {
                  this.wordQuery += this.keyidList[i].id + '|'
                }
            console.log(this.wordQuery)
            const id_query_2 = this.userfeel.state[1]
            const id_url_2 = home + '/search/keyword' +'?api_key=' +key + '&query=' + id_query_2 + language
             axios.get(id_url_2).then((res) => {
                console.log(res)
              this.keyidList = res.data.results
              
              // 👇 keyword IDをORで連結してrequestできる形に**************************************************************
                for (let i = 0; i < Object.keys(this.keyidList).length; i++) {
                  this.wordQuery += this.keyidList[i].id + '|'
                }
                console.log(this.wordQuery)
              // 👇 wordQueryとdecideGenre()で取得したuserfeel.genreにて最終結果request**************************************************************
                const discover_url = home + '/discover/movie' +'?api_key=' +key + '&with_keywords=' + this.wordQuery + language
                 axios.get(discover_url).then((res) => {
                   console.log(res)
                    let a = [] // 👇resの映画に含まれる全てのジャンル（重複あり）
                    for (let i = 0; i < res.data.results.length; i++) {
                      for (let j = 0; j < res.data.results[i].genre_ids.length; j++) {
                        a.push(res.data.results[i].genre_ids[j])
                      }
                    }
                    // 👇item_genreListに重複がないように追加
                    let counter = 0;
                    for (let i = 0; i < a.length; i++) {
                      for (let j = 0; j < this.genreList.length; j++) {
                        if(a[i] == this.genreList[j].id){
                          if (counter !== 0) { //最初の追加以降はpush済と被りがないか精査
                            for (let k = 0; k < this.item_genreList.length; k++) {
                              if (a[i] === this.item_genreList[k].id) {
                                  break
                              }
                              if (k === this.item_genreList.length - 1) {
                                this.item_genreList.push(this.genreList[j])
                                break
                              }
                            }
                          }
                          else{//　最初のみ必ず追加
                            this.item_genreList.push(this.genreList[j])
                            counter += 1;
                          }
                          break
                        }
                      }
                    }
                    console.log(this.item_genreList)
                 }).catch((error) => {
                    console.log(error)
                    this.message = 'Sorry, we could\'t find the data on the combination.'
                    this.json_data = {}
                  })
             }).catch((error) => {
                    console.log(error)
                    this.message = 'Sorry, we could\'t find the data on the combination.'
                    this.json_data = {}
                  })
          }).catch((error) => {
              console.log(error)
              this.message = 'Sorry, we could\'t find the data on the combination.'
              this.json_data = {}
            })
      this.flag_2 = false
      this.flag_3 = true
    },
    decideGenre (id) {
      this.userfeel.genre += id
      console.log(this.userfeel);
      this.flag_3 = false
      this.flag_4 = true
    },
    finalAnswer () {
      this.flag_4 = false
      const discover_url = home + '/discover/movie' +'?api_key=' +key + '&with_keywords=' + this.wordQuery + '&with_genres=' + this.userfeel.genre + language
      axios.get(discover_url).then((res) => {
      this.finalResults = res.data.results
      for (let i = 0; i < this.finalResults.length; i++) {
        this.finalResults[i].poster_path = "https://image.tmdb.org/t/p/w500" + this.finalResults[i].poster_path
        let a = "https://www.themoviedb.org/movie/" + this.finalResults[i].id
        this.$set(this.finalResults[i], 'url', a)
      }
        console.log(this.finalResults);
      }).catch((error) => {
        console.log(error)
        this.message = 'Sorry, we could\'t find the data on the combination.'
        this.finalResults = {}
      })
      this.flag_3 = false
    },
  },
}
</script>

<style>
.popular{
  color: white;
}
</style>

