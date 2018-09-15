<template>
    <div>
        <div class="row justify-content-end">
            <div class="col-4">
                <h2 class="header text-center">ข้อมูลวิชา</h2>
            </div>
            <div class="col-4">
                <alert :message="message" :type="result"></alert>
            </div>
        </div>
        
        <b-form @submit="onSubmit" @reset="onReset">            
            <label for="name"><span class="icon"><i class="fas fa-book  fa-lg" ></i></span>ชื่อวิชา :</label>
            <transition :duration="300" name="fade" mode="out-in">
                <b-button variant="outline-success" size="sm" @click="onEdit" v-if="!isEdit"><i class="fas fa-pen-square fa-sm"></i>&nbsp;แก้ไข</b-button>
                <div v-if="isEdit" class="d-inline">
                    <b-button variant="outline-primary" size="sm" type="submit" ><i class="fas fa-save fa-sm"></i>&nbsp;บันทึก</b-button>                
                    <b-button variant="danger" @click="isEdit=false" size="sm" ><i class="fas fa-ban fa-sm"></i>&nbsp;ยกเลิก</b-button>
                </div>
                
            </transition>
            <b-form-input v-model="subjectname"
                id="txtName"
                type="text"
                ref="name"
                placeholder="กรุณาใส่ชื่อวิชา"
                @focus.native="$event.target.select()"
                :disabled="!isEdit">
            </b-form-input>                 
        </b-form>

        <label><span class="icon"><i class="fas fa-question fa-lg"></i></span>แบบทดสอบ :</label>       
        
        <b-button id="btnAddTest" v-if="false"
            variant="outline-success" size="sm" 
            @click="addTest">
            <i class="fas fa-plus-square fa-md"></i>
            &nbsp;เพิ่มแบบทดสอบ
        </b-button>
        <test-manage 

            ref="testForm"
            :data="test" 
            parent="subjects"
            :parentid = "subject[0].id"
            v-if="showTest"
            @eventSubmit="testSubmit"
            @eventReset="testReset">
        </test-manage>
        
        

        <div class="testlist" v-if="tests.length > 0">
            <div class="row header align-items-center">
                <div class="col-md-4 text-center">ชื่อแบบทดสอบก่อนเรียน</div>
                <div class="col-md-2 text-center">ประเภทการทดสอบ</div>
                <div class="col-md-2 text-center">คำถามคำตอบ</div>
                <div class="col-md-2 text-center">จัดการข้อมูล</div>
                <div class="col-md-2 text-center">ปรับปรุงเมื่อ</div>
            </div>
            <div class="row data align-items-center" v-for="(test,index) in tests" :key="index">
                <div class="col-md-4">
                    {{test.name}}
                </div>
                <div class="col-md-2 text-center">
                    <span class="text-center">{{test.typetext}}</span>
                </div>
                <div class="col-md-2 text-center">
                    <question-manage 
                        question_type="subjects"
                        :question_type_id = "subject[0].id"
                        :test_id="`${test.id}`"
                        @eventSubmit="showAlert"
                        @modalClose="getTest"
                    >
                    <span class="question_title text-left" slot="title">{{subject[0].name}}</span>
                    <span class="question_title text-left" slot="topic">{{test.name}}</span>

                    </question-manage>
                    
                </div>
                <div class="col-md-2 text-center">
                    <b-button variant="primary" size="sm" 
                        @click="editTest(index)"
                        v-b-tooltip.hover 
                        title="edit"
                        class="text-center">
                        <i class="fas fa-edit "></i>                        
                    </b-button>
                    <b-button variant="danger" size="sm" 
                        @click="deleteTest(index)"
                        v-b-tooltip.hover 
                        title="delete" v-if="false">
                        <i class="fas fa-times "></i>                        
                    </b-button>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
        
        

    </div>
