<template>
    <div>

        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            
            <router-link tag="a" to="/admin" class="navbar-brand col-sm-3 col-md-2 mr-0">Admin Zone</router-link>
            <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                <a class="nav-link" href="#">Sign out</a>
                </li>
            </ul>
        </nav>
        
          <div class="row">
            <div class="col-sm-3 col-md-2">
              <div class="col-md-2 bg-light sidebar">
              <div class="sidebar-sticky">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <b-link to="/admin" class="nav-link border-bottom" active-class="navactive">DashBoard</b-link>                    
                  </li>
                  <li class="nav-item">
                    <b-link to="/admin/subject" class="nav-link  border-bottom" active-class="navactive">ข้อมูลวิชา</b-link>                                       
                  </li>
                  <li class="nav-item">
                    <b-link to="/admin/article" class="nav-link  border-bottom" active-class="navactive">ข้อมูลหัวข้อวิชา</b-link>                                        
                  </li>
                  <li class="nav-item">
                    <b-link to="/admin/webboard" class="nav-link  border-bottom" active-class="navactive">กระดานข่าว</b-link>                                        
                  </li>
                  <li class="nav-item">
                    <b-link to="/admin/flashnew" class="nav-link border-bottom" active-class="navactive">ข่าวสารน่ารู้</b-link>                                        
                  </li>
                </ul> 
              </div>
              </div>
            </div>
            <div class="col-sm-9 col-md-10">
              
              <div class="detail">
                <router-view></router-view>
              </div>
            </div>
          </div>
      
        
    </div>
</template>
<style scoped>
.navactive{
  color: rgb(15, 20, 70);
}
.detail{
  width: 100%;
  height: 100%;
  background-color: #fff;
  margin-top:48px;
  padding: 20px;
}
.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

.col-sm-3, .col-md-2, .col-sm-9, .col-md-10{
  padding-left: 0px;
  padding-right: 0px;
  
}
/*
 * Sidebar
 */
.row{
  width: 100%!important;
  margin-top: 0px;
  margin-left: 0px;
  margin-right: 0px;
  background-color: #fff!important;
}
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

@supports ((position: -webkit-sticky) or (position: sticky)) {
  .sidebar-sticky {
    position: -webkit-sticky;
    position: sticky;
  }
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #999;
}

.sidebar .nav-link.active {
  color: #007bff;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

/*
 * Content
 */

[role="main"] {
  padding-top: 48px; /* Space for fixed navbar */
}

/*
 * Navbar
 */

.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: 1rem;
  background-color: rgba(0, 0, 0, .25);
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .form-control {
  padding: .75rem 1rem;
  border-width: 0;
  border-radius: 0;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}
</style>
