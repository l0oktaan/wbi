<template>
<div class="container">
    <div class="topic">
        <div class="row justify-content-between" v-b-modal="'modal-test' + testid">
            <div class="col-9">
                <div >{{title}}</div>
            </div>
            <div class="col-3">
                <div class="text-right">ผลสอบ {{answeredPaper.length}}</div>
            </div>
        </div>  
    </div>
    <b-modal 
        :id="'modal-test' + testid" 
        :title="title"
        size="lg" 
        ref="modal"
        centered
        hide-footer
        hide-header-close
        header-class="modalHeader"
        @shown="clearName"
        @headerclose="toReload()">
        <my-question-answer 
            :id="'qa' + testid"
            :arrQuestion="questions" 
            @eventClose="handleClose"
            @eventSubmit="toSubmit"
            ></my-question-answer>
    </b-modal>
</div>
    
</template>
<script>
export default {
    props: ['title','testid','questions'],
    data(){
        return{
            answeredPaper: [],
            arrQuestion:[]         
        }
    },
    methods: {
        toSubmit(answeredPaper){  
            
            this.answeredPaper = answeredPaper;         
            
            this.$forceUpdate();
            this.$nextTick();
            
        },
        clearName(){
            console.log('clear');
        },
        handleClose(event){
            //event.preventDefault()
            this.$refs.modal.hide()
        },
        
    },
    created(){
        this.arrQuestion = this.questions;
        console.log('q :' + this.arrQuestion);
    },
    computed: {
        iModal(){
            return 'modal-test' + this.testid
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


