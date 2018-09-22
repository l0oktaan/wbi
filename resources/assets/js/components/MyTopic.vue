<template>
    <ul>
        <li v-for="(value,index) in topics" :key="index">
        {{value.name}}
        </li>
    </ul>
</template>
<script>
export default {
    props: ['article_id'],
    data(){
        return {
            topics: []
        }
    },
    methods :{
        fetchdata(){
            var path = `/api/articles/${this.article_id}/topics`
            axios.get(path)
            .then(response=>{
                this.topics = response.data.data;                         
                this.$forceUpdate();
            })
        }
    },
    created(){
        this.fetchdata();
    }
}
</script>

