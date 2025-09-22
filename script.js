const bar = document.getElementById("bar");
const close = document.getElementById("close");
const nav = document.getElementById("navbar");

// nếu bấm bar -> thêm class vào nav (active: right 0)
if (bar) {
    bar.addEventListener("click", () => {
        nav.classList.add("active");
    })
}


if (close) {
    close.addEventListener("click", () => {
        nav.classList.remove("active");
    })
}
