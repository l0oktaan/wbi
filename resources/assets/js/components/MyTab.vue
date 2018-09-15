<template>
    <b-container>
    <div class="row">
        <div class="col-3">
            <div @click="toActive()" class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                    <div data-toggle="tooltip" data-placement="top" :title="tabs[0].name"><i class="fas fa-clipboard-list fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[0].name}}</span></div>
                </a>
                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                    <i class="fas fa-fas fa-user-graduate fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[1].name}}</span>
                </a>
                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                    <i class="fas fa-globe fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[2].name}}</span>
                </a>
                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                    <i class="fas fa-book-open fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[3].name}}</span>
                </a>
            </div>
        </div>
        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <h2>{{tabs[0].name}}</h2>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h3>{{tabs[0].abouts[0].about}}</h3>
                    </li> 
                    <li class="list-group-item">
                        <h3>ข้อมูลโดยรวม</h3>
                        <ul>
                            <li v-for="(value,index) in tabs[0].abouts[0].summary" :key="index">
                            <span>{{value.name}} : {{value.value}}</span>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h3>คุณสมบัติผู้เรียน</h3>
                        <span>{{tabs[0].abouts[0].requirement}}</span>              
                    </li>
                    <li class="list-group-item">
                        <h3>เนื้อหาเหมาะสมกับ</h3>
                        <ul>
                            <li v-for="(value,index) in tabs[0].abouts[0].suitablefor" :key="index">
                            {{value.name}}
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <h3>เครื่องมือที่จำเป็น</h3>
                        <ul>
                            <li v-for="(value,index) in tabs[0].abouts[0].tools" :key="index">
                            {{value.name}}
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">...</div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
        </div>
    </div>
</div>
    </b-container>
</template>
<script>
export default {
    data(){
        return{
            isActive: '',
            toShow: 'invisible',
            tabs: [
                {
                    id: 1,
                    name: 'แนะนำการใช้บทเรียน',
                    abouts:[
                        {          
                        'about': 'เน้น ฝึกคิด ลงมือปฏิบัติ ให้สามารถใช้งานได้ในโลกจริง โดย C เป็นภาษา ที่เรียกได้ว่าเป็นภาษาพ่อของอีกหลายๆ ภาษา ใน โลกเลยที่เดียว และนอกจากนี้ C ยังเป็นภาษา ที่ใช้ในงานด้าน hardware และ ระบบปฏิบัติการของ computer หรือใครที่อยากทำในส่วนของ Image Processing ,Computer Vision หรือพวกหุ่นยนต์ก็ต้องเริ่มจากภาษา C นั้นเอง',
                        'summary': [
                            {
                            'id' : 1,
                            'name' : 'จำนวนหัวข้อ',
                            'value' : 12
                            },
                            {
                            'id' : 2,
                            'name' : 'จำนวนผู้เข้าเรียน',
                            'value' : 32
                            },
                        ],
                        'requirement' : 'คนธรรมดาทั่วไป ไม่จำเป็นต้องมีพื้นฐานเขียนโปรแกรม มาก่อน อายุ 12 ปีขึ้นไป',
                        'suitablefor' : [
                            {
                            'id' : 1,
                            'name' : 'เด็กนักเรียน ม.ต้น ม. ปลาย ที่ต้องการรู้เรื่องเขียนโปรแกรม'
                            },
                            {
                            'id' : 2,
                            'name' : 'เด็กนักเรียน ม.ต้น ม. ปลาย ที่ต้องการรู้เรื่องเขียนโปรแกรม สำหรับสอบ โอลิมปิกวิชาการ สสวท. สอวน.'
                            },
                            {
                            'id' : 3,
                            'name' : 'บุคคลที่เบื่อในการเรียนเขียนโปรแกรมแล้วเขียนไม่ได้สักที'
                            },
                            {
                            'id' : 4,
                            'name' : 'นักเรียนนักศึกษา คณะวิศวกรรมศาสตร์ , วิทยาการ คอมพิวเตอร์ , คณะวิทยาศาสตร์ , ICT'
                            },
                        ],
                        'tools' : [
                            {
                            'id' : 1,
                            'name' : 'โปรแกรมภาษา C / C++'              
                            },
                            {
                            'id' : 2,
                            'name' : 'โปรแกรม IDE เช่น Netbeans for C/C++, Atom, Sublime, VS Code เป็นต้น'              
                            }            
                        ],
                        'description' : ''
                        }
                    ],
                },
                {
                    id: 2,
                    name: 'วัตถุประสงค์การเรียนรู้'
                },
                {
                    id: 3,
                    name: 'แหล่งเรียนรู้เพิ่มเติม'
                },
                {
                    id: 4,
                    name: 'หัวข้อบทเรียน'
                },
            ]
        }
    },
    methods: {
        toActive(){
            this.isActive = 'active'
            this.toShow = 'visible'
        }
    },    
}
</script>

<style scoped>
.container{
    padding: 0px!important;
}
.row{
    background-color: rgba(136, 179, 219,0.5)!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    padding-left: 0px;
}

.col-3{
    padding-top: 0px!important; 
    padding-right: 15px!important;
    padding-bottom: 0px!important;
    padding-left: 0px!important;
}
.col-9{
    background-color: transparent!important;
}
.card{
    border-radius: 0px;
    border-width: 0px!important;
}
.fas{
    padding-right: 10px;
}
.nav-link.active{    
    color: #032430;
    background-color: rgba(255, 255, 255, 0.5)!important;
}

.tab-pane{
    color: #032430;
    padding: 10px;
    background-color: transparent!important;
}
.tab-content{
    background-color: transparent!important;
}
.card{
    background-color: rgb(136, 179, 219)!important;
}
.nav{
  padding-top: 0px;
  background-color: rgba(8, 52, 94, 0.7);
  height: 100%;
  margin-right: 5px;
}
.row{
    padding: 0px!important;
    
}
.list-group-item{
    padding: 10px!important;
    margin: 5px;
    background-color: rgba(250, 251, 252, 0.877)!important;
    -webkit-box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
-moz-box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
}
.list-group-item>h3{
    font-size: 0.85em;
}
.list-group-item>span{
    font-size: 0.8em;
}
 .list-group-item>ul{
    font-size: 0.8em;
}
@media (min-width: 800px){
.d-md-block{
    display: inline!important;
}
}
@media (max-width: 768px){
.d-md-block{
    display: none!important;
}
}

</style>
