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

const displayCount = document.getElementById("cart_count");
if (displayCount.textContent == "0") {
    document.getElementById("cart_count").style.display = "none";
}
const avatar = document.querySelector(".avatar");
const dropdown = document.querySelector(".dropdown");

avatar.addEventListener("click", () => {
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
});

// Ẩn khi click ra ngoài
document.addEventListener("click", (e) => {
    if (!avatar.contains(e.target)) {
        dropdown.style.display = "none";
    }
});
// show up password
function showHiddenPassword(inputID, iconID) {
    const input = document.getElementById(inputID);
    const icon = document.getElementById(iconID);

    icon.addEventListener("click", () => {
        if (input.getAttribute("type") === "text") {
            input.setAttribute("type", "password");
            icon.innerHTML = '<i class="bi bi-eye"></i>';
        } else {
            input.setAttribute("type", "text");
            icon.innerHTML = '<i class="bi bi-eye-slash"></i>';
        }
    });
}

// Ẩn các phần không active ban đầu
document.getElementById("settings_security").style.display = "none";
document.getElementById("settings_address").style.display = "none";

const tabs = document.querySelectorAll(".settings_nav a");
const contents = {
    tab_account: document.getElementById("settings_account"),
    tab_security: document.getElementById("settings_security"),
    tab_address: document.getElementById("settings_address")
};

// Xử lý click cho từng tab
tabs.forEach(tab => {
    tab.addEventListener("click", (e) => {
        e.preventDefault();

        // Xóa class active của tất cả tab
        tabs.forEach(t => t.classList.remove("settings_active"));

        // Ẩn tất cả nội dung
        for (let key in contents) {
            contents[key].style.display = "none";
        }

        // Active tab được click
        tab.classList.add("settings_active");

        // Hiển thị nội dung tương ứng
        const targetId = tab.id.replace("tab_", "settings_");
        contents[tab.id].style.display = "block";
    });
});