</template>
<script>
export default {
    data(){
        return{
            source: '/api/subjects',
            subject: [],
            subjectname: '',
            isEdit: false,
            result: '',
            message: '',
            showTest: false,
            tests: [],
            test: [],
            pretest: [],
            posttest: [],
            myquestions:[],
            question_path: []
        }
    },
    created(){
        this.fetchData();
    },
    methods: {
        fetchData(){
        axios.get(`${this.source}`)
            .then(response => {
                this.subject = response.data.data;
                this.subjectname = this.subject[0].name;
                
                this.getTest();
                
                
            })
            
        },
        onSubmit(evt){
            evt.preventDefault();
            axios.put(`${this.source}/${this.subject[0].id}`,{
                name: this.subjectname
            }).then(response => {
                
                this.showAlert("success","บันทึกสำเร็จ");
                this.isEdit = false;
                
                console.log(response);
            }).catch(error => {
                this.isEdit = true;
                console.log(error);
            })
            
        },
        
        getTest(){
            var tests = [];
            axios.get(`/api/subjects/1/subject_tests`)
                .then(response => {
                    tests = response.data.data;
                    this.tests = tests;                  
                }).catch(error => {

                });
            
                
        },
        
        countQuestion(testid){
            return 0;
        },

        deleteTest(index){
            var confirm = window.confirm('คุณต้องการลบแบบทดสอบใช่หรือไม่');
            if (confirm == true){
                var path = `/api/subjects/${this.subject[0].id}/subject_tests/${this.tests[index].id}`
                console.log('path :' + path);
                axios.delete(`${path}`,{

                }).then(response => {
                    this.showAlert("success","ลบข้อมูลสำเร็จ");                    
                }).catch(error => {
                    console.log()
                })
            }
            this.getTest();

        },
        onEdit(e){
            e.preventDefault();
            this.isEdit=true;
            this.message = "";
            this.result = "";
        },
        onReset(){

        }, 
        addTest(){
            //this.$refs.testForm.TestManage.reset();
            this.test =[];
            this.showTest = true;

            this.$forceUpdate();
            this.$nextTick();
        },
        editTest(index){
            this.test = [];
            this.showTest = true;
            this.test.push(this.tests[index]);
            console.log('test:' + this.test);
        },
        testSubmit(){
            
            this.showAlert("success","บันทึกข้อมูลสำเร็จ");  
            this.getTest();
            
            this.$forceUpdate();
            this.$nextTick();
        },
        testReset(){
            this.showTest = false;            
            this.$forceUpdate();
            this.$nextTick();
        },
        showAlert(result, message){
            this.message = message;
            this.result = result;
            setTimeout(() => {
                this.message = "";
                this.result = "";
            }, 3000);
            
        }    
    },
    watch: {
        isEdit(){
            if (this.isEdit){
                this.$nextTick(() =>
                    this.$refs["name"].focus()                    
                );
                //$('#name').focus();
                
            }
        }
    },
    computed: {
        getPretest(){
            let test = [];
            test = this.tests.filter((test)=>test.type == 1);
            return test;
        },
        getPosttest(){
            let test = [];
            test = this.tests.filter((test)=>test.type == 2);
            return test;
        },
        
    }
}
</script>

<style lang="scss" scoped>
.icon{
    color: rgb(90, 90, 90);
    margin-right: 10px;
}
.subject{
    color: #000;
}
.header{
    padding-bottom: 20px;
}
.alertbox{
    height: 50px;
}
.nav-item>a{
    border-bottom: 1px solid rgb(105, 105, 105)!important;
}
.btn{
    font-size: 0.7em;
    margin-bottom: 5px;
    margin-top: 5px;
}
#txtName{
    margin-bottom: 5px;
}
.row.header{
    background-color: rgb(196, 196, 196);
    padding-top: 5px!important;
    padding-bottom: 5px!important;
}
.row.data{
    
    padding-top: 5px!important;
    padding-bottom: 5px!important;
    background-color: #ddd;
    background-image: linear-gradient(top, rgba(255,255,255,1),
                                            rgba(255,255,255,0)); 
    transition: background-color .2s ease-out;
    background-clip: padding-box; /* Fix bleeding */
}
.row.data:hover{
  background-color: #eee;
  cursor: pointer;
}
.testlist{
    font-size: 0.8em;
}
.modal-big{
    width: 80%!important;
}
.question_title{
    font-size: 1em;
    font-weight: normal;
    text-align: left;
}
.modal-content{
    cursor: default!important;
}
</style>
