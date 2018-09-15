<template>
    <div class="container">
        <div v-html="detail"></div>
        
        <vue-editor
            v-model="detail" 
            :editorToolbar="customToolbar"
            useCustomImageHandler
            @imageAdded="handleImageAdded"
            
        ></vue-editor>
        {{detail}}
        <b-button @click="ok" size="sm" variant="success">ok</b-button>
    </div>
</template>
<script>

export default {
    
    props: ['path'],
    data(){
        return{            
            detail: '',
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{'align': ''}, {'align': 'center'}, {'align': 'right'}, {'align': 'justify'}],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['blockquote', 'code-block'],
                [{ 'color': [] }, { 'background': [] }],
                ['link', 'image', 'video'],
            ],
            
        }
    },
    methods: {
        ok(){
            
            this.$forceUpdate();
        },
        handleImageAdded: function(file, Editor, cursorLocation, resetUploader) {
            let formData = new FormData();
            formData.append('file', file);
            formData.append('path',this.path);
            axios.post('/api/files/upload-file',
                formData,
                { 
                    headers: {'Content-Type': 'multipart/form-data'}              
                })
            .then(response=>{
                let file = response.data; // Get url from response
                //let url = `/img/${this.path}/${file}`;
                Editor.insertEmbed(cursorLocation,'image', file);
                resetUploader();
                console.log(response.data);
            }).catch(error=>{
                console.log(error);
                
            });            
        },
        
        
        
    },
    
}
</script>
<style scoped>
.ql-tooltip .ql-editing{
    left:0!important;
}
.ql-editor>pre{
    background-color: #4c3f33!important;
    color: #ffffff;
}
.line-numbers-wrapper {
  position: relative;
  padding-left: 0;
}
.line-numbers-wrapper > code { color: #bbb; }

.line-numbers-code {
  margin: 0;
  padding: 0;
  overflow: visible;
  position: absolute; top: 0px; left: 3.3rem; // You may have to adjust this
  z-index: 1;

  // App-specific anti-styles
  border: none;
}
</style>

