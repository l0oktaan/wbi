<template>
    <b-container>
        <b-row>
            <b-col>
                <div class="text-header">                
                    <h3><i class="fas fa-book-open"></i>&nbsp;หัวข้อบทเรียน</h3>
                </div>
            </b-col>
        </b-row>
        <b-row>
            <b-col>
                <my-test :test="pretest"></my-test>
               
                <my-articles :article_id="article.id" v-for="(article,index) in articles" :key="index"></my-articles>
                <my-test :test="posttest"></my-test>
            </b-col>
        </b-row>
        <!-- <b-row>
            <b-col>
                <div class="topic">
                    <div class="row justify-content-between" @click="showModal(pretest.questions,pretest.name)">
                        <div class="col-9">
                            <div >{{pretest.name}}</div>
                            
                        </div>
                        <div class="col-3">
                            <div class="text-right">ผลสอบ&nbsp;{{result}}&nbsp;คะแนน</div>
                        </div>
                    </div> 
                </div>
                <div class="topic">
                    <div class="row justify-content-between" @click="showModal(posttest.questions,posttest.name)">
                        <div class="col-9">
                            <div >{{posttest.name}}</div>
                            
                        </div>
                        <div class="col-3">
                            <div class="text-right">ผลสอบ</div>
                        </div>
                    </div> 
                </div>
                <b-modal 
                    id="modal" 
                    :title="modal_title"
                    size="lg" 
                    ref="modal"
                    centered
                    hide-footer
                    hide-header-close
                    no-close-on-backdrop
                    no-close-on-esc
                    @hidden="onModalClose"
                    header-class="modalHeader"                    
                    >
                    <my-question-answer 
                        :arrQuestion="questions" 
                        ref="question"  
                        @eventSubmit="submitTest"
                        @eventClose="toModalClose"                                                                     
                    ></my-question-answer>
                    
                </b-modal>
            </b-col>
        </b-row> -->
    </b-container> 
</template>
<script>

export default {
    data(){
        return{
            
            questions:[],
            pretest: {},
            posttest: {},
            pretest_id: 1,
            posttest_id : 1,
            pretest_path : '',
            pretest_index : 0,
            posttest_index : 0,
            modal_title: '',
            result: 0,
            articles:[]
        }
    },
    methods: {
        getTest(){
            console.log('get test');
            this.tests = [];
            var pretestpath = "";
            var path = "/api/subjects/1/subject_tests/";
            var index = 0;
            axios.get(path)
            .then(response=>{
                this.tests = response.data.data;
                //console.log('tests' + this.tests[0].questions.link);
               /*  for (let i=0; i< response.data.data.length;i++){
                    this.tests.push(response.data.data[i]);    
                } */
                this.tests.forEach(element => {
                    if (element.type == 1){
                        this.pretest = element
                        this.$store.state.subject_pretest_path = this.pretest.questions;
                        
                        this.pretest_path = element.questions;
                        //   console.log('pretest_path :' + this.pretest_path);                      
                    }else if (element.type == 2){
                        this.posttest = element;
                    }
                });

                
            }).catch(error=>{

            })
        },
        getArticle(){
            var path = `/api/articles`;
            console.log('article :' + path);
            axios.get(path)
            .then(response=>{
                this.articles = response.data.data;
                this.$forceUpdate();
            }).catch(error=>{

            })
            
        },
        showModal(q_path,title){  
            this.modal_title = title;          
            this.getQuestions(q_path);
            this.$root.$emit('bv::show::modal','modal');
        },
        getQuestions(path){
            axios.get(path)
            .then(response=>{
                this.questions = response.data.data;
            })
        },
        onModalClose(){
            this.$refs.question.clearData();
        },
        toModalClose(){
            this.$root.$emit('bv::hide::modal','modal');
        },
        submitTest(selectChoice){
            //console.log('submit' + selectChoice.length);
            this.result = selectChoice.length;
        }
        
    },
    computed: {
        
    },
    created(){
        this.getTest();
        this.getArticle();
    },
    watch: {
        pretest_path(){
            this.$store.state.subject_pretest_path = this.pretest.questions;
            //console.log('store path :' + this.$store.state.subject_pretest_path)
            this.$forceUpdate();
        },
        
    }
}
</script>
<style scoped>
.text-header{
    color: #fff;
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
