<template>
    <b-form>       
        <b-form-group id="lblTopic"
                    label="ชื่อกระทู้ :"
                    label-for="txtTopic">
            <b-form-input id="txtTopic"
                        type="text"                                
                        required
                        placeholder="ใส่ชื่อกระทู้">
            </b-form-input>
        </b-form-group>
        <b-form-group id="lblContent"
                    label="รายละเอียด :"
                    label-for="txtContent">
            <b-form-input id="txtTopic"
                        type="text" v-if="false"
                        v-model="content">
            </b-form-input>
        </b-form-group>
        <div class="newTopic">
            <vue-editor v-model="content" :editorToolbar="customToolbar"></vue-editor>
        </div>
        <div class="text-center">
            <b-button id="btnSubmit" type="submit" variant="primary">ส่งความคิดเห็น</b-button>
            <b-button id="btnReset" type="reset" variant="danger">ล้างข้อมูล</b-button>
        </div>       
    </b-form>
</template>
<script>
export default {
    props: {
        content: {
            type: Object
        }
    },
    data(){
        return{
            content: '',
            customToolbar: [
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['image', 'code-block']
            ],
        }
    }
}
</script>
<style scoped>
form{
    color: #000;
}

#btnSubmit, #btnReset{
    border-radius: 0px;
    margin: 10px;
}
</style>
