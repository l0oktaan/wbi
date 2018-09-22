<template>
    <b-container>
        <b-row>
            <b-col>
                <b-button  @click="btnClick(1)" :class="detail == 1 ? 'select' : ''"><i class="fas fa-clipboard-list fa-3x"></i><br><span>แนะนำบทเรียน</span></b-button>
            </b-col>
            <b-col>
                <b-button @click="btnClick(2)" :class="detail == 2 ? 'select' : ''"><i class="fas fa-fas fa-user-graduate fa-3x"></i><br><span>วัตถุประสงค์การเรียนรู้</span></b-button>
            </b-col>
            <b-col>
                <b-button @click="btnClick(3)" :class="detail == 3 ? 'select' : ''"><i class="fas fa-globe fa-3x"></i><br><span>แหล่งเรียนรู้เพิ่มเติม</span></b-button>
            </b-col>
            <b-col>
                <b-button @click="btnClick(4)" :class="detail == 4 ? 'select' : ''"><i class="fas fa-book-open fa-3x"></i><br><span>หัวข้อบทเรียน</span></b-button>
            </b-col>
        </b-row>
        <b-row>
            <b-col >
                
                <div  v-show="detail===1">
                    <input type="hidden" id="detail11">
                    <h3>{{tabs[0].name}}</h3>
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
                <div id="detail2" v-show="detail===2">
                    <h3>{{tabs[1].name}}</h3>
                    <ul class="list-group list-group-flush">                        
                        <li class="list-group-item">                            
                            <ul>
                                <li v-for="(value,index) in tabs[1].subject" :key="index">
                                <span>{{value}}</span>
                                </li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <div id="detail3" v-show="detail===3">แหล่งเรียนรู้เพิ่มเติม</div>
                <transition name="fade">
                <div id="detail4" v-show="detail===4">
                    <h3>{{tabs[3].name}}</h3>
                    <ul class="list-group list-group-flush">                      
                        <li class="list-group-item" v-for="article in tabs[3].articles" :key="article.id">
                            <h3>{{article.name}}</h3>
                            <my-topic :article_id="article.id"></my-topic>            
                        </li>
                    </ul>
                </div>
                </transition>
            </b-col>
            
        </b-row>
    </b-container>
</template>
<script>

export default {
    data(){
        return{
            detail: 0,
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
                    name: 'วัตถุประสงค์การเรียนรู้',
                    subject: [
                        'อธิบายความหมายของภาษาคอมพิวเตอร์ ตัวแปลภาษา และขั้นตอนการพัฒนาโปรแกรมได้',
                        'มีความรู้ความเข้าใจเกี่ยวกับขั้นตอนการทำงานและวิธีการทางคอมพิวเตอร์ การจำลองความคิดการเขียนโปรแกรม',
                        'มีความรู้ความเข้าใจเกี่ยวกับโครงสร้างของภาษาซี ประวัติภาษาซี การคอมไพล์ และองค์ประกอบพื้นฐานของภาษาซี',
                        'มีความรู้ความเข้าใจเกี่ยวกับการติดตั้งโปรแกรม การตั้งค่าการใช้งานโปรแกรม Dev C++ ที่ใช้เขียนโปรแกรมภาษาซี',
                        'มีความรู้ความเข้าใจเกี่ยวกับ ตัวแปร ชนิดข้อมูล ค่าคงที่ตัวดำเนินการและนิพจน์ของภาษาซี',
                        'มีทักษะการเขียนโปรแกรมเพื่อรับค่าทางแป้นพิมพ์และคำสั่งแสดงผลบนหน้าจอภาพคอมพิวเตอร์',
                        'มีทักษะการเขียนโปรแกรมที่มีโครงสร้างการทำงานแบบมีทางเลือก',
                        'มีทักษะการเขียนโปรแกรมที่มีโครงสร้างการทำงานแบบวนซ้ำ',
                        'มีทักษะการเขียนโปรแกรมที่มีโครงสร้างการทำงานแบบอาร์เรย์และสายอักขระ'
                    ]
                },
                {
                    id: 3,
                    name: 'แหล่งเรียนรู้เพิ่มเติม'
                },
                {
                    id: 4,
                    name: 'หัวข้อบทเรียน',
                    articles: []
                },
            ]
        }
    },
    methods: {
        btnClick(detail){            
            this.detail = this.detail == detail ? 0 : detail;
            //$("html, body").animate({ scrollTop: $(document).height() }, 1500);
            
            //$('div#detail11')[0].scrollIntoView(false);
            //let element = document.getElementById("detail");
            //element.scrollIntoView();
                
                
            
        },
        fetchData() {
            this.fetchArticle();
        },
        fetchArticle(){
            var path = `/api/articles`;
            //console.log('article :' + path);
            axios.get(path)
            .then(response=>{
                this.tabs[3].articles = response.data.data;
                this.$forceUpdate();

            }).catch(error=>{

            })
        }
    },
    created(){
        this.fetchData();
    }

}
</script>
<style scoped>

.container{
    background-color: rgba(255, 255, 255, 0.5);
    padding: 10px!important;
}
.btn{
    border-radius: 0px!important;
    width: 100%;
    height: 180px;
    background-color: rgb(231, 233, 235);
    color: rgb(22, 96, 192);
}
.btn.select{
    background-color: rgb(22, 96, 192);
    color: #fff;
}
.list-group-item{
    padding: 10px!important;
    margin: 5px;
    background-color: rgba(250, 251, 252, 0.877)!important;
    -webkit-box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
-moz-box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
box-shadow: 3px 3px 3px 0px rgba(0,0,0,0.75);
color: #032430;
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
</style>

