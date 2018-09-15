<template>
    
    <div class="flashnews">Flash New
    <carousel 
        :perPageCustom="[[768, 2],[1024, 3]]"
        :scrollPerPage="false" 
        :autoplay="true" 
        :loop="true"
        :paginationPadding="5"
        :autoplayHoverPause="true"
        :paginationEnabled="false"
        :navigationEnabled="true"
        >
        <slide v-for="slide in slides" :key="slide.id">
            <b-card :title="'Title' + slide.id"
                    :img-src="slide.cover"
                    img-fluid
                    img-alt="image"
                    img-top>
                <p class="card-text">
                    {{slide.name}}
                </p>
                <small class="text-muted">{{slide.footer}}</small>
            </b-card>
        </slide>                                       
    </carousel>
    </div>
            
</template>
<style scoped>
.flashnews{
    border-radius: 0px!important;
    text-align: center;
    background-color: rgba(15, 95, 141, 0.6);
    padding: 10px;
    height: 100%;
    
}
.card-body{
    padding: 10px;
    text-align: left;
    background-color:  rgba(46, 169, 240, 0.8);
}

.card, .card-img-top{
    border-radius: 0px;
}
.card-text, .card-title{
    color:#032430;
}
.card-text{
    padding-bottom: 5px;
    font-size: 0.8em;
}
.card{
    margin-left: 5px;
    margin-right: 5px;
    border-width: 0px;
}
.VueCarousel-navigation-button{
    color: #eee!important;
}
</style>

<script>
import { Carousel, Slide } from 'vue-carousel';

export default {
    components: {
        Carousel,
        Slide
    },
    data(){
        return{
            slides: [
                {
                    id: 1,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 2,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 3,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 4,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 5,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 6,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 7,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 8,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 9,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 10,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 11,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
                {
                    id: 12,
                    name: 'This card has supporting text below as a natural lead-in to additional content',
                    cover: 'https://placekitten.com/500/350',
                    footer: 'Last updated 3 mins ago'
                },
            ]
        }
    }
}
</script>
