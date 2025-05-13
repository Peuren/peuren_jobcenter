import { ref } from 'vue';
import { createGlobalState } from '@vueuse/core';
import { fetchNui, isEnvBrowser } from '../utils';

export const useGlobalState = createGlobalState(() => {
        const visible = ref(isEnvBrowser());      
        const page = ref("");
        const pageData = ref([]);

        window.addEventListener("keydown", (event) => {
            if (event.key == "Escape") {
                fetchNui("close");
                page.value = "";
            }
        });

        window.addEventListener("message", async (event) => {
            if (event.data.type == "visible") {
                visible.value = event.data.value;
            } else if (event.data.type == "open") {
                page.value = event.data.page;
                pageData.value = event.data.pageData;
            }
        });

        return { visible, page, pageData };
    }
);