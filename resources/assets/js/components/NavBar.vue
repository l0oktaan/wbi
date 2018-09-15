<template>
    <div>
        <!-- As a heading -->
        <b-navbar variant="faded" type="light" toggleable>
            <b-navbar-toggle target="nav_text_collapse"></b-navbar-toggle>            
            <b-collapse is-nav id="nav_text_collapse" >
                <b-navbar-nav>
                    <b-nav-item active-class="navactive" to="/" class="text-center"><i class="fas fa-home" aria-hidden="true"></i>หน้าหลัก</b-nav-item>                                        
                    <b-nav-item active-class="navactive" to="/article" class="text-center"><i class="fas fa-book-open" aria-hidden="true"></i>หัวข้อบทเรียน</b-nav-item>
                    <b-nav-item active-class="navactive" to="/webboard" class="text-center"><i class="fas fa-comments" aria-hidden="true"></i>กระดานสนทนา</b-nav-item>
                    
                </b-navbar-nav>
                <b-navbar-nav class="ml-auto">
                    <b-nav-item right to="/register" class="text-center"><i class="fas fa-user-plus" aria-hidden="true"></i>สมัครสมาชิก</b-nav-item>
                    <b-nav-item right to="/login" class="text-center"><i class="fas fa-sign-in-alt" aria-hidden="true"></i>เข้าสู่ระบบ</b-nav-item>
                </b-navbar-nav>
                
            </b-collapse>
            
        </b-navbar>
    </div>
</template>
<style scoped>
@media only screen and (max-width: 768px) {
    .fa, .fas, .fad{
        display: inline!important;
        margin-right: 10px;
    }
    

}
@media only screen and (max-width: 990px) {
    .nav-item{
        padding: 5px!important;
    }    

}

.fa, .fas, .fad{
    display: block;
    padding-bottom: 10px;
}
.nav-item{
    padding: 10px 15px 5px 15px;
}
.nav-item>a{
    color: #bbb!important;
    
}
.nav-item>a.active{
    color: #fff!important;
    text-shadow: 0px 0px 10px #0be0f0;
    
}
.nav-link{
    padding-bottom: 0px;
}
.nav-item>a:hover{
    color: #fff!important;
}
.nav-item>form{
    padding: 5px!important;
    
}

.navbar{
    
    
    padding-top: 5px!important;
    padding-bottom: 5px!important;
    background-color: transparent!important;
    border-radius: 0px!important;  
}

#navbarSupportedContent{
    vertical-align: middle!important;
    
}
</style>