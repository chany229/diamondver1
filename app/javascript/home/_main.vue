<template>
<div id='home-main'>
    <div class='side'>
        <h1 v-on:click="click_top()"><span>DIAMOND ALLIANCE</span></h1>
        <ul class='menu'>
            <li class='item'>
                <div v-bind:class="{ 'btn' : true, 'current' : isCurrent('top') }" v-on:click="click_top()">TOP</div>
            </li>
            <li class='item works'>
                <div v-bind:class="{ 'btn' : true, 'current' : isCurrent('works') }" v-on:click="click_works()">WORKS</div>

                <div class='list hide'>
                    <ul class='categories'>
                        <li v-for="category in categories">
                            {{ category.title }}
                            <ul class='entries'>
                                <li v-for="entry in category.entries">
                                    <router-link :to="{name: 'entry', params: {id: entry.id}}" :title="entry.title">♦</router-link>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <router-link to='/tags' class='to_tags'>>按标签搜索</router-link>
                    <div class='clear'></div>
                </div>
            </li>
            <li class='item'>
                <div v-bind:class="{ 'btn' : true, 'current' : isCurrent('contact') }" v-on:click="click_contact()">CONTACT</div>
            </li>
        </ul>

        <div class='info'>Designed and produced by 六十</div>
    </div>
    <div class="content_wrapper">
        <a href='/session/new' target="_blank" class='icon'></a>
        <keep-alive>
            <router-view :key="key"></router-view>
        </keep-alive>
    </div>
</div>
</template>
<script>
    import Axios from 'axios';
    export default {
        data: function () {
            return {
                categories: [],
                currentVal: ''
            }
        },
        mounted() {
            //頁面加載完成後執行
            if ( this.isCurrent('works') ) {
                $('.list').slideDown();
            }
            this.get_works();
        },
        methods: {
            isCurrent: function (val) {
                return this.current == val;
            },
            click_top: function () {
                $('.list').slideUp();
                this.$router.push('/');
                this.currentVal = 'top';
            },
            click_works: function () {
                $('.list').slideToggle();
                this.currentVal = 'works';
            },
            click_contact: function () {
                console.log('=================');
                $('.list').slideUp();
                this.$router.push('/contact');
                this.currentVal = 'contact';
            },
            get_works() {
                let that = this;
                Axios.get('/get_works').then(function(res){
                    console.log(res);
                    that.categories = res['data'];
                })
            }
        },
        created() {　　　　//实例被创建时候执行

        },
        computed: {
            key() {
                return this.$route.name?this.$route.name+ +new Date():this.$route+ +new Date()
            },
            current() {
                if (this.currentVal == '') {
                    let val = this.$route.path;
                    if (val == '/') {
                        return 'top'
                    } else if (val == '/contact') {
                        return 'contact'
                    }
                    return 'works'
                } else {
                    return this.currentVal;
                }
            }
        },
        watch: {//监听数据前后变化
        //firstName: function (val, oldVal) { //如果watch监测的是一个对象的话，直接使用watch是不行的，此时我们可以借助于computed计算属性来完成}
        //或者在键路径加上引号
        //‘demo.name’:function (val, oldVal) {}
        //user: function (val, oldVal) { 　　//数据前后变化}
        },
        // beforeCreate: function () {
        //     console.group('beforeCreate 创建前状态===============》');
        // },
        // created: function () {
        //     console.group('created 创建完毕状态===============》');
        // },
        // beforeMount: function () {
        //     console.group('beforeMount 挂载前状态===============》');
        // },
        // mounted: function () {
        //     console.group('mounted 挂载结束状态===============》');
        // },
        // beforeUpdate: function () {
        //     console.group('beforeUpdate 更新前状态===============》'); 
        // },
        // updated: function () {
        //     console.group('updated 更新完成状态===============》');
        // },
        // beforeDestroy: function () {
        //     console.group('beforeDestroy 销毁前状态===============》');
        // },
        // destroyed: function () {
        //     console.group('destroyed 销毁完成状态===============》');
        // }

    }
</script>