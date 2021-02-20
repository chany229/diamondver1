<template>
    <div>
        <div class="loading" v-show="showLoading"><span><img src='/loading.gif'/></span></div>
        <div class="content">
            <h1>CONTACT</h1>
            <div class="wrapper">
                <div class="inner">
                    <div class="contact">
                        <div v-html="contact"></div>
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
            this.get_contact();
        },
        data () {
            return {
                contact: '',
                showLoading: true
            }
        },
        methods: {
            get_contact () {
                let that = this;
                Axios.get('/get_contact').then(function(res){
                    console.log(res);
                    that.contact = res['data']['contact']['body'];
                    that.showLoading = false;
                })
            },
        }
    }
</script>
<style scoped></style>