<template>
<div class="container">{{articles}}
    <div class="topic" :id="'article' + article.id" v-for="(article, aindex) in arrArticle" :key="article.id">
        <div class="row justify-content-between" @click="topicClick(article.id)">
            <div class="col-9">
                <div >{{article.name}}</div>
            </div>
            <div class="col-3">
                <div class="text-right">{{article.topics.length}}&nbsp;หัวข้อ</div>
            </div>
        </div> 
            
        <ul :id="'listTopic' + article.id" v-if="isVisible(article.id)"> 
            <li class="listTopic" v-b-modal="'modal-pretest-' + article.id" @click="getPretest(article.id)">ทดสอบก่อนเรียน</li>           
            <li v-for="(topic, tindex) in article.topics" 
                :id="'topic-' + article.id + '-' + topic.id"
                :key="topic.id" 
                class="listTopic"
                @click="showTopic(article.id, topic.id, topic.name,aindex, tindex)" 
                v-b-modal="'modal-center'">
                {{topic.name}}                
            </li>
            <li class="listTopic" v-b-modal="'modal-posttest-' + article.id" @click="getPosttest(article.id)">ทดสอบหลังเรียน</li>
            <b-modal 
                :id="'modal-pretest-' + article.id" 
                :title="'แบบทดสอบก่อนเรียน ' + article.name"
                size="lg" 
                :ref="'modal-pretest-' + article.id"
                hide-footer
                hide-header-close
                header-class="modalHeader"
                >
                <my-question-answer 
                    :id="'qa-pretest-'+ article.id"
                    :arrQuestion="getPretest(article.id)"
                    @eventClose="handleClose('modal-pretest-' + article.id)"
                ></my-question-answer>
            </b-modal>
            <b-modal 
                :id="'modal-posttest-' + article.id" 
                :title="'แบบทดสอบหลังเรียน ' + article.name"
                size="lg" 
                :ref="'modal-posttest-' + article.id"
                hide-footer
                hide-header-close
                header-class="modalHeader"
                >
                <my-question-answer 
                    :id="'qa-posttest-'+ article.id"
                    :arrQuestion="getPosttest(article.id)"
                    @eventClose="handleClose('modal-posttest-' + article.id)"
                ></my-question-answer>
            </b-modal>
        </ul>   

             
    </div>
    <b-modal id="modal-center" size="lg" :title="topicName" hide-footer>
        <show-topic :topic="topicID"></show-topic>
    </b-modal>
        
</div>
    
</template>
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

<script>
export default {
    props: ['articles'],
  data() {
    return {
        arrVisible: [],
        topicID: 0,
        topicName: '',        
        modalQuestionTitle:'',
        modalQuestionID: 0,
        modalQuestionIndex: 0,
        //questions:[],
        arrArticle: []
        
        
    }
  },
  methods: {
        fetchData(){
            this.arrArticle = this.articles;
        },
        topicClick(id){
            //กดเปิด กดปิด
            if (this.isVisible(id)){
                var index = this.arrVisible.indexOf(id);              
                if (index !== -1){                  
                    this.arrVisible.splice(index,1);
                }              
                $('#listTopic' + id).visible = false
                $('#article' + id).removeClass('active');

            }else{
                this.arrVisible.push(id);
                $('#article' + id).addClass('active');
            }
            
        },
        isVisible(id){
            let check = false
            this.arrVisible.indexOf(id) < 0 ? check = false : check = true;
                return check;          
        },
        showTopic(articleid,topicid,name,aindex,tindex)
        {
            this.topicID = topicid;
            this.topicName = name;
            
            $('.listTopic').removeClass('topicSelect');
            $('#topic-' + articleid + '-' + topicid).addClass('topicSelect');

        },
        getPretest(articleid){
            let arr = [];
            var index = this.articles.findIndex(i => i.id === articleid);
            arr = this.articles[index].pretest.questions.slice(0);
            //console.log('index:' + index);
            return arr;
        },
        getPosttest(articleid){
            let arr = [];
            var index = this.articles.findIndex(i => i.id === articleid);
            arr = this.articles[index].posttest.questions.slice(0);
            //console.log('index:' + index);
            return arr;
        },
        handleClose(ref){
            
            this.$refs[ref][0].hide()
        }
        

  },
  mounted(){
      
  },
  watch: {
      articles(){
          this.fetchData();
      }
  },
  mounted() {
     this.addArray(); 
    }
}
</script>
