<template>
    <div>
        <div class="loading" v-show="showLoading"><span><img src='/loading.gif'/></span></div>
        <div class="content">
            <h1>WELCOME</h1>
            <div class="wrapper">
                <div class="inner">
                    <div class="about">
                        <div v-html="about"></div>
                    </div>
                    <div class="record">
                        <h2>What's new</h2>
                        <ul>
                            <li v-for="record in records">
                                <span>{{record.created_at}}</span>
                                <span>{{record.title}}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Axios from 'axios';
    export default {
    	name: 'top',
    	components: {

    	},
    	mounted () {
            this.get_top();
    	},
        data () {
            return {
                about: '',
                records: [],
                showLoading: true
            }
        },
        methods: {
            get_top () {
                let that = this;
                Axios.get('/get_top').then(function(res){
                    console.log(res);
                    that.about = res['data']['about']['about']['body'];
                    that.records = res['data']['records'];
                    that.showLoading = false;
                })
            },
        }
    }
</script>
<style scoped>
</style>