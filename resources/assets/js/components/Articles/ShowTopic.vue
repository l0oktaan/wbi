<template>
    <div>
        <div v-html="detail"></div>
    </div>
</template>
<script>


export default {
    props: ['detail'],
    
    data(){
        return{
            showTopic: {
                id: 0,
                topicName: '',
                detail: ''
            },            
        }
    },
   methods: {
       fetchData(){

       }
   }
}
</script>
<style scoped>

</style>
