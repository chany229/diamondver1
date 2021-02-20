<template>
    <div>
        <div class="loading" v-show="showLoading"><span><img src='/loading.gif'/></span></div>
        <div class="content">
            <h1>标签：{{tag}}</h1>
            <div class='wrapper'>
                <div class='inner'>
                    <ul class='entries_ul'>
                        <li v-for="entry in entries">
                            <router-link :to="{name: 'entry', params: {id: entry.id}}">{{entry.title}}</router-link>
                            <span>{{entry.created_at}}</span>
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
    	name: 'tag',
    	components: {

    	},
    	mounted () {
            this.tag = this.$route.params.tag;
            console.log('tag', this.tag);
            this.get_tag(this.tag);
        },
        data () {
            return {
                tag: '',
                entries: [],
                showLoading: true
            }
        },
        methods: {
            get_tag (tag) {
                let that = this;
                Axios.get('/get_tag/' + tag).then(function(res){
                    console.log(res);
                    that.entries = res['data']['entries'];
                    console.log('entries', that.entries);
                    that.showLoading = false;
                })
            },
        }
    }
</script>
<style scoped></style>