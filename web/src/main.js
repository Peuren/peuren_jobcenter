import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import PrimeVue from 'primevue/config';
import "primevue/resources/themes/aura-dark-green/theme.css";
import 'primeicons/primeicons.css';

const app = createApp(App);
app.use(PrimeVue, { ripple: true });

import Button from "primevue/button";
app.component('Button', Button);

import Menubar from 'primevue/menubar';
app.component('Menubar', Menubar);

import Card from 'primevue/card';
app.component('Card', Card);

import Chip from 'primevue/chip';
app.component('Chip', Chip);

import Tag from 'primevue/tag';
app.component("Tag", Tag);

import Panel from 'primevue/panel';
app.component("Panel", Panel);

import Menu from 'primevue/menu';
app.component("Menu", Menu);

import Dialog from 'primevue/dialog';
app.component("Dialog", Dialog);

import InputText from 'primevue/inputtext';
app.component("InputText", InputText);

import Checkbox from 'primevue/checkbox';
app.component("Checkbox", Checkbox);

import Dropdown from 'primevue/dropdown';
app.component("Dropdown", Dropdown);

import Avatar from 'primevue/avatar';
app.component("Avatar", Avatar);

import ConfirmPopup from 'primevue/confirmpopup';
app.component("ConfirmPopup", ConfirmPopup);

import Toast from 'primevue/toast';
app.component("Toast", Toast);

import ColorPicker from 'primevue/colorpicker';
app.component("ColorPicker", ColorPicker);

import ConfirmationService from 'primevue/confirmationservice';
app.use(ConfirmationService);

import ToastService from 'primevue/toastservice';
app.use(ToastService);

import Tooltip from 'primevue/tooltip';
app.directive('tooltip', Tooltip);

app.mount('#app');