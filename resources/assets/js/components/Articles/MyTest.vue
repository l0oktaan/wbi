<template>
<div>
    <div class="topic">
    <div class="row justify-content-between" @click = "toShowModal('modal-test-'+test.id)">
        <div class="col-9">
            <div >{{test.name}}</div>            
        </div>
        <div class="col-3">
            <div class="text-right">ผลสอบ&nbsp;{{result}}&nbsp;คะแนน</div>
        </div>
    </div> 
</div>
    <b-modal 
        :id="'modal-test-' + test.id" 
        :title="test.name"
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
</div>
    
</template>
<script>
export default {
    props: ['test'],
    data(){
        return{
            questions:[],
            showTest:{},
            question_path: '',
            result: 0,

        }
    },
    methods: {       
        fetchData(){
            var path = this.showTest.questions;
            axios.get(path)
            .then(response=>{
                this.questions = response.data.data;
            })
        },
        toShowModal(modal){  
            //this.modal_title = title;          
            //this.getQuestions(q_path);
            this.fetchData();
            this.$root.$emit('bv::show::modal',modal);
        },
        onModalClose(){
            this.$refs.question.clearData();
        },
        toModalClose(){
            this.$root.$emit('bv::hide::modal',this.modalname);
            //this.$refs.modal.hide();
        },
        submitTest(selectChoice){
            console.log('submit' + selectChoice.length);
            this.result = selectChoice.length;
        },
        
        
    },
    watch:{
        test(){
            this.showTest = this.test;
            this.fetchData();
        }
    },
    created(){
        
    },
    computed: {
      modalname(){
           return 'modal-test-' + this.showTest.id;
       }
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


