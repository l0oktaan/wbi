<template>
<div>
    <div role="tablist">
        <b-card no-body class="mb-1" v-for="article in articles" :key="article.id">
            <b-card-header header-tag="header" class="p-1" role="tab">
                <b-btn block @click="toggleShow(article.id-1)" v-b-toggle="'accordion' + article.id" variant="default">{{article.name}}</b-btn>
            </b-card-header>
            <b-collapse :id="'accordion' + article.id" accordion="my-accordion" role="tabpanel">
                <b-card-body>
                    <ul class="list-group list-group-flush" v-for="topic in article.topics" :key="topic.id">
                        <li class="list-group-item"><b-btn @click="showTopic(topic.id, topic.name)" v-b-modal.modal-center>[{{topic.id}}]&nbsp;{{topic.name}}</b-btn></li>                        
                    </ul>                
                </b-card-body>
            </b-collapse>
        </b-card>    
    </div>
    <b-modal id="modal-center" size="lg" :title="topicName" hide-footer>
        <show-topic :topic="topicID"></show-topic>
    </b-modal>
</div>
    
</template>
<style scoped>
.btn{
    text-align: left;
    border-radius: 0px;
    color: #032430;
}
.btn:hover,
.btn:focus {
  text-decoration: none;
}

.btn:focus,
.btn.focus {
  outline: 0;
  -webkit-box-shadow: 0 0 0 0.2rem rgba(10, 154, 250, 0.85);
  box-shadow: 0 0 0 0.2rem rgba(10, 154, 250, 0.85);
}
.card{
    border-radius: 0px;
}
.card-body{
    color: #032430;
}
.modal-title .modal-body{
    color: #032430!important;
}
.list-group-item>button{
    background-color: transparent;
    border-width: 0px;
    width: 100%;
}
</style>

<script>
export default {
    props: ['articles'],
  data() {
    return {
        arrVisible: [],
        topicID: 0,
        topicName: ''
    }
  },
  methods: {
      toggleShow(n){
          
          //this.arrVisible[n] = (this.arrVisible[n] == '') ? 'visible' : '';
          this.arrVisible[n] = !this.arrVisible[n];
          
          
      },
      createArray(){
        
        let length = this.articles.length;
        console.log('mounted' + length);
        
        for(let n = 0; n < length; n++){
            this.arrVisible[n] = false
        }
      },
      showTopic(id,name)
      {
          this.topicID = id;
          this.topicName = name;
      }
  },
  mounted() {
      
      
      this.createArray();
            
  }
}
</script>
