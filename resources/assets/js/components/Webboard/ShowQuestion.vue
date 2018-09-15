<template>
    <div>
        <b-row align-v="center">
            <b-col mr-auto>
                <div class="text-header">                
                    <h3><i class="fas fa-comments"></i>&nbsp;กระดานสนทนา</h3>
                </div>
            </b-col> 
            <b-col align-self="end">
                <div class="text-header text-right">                
                    <b-button @click="goBack()" variant="outline-default" size="sm"><i class="fas fa-caret-square-left"></i>&nbsp;กลับหน้ารวม</b-button>
                </div>
            </b-col>       
        </b-row>
        
        <div class="showQuestion">   
            <div class="d-flex justify-content-between align-items-top">
                
                <div>
                    <h3><i class="fas fa-question fa-lg"></i> &nbsp;{{question.title}}</h3>
                    <div v-html="question.detail"></div>
                    <pre class="line-numbers">
                        <code class="language-cpp">
                            #include &lt;stdio.h&gt; 
                            int main() 
                            { 
                                printf("Hello, World!\n"); return 0; 
                            } 
                        </code>
                    </pre>
                </div>
                <div >
                    <span class="align-top">...</span>
                </div>

                
            </div>
            
            
            <div class="reply" v-for="reply in question.reply" :key="reply.id">
                <h4><i class="far fa-lightbulb fa-lg"></i>&nbsp;ความคิดเห็นที่ {{reply.id}} : โดย {{reply.userid}}</h4>
                <div v-html="reply.detail"></div>
                <pre><code class="language-css">{{reply.detail}}</code></pre>
            </div>
            <div class="edit">
                <h4><i class="fas fa-pencil-alt fa-lg"></i>&nbsp;แสดงความคิดเห็น</h4>
                {{content}}
                <code-box :content="content"></code-box>
                <vue-editor v-model="content" :editorToolbar="customToolbar"></vue-editor>
                <div class="text-center">
                    <b-button id="btnPreview" v-b-modal.modal-center variant="outline-primary" size="sm">แสดงตัวอย่าง</b-button>
                    <b-button id="btnSave" variant="primary" size="sm">ส่งความคิดเห็น</b-button>
                </div>
                
            </div>
            
            <b-modal id="modal-center" centered size="lg" title="แสดงตัวอย่าง" hide-footer >
                <code-box :content="content"></code-box>
            </b-modal>
            
        </div>
    </div>
    
</template>
<script>

export default {
    
    mounted(){
        this.qid = this.$route.params.id
    },
    data(){
        return{
            content: '',
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['image', 'code-block']
            ],
            qid: 0,            
            question:               
            {
                    id: 1,
                    title: 'คำถามที่ 1',
                    detail: 'รายละเอียด</br>คำถามที่ 1',
                    userid: 'aaa',
                    reply: [
                        {
                            id: 1,
                            detail: '.showQuestion{ background-color: rgb(255, 255, 255); padding: 20px; vertical-align: top;  margin-top: 10px;}',
                            userid: 'bbbb'
                        },
                        {
                            id: 2,
                            detail: 'คำตอบที่ 2',
                            userid: 'ccc'
                        },
                    ]
                }
                
            
        }
    },
    methods: {
        goBack: function(){
            this.$router.push('/webboard');
        }
    }
}
</script>
<style scoped>
.showQuestion{
    background-color: rgb(255, 255, 255);
    padding: 20px;
    vertical-align: top;
    margin-top: 10px;
}
.reply{
    margin-top: 20px;
    margin-left: 25px;
    
}
.edit{
    margin-top: 20px;
    padding: 10px 15px 10px 25px;
    
}
.btn{
    
    border-radius: 0px!important;
}
#btnPreview, #btnSave{
    margin: 15px;
}
pre.ql-syntax{
    background-color: #000!important;
    color: #fff!important;
}
.text-header{
    color: #fff;
}
</style>

