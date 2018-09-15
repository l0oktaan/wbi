<template>
    <div>
        <div class="row justify-content-end">
            <div class="col-4">
                <h2 class="header text-center">ข้อมูลหัวข้อวิชา (Article) 
                    <b-button class="btnAdd" 
                        variant="success" 
                        size="lg"
                        @click="onAddArticle"><i class="fas fa-plus fa-lg"></i>
                    </b-button>
                </h2>
            </div>
            <div class="col-4">
                <alert :message="message" :type="result"></alert>
            </div>
        </div>
        <b-form @submit.stop.prevent="onSubmit" @reset="onReset" v-if="status != ''">
            <b-card>                
                    <b-row align-h="end" slot="header"> 
                        <b-col cols="4">
                            จัดการข้อมูลหัวข้อวิชา
                        </b-col>
                        <b-col cols="4" text-right>
                            <b-button variant="primary" type="submit" size="sm">บันทึก</b-button>
                            <b-button variant="danger" @click="clearData" size="sm">ยกเลิก</b-button>
                        </b-col>
                    </b-row>
                
            <b-row>
                <b-col sm="2">
                    <b-form-group id="a_order"
                                label="ลำดับ:"
                                label-for="article_order">
                                <b-form-select id="article_order"
                                            :options="a_order_list"
                                            required
                                            size="sm"
                                            v-model="a_order">
                                </b-form-select>
                            </b-form-group>
                </b-col>
                <b-col sm="10">
                    <b-form-group id="lblArticleName"
                        label="หัวข้อวิชา :"
                        label-for="a_name">
                        <b-form-input id="a_name"
                                    type="text"
                                    v-model="a_name"
                                    required
                                    size="sm"
                                    placeholder="ใส่ชื่อหัวข้อวิชา">
                        </b-form-input>
                    
                    </b-form-group>
                </b-col>
            </b-row>
            </b-card>
        </b-form>
        <!--============================Test Form=============================-->
        <test-manage
            ref="testForm"
            :data="test" 
            parent="articles"
            :parentid = "test.article_id"
            v-if="show_test==true"
            @eventSubmit="testSubmit"
            @eventReset="testReset">
        </test-manage>
        <!--============================Test Form End=========================-->
        <label for="name" class="lblHead"><span class="icon"><i class="fas fa-list-ul fa-lg" ></i></span>รายการหัวข้อวิชา :</label>
        <div class="articlelist" v-if="articles.length > 0">
            <div class="row header align-items-center">
                <div class="col-md-1 text-center">หัวข้อที่</div>
                <div class="col-md-4 text-center">ชื่อหัวข้อวิชา</div>
                <div class="col-md-2 text-center">หัวข้อย่อย</div>
                <div class="col-md-1 text-center">Pre-Test</div>
                <div class="col-md-1 text-center">Post-Test</div>
                <div class="col-md-2 text-center">จัดการข้อมูล</div>
            </div>
            <div v-for="(a,index) in articles" :key="index">
                <div class="row data align-items-center" >
                    <div class="col-md-1">{{a.order}}</div>
                    <div class="col-md-4">{{a.name}}</div>
                    <div class="col-md-2">
                        <b-button variant="primary" size="sm" 
                            @click="showTopic(index)"
                            v-b-tooltip.hover 
                            title="edit"
                            class="text-center">
                            {{arrTopic[index].count}}&nbsp;หัวข้อย่อย                        
                        </b-button>
                        <b-button variant="success" size="sm" 
                            @click="addTopic(index)"
                            v-b-tooltip.hover 
                            title="add"
                            class="text-center"
                            v-b-modal.modal_topic
                            v-if="arrTopic[index].show">
                            <i class="fas fa-plus fa-sm"></i>
                        </b-button>
                    </div>
                    <div class="col-md-1 text-center">
                        <b-button size="sm" 
                            variant="success" 
                            @click="addTest(index)" 
                            v-if="arrTopic[index].pretest_id==0">เพิ่ม Pre-Test
                        </b-button>
                        <question-manage 
                            v-else
                            question_type="articles"
                            :question_type_id = "a.id"
                            :test_id="arrTopic[index].pretest_id" 
                            @getTest="getTest"                           
                        >
                        <span class="question_title text-left" slot="title">{{a.name}}</span>
                        <span class="question_title text-left" slot="topic">{{arrTopic[index].pretest_name}}</span>

                        </question-manage>
                    </div>
                    <div class="col-md-1 text-center">
                        <b-button size="sm" 
                            variant="success" 
                            @click="addTest(index)" 
                            v-if="arrTopic[index].posttest_id==0">เพิ่ม Post-Test
                        </b-button>
                        <question-manage 
                            v-else
                            question_type="articles"
                            :question_type_id = "a.id"
                            :test_id="arrTopic[index].posttest_id" 
                            @getTest="getTest"                           
                        >
                        <span class="question_title text-left" slot="title">{{a.name}}</span>
                        <span class="question_title text-left" slot="topic">{{arrTopic[index].posttest_name}}</span>

                        </question-manage>
                    </div>
                    <div class="col-md-2">
                        <b-button variant="primary" size="sm" 
                            @click="editArticle(index)"
                            v-b-tooltip.hover 
                            title="edit"
                            class="text-center">
                            <i class="fas fa-edit fa-sm"></i>                        
                        </b-button>
                        <b-button variant="danger" size="sm" 
                            @click="deleteArticle(index)"
                            v-b-tooltip.hover 
                            title="delete">
                            <i class="fas fa-times fa-sm"></i>                        
                        </b-button>
                    </div>    
                                
                </div>
                    <transition name="slide-fade">
                    <div class="topic" v-if="arrTopic[index].show">
                        <topic-list 
                            :id="a.id"
                            :article_id="a.id"
                            :article_index="index"
                            :topic_count="arrTopic[index].count"
                            :ref="index"
                            @editTopic="toEditTopic"
                            @showAlert="showAlert"
                            @fetchArticle="getTopicCount"
                            @createOrder="getTopicOrderList">
                        </topic-list>
                    </div>
                    </transition>
                
            </div>

        </div>
        <!--==========================Modal Topic============================-->
        <b-modal 
            id="modal_topic" 
            
            size="lg" 
            ref="modal"
            centered
            hide-footer
            hide-header
            no-close-on-backdrop
            no-close-on-esc
            
            header-class="modalHeader"                    
            >
            <b-form @submit.stop.prevent="onTopicSubmit" @reset="onReset">
                <b-card header="จัดการข้อมูลหัวข้อย่อย">                                  
                   <b-row>
                        <b-col>
                            <b-form-group id="a_order"
                                        label="ลำดับ:"
                                        label-for="topic_order">
                                        <b-form-select id="topic_order"
                                            :options="t_order_list"
                                            required
                                            size="sm"
                                            v-model="topic.order">
                                        </b-form-select>
                                    </b-form-group>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col >
                            <b-form-group id="lblTopicName"
                                label="หัวข้อย่อย :"
                                label-for="t_name">
                                <b-form-input id="t_name"
                                            type="text"
                                            v-model="topic.name"
                                            required
                                            size="sm"
                                            placeholder="ใส่ชื่อหัวข้อย่อย">
                                </b-form-input>
                            
                            </b-form-group>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>
                            <b-form-group id="lblTopicDetail"
                                label="รายละเอียด :"
                                label-for="t_detail">
                                <!-- <b-form-input id="t_detail"
                                            type="text"
                                            v-model="topic.detail"
                                            required
                                            size="sm"
                                            :rows="10"
                                            placeholder="ใส่รายละเอียด">
                                </b-form-input> --> 
                                <my-editor                        
                                    :content = this.topic.detail
                                    ref="editor" 
                                    :path="'article/' + topic.article_id"                                    
                                ></my-editor>
                            </b-form-group>
                        </b-col>
                    </b-row>
                    <div slot="footer">
                        <div class="text-center">
                            <b-button variant="outline-primary" type="submit" ><i class="fas fa-save fa-sm"></i>&nbsp;บันทึก</b-button>                
                            <b-button variant="danger" @click="toModalClose()"><i class="fas fa-ban fa-sm"></i>&nbsp;ยกเลิก</b-button>
                        </div>
                        
                    </div>
                </b-card>
            </b-form>
            
        </b-modal>
        <!--==========================Modal Topic End =======================-->
    </div>
