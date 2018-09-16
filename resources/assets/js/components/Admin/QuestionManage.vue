<template>
    <div>
        <my-alert :AlertType="alert"></my-alert>
        <b-button @click="toStart" variant="primary" size="sm" v-b-modal="`${modal_name}`">{{question.length}}&nbsp;คำถาม</b-button>

        <b-modal :id="`${modal_name}`" 
            title="จัดการคำถาม-คำตอบ"
            size="lg"
            no-close-on-backdrop
            no-close-on-esc
            no-enforce-focus
            hide-footer
            @hide="modalClose"
            >
            
            <p class="question_title text-left">หัวข้อ :<slot name="title"></slot></p> 
            <p class="question_title text-left">แบบทดสอบ :<slot name="topic"></slot></p>
            <alert style="display:relation; z-index:200;" :message="message" :type="result"></alert>
            <!--========================Form Question Add/Edit=========================-->
            <transition name="slide-fade">
            <b-form class="text-left" @submit="q_submit" v-if="q_box_show"> 
                <b-card header="จัดการคำถาม">
                    <div class="row">
                        <div class="col-2">
                            <b-form-group id="lblQOrder"
                                label="ลำดับ:"
                                label-for="q_order">
                                <b-form-select id="q_order"
                                            :options="q_order_list"
                                            required
                                            size="sm"
                                            v-model="q_order">
                                </b-form-select>
                            </b-form-group>
                        </div>
                        <div class="col-10">
                            <b-form-group id="lblQName"
                                label="คำถาม:"
                                label-for="q_name">
                                <b-form-input id="q_name"
                                            type="text"
                                            v-model="q_name"
                                            required
                                            size="sm"
                                            placeholder="ใส่รายละเอียดคำถาม">
                                </b-form-input>
                            
                            </b-form-group>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <b-form-group id="lblQAnswer"
                                label="คำตอบ :"
                                label-for="q_answer">
                            <b-form-select id="q_answer"
                                        :options="q_answer_list"
                                        required
                                        size="sm"
                                        v-model="q_answer">
                            </b-form-select>                            
                        </b-form-group>
                        </div>
                        <div class="col-10">
                            <label >ตัวเลือกคำตอบ</label>
                            <b-container fluid>
                                <b-row class="option-row" v-for="(option,index) in options" :key="index" align-v="center">
                                    <b-col sm="2">
                                        <label class="option-label" :for="`option-${option.value}`">ตัวเลือกที่ {{ option.value }}:</label>
                                    </b-col>
                                    <b-col sm="10">
                                        <b-form-input :id="`option-${option.value}`"
                                            type="text" size="sm" v-model="option.text"
                                            :placeholder="`ตัวเลือกที่ ${option.value}`"
                                            required>
                                        </b-form-input>
                                    </b-col>
                                </b-row>
                            </b-container>
                        </div>
                    </div>
                
                
                
                <div slot="footer">
                    <div class="text-center">
                        <b-button variant="outline-primary" type="submit" ><i class="fas fa-save fa-sm"></i>&nbsp;บันทึก</b-button>                
                        <b-button variant="danger" @click="q_reset()"><i class="fas fa-ban fa-sm"></i>&nbsp;ยกเลิก</b-button>
                    </div>
                    
                </div>
                </b-card>          
            </b-form>
            </transition>
            <!--===================End Form Question Add/Edit=========================-->    
            <div class="row">
                <div class="col text-left">
                    <label><span class="icon"><i class="fas fa-question fa-lg"></i></span>ข้อมูลคำถาม - คำตอบ :</label>
                    <b-button id="btnAddQuestion" 
                        variant="outline-success" size="sm" 
                        @click="addQuestion()"
                        >
                        <i class="fas fa-plus-square fa-md"></i>
                        &nbsp;เพิ่มคำถามคำตอบ
                    </b-button>
                </div>
            </div>
            <div class="question_list" >
                <div class="row header align-items-center">
                    <div class="col-md-1 text-center">ลำดับ</div>
                    <div class="col-md-5 text-center">คำถาม</div>
                    <div class="col-md-2 text-center">คำตอบ</div>
                    <div class="col-md-2 text-center">ตัวเลือก</div>
                    <div class="col-md-2 text-center">จัดการข้อมูล</div>
                </div>
                 <div class="row data align-items-center"  v-for="(q,index) in question" :key="index">
                    <div class="col-md-1">
                        {{q.order}}
                    </div>
                    <div class="col-md-5 text-left">
                        <span class="text-left">{{q.name}}</span>
                    </div>
                    <div class="col-md-2 text-center">                        
                        <span class="text-center">{{q.answer}}</span>
                    </div>
                    
                    <div class="col-md-2"></div>
                    <div class="col-md-2 text-center">
                        <b-button variant="primary" size="sm" 
                            v-b-tooltip.hover 
                            title="edit"
                            class="text-center"
                            @click="q_edit(index)">
                            <i class="fas fa-edit "></i>                        
                        </b-button>
                        <b-button variant="danger" size="sm" 
                            @click="q_delete(index)"
                            v-b-tooltip.hover 
                            title="delete">
                            <i class="fas fa-times "></i>                        
                        </b-button>
                    </div>
                </div>
            </div>
            
            
        </b-modal>
    </div>
