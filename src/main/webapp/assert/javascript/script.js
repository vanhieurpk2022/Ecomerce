


function getActiveBar() {
    try {
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
    } catch (error) {
        console.error("Lỗi active bar", error);
    }
}



    try {
        const displayCount = document.getElementById("cart_count");
        if (displayCount.textContent == "0") {
            document.getElementById("cart_count").style.display = "none";
        }
    } catch (error) {
        console.log(error);
    }



function dropDownWhenLogin() {
    try {
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
    } catch (error) {
        console.log(error);
    }
}

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


getActiveBar();
dropDownWhenLogin();




