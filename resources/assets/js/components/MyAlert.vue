<template>
  
</template>
<script>
export default {
  props: ['AlertType'],
  data(){
    return{
      alert: ''
    }
  },
  watch: {
    AlertType(){
      if (this.AlertType != ""){
        if (this.AlertType == "success"){          
          this.$swal({
              title: "ทำรายการสำเร็จ",                        
              icon: "success",
              timer: 2000,
              button: false,
          });          
        }else if (this.AlertType == "error"){          
          this.$swal({
              title: "เกิดข้อผิดพลาด",                        
              icon: "error",
              timer: 2000,
              button: false,
          });          
        }
        this.$parent.alert = "";
      }
    }
  }
}
</script>

<style scoped>
.swal-title{
  font-size: 0.8em!important;
}
</style>
