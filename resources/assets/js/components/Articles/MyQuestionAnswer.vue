<template>
    <form @submit.stop.prevent="handleSubmit">
        <b-container>
            <b-row>
                <b-col>
                    
                    <b-card no-body>
                        <b-tabs v-model="qindex" id="testTab" pills card vertical nav-wrapper-class="col-3">
                            <b-tab  :id="'q'+index" :title="'ข้อที่ :' + (index+1) + answered[index]" v-for="(question,index) in questions" :key="question.id" >
                                <div class="question">{{question.name}}</div>
                                
                                <b-form-group>
                                    <b-form-radio-group                        
                                        v-model="selectChoice[index].select"                         
                                        :options="options[index]"                                                                              
                                        stacked
                                        :id="'option' + question.id"
                                        @input="isSelected"
                                        :name="'option' + question.id"
                                        >
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
    props: ['arrQuestion'],
    data(){
        return{    
            questions: [],      
            qindex: 0,
            
            answered: [],
            max: 0,
            count: 0,
            
               
            selectChoice: [],
            answeredPaper:[],
            options: [],
          
        }
    },
    watch: {
        
    },
    methods: {
       getOptions(path){
           let option = {}
           axios.get(path)
           .then(response=>{
              option = response.data.data;
              this.options.push(option);
           })
       },
       isSelected(){            
            let count = 0;
            for (let i = 0; i < this.selectChoice.length; i++){ 
                
                if (this.selectChoice[i].select != 0){
                    this.answered[i] = '*';                    
                    count = count + 1;                        
                    
                }else{
                    this.answered[i] = '';
                }
            } 
            this.count = count;            
        },
        clearData(){
            this.questions=[];
            this.qindex = 0
            this.max = 0            
            this.count = 0 
            this.options= [];         
            this.selectChoice = [];
            this.answered = [];
            this.answeredPaper=[];
                    
            console.log('clearData');
        },
        fetchData(){
            console.log('Question Created');
            this.questions = this.arrQuestion;
            this.questions.forEach(element => {
                this.selectChoice.push({ 'qid':element.id ,'select':0 });                
                this.answered.push('');
                this.getOptions(element.options.link);
               
            });
            
            this.max = this.arrQuestion.length
        },
        isAnswerAll(){            
            if (this.count === this.max){
                return true
            }else{
                return false
            }

        },
        handleSubmit(){         
            this.$emit('eventSubmit',this.selectChoice);
            this.clearData();
            this.$emit('eventClose');
        },
        toClose(){
            this.$emit('eventClose');
        },
    },    
    created(){
            
        
    },
    watch:{
        arrQuestion(){
            console.log('watch')
            this.clearData();
            this.fetchData();
        }
    },
    mounted(){
       
    },
    computed:{
        countPercent(){
            return (this.count/this.max) * 100
        },
        
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
