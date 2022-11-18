<script setup>
import { h, onMounted, ref } from 'vue';

const props = defineProps({
  appId: { type: String, required: true },
});

const appComponent = ref();

const ErrorComponent = {
  render() {
    return h('div', { class: 'app-error' }, 'ERROR');
  },
};

async function mountApp(appId) {
  try {
    const url = `/apps/${appId}/index.esm.js`;
    const mod = await import(/* @vite-ignore */ url);
    appComponent.value = mod.make();
  } catch (err) {
    console.warn('import remote module failed, ', err);
    appComponent.value = ErrorComponent;
  }
}

onMounted(() => {
  mountApp(props.appId);
});
</script>

<template>
  <div class="app-loader" :data-set-app-id="appId">
    <component :is="appComponent"></component>
  </div>
</template>