</template>
<script>
export default {
    data(){
        return {
            status: '',
            articles:[],
            path: '',
            message: '',
            result: '',
            a_id: 0,
            a_order: 0,
            a_name: '',
            a_status: 1,
            a_order_list: [],
            t_order_list: [],
            arrTopic:[],
            topic_status: '',
            editor_state: '',
            topic:{
                id: 0,
                name: '',
                article_id: 0,
                order: 0,
                detail: '',
                status: 1
            },
            index: 0,

            show_test: false,
            test:{
                id: 0,
                article_id: 0,
                name: '',
                type: 0,
                status: 1,                
            },
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['image', 'code-block']
            ],
            
        }
    },
    methods:{
        too(){
            this.show = !this.show;
        },
        fetchData(){
            this.path = '/api/articles';
            axios.get(this.path)
            .then(response=>{
                this.articles = response.data.data;
                this.setArrTopic();
                this.getTopicCount();
                this.getTest();
            })
        },
        onSubmit(){
            this.path = '/api/articles';
            if (this.status == "new"){
                axios.post(this.path,{
                    name: this.a_name,
                    subject_id: 1,
                    order: this.a_order,
                    status: this.a_status
                }).then(response=>{
                    this.showAlert("success","บันทึกข้อมูลสำเร็จ");
                    var article = {};                   
                    article = response.data.data;
                    this.a_id = article.id;
                    this.a_name = article.name;
                    this.a_order = article.order;
                    this.a_status = article.status;
                    this.status = "edit";
                    this.fetchData();
                })
            }else if (this.status == "edit"){
                var path = `/api/articles/${this.a_id}`;
                axios.put(path,{
                    name: this.a_name,
                    subject_id: 1,
                    order: this.a_order,
                    status: this.a_status
                }).then(response=>{
                    this.showAlert("success","บันทึกข้อมูลสำเร็จ");
                    var article = {};                   
                    article = response.data.data;
                    this.a_id = article.id;
                    this.a_name = article.name;
                    this.a_order = article.order;
                    this.a_status = article.status;
                    this.status = "edit";
                    this.fetchData();
                })
            }
            
        },
        onReset(){

        },
        getOrderList(){
            var max = this.articles.length;
            var order = [];
            
            order.push({'value': 0, text: 'ลำดับ'});
            if (this.status == "new"){
                max = max + 1;
            }
            for (let i = 1; i <= max; i++){
                order.push({value: i, text: i});
            }
            this.a_order_list = order;
        },
        setArrTopic(){
            this.arrTopic = [];
            var total = this.articles.length;
            for (let i = 0 ; i < total ; i++){
                this.arrTopic.push({
                    'show':false,
                    'count':0,
                    'test':0,
                    'pretest_id':0,
                    'posttest_id':0,
                    'pretest_name': '',
                    'posttest_name': ''
                });
            }
            
        },
        getTopicCount(){
            var path = '';
            var count = 0;
            var aid = 0;
            var topic = [];
            for (let i=0 ;i<this.articles.length;i++){
                aid = this.articles[i].id;
                path = `/api/articles/${aid}/topics`;
                axios.get(path)
                .then(response=>{
                    topic = response.data.data;
                    count = topic.length;
                    this.arrTopic[i].count = count;                    
                })

            }
           this.$forceUpdate();         
            
        },
        showTopic(index){
            //if (this.arrTopic[index].count != 0){
                this.arrTopic[index].show = !this.arrTopic[index].show;
                this.$forceUpdate();
            //}
            
        },
        onAddArticle(){
            this.status = "new";
            this.getOrderList();
        },
        showAlert(result, message){
            this.message = message;
            this.result = result;
            setTimeout(() => {
                this.message = "";
                this.result = "";
            }, 3000);
            
        }, 
        editArticle(index){
            
            this.status = "edit";
            this.getOrderList();
            this.a_id = this.articles[index].id;
            this.a_name = this.articles[index].name;
            this.a_order = this.articles[index].order;
            
        },
        deleteArticle(index){
            var id = this.articles[index].id;
            var path = `/api/articles/${id}`;
            var confirm = window.confirm('คุณต้องการลบหัวข้อวิชา ใช่หรือไม่');
            if (confirm == true){
                 axios.delete(path)
                .then(response=>{
                    this.showAlert("success","ลบข้อมูลสำเร็จ");
                    
                    this.fetchData();
                    if (this.a_id == id){
                        this.clearData();
                    }
                })
            }
           
        },
        clearData(){
            this.status = "";
            this.a_id = 0;
            this.a_name = "";
            this.a_order = 0;            
        },
        getTopicOrderList(count){
            var max = count;
            var order = [];
            
            order.push({'value': 0, text: 'ลำดับ'});
            if (this.topic_status == "new"){
                max = max + 1;
            }
            for (let i = 1; i <= max; i++){
                order.push({value: i, text: i});
            }
            this.t_order_list = order;
        },
        addTopic(index){
            this.index = index;
            this.topic_status = "new";
            this.getTopicOrderList(this.arrTopic[index].count);
            this.topic.article_id = this.articles[index].id;
            this.$forceUpdate();
        },
        toModalClose(){
            this.$root.$emit('bv::hide::modal','modal_topic')
        },
        onTopicSubmit(){
            
            var path = "";
            var topic = {};
            //console.log('topic : '+ this.topic.name + this.topic.order +this.topic.detail);
            if (this.topic_status == "new"){
                path = `/api/articles/${this.topic.article_id}/topics`;               
                axios.post(path,{
                    name: this.topic.name,
                    order: this.topic.order,
                    detail: this.$store.state.content,
                    status: this.topic.status
                }).then(response=>{
                    this.topic_status = "edit"
                    topic = response.data.data;
                    this.topic.name = topic.name;
                    this.topic.order = topic.order;
                    this.topic.detail = topic.detail;
                    this.topic.status = topic.status;
                    this.toModalClose();
                    this.showAlert("success","บันทึกข้อมูลสำเร็จ")
                    this.getTopicCount();                   
                    
                    this.$forceUpdate();
                }).catch(error=>{
                    this.showAlert("error","ไม่สามารถบันทึกข้อมูลได้")
                    console.log(error);
                })
            }else if (this.topic_status == "edit"){
                var path = `/api/articles/${this.topic.article_id}/topics/${this.topic.id}`;
                axios.put(path,{
                    name : this.topic.name,
                    order : this.topic.order,
                    detail : this.$store.state.content,
                    status : this.topic.status,
                }).then(response=>{
                    topic = response.data.data;
                    this.topic.name = topic.name;
                    this.topic.order = topic.order;
                    this.topic.detail = topic.detail;
                    this.topic.status = topic.status;
                    this.toModalClose();
                    this.showAlert("success","บันทึกข้อมูลสำเร็จ")
                    this.arrTopic[this.index].count = 0;
                    this.getTopicCount();                  
                    this.$forceUpdate();
                })
            }
            

        },
        toEditTopic(topic){
            this.topic.id = topic.id;
            this.topic.article_id = topic.article_id;
            this.topic.name = topic.name;
            this.topic.order = topic.order;
            this.topic.detail = topic.detail;
            this.$store.state.content = this.topic.detail
            this.editor_state = "preview"
            //console.log('detail :' + this.topic.detail);
            this.topic.status = topic.status;
            this.$root.$emit('bv::show::modal','modal_topic');
            this.$forceUpdate();
        },
        addTest(index){
            this.status = "";
            this.a_id = 0;
            this.a_order = 0;
            this.a_name = "";
            
            this.index = index;
            this.test.article_id = this.articles[index].id;
            //console.log('article :' + this.articles[index].id);
            this.show_test = true;
            this.$forceUpdate();

        },
        getTest(){
            var test=[];
            for (let i=0;i < this.articles.length; i++){
                var path=`/api/articles/${this.articles[i].id}/article_tests`;
                //console.log('test path :' + path);
                axios.get(path)
                .then(response=>{
                    test = response.data.data;
                    this.arrTopic[i].test = test.length;
                    for (let j=0;j<test.length;j++){
                        if (test[j].type==1){
                            this.arrTopic[i].pretest_id = test[j].id
                            this.arrTopic[i].pretest_name = test[j].name
                        }else if (test[j].type==2){
                            this.arrTopic[i].posttest_id = test[j].id
                            this.arrTopic[i].posttest_name = test[j].name
                        }
                    }
                    this.$forceUpdate();
                })
            }
            this.$forceUpdate();
        },
        testSubmit(){
           this.getTest();
           this.show_test = false;
           this.test.id = 0;
           this.test.name = '';
           this.test.type = 0;
           this.test.status = 1;
           this.test.article_id = 0;
        },
        testReset(){
            this.show_test = false;
            this.$forceUpdate();
        }
    },
    mounted(){
        this.fetchData();
        
    },
    computed: {
        
    }
}
</script>
<style scoped>
.btn{
    font-size: 0.8em;
    margin-bottom: 5px;
    margin-top: 5px;
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
.articlelist{
    margin-top: 5px;
    font-size: 0.8em;
}
.btnAdd{
    border-radius: 50%;
    width: 45px;
    height: 45px;
    padding: 0px;
    vertical-align: middle;
}
.card-body{
    padding: 10px!important;
}
.card-header{
    padding: 5px;
}
.row{
    padding-top: 0px;
}
.topic{
    margin-right: 10px;
    margin-left: 10px;
    margin-top: 5px;
    margin-bottom: 5px;
    
}
.lblHead{
    margin-top: 10px;
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
</style>
