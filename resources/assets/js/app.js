
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue';



import VueRouter from 'vue-router'
Vue.use(VueRouter)

import Vuex from 'vuex'
Vue.use(Vuex)

import axios from 'axios'
import VueAxios from 'vue-axios'
//axios.defaults.baseURL = 'http://sajjainfo.com';
//axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.use(VueAxios, axios)



import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);

import VueCarousel from 'vue-carousel';
Vue.use(VueCarousel);

 //import VueEditor from 'vue2-editor'
 //Vue.use(VueEditor);
import VueSwal from 'vue-swal'

Vue.use(VueSwal)

import VueQuillEditor from 'vue-quill-editor'

import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import 'highlight.js/styles/vs2015.css'
import hljs from 'highlight.js'

Vue.use(hljs)
Vue.use(VueQuillEditor,)

import Prism from 'prismjs';
Vue.use(Prism);

import JQuery from 'jquery'
let $ = JQuery
window.$ = require('jquery')

import App from './views/App'
import Index from './views/Index'
import Article from './views/Article'
import Webboard from './views/Webboard'
import Questions from './views/Questions'
import Question from './views/Question'


import Home from './views/Home'
import Admin from './views/Admin/Admin'
import AdminSubject from './views/Admin/AdminSubject'
import AdminArticle from './views/Admin/AdminArticle'
import AdminDashboard from './views/Admin/AdminDashboard'
import AdminWebboard from './views/Admin/AdminWebboard'
import AdminFlashnew from './views/Admin/AdminFlashnew'
const router = new VueRouter({
    mode: 'history',
    base: '/',
    routes: [
        {
            path: '/',
            component: Home,
            children: [
                {
                    path: '',
                    component: Index
                },
                {
                    path: '/article',
                    component: Article
                },
                {
                    path: '/webboard',
                    component: Webboard,
                    children: [
                        {
                            path: '',
                            component: Questions
                        },
                        {
                            path: '/webboard/question/:id',
                            component: Question
                        }
                    ]
                }
            ]
        },
        {
            path: '/admin',
            component: Admin,
            children: [
                {
                    path: '',
                    component: AdminDashboard
                },
                {
                    path: 'subject',
                    component: AdminSubject
                },
                {
                    path: 'article',
                    component: AdminArticle
                },
                {
                    path: 'webboard',
                    component: AdminWebboard
                },
                {
                    path: 'flashnew',
                    component: AdminFlashnew
                }
            ]
        }
        
    ]
});

const store = new Vuex.Store({
    state: {
        //Subject Pretest
        subject_pretest_path: '',        
        subject_posttest_path: '',
        content: ''
    },
    mutations: {
        SET_SUBJECT_PRETEST_PATH: (state,path) => {
            state.subject_pretest_path = path
        },
        
    },
    actions: {
        
    }
})
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('Alert', require('./components/Alert.vue'));

Vue.component('NavBar', require('./components/NavBar.vue'));
Vue.component('MyHeader', require('./components/MyHeader.vue'));
Vue.component('MyTeacher', require('./components/MyTeacher.vue'));
Vue.component('FlashNews', require('./components/FlashNews.vue'));
Vue.component('MyTab', require('./components/MyTab.vue'));
Vue.component('MyFooter', require('./components/MyFooter.vue'));
Vue.component('MyDetail', require('./components/MyDetail.vue'));
Vue.component('CodeBox', require('./components/CodeBox.vue'));
Vue.component('MyTopic', require('./components/MyTopic.vue'));
Vue.component('MyAlert', require('./components/MyAlert.vue'));

Vue.component('MyArticles', require('./components/Articles/ListArticles.vue'));
Vue.component('ShowTopic', require('./components/Articles/ShowTopic.vue'));

Vue.component('MyQuestionAnswer', require('./components/Articles/MyQuestionAnswer.vue'));
Vue.component('MyTest', require('./components/Articles/MyTest.vue'));
Vue.component('SlotQuestionAnswer', require('./components/Articles/SlotQuestionAnswer.vue'));

Vue.component('ListQuestions', require('./components/Webboard/ListQuestions.vue'));
Vue.component('ShowQuestion', require('./components/Webboard/ShowQuestion.vue'));
Vue.component('ContentBox', require('./components/Webboard/ContentBox.vue'));

Vue.component('DashBoard', require('./components/Admin/DashBoard.vue'));
Vue.component('QuestionManage', require('./components/Admin/QuestionManage.vue'));
Vue.component('TestManage', require('./components/Admin/TestManage.vue'));
Vue.component('TopicList', require('./components/Admin/TopicList.vue'));
Vue.component('TopicManage', require('./components/Admin/TopicManage.vue'));

Vue.component('MyEditor', require('./components/MyEditor.vue'));
const app = new Vue({
    el: '#app',
    store,
    components: { App },
    router,
    Prism,
    
});







