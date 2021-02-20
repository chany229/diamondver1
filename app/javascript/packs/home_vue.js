import Vue from 'vue'
import VueRouter from 'vue-router'

import Main from '../home/_main.vue'

import Top from '../home/top.vue'
import Entry from '../home/entry.vue'
import Contact from '../home/contact.vue'
import Tags from '../home/tags.vue'
import Tag from '../home/tag.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  // mode: 'history',
  routes: [
    { path: '/',          name: 'top',     component: Top },
    { path: '/contact',   name: 'contact', component: Contact },
    { path: '/entry/:id', name: 'entry',   component: Entry },
    { path: '/tags',      name: 'tags',    component: Tags },
    { path: '/tag/:tag',  name: 'tag',     component: Tag }
  ]
})

const VueRouterPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (to) {
  return VueRouterPush.call(this, to).catch(err => err)
}

//更改頁面標題 //TODO
// router.afterEach((to, from, next) => {
//   document.title = to.name;
// })

document.addEventListener('DOMContentLoaded', () => {
  let apps = [
    { elem: '#home-main', object: Main }
  ];

  let props = window.jsProps || {};
  apps.forEach((app) => {
    if($(app.elem).length) {
      if(app.object.render) { // テンプレートあり
        new Vue({el: app.elem, router, render: h => h(app.object, { props }) });
      }
      else { // HTMLをテンプレートに
        new Vue(router, app.object).$mount(app.elem);
      }
    }
  });
})

