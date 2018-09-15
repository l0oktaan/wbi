<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="{{asset('css/app.css')}}">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <style>
   #particle-canvas{
    width: 100%;
    height: 100%;
    position: fixed;
    z-index: 1;
    left: 0px;
    top: 0px;
    bottom: 0px;
    background-color: #ccc;  
    overflow-y: none;  
}
    html, body{
        height: 100%;
        font-family: 'Trirong'!important;
    }
    </style>
</head>
<body>
    <div id="app">            
            <router-view></router-view>
        </div>
    
    <!-- <div id="particle-canvas"></div> -->
    {{--  <script src="/js/particles.js"></script>  --}}
    <script>
        var flagsUrl = '{{ env('APP_URL') }}'; //this is the url from .env file
    </script>
    <script type="text/javascript" src="{{asset('js/app.js')}}"></script>
    {{--  <script src="/js/particle.min.js" type="text/javascript"></script>   --}}
     
    <script>
        
    /* particlesJS.load(@dom-id, @path-json, @callback (optional)); 
    
    particlesJS.load('particles-js', 'assets/particles.json', function () {
        console.log('callback - particles.js config loaded');
    });
    */
   /*    
    $(window).scroll(function(){
            if($(window).scrollTop() > elementPosition.top){
                $('#particle-canvas').css('position','fixed').css('top','0');
            }   
    });
    */ 
    </script>       
</body>
</html>