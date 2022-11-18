# Vue Remote Component Demo

基于 Vue3 的远程组件加载 Demo。

## 加载流程

![流程图](./loading-flow.png)

## 实现要点

- 所有 app 组件导出为 esm 模块
- portal 中创建一个 Vue 实例
    - 远程组件包装在 AppLoader 组件中，由其内部加载组件
    - import 语句要加上 `/* @vite-ignore */` 防止被 vite 处理
- 构建时，Vue 加入 external
- 缺少的依赖，通过 import-maps 映射到 cdn 上的 vue.runtime-prod.js

## LICENSE

MIT
