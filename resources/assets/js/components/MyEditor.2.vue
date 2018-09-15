<template>
    <div class="container">
        <div v-html="content"></div>
        <input type="file" id="getFile" @change="uploadFunction($event)" />
        <quill-editor ref="myTextEditor"
                      v-model="content"
                      :options="editorOption"                        
                      >
        </quill-editor>
        {{content}}
        <b-button @click="ok" size="sm" variant="success">ok</b-button>
    </div>
</template>
<script>
import hljs from 'highlight.js'
//import hljs from 'highlightjs-line-numbers.min.js'
//import from 'highlight.js/styles/vs2015.css'
//hljs.initHighlightingOnLoad();
export default {
    
    props: ['path'],
    data(){
        return{            
            content: '',
            editorOption: {
                theme: 'snow',
                placeholder: "",
                modules: {
                    toolbar: [
                        ['bold', 'italic', 'underline', 'strike'],
                        ['blockquote', 'code-block'],
                        [{ 'header': 1 }, { 'header': 2 }],
                        [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                        [{ 'script': 'sub' }, { 'script': 'super' }],
                        [{ 'indent': '-1' }, { 'indent': '+1' }],
                        [{ 'direction': 'rtl' }],
                        [{ 'size': ['small', false, 'large', 'huge'] }],
                        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],                        
                        [{ 'color': [] }, { 'background': [] }],
                        [{ 'align': [] }],
                        ['clean'],
                        ['link', 'image', 'video'],
                        
                    ],
                    handlers: {
                        'image': function(){
                            console.log('up image');
                            document.getElementById('getFile').click()
                        }
                    },
                    syntax: {
                        highlight: text => hljs.highlightAuto(text).value //lineNumbersBlock
                        //highlight: text => hljs.lineNumbersBlock(text).value
                    },
                    
                },
                
            }
        }
            
        
    },
    methods: {
        uploadFunction(e){
  
            //you can get images data in e.target.files
            //an single example for using formData to post to server
            
            
            var form = new FormData()
            form.append('file[]', e.target.files[0])
            console.log('up image');
            //do your post
            
            
        },
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
  position: absolute; top: 0px; left: 3.3rem; 
  z-index: 1;

 
  border: none;
}
</style>

