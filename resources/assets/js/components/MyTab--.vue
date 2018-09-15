<template>
    <b-card no-body>
        <b-tabs pills vertical nav-wrapper-class="w-25">
            <b-tab active>
                <template slot="title"><i class="fas fa-clipboard-list fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[0].name}}</span></template>
                <div class="container">
                    <h2>แนะนำการใช้บทเรียน</h2>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                        <h4>{{tabs[0].abouts[0].about}}</h4>
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
            </b-tab>
            <b-tab>
                <template slot="title"><i class="fas fa-clipboard-list fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[1].name}}</span></template>
                <b-container>

                </b-container>
            </b-tab>
            <b-tab>
                <template slot="title"><i class="fas fa-clipboard-list fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[2].name}}</span></template>
                <b-container>

                </b-container>
            </b-tab>
            <b-tab>
                <template slot="title"><i class="fas fa-clipboard-list fa-lg"></i>&nbsp;<span class="d-sm-none d-md-block">{{tabs[3].name}}</span></template>
                <b-container>

                </b-container>
            </b-tab>
        </b-tabs>
    </b-card>
</template>
<script>
export default {
    data(){
        return{
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
    }
}
</script>

<style scoped>
.card{
    border-radius: 0px;
    border-width: 0px!important;
}
.nav-item>.nav-link.active{    
    background-color: rgb(136, 179, 219)!important;
}
.tab-pane{
    color: #000;
    padding: 10px;
    background-color: rgb(136, 179, 219)!important;
}
.tab-content{
    background-color: rgb(136, 179, 219)!important;
}
.card{
    background-color: rgb(136, 179, 219)!important;
}
.nav{
    background-color: #000;
}
.row{
    padding: 0px!important;
    
}
.list-group-item{
    background-color: rgb(136, 179, 219)!important;
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
