<script setup>
  import Header from "./components/Header.vue";
  import Jobs from "./pages/Jobs.vue";

  import { useGlobalState } from "./stores/globalStore";  
  const globalState = useGlobalState();
</script>

<template>
    <div class="MainContainer">
        <div class="Content" v-if="globalState.visible.value">
          <Header v-if="globalState.page.value == 'center'" />
          <div class="Contents">
              <Jobs v-if="globalState.page.value == 'center'"></Jobs>
          </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
  .MainContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;

    .Content {
      display: flex;
      align-items: center;
      flex-flow: column;
      width: 90vh;
      background-color: rgb(15, 15, 15);
      border-radius: 0.5vh;

      .Contents {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 52vh;
        width: 100%;        
      }
    }
  }
</style>
