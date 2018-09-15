<template>
    <div>
        <div class="row justify-content-md-center">
                <div class="col-sm-8">
                    <b-form id="frmTest" @submit="onSubmit">
                        <b-form-group id="fieldTestName"
                            label="ใส่ชื่อแบบทดสอบ"
                            label-for="txtTestName"
                            description="">
                            <b-form-input v-model="testName" 
                                id="txtTestName"  
                                required     
                                type="text"
                                @focus.native="$event.target.select()"
                                placeholder="กรุณาใส่ชื่อแบบทดสอบ">
                            </b-form-input>
                        </b-form-group>
                        
                        <b-form-group label="เลือกประเภทของแบบทดสอบ">
                            <b-form-radio-group v-model="testType"
                                required
                                :options="optionsTest"
                                name="rbtTest">
                            </b-form-radio-group>
                        </b-form-group>
                    <b-button variant="outline-primary" type="submit" ><i class="fas fa-save fa-sm"></i>&nbsp;บันทึก</b-button>                
                    <b-button variant="danger" @click="onReset" ><i class="fas fa-ban fa-sm"></i>&nbsp;ยกเลิก</b-button>
                </b-form>        
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['data','parent','parentid'],
    data(){
        return{
            mytest: [],  
            optionsTest: [
                { text: 'แบบทดสอบก่อนเรียน (Pre-Test)' , value: 1},
                { text: 'แบบทดสอบหลังเรียน (Post-Test)' , value: 2}
            ],
            state: "new",
            
            testName: '',
            testType: 0,
        }
    },
    methods: {
        
        onSubmit(evt){
            
            evt.preventDefault();
            
            let path;
            path = `/api/${this.parent}/${this.parentid}/`
            //console.log('parent :' + this.parent + this.parentid);
            if (this.parent == "subjects"){
                path = `${path}subject_tests`;
            }else if (this.parent == "articles"){
                path = `${path}article_tests`;
            }
            //console.log('add test:' + path);
            if (this.state == "new"){
                axios.post(`${path}`,{
                    name : this.testName,
                    type : this.testType,
                    status : "1"

                }).then((response) => {
                   
                }).catch(error => {                    
                    console.log('error:' + error);
                })
            }else{
                //console.log('state:' + this.state);
                
                axios.put(`${path}/${this.data[0].id}`,{
                    name : this.testName,
                    type : this.testType,
                    status : "1" 
                }).then((response) => {
                    
                }).catch(error => {                    
                    console.log('error:' + error);
                })
            }
            
            this.$emit('eventSubmit');
            
            
            
        }, 
        onReset(){
            this.reset();
            this.$emit('eventReset');
        },
        reset(){
            this.testName = '';
            this.testType = 0;
            this.state = "new"
        }     
    },
    watch: {
        data(){
           if (this.data.length > 0){
                this.testName = this.data[0].name;
                this.testType = this.data[0].type;
                this.state = "edit";
            }else{
                this.testName = '';
                this.testType = 0;
                this.state = "new"
            } 
            
            this.$forceUpdate(); 
        }
    },
    created(){
        //console.log(this.data);
        if (this.data.length>0){
            this.testName = this.data[0].name;
            this.testType = this.data[0].type;
            this.state = "edit";
        }else{
            this.testName = '';
            this.testType = 0;
            this.state = "new"
        }
    }
    
}
</script>
<style scoped>

.btn{
    font-size: 0.7em;
    margin-bottom: 5px;
}
#frmTest{
    margin-bottom: 10px;
    border : 1px solid rgb(194, 194, 194);
    border-radius: 5px;
    padding: 10px;
}
</style>
