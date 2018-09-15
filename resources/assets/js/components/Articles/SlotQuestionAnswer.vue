<template>
    <form @submit.stop.prevent="handleSubmit">
        <b-container>
            <b-row>
                <b-col>
                    <b-card no-body>
                        <b-tabs v-model="qindex" id="testTab" pills card vertical nav-wrapper-class="col-3">
                            <b-tab  :id="'q'+index" :title="'ข้อที่ :' + (index+1) + answered[index+1]" v-for="(question,index) in arrQuestion" :key="question.id" >
                                <div class="question">{{question.question}}</div>
                                <b-form-group>
                                    <b-form-radio-group                        
                                        v-model="selectChoice[index+1].selected"                         
                                        :options="question.choices"
                                        :input-value="question.choices"
                                        stacked
                                        :id="'radioChoice'+ id + index"
                                        @input="isSelected"
                                        :name="'radioChoice'+ id + index"
                                        :title-link-class="linkClass(index)">
                                    </b-form-radio-group>
                                </b-form-group>
                            </b-tab>
                        </b-tabs>
                    </b-card>
                </b-col>
            </b-row>
            <b-row>
                <b-col>                                   
                    <div class="progress" v-if="count>0">
                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" :style="{width:countPercent+'%'}">{{count}}/{{max}}</div>
                    </div>                    
                </b-col>
            </b-row>
            <b-row>
                <div class="col text-center">                    
                    <b-button type="submit" :disabled="!isAnswerAll()" variant="primary" >ส่งแบบทดสอบ</b-button>
                    <b-button @click="toClose" variant="danger">ยกเลิก</b-button>
                </div>
            </b-row>
        </b-container>
        
    </form>
    
</template>
<script>
export default {
    props: [
        'arrQuestion',
        'id'
    ],
    data(){
        return{ 
            
            qindex: 0,
            answeredIcon: '<div v-html="<i class="fas fa-play-circle"></i>"></div>',
            answered: [''],
            max: 0,
            count: 0,
            setmodel:'',
            selected: [0],           
            selectChoice: [
                {
                    qid: 0,
                    selected: 0
                }
            ],
            answeredPaper:[]
        }
    },
    watch: {
        
    },
    methods: {
        handleSubmit(){
            this.answeredPaper = this.createAnsweredPaper();
            
            
            this.$emit('eventSubmit',this.answeredPaper);
            this.clearData();
            this.$forceUpdate();  
            this.$emit('eventClose'); 
        },
        toClose(){
            this.clearData();
            this.$forceUpdate();            
            this.$emit('eventClose');
        },
        createAnsweredPaper(){
            let answeredPaper = [];
            for (let i = 1; i < this.selectChoice.length; i++){
                answeredPaper.push({'qid':this.selectChoice[i].qid, 'selected':this.selectChoice[i].selected});
                //console.log('qid:' + answeredPaper[i-1].qid + 'selected:' + answeredPaper[i-1].selected)
            }
            console.log('Paper Answered Created');
            return answeredPaper;
        },
        linkClass(index){
            
            if (this.qindex === index){
                return ['bg-success', 'text-light']
            }else{
                return ['bg-light', 'text-info']
            }
        },
        isSelected(){            
            let count = 0;
            for (let i = 0; i <= this.arrQuestion.length; i++){ 
                
                if (this.selectChoice[i].selected != 0){
                    this.answered[i] = '*';                    
                    count = count + 1;                        
                    
                }else{
                    this.answered[i] = '';
                }
            } 
            this.count = count;            
        },
        clearData(){
            this.qindex = 0
            this.answeredIcon = ''
            this.answered = ['']            
            this.count = 0
            this.setmodel = 0
            //this.selected = []
            //this.selectChoice = []
            let i = 0
            for (i=1; i < this.selectChoice.length; i++){                
                this.selectChoice[i].selected = 0;
                this.answered[i] = '';
            } 
            console.log('clearData');
        },
        isAnswerAll(){
            
            if (this.count === this.max){
                return true
            }else{
                return false
            }

        }
    },
    computed:{
        countPercent(){
            return (this.count/this.max) * 100
        },
        
    },
    created(){
        console.log('Question Created');
        let i = 0        
        for (i=0; i<this.arrQuestion.length; i++){
            this.selectChoice.push({ 'qid':this.arrQuestion[i].id ,'selected':0 });
            this.selected.push(0);
            this.answered.push('');            
        }
        this.max = i
        console.log(this.selectChoice);
    },
    mounted(){
       
    },
    
}
</script>
<style scoped>
.row{
    padding-top: 0px;
}
.col{
    padding-left: 0px;
    padding-right: 0px;
}
.progress{
    margin: 10px;
}
</style>
