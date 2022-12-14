import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import locale from 'element-ui/lib/locale/lang/en'
import '@/assets/global.css'
import SlideVerify from 'vue-monoplasty-slide-verify';

Vue.use(SlideVerify);
Vue.config.productionTip = false
Vue.use(ElementUI, { locale }),{size: 'small'};


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
