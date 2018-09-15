<template>

    <div class="topic" >
        <div class="row justify-content-between" @click="showTopic =! showTopic">
            <div class="col-9">
                <div >{{article.name}}</div>
            </div>
            <div class="col-3">
                <div class="text-right">{{topics.length}}&nbsp;หัวข้อ</div>
            </div>
            
        </div> 
        <ul v-if="showTopic">  
            <li class="listTopic" v-b-modal="'modal-test'+article_id" @click="getQuestion(pretest.id)">{{pretest.name}}</li>                      
            <li v-for="(topic,index) in topics" :key="topic.id"                                 
                class="listTopic"
                @click="onClickTopic(index)"
                v-b-modal="'modal-topic'+article_id">
                {{topic.name}}
            </li>  
            <li class="listTopic" v-b-modal="'modal-test'+article_id" @click="getQuestion(posttest.id)">{{posttest.name}}</li>                   
        </ul>
        <b-modal 
            :id="'modal-topic'+article_id" 
            size="lg" 
            
            :title="topic.name" 
            hide-footer>
            <show-topic :detail="topic.detail"></show-topic>
        </b-modal>
        <b-modal :id="'modal-test'+article_id" size="lg" hide-footer>
            <my-question-answer 
                :arrQuestion="questions"                 
                @eventSubmit="submitTest"
                @eventClose="toModalTestClose"                                                                              
            ></my-question-answer>
        </b-modal>
        
    </div>

    
</template>
<script>
export default {
    props : ['article_id'],
    data(){
        return{
            article: {
                id: 0,
                name :'',
                status : 1
            },
            topics: [],
            tests: [],
            test: {},
            pretest: {},
            posttest: {},
            showTopic: false,
            topic: {
                id: 0,
                name: '',
                detail: ''
            },
            showTopicName: '',
            showTopicID: 0,
            questions: []
        }
    },
    mounted(){
        this.fetchData()
    },
    methods: {
        fetchData(){
            var path = `/api/articles/${this.article_id}`
            axios.get(path)
            .then(response=>{
                this.article = response.data.data;
            })
            this.getTopic();
            
        },
        getTopic(){
            var path = `/api/articles/${this.article_id}/topics`
            axios.get(path)
            .then(response=>{
                this.topics = response.data.data;
                this.getTest();                
                this.$forceUpdate();
            })
        },
        getTest(){
            var path = `/api/articles/${this.article_id}/article_tests`;
            axios.get(path)
            .then(response=>{
                this.tests = response.data.data;
                for (let i=0;i<this.tests.length;i++){
                    if (this.tests[i].type == 1){
                        this.pretest = this.tests[i];
                    }else if (this.tests[i].type == 2){
                        this.posttest = this.tests[i];
                    }
                }
            })
        },
        getQuestion(test_id){
            var path =`/api/articles/${this.article_id}/article_tests/${test_id}/article_questions`;
            axios.get(path)
            .then(response=>{
                this.questions = response.data.data;
                this.$forceUpdate();
            })
        },
        onClickTopic(index){
            this.topic.id = this.topics[index].id;
            this.topic.name = this.topics[index].name;
            this.topic.detail = this.topics[index].detail;
            this.$forceUpdate();
        },
        submitTest(selectChoice){            
            this.result = selectChoice.length;
        },
        toModalTestClose(){
            var modalName = 'modal-test' + this.article_id;
            this.$root.$emit('bv::hide::modal',modalName);
            //this.$refs.modal.hide();
        },
    }
    
}
</script>

<style scoped>
.modal-header>h5{
    font-size: 1.25em!important;
    text-align: center!important;
}
.container{
    background-color: #fff;
    padding: 15px 15px 5px 15px;
}
.row{
    padding-top: 5px;
    padding-bottom: 5px;
}
.topic{
    display: inline-block;
  *display: inline;
  width: 100%;
  padding: 6px 20px;
  margin: 0 0 5px; ;
  cursor: pointer;
  border: 1px solid #bbb;
  overflow: visible;
  
  text-decoration: none;
  white-space: nowrap;
  color: #555;
  background-color: #ddd;
  background-image: linear-gradient(top, rgba(255,255,255,1),
                                         rgba(255,255,255,0)),
                    url(data:image/png;base64,iVBORw0KGg[...]QmCC); 
  transition: background-color .2s ease-out;
  background-clip: padding-box; /* Fix bleeding */
  border-radius: 3px;
  box-shadow: 0 1px 0 rgba(0, 0, 0, .3),
              0 2px 2px -1px rgba(0, 0, 0, .5),
              0 1px 0 rgba(255, 255, 255, .3) inset;
  text-shadow: 0 1px 0 rgba(255,255,255, .9);  

}
.topic:hover{
  background-color: #eee;
  
}
.topic>.row:hover{
  
  color: #079488;
  
}
.topicSelect{
    color: #079488;
    
}
.listTopic:hover{
    color: #079488;
    
}
.active{
  background: #e9e9e9;
  position: relative;
  top: 1px;
  text-shadow: none;
  box-shadow: 0 1px 1px rgba(0, 0, 0, .3) inset;
}
.fade-enter,
.fade-leave-active {
    opacity: 0;
    transform: translateY(-10px);
}
.fade-leave-active {
    position: absolute;
}

.animated {
  transition: all 0.5s;
  /*display: flex;*/
  width: 100%;
}
.card-header{
    background-color: rgb(9, 40, 126)!important;
    padding: 5px!important;
}
#testTab__BV_tab_controls_{
		padding: 5px!important;
}
</style>


