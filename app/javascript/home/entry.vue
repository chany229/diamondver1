<template>
    <div>
        <div class="loading" v-show="showLoading"><span><img src='/assets/loading.gif'/></span></div>
        <div class='content'>
            <h1>{{entry.title}}</h1>
            <div class='wrapper'>
                <div class='inner'>
                    <div class='info'>
                        <span>分类：{{entry.category_name}}</span>
                        <span> | </span>
                        <span>标签：<router-link v-for="tag in tags" :to="{name: 'tag', params: {tag: tag}}">[{{tag}}]</router-link></span>
                        <span> | </span>
                        <a v-on:click="go_to_comments()">评论({{entry.comment_count}})</a>
                        <span class='right'>{{entry.created_at}}</span>
                    </div>
                    <div v-html="content"></div>
                    <div class='comments'>
                        <ul class='comments_left'>
                            <li v-for='comment in comments'>
                                <span class='username'>{{comment.username}}:</span>
                                <span class='comment'>{{comment.comment}}</span>
                                <span class='created_at'>({{comment.created_at}})</span>
                            </li>
                        </ul>
                        
                        <div class="comments_right">
                            <input type="text" v-model.trim="input_username" placeholder="请输入昵称"><br/>
                            <textarea v-model.trim="input_comment" placeholder="请输入内容"></textarea><br/>
                            <button class="btn" v-on:click="post_comment()">提交</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Axios from 'axios';
    export default {
    	name: 'entry',
    	components: {

    	},
    	mounted () {
            this.init_page();
            this.get_entry();
    	},
        data () {
            return {
                entry_id: 0,
                entry: {
                    title: '',
                    content: {
                        body: ""
                    }
                },
                comments: [],
                content: "",
                showLoading: true,
                input_comment: '',
                input_username: '',
                input_ua: '',
                tags: []
            }
        },
        created () {　　　　//实例被创建时候执行
        },
        watch: {
        },
        methods: {
            init_page () {
                this.input_username = Cookies.get('input_username');
                this.input_ua = navigator.userAgent;
                console.log(this.input_ua);
            },
            get_entry () {
                this.entry_id = this.$route.params.id;
                let that = this;
                Axios.get('/get_entry/' + that.entry_id).then(function(res){
                    // console.log(res);
                    that.entry = res['data'];
                    that.comments = that.entry.comments;
                    that.tags = that.entry.tags;

                    // console.log(that.entry.title);
                    // console.log('body', that.entry.content.body);
                    that.updateImages();
                    that.showLoading = false;
                })
            },
            post_comment () {
                let that = this;
                let data = {
                    comment: this.input_comment,
                    username: this.input_username,
                    ua: this.input_ua,
                    created_at: '刚刚',
                    entry_id: this.entry_id
                }
                Axios.post('/comment', data).then(res=>{
                    that.comments.push(data);
                    that.input_comment = "";

                    console.log("comments". that.comments);
                });
            },
            updateImages () {
                const reg = new RegExp(/<action-text-attachment(.*?)url="(.*?)"(.*?)<\/action-text-attachment>/i);

                this.content = this.entry.content.body.replaceAll(reg, '<img src="$2" style="max-width:100%"/>');
            },
            go_to_comments() {
                document.querySelector(".comments").scrollIntoView();
            }
        }
    }
</script>
<style scoped></style>