import { createApp } from 'vue';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';

import Portal from './Portal.vue';

const app = createApp(Portal);
app.use(ElementPlus);
app.mount('#app');
