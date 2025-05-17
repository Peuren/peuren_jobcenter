<script setup>
import { fetchNui } from '../utils';
import { useGlobalState } from '../stores/globalStore';
import { ref, computed } from "vue";
import Tag from 'primevue/tag';
import locale from "../locale";
import Tooltip from 'primevue/tooltip';

const globalState = useGlobalState();
const searchQuery = ref('');
const jobs = globalState.pageData;

const filteredJobs = computed(() => {
    if (!searchQuery.value) return jobs.value;
    return jobs.value.filter(job => 
        job.title.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
        job.description.toLowerCase().includes(searchQuery.value.toLowerCase())
    );
});

const getRequirementIcon = (type) => {
    const icons = {
        'license': 'pi pi-id-card',
        'item': 'pi pi-box',
        'money': 'pi pi-dollar',
        'age': 'pi pi-user',
    };
    return icons[type] || 'pi pi-check';
};

const getImageSource = (itemName) => {
    return `nui://peuren_jobcenter/web/images/${itemName}`;
};

</script>

<template>
    <div class="jobs-container">
        <!-- Search and Filter Section -->
        <div class="search-section">
            <div class="search-bar">
                <i class="pi pi-search"></i>
                <input 
                    v-model="searchQuery"
                    type="text"
                    :placeholder="locale('jobs', 'search_jobs')"
                >
            </div>
        </div>

        <!-- Jobs Grid -->
        <div class="jobs-grid">
            <div v-for="job in filteredJobs" 
                :key="job.id" 
                class="job-card">
                <div class="job-header">
                    <img :src="getImageSource(job.image)" :alt="job.title">
                    <div class="job-title">
                        <div class="title-left">
                            <i :class="job.icon"></i>
                            <h3>{{ job.title }}</h3>
                        </div>
                        <div class="rank-tag" v-if="job.rank"
                            v-tooltip.top="locale('jobs', 'rank_tooltip')">
                            <i class="pi pi-star-fill"></i>
                            <span>{{ job.rank }}</span>
                        </div>
                    </div>
                </div>

                <div class="job-content">
                    <p class="job-description">
                        {{ job.description }}
                    </p>
                    <div class="requirements">
                        <div class="requirements-header">
                            <i class="pi pi-list"></i>
                            <span>{{ locale('jobs', 'requirements') }}</span>
                        </div>
                        <div class="requirements-tags">
                            <Tag v-for="req in job.requirements" 
                                :key="req.label"
                                :value="req.label"
                                :severity="req.severity">
                                <template #icon>
                                    <i :class="getRequirementIcon(req.type)"></i>
                                </template>
                            </Tag>
                        </div>
                    </div>

                    <div class="button-group">
                        <Button class="start-button" 
                               @click="fetchNui('start-working', job.id)">
                            <i class="pi pi-play"></i>
                            <span>{{ locale('jobs', 'start_working') }}</span>
                        </Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped lang="scss">
