<template>
    <div class="topic">
        
        <div class="row header align-items-center">
            <div class="col-md-1 text-center">หัวย่อยข้อที่</div>
            <div class="col-md-4 text-center">ชื่อหัวข้อย่อย</div>                        
            <div class="col-md-2 text-center">จัดการข้อมูล</div>
        </div>
        <div class="row data align-items-center" v-for="(topic,index) in topics" :key="index">
            <div class="col-md-1 text-center">{{topic.order}}</div>
            <div class="col-md-4 text-center">{{topic.name}}</div>                        
            <div class="col-md-2">
                <b-button variant="primary" size="sm" 
                    @click="editTopic(index)"
                    v-b-tooltip.hover 
                    title="edit"
                    class="text-center">
                    <i class="fas fa-edit fa-sm"></i>                        
                </b-button>
                <b-button variant="danger" size="sm" 
                    @click="deleteTopic(index)"
                    v-b-tooltip.hover 
                    title="delete">
                    <i class="fas fa-times fa-sm"></i>                        
                </b-button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props : ['article_id','article_index','topic_count'],
    data(){
        return {
            topics: [],
            topic:{
                id: 0,
                name: '',
                article_id: 0,
                order: 0,
                detail: '',
                status: 1
            }
        }
    },
    methods: {
        fetchData(){      
            console.log('Get Topic');     
            var path = `/api/articles/${this.article_id}/topics`
            console.log('path' + path);
            axios.get(path)
            .then(response=>{
                this.topics = response.data.data;
            })            
        },
        editTopic(index){
            this.topic.id = this.topics[index].id;
            this.topic.article_id = this.article_id;
            this.topic.name = this.topics[index].name;
            this.topic.order = this.topics[index].order;
            this.topic.detail = this.topics[index].detail;
            this.topic.status = this.topics[index].status;
            this.$parent.index = this.article_index;
            this.$parent.topic_status = "edit";
            this.$emit("createOrder",this.topic_count);
            this.$emit("editTopic",this.topic);
        },
        deleteTopic(index){
            var path = `/api/articles/${this.article_id}/topics/${this.topics[index].id}`;
            this.$swal({
                title: "คุณต้องการลบหัวข้อย่อย ใช่หรือไม่ ?",
                icon: "warning",
                buttons: [
                    'ยกเลิก',
                    'ยืนยัน'
                ],
                dangerMode: true,
            }).then(isConfirm =>{
                if (isConfirm){
                    axios.delete(path)
                    .then(response=>{
                        //this.$emit("showAlert",{"success","ลบข้อมูลสำเร็จ"});
                        this.$parent.alert = "success";
                        this.topic.id = 0;
                        this.topic.article_id = 0;
                        this.topic.name = '';
                        this.topic.order = 0;
                        this.topic.detail = '';
                        this.topic.status = 1;
                        this.$emit("fetchArticle");
                        this.fetchData();
                    })
                }
                
            });
            
        }
    },
    watch:{
        article_id(){
            this.fetchData();
        },
        topic_count(){
            this.fetchData();
        }
    },
    created(){
        this.fetchData();
    },
}
</script>
<style scoped>
.row.header{
    background-color: rgb(158, 212, 243);
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

</style>
