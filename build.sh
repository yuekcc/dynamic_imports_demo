#!/bin/env sh
set -aux

ROOT=$(pwd)

# 安装依赖
test -d node_modules || pnpm i -r

# 构建子应用
cd ${ROOT}/packages/app-name-card
pnpm build

# 构建 portal
cd $ROOT/packages/portal
pnpm build
cd dist

# 安装 vue.esm 模块，portal 和 子应用都依赖外部的 vue
# 主要是对于浏览器 esmodule 只能通过 importmap 来映射到相同的 vue 实现 
cp $ROOT/packages/portal/node_modules/vue/dist/vue.esm-browser.prod.js .

# 安装子应用
mkdir -p apps/app-name-card
cd apps/app-name-card
cp ${ROOT}/packages/app-name-card/dist/index.esm.js .
cd $ROOT/packages/portal

# 启动预览服务器
pnpm preview