</template>
<script>
export default {
    props:['question_type','question_type_id','test_id'],
    data(){
        return{
            modal_name : `question_${this.question_type}_${this.question_type_id}_${this.test_id}`,
            question : [],
            q_path: '',
            q_id: 0,
            q_name: '',
            q_order: 0,
            q_type: 0,
            q_answer: 0,
            q_max: 0,
            q_order_list: [],
            q_answer_list: [
                {value: 0, text: "คำตอบ"},
                {value: 1, text: "ข้อ 1 ถูก"},
                {value: 2, text: "ข้อ 2 ถูก"},
                {value: 3, text: "ข้อ 3 ถูก"},
                {value: 4, text: "ข้อ 4 ถูก"},
            ],
            status : "new",
            q_box_show: false,
            option1 : 
                {
                    id: 0,
                    text : '',
                    value : 0,                    
                }
            ,
            options : [],
            message: "",
            result: "success",
            alert: ""
        }
    },
    created(){
        //console.log("test id :" + this.test_id);
        this.fetchData();
        
    },
    
    watch:{
        test_id(){
            //console.log("test id change :" + this.test_id);
            this.fetchData();
        }
    },

    methods: {
        fetchData(){
            if (this.test_id != 0){
                //console.log(this.question_type);
                var q = [];
                var test_name = "";
                test_name = (this.question_type == "subjects" ? "subject_tests" : "article_tests");
                var question_name = this.question_type == "subjects" ? "subject_questions" : "article_questions";
                var path = `/api/${this.question_type}/${this.question_type_id}/${test_name}/${this.test_id}/${question_name}`;
                this.path = path;
                //console.log('q path :' + path);
                this.getQuestion(path);
            }
            
        },
        getQuestion(path){            
            var questions = [];
            //let path = `/api/subjects/1/subject_tests/${testid}/subject_questions`;
            //console.log(path);
            axios.get(`${path}`)
                .then(response => {                    
                    this.question = response.data.data;    
                    var max = this.question.length;
                    this.q_max = max;
                    this.getOrderList(); 
                    this.$forceUpdate();                   
                })                        
        },
        getOptions(){
            if (this.status == "edit"){
                var path = `/api/questions/${this.q_id}/options`;                

                axios.get(`${path}`)
                    .then(response => {
                        this.options = response.data.data;
                        //console.log('options :' + this.options);
                        if (this.options.length == 0){
                            this.clearOption();
                        }
                    }).catch(error =>{

                    })
            }
        },
        saveOptions(){
            var path = "";
            if (this.status == "edit" && this.options[0].id != 0){                
                
                for (let i=0; i<4 ;i++){
                    path = `/api/questions/${this.q_id}/options/${this.options[i].id}`;
                    //console.log('save option: '+ path);
                    axios.put(`${path}`,{
                        text : this.options[i].text,
                        value : this.options[i].value,
                        status : 1
                    }).then(response =>{
                        this.clearOption();
                    }).catch(error=>{

                    })
                }
            }else{                
                for (let i=0; i<4 ;i++){
                    path = `/api/questions/${this.q_id}/options`;
                    //console.log('save option: '+ path);
                    axios.post(`${path}`,{
                        text : this.options[i].text,
                        value : this.options[i].value,
                        status : 1
                    }).then(response =>{
                        this.clearOption();
                    }).catch(error=>{
                        this.showAlert("error","บันทึกตัวเลือกไม่สำเร็จ");
                    })
                }
            }
        },
        showAlert(result, message){
            this.message = message;
            this.result = result;
            setTimeout(() => {
                this.message = "";
                this.result = "";
            }, 3000);
            
        },    
        getOrderList(){
            var max = this.q_max;
            var order = [];
            
            order.push({'value': 0, text: 'ลำดับ'});
            if (this.status == "new"){
                max = max + 1;
            }
            for (let i = 1; i <= max; i++){
                order.push({value: i, text: i});
            }
            this.q_order_list = order;
        },
        q_edit(index){
            this.q_box_show = true;
            this.q_id = this.question[index].id;
            this.q_order = this.question[index].order;
            this.q_name = this.question[index].name;
            this.q_answer = this.question[index].answer;
            this.status = "edit"
            this.getOrderList();
            this.getOptions();
        },
        q_submit(e){
            e.preventDefault();
            if (this.status == "edit"){
                var path = "";
                path = `${this.path}/${this.q_id}`;
                //console.log('path :' + path);
                axios.put(`${path}`,{
                    name : this.q_name,                    
                    order : this.q_order,
                    answer : this.q_answer,
                    status : "1"
                }).then(response => {
                    //console.log("response:" + response);
                    this.getQuestion(this.path);
                    this.saveOptions();
                    this.clearQuestion();
                    //this.showAlert("success","บันทึกข้อมูลสำเร็จ");
                    this.alert = "success";                    
                    
                }).catch(error => {
                    //console.log("error:" + error);
                    this.$swal({
                        title: "เกิดข้อผิดพลาด",                        
                        icon: "success",
                        timer: 2000,
                        button: false,
                    });
                })
            }else{
                var path = "";
                path = this.path;
                
                axios.post(`${path}`,{
                    name : this.q_name,                    
                    order : this.q_order,
                    answer : this.q_answer,
                    status : "1"
                }).then(response => {
                    //console.log("response:" + response);
                    this.alert = 'success';
                    var data = response.data.data;
                    this.q_id = data.id;
                    this.saveOptions();
                    this.getQuestion(this.path);
                    
                    
                    this.clearQuestion();
                    
                    
                }).catch(error => {
                     this.alert = 'error';
                    //console.log("error:" + error);
                })
            }
        },
        q_delete(index){
            this.$swal({
                title: "คุณต้องการลบคำถาม คำตอบ ใช่หรือไม่ ?",
                icon: "warning",
                buttons: [
                    'ยกเลิก',
                    'ยืนยัน'
                ],
                dangerMode: true,
            }).then(isConfirm =>{
                if (isConfirm){
                    var path = "";
                    path = `${this.path}/${this.question[index].id}`
                    
                    //console.log('path :' + path);
                    axios.delete(`${path}`,{

                    }).then(response => {
                        if (this.q_id == this.question[index].id){
                            this.clearQuestion();
                            this.clearOption();
                        }
                        //this.showAlert("success","ลบข้อมูลสำเร็จ")
                        this.alert = "success";
                        this.getQuestion(this.path);
                                        
                    }).catch(error => {
                        this.alert = "error";
                    // console.log("error: " + error);
                    })
                }
            });
            
            
                
            
            
        },
        addQuestion(){
            this.clearQuestion();
            this.q_box_show = true;
            this.getOrderList();
            this.createOptions();
        },
        q_reset(){
             this.clearQuestion();
            this.q_box_show = false;
        },
        clearQuestion(){
            this.status = "new";
            this.q_id = 0;
            this.q_name = "";
            this.q_order = 0;
            this.q_answer = 0;
        },
        handleImageAdded: function(file, Editor, cursorLocation, resetUploader) {
            // An example of using FormData
            // NOTE: Your key could be different such as:
            // formData.append('file', file)

            var formData = new FormData();
            formData.append('image', file)
console.log('image: ' + formData);
            axios({
            url: 'https://fakeapi.yoursite.com/images',
            method: 'POST',
            data: formData
            })
            .then((result) => {
            let url = result.data.url // Get url from response
            Editor.insertEmbed(cursorLocation, 'image', url);
            resetUploader();
            })
            .catch((err) => {
            console.log(err);
            })
        },
        createOptions(){
            this.options= [];
            
            for (let i = 1; i <= 4; i++){
                this.options.push({
                    id: 0,
                    text: "",
                    value: i
                })
            }
        },
        clearOption(){
            
            this.options = [];
            for (let i = 1; i <= 4; i++){
                this.options.push({
                    id: 0,
                    text: "",
                    value: i
                })
            }
        },
        modalClose(){
            this.q_reset();
            this.$emit("getTest");
        },
        toStart(){
            this.q_box_show = false;
        }
        
    },
    computed: {
        
    }
}
</script>
<style scoped>
.question_title{
    font-size: 1.1em;
    font-weight: bold;
    text-align: left;
}
.modal-content{
    cursor: default!important;
}
.btn{
    font-size: 0.8em;
    margin-bottom: 5px;
    margin-top: 5px;
}
.options{
    border-width: 0px!important;
}
.card-body{
    padding: 5px 10px 5px 10px!important;
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
.question_list{
    font-size: 0.8em;
}
#q_order, #q_answer{
    max-width: 100px;
    cursor: pointer;
}
.slide-fade-enter-active {
  transition: all .5s ease;
}
.slide-fade-leave-active {
  transition: all .5s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
.option-row{
    padding-top: 3px!important;
    padding-bottom: 3px!important;
}
.option-label{
    
    margin-bottom: 0px!important;
}
</style>

