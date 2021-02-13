<template>
    <div>
        <div class="loading" v-show="showLoading"><span><img src='/assets/loading.gif'/></span></div>
        <div class="content">
            <h1>TAGS</h1>
            <div class='wrapper'>
                <div class='inner'>
                    <ul class='tags_ul'>
                        <li v-for="tag in tags">
                            <router-link :to="{name: 'tag', params: {tag: tag.name}}">{{tag.name}}({{tag.count}})</router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Axios from 'axios';
    export default {
    	name: 'tags',
    	components: {

    	},
    	mounted () {
            this.get_tags();
    	},
        data () {
            return {
                tags: [],
                showLoading: true
            }
        },
        methods: {
            get_tags () {
                let that = this;
                Axios.get('/get_tags').then(function(res){
                    console.log(res);
                    that.tags = res['data']['tags'];
                    console.log('tags', that.tags);
                    that.showLoading = false;
                })
            },
        }
    }
</script>
<style scoped></style>