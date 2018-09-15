<template>
    <div>        
        <my-editor 
            ref="editor" 
            :path="'topic/' + topic_id"
            @onPreview="onPreview"></my-editor>
        <b-modal
            ref="modalPreview">
            <div v-html="detail"></div>
        </b-modal>
    </div>
</template>
<script>
window.$ = require('jquery')
import hljs from 'highlight.js'
$('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
});

export default {
    data(){
        return{
            detail: '',
            topic_id: 1
        }
    },
    
    mounted(){
         
        
    },
    methods: {
        onPreview(showdetail){
            console.log('detail :' + showdetail);
            this.detail = showdetail;
            this.$forceUpdate();
            this.$refs.modalPreview.show();
        }
    }
}
</script>

