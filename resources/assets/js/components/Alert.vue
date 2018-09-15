<template>
    <div>
        
        <div id="success" class="alert alert-success" role="alert" v-show="istype=='success'">
            {{message}}
        </div>
       
        <div id="error" class="alert alert-warning" role="alert" v-show="istype=='error'">
            {{message}}
        </div> 
    </div>
     
</template>
<script>
export default {
    props: ['message','type'],
    data(){
        return{
            istype: '',
        }
    },
    methods: {
      showAlert(){
        this.istype = this.type;
        $('.alert').addClass('myslide');
        setTimeout(() => {
            this.istype = "";                    
            $('.alert').removeClass('myslide');
        }, 3000);
      }
    },
    watch: {
        type(){
            if (this.type != ""){
                this.showAlert();
            }
        },
        message(){
          if (this.message != ""){
                this.showAlert();
            }
        }
    }
}
</script>

<style scoped>
#success{
  position: absolute;
    top: 8px;
    right: 8px;
}
.myslide{
  animation: animationFrames linear 3s;
  animation-iteration-count: 1;
  transform-origin: 50% 50%;
  -webkit-animation: animationFrames linear 3s;
  -webkit-animation-iteration-count: 1;
  -webkit-transform-origin: 50% 50%;
  -moz-animation: animationFrames linear 3s;
  -moz-animation-iteration-count: 1;
  -moz-transform-origin: 50% 50%;
  -o-animation: animationFrames linear 3s;
  -o-animation-iteration-count: 1;
  -o-transform-origin: 50% 50%;
  -ms-animation: animationFrames linear 3s;
  -ms-animation-iteration-count: 1;
  -ms-transform-origin: 50% 50%;
}

@keyframes animationFrames{
  0% {
    opacity:0;
    transform:  translate(0px,33px)  ;
  }
  25% {
    opacity:1;
    transform:  translate(0px,0px)  ;
  }
  75% {
    opacity:1;
    transform:  translate(0px,0px)  ;
  }
  100% {
    opacity:0;
    transform:  translate(0px,0px)  ;
  }
}

@-moz-keyframes animationFrames{
  0% {
    opacity:0;
    -moz-transform:  translate(0px,33px)  ;
  }
  25% {
    opacity:1;
    -moz-transform:  translate(0px,0px)  ;
  }
  75% {
    opacity:1;
    -moz-transform:  translate(0px,0px)  ;
  }
  100% {
    opacity:0;
    -moz-transform:  translate(0px,0px)  ;
  }
}

@-webkit-keyframes animationFrames {
  0% {
    opacity:0;
    -webkit-transform:  translate(0px,33px)  ;
  }
  25% {
    opacity:1;
    -webkit-transform:  translate(0px,0px)  ;
  }
  75% {
    opacity:1;
    -webkit-transform:  translate(0px,0px)  ;
  }
  100% {
    opacity:0;
    -webkit-transform:  translate(0px,0px)  ;
  }
}

@-o-keyframes animationFrames {
  0% {
    opacity:0;
    -o-transform:  translate(0px,33px)  ;
  }
  25% {
    opacity:1;
    -o-transform:  translate(0px,0px)  ;
  }
  75% {
    opacity:1;
    -o-transform:  translate(0px,0px)  ;
  }
  100% {
    opacity:0;
    -o-transform:  translate(0px,0px)  ;
  }
}

@-ms-keyframes animationFrames {
  0% {
    opacity:0;
    -ms-transform:  translate(0px,33px)  ;
  }
  25% {
    opacity:1;
    -ms-transform:  translate(0px,0px)  ;
  }
  75% {
    opacity:1;
    -ms-transform:  translate(0px,0px)  ;
  }
  100% {
    opacity:0;
    -ms-transform:  translate(0px,0px)  ;
  }
}

</style>

