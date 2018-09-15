<template>
    <div class="container">
        
        <div v-html="detail" v-if="editor_state=='preview'"></div>
        <vue-editor
            v-model="detail" 
            :editorToolbar="customToolbar"
            :editorOptions="editorSettings"
            useCustomImageHandler
            @imageAdded="handleImageAdded"
            v-if="editor_state=='edit'"
        ></vue-editor>
        <b-button @click="editor_state='edit'" size="sm" variant="success" v-if="editor_state=='preview'">แก้ไข</b-button>
        <b-button @click="editor_state='preview'" size="sm" variant="primary" v-if="editor_state=='edit'">แสดงตัวอย่าง</b-button>
        
        
    </div>
</template>
<script>
import { VueEditor, Quill } from 'vue2-editor'



import hljs from 'highlight.js'

export default {
    
    props: ['path','content'],
    data(){
        return{      
            editor_state: 'edit',
            mycode: '',      
            detail: this.content,
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{'align': ''}, {'align': 'center'}, {'align': 'right'}, {'align': 'justify'}],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['blockquote', 'code-block'],
                [{ 'color': [] }, { 'background': [] }],
                ['link', 'image', 'video'],
            ],
            editorSettings:{
                modules:{                    
                    syntax: {                        
                        highlight: text => hljs.highlightAuto(text).value //lineNumbersBlock
                        //highlight: text => hljs.lineNumbersBlock(text).value
                    },
                }
            },
            
            
        }
    },
    methods: {
        onOk(){
            /* $('pre').each(function(i, block) {
                hljs.highlightBlock(block);
            });
            this.$forceUpdate(); */
            //this.$store.state.content = this.detail
            this.$emit("onOk",this.detail);
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
        
        fetchData(){
            this.detail = this.$store.state.content;
            console.log('get content :' + this.detail);
        }
        
        
    },
    computed: {
        getDeatil(){

        }
    },
    created(){
       this.fetchData();
    },
    watch: {
        content(){
            this.detail = this.content;
        },
        detail(){
            this.$store.state.content = this.detail;
        }
    }
    
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
  position: absolute; top: 0px; left: 3.3rem; 
  z-index: 1;

 
  border: none;
}
</style>

