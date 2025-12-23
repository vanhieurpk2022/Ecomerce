
// xóa giở hàng
function removeItem(button) {
	const $btn = $(button);
	const variantId = $btn.data("variantid");
	const row = $btn.closest("tr");

	$.ajax({
		url: "cart?action=RemoveProducts",
		type: "POST",
		data: {
			id: variantId
		},
		success: function(res) {
			row.fadeOut(200, function() {
				$(this).remove();
			});

			// update total
			$("#TotalPrice").text(res.totalPrice);

			$("#cart_count_mobile").text(res.cartCount);
			$("#cart_count").text(res.cartCount);

			// ===== ẨN / HIỆN BADGE =====
			if (res.cartCount == 0){
				$("#cart_count_mobile").hide();
				$("#cart_count").hide();
			}

		},
		error: function() {
			console.log("Xóa sản phẩm thất bại!");
		}
	});
}

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
try {
	const displayCount = document.getElementById("cart_count_mobile");
	if (displayCount.textContent == "0") {
		document.getElementById("cart_count_mobile").style.display = "none";
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
// Sau 10 giây (10000 ms) sẽ ẩn thẻ thông báo
setTimeout(function() {
	var msg = document.getElementById("msg_pwd");
	if (msg) {
		msg.style.display = "none";
	}
}, 10000);

getActiveBar();
dropDownWhenLogin();




