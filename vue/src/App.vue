<template>
  <app-menu>
    <Menu :info="info" @project_change="project_change"></Menu>
  </app-menu>

  <l-navigation-drawer :style="slider_style">
    <TreeView :data="file_data" @content_change="content_change"></TreeView>
    <Sash location="right" :width="slider_width" @attribute_change="slider_change" />
  </l-navigation-drawer>

  <r-navigation-drawer :style="operate_style">
    <Sash location="left" :width="operate_width"  @attribute_change="operate_change" />
  </r-navigation-drawer>
  
  <main :style="main_style">
    <MainPage :content="content"></MainPage>
  </main>
  
</template>

<script lang="ts" setup>
import Sash from './components/Sash.vue';
import MainPage from './layouts/MainPage.vue';
import Menu from './layouts/Menu.vue'
import TreeView from './layouts/TreeView.vue';

import { ref,watch,reactive } from 'vue';

declare const pywebview: any

// 初始宽度
var slider_width = ref(200)
var operate_width = ref(160)

var main_style = reactive({
  left: slider_width.value + 'px',
  right: operate_width.value + 'px',
})

var slider_style = reactive({
  width: slider_width.value + 'px'
})

var operate_style = reactive({
  width: operate_width.value + 'px',
})

// 监视变化，更新相关属性。

watch(slider_width, () => {
  var p = slider_width.value + 'px';
  main_style.left = p
  slider_style.width = p
});

watch(operate_width, () => {
  var p = operate_width.value + 'px';
  main_style.right = p
  operate_style.width = p
});


const slider_change = (width: number) => {
  slider_width.value = width
}
const operate_change = (width: number) => {
  operate_width.value = width
}

// 收取文件夹选择回调，并获取文件夹下的所有文件信息
var file_data = ref([])
const project_change = (data:any) => {
  file_data.value = data
}

var content = ref('')
var info = ref('None')
const content_change = (text:string,infomation:string) => {
  content.value = text
  info.value = infomation
}
</script>

<style>
app-menu {
  position: absolute;
  top: 0px;
  width: 100%;
  height: 40px;
}

main {
  position: absolute;
  top: 40px;
  bottom: 0px;
}

l-navigation-drawer {
  position: absolute;
  top: 40px;
  bottom: 0px;
  left: 0px;
  background-color: aquamarine;
}

r-navigation-drawer {
  position: absolute;
  top: 40px;
  bottom: 0px;
  right: 0px;
  background-color:antiquewhite;
}
</style>