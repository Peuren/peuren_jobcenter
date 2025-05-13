let localeData = {}

function getNestedValue(obj, path) {
    return path.split('.').reduce((current, key) => {
        return current?.[key];
    }, obj);
}

function locale(page, path) {
    return getNestedValue(localeData[page], path) || path;
}

window.addEventListener("message", (event) => {
    if (event.data.type == "loadLocale") {
        localeData = event.data.data;
    }
});

export default locale;