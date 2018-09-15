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
                <b-button v-b-modal.modalNewTopic variant="success" size="sm"><i class="fas fa-plus"></i>&nbsp;เพิ่มหัวข้อสนทนา</b-button>
            </div>
        </b-col>       
    </b-row>
    <b-row>
        <b-col>
            <b-list-group>
                <b-list-group-item button @click="showQuestion(question.id)" v-for="question in questions" :key="question.id" class="d-flex justify-content-between align-items-center">
                    <span><h3>{{question.title}}</h3>{{question.detail}}</span><b-badge variant="primary" pill>{{question.reply.length}}</b-badge>
                </b-list-group-item>            
            </b-list-group>           
        </b-col>       
    </b-row>
    <b-modal id="modalNewTopic" centered size="lg" title="เพิ่มหัวข้อสนทนา" hide-footer >                    
        <content-box></content-box>
    </b-modal>
    <b-modal id="modalTopic" centered size="lg" title="แสดงตัวอย่าง" hide-footer >                    
        
     </b-modal>
</div>
</template>
<script>
export default {
    data(){
        return{
            content: '',
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['image', 'code-block']
            ],
            questions: [
                {
                    id: 1,
                    title: 'คำถามที่ 1',
                    detail: 'รายละเอียดคำถามที่ 1',
                    userid: 'aaa',
                    reply: [
                        {
                            id: 1,
                            detail: 'คำตอบที่ 1',
                            userid: 'bbbb'
                        },
                        {
                            id: 2,
                            detail: 'คำตอบที่ 2',
                            userid: 'ccc'
                        },
                    ]
                },
                {
                    id: 2,
                    title: 'คำถามที่ 2',
                    detail: 'รายละเอียดคำถามที่ 2',
                    userid: 'bbb',
                    reply: [
                        {
                            id: 1,
                            detail: 'คำตอบที่ 1',
                            userid: 'aaa'
                        },
                        {
                            id: 2,
                            detail: 'คำตอบที่ 2',
                            userid: 'ccc'
                        },
                        {
                            id: 3,
                            detail: 'คำตอบที่ 3',
                            userid: 'santi'
                        },
                    ]
                },
                {
                    id: 3,
                    title: 'คำถามที่ 3',
                    detail: 'รายละเอียดคำถามที่ 3',
                    userid: 'ccc',
                    reply: [
                        {
                            id: 1,
                            detail: 'คำตอบที่ 1',
                            userid: 'santi'
                        }
                    ]
                },
            ]
        }
    },
    methods: {
        showQuestion: function(qid){
            let linkto = '/webboard/question/' + qid;
            this.$router.push(linkto);
        }
    }
}
</script>
<style scoped>
.newTopic{
    background-color: #fff;
    color: #000;
}
.container{
    margin-top: 15px;
}
.text-header{
    color: #fff;
}
.btn{
    border-radius: 0px;
}
</style>
