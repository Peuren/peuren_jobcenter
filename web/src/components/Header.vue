<script setup>
    import { ref } from "vue";    
    import { useGlobalState } from '../stores/globalStore';
    import locale from "../locale";

    const globalState = useGlobalState();
    const items = ref([
        {
            label: locale('header', 'job_tab_title'),
            icon: 'pi pi-briefcase',
        },
    ]);
</script>

<template>
    <div class="header-container">
        <div class="nav-content">
            <div class="nav-items">
                <div class="nav-item" 
                    v-for="item in items" 
                    :key="item.label"
                    @click="item.command"
                    :class="{ 'active': globalState.currentTab === item.label.toLowerCase() }">
                    <i :class="item.icon"></i>
                    <span>{{ item.label }}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
.header-container {
    width: 100%;
    margin-bottom: 0vh;

    .nav-content {
        background-color: rgb(32, 32, 32);
        border-radius: 0.8vh;
        padding: 1vh 2vh;

        .nav-items {
            display: flex;
            gap: 1vh;

            .nav-item {
                display: flex;
                align-items: center;
                gap: 1vh;
                padding: 1vh 1.5vh;
                border-radius: 0.6vh;
                cursor: pointer;
                transition: all 0.2s ease;
                color: rgb(200, 200, 200);

                i {
                    font-size: 1.6vh;
                    color: rgb(87, 182, 87);
                }

                span {
                    font-size: 1.4vh;
                    font-weight: 500;
                }

                &:hover {
                    background: rgba(255, 255, 255, 0.05);
                    color: white;
                }

                &.active {
                    background: rgba(87, 182, 87, 0.1);
                    color: rgb(87, 182, 87);

                    i {
                        color: rgb(87, 182, 87);
                    }
                }
            }
        }
    }
}
</style>