/**
 *  chuyển tab của settings
 */
function activeBarSettings() {
    try {
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
    } catch (error) {
        console.log("Lỗi active các thanh settings", error)
    }
}
activeBarSettings();