.jobs-container {
    display: flex;
    flex-direction: column;
    gap: 2vh;
    padding: 2vh;
    height: 100%;
    width: 100%;
    color: white;
    overflow: hidden; // Add this

    .search-section {
        .search-bar {
            display: flex;
            align-items: center;
            gap: 1vh;
            background: rgb(32, 32, 32);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 0.8vh;
            padding: 0 1.5vh;
            height: 5vh;

            i {
                font-size: 1.6vh;
                color: rgb(87, 182, 87);
            }

            input {
                flex: 1;
                background: none;
                border: none;
                outline: none;
                color: white;
                font-size: 1.4vh;
                height: 100%;

                &::placeholder {
                    color: rgba(255, 255, 255, 0.5);
                }
            }
        }
    }

    .jobs-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2vh;
        overflow-y: auto;
        padding-right: 1vh;
        flex: 1;
        min-height: 0;

        .job-card {
            height: 40vh;  // Increased fixed height
            min-height: 40vh;
            background: rgb(32, 32, 32);
            border-radius: 0.8vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;

            .job-header {
                height: 15vh;  // Increased header height
                min-height: 15vh;
                position: relative;
            }

            .job-content {
                flex: 1;
                padding: 1.5vh;
                display: flex;
                flex-direction: column;
                min-height: 0;

                .job-rank {
                    flex: 0 0 auto;
                    margin-bottom: 1.5vh;
                }

                .requirements {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    margin-bottom: 1.5vh;
                    min-height: 0;
                }

                .button-group {
                    flex: 0 0 4vh;
                    display: flex;
                    gap: 1vh;
                    margin-top: auto;
                    
                    .info-button, .start-button {
                        flex: 1;
                        margin: 0;
                        padding: 0;
                        height: 4vh;
                        border: none;
                        border-radius: 0.6vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 1vh;
                        transition: all 0.2s ease;

                        i {
                            font-size: 1.4vh;
                        }

                        span {
                            font-size: 1.3vh;
                            font-weight: 600;
                        }
                    }

                    .info-button {
                        background: rgba(255, 255, 255, 0.1);
                        color: white;

                        &:hover {
                            background: rgba(255, 255, 255, 0.15);
                            transform: translateY(-0.2vh);
                        }
                    }

                    .start-button {
                        background: rgb(87, 182, 87);

                        &:hover {
                            background: darken(rgb(87, 182, 87), 5%);
                            transform: translateY(-0.2vh);
                        }
                    }
                }
            }
        }

        &::-webkit-scrollbar {
            width: 0.6vh; // Slightly wider for better usability
        }

        &::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 1vh;
        }

        &::-webkit-scrollbar-thumb {
            background: rgba(87, 182, 87, 0.3);
            border-radius: 1vh;

            &:hover { // Add hover effect
                background: rgba(87, 182, 87, 0.5);
            }
        }

        .job-card {
            background: rgb(32, 32, 32);
            border-radius: 0.8vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;

            .job-header {
                position: relative;
                height: 12vh;

                img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .job-title {
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    padding: 1vh;
                    background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    gap: 1vh;

                    .title-left {
                        display: flex;
                        align-items: center;
                        gap: 1vh;

                        i {
                            font-size: 1.8vh;
                            color: rgb(87, 182, 87);
                        }

                        h3 {
                            margin: 0;
                            font-size: 1.6vh;
                            font-weight: 600;
                        }
                    }

                    .rank-tag {
                        display: flex;
                        align-items: center;
                        gap: 0.4vh;
                        background: rgba(255, 196, 0, 0.2);
                        border: 1px solid rgba(255, 196, 0, 0.3);
                        padding: 0.3vh 0.8vh;
                        border-radius: 0.4vh;

                        i {
                            font-size: 1.2vh;
                            color: rgb(255, 196, 0);
                        }

                        span {
                            font-size: 1.1vh;
                            font-weight: 600;
                            color: rgb(255, 196, 0);
                        }
                    }
                }
            }

            .job-content {
                padding: 1.5vh;
                display: flex;
                flex-direction: column;
                gap: 1.5vh;

                .job-description {
                    margin: 0;
                    font-size: 1.3vh;
                    color: rgb(200, 200, 200);
                    line-height: 1.8vh;
                }

                .job-rank {
                    .rank-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 0.8vh;

                        .rank-title {
                            display: flex;
                            align-items: center;
                            gap: 0.5vh;
                            font-size: 1.3vh;
                            color: rgb(255, 196, 0);

                            i {
                                font-size: 1.4vh;
                            }
                        }

                        .xp-counter {
                            font-size: 1.2vh;
                            color: rgb(200, 200, 200);
                        }
                    }

                    .p-progressbar {
                        height: 1vh;
                        border-radius: 0.5vh;

                        :deep(.p-progressbar-value) {
                            background: rgb(87, 182, 87);
                        }
                    }
                }

                .requirements {
                    background: rgba(255, 255, 255, 0.05);
                    border-radius: 0.6vh;
                    padding: 1vh;

                    .requirements-header {
                        display: flex;
                        align-items: center;
                        gap: 0.8vh;
                        margin-bottom: 1vh;
                        padding-bottom: 0.8vh;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.1);

                        i {
                            font-size: 1.3vh;
                            color: rgb(87, 182, 87);
                        }

                        span {
                            font-size: 1.2vh;
                            color: rgb(200, 200, 200);
                            font-weight: 500;
                        }
                    }

                    .requirements-tags {
                        display: flex;
                        gap: 0.6vh;
                        flex-wrap: wrap;

                        :deep(.p-tag) {
                            margin: 0;
                            font-size: 1.1vh;
                            padding: 0.3vh 0.8vh;
                            border-radius: 0.4vh;
                            display: flex;
                            align-items: center;
                            gap: 0.5vh;
                            
                            &.p-tag-info {
                                background: rgba(255, 255, 255, 0.1);
                                color: rgb(200, 200, 200);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                            }
                            
                            &.p-tag-warning {
                                background: rgba(255, 255, 255, 0.15);
                                color: rgb(220, 220, 220);
                                border: 1px solid rgba(255, 255, 255, 0.15);
                            }
                            
                            &.p-tag-danger {
                                background: rgba(255, 255, 255, 0.2);
                                color: rgb(240, 240, 240);
                                border: 1px solid rgba(255, 255, 255, 0.2);
                            }

                            .p-tag-icon {
                                font-size: 1.1vh;
                                order: -1;
                                color: rgb(87, 182, 87);
                            }
                        }
                    }
                }

                .button-group {
                    flex: 0 0 4vh;
                    display: flex;
                    gap: 1vh;
                    margin-top: auto;

                    .info-button, .start-button {
                        flex: 1;
                        margin: 0;
                        padding: 0;
                        height: 4vh;
                        border: none;
                        border-radius: 0.6vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 1vh;
                        transition: all 0.2s ease;

                        i {
                            font-size: 1.4vh;
                        }

                        span {
                            font-size: 1.3vh;
                            font-weight: 600;
                        }
                    }

                    .info-button {
                        background: rgba(255, 255, 255, 0.1);
                        color: white;

                        &:hover {
                            background: rgba(255, 255, 255, 0.15);
                            transform: translateY(-0.2vh);
                        }
                    }

                    .start-button {
                        background: rgb(87, 182, 87);

                        &:hover {
                            background: darken(rgb(87, 182, 87), 5%);
                            transform: translateY(-0.2vh);
                        }
                    }
                }
            }
        }
    }

    :deep(.p-tooltip) {
        background: rgba(0, 0, 0, 0.9);
        padding: 0.5vh 0.8vh;
        border-radius: 0.3vh;
        font-size: 1.1vh;
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.1);
        max-width: 15vh;
    }
}
</style>