
// delete address
function updateCurrenAddress(button,linkURL) {

	const $btn = $(button);
	const addressID = $btn.data("addressId");
	console.log(addressID);
	$.ajax({
		url: linkURL+"/user/updateCurrentAddress",
		type: "POST",
		data: {
			id:addressID
		},
		success: function(res) {
			window.location.href = linkURL + "/user/address";

	
		},
		error: function() {
			console.log("Cập Nhật Current");
		}
	});
}

// delete address
function removeAddressByID(button, closet,linkURL) {

	const $btn = $(button);
	const addressID = $btn.data("addressId");
	const row = $btn.closest(closet);
	console.log(addressID);
	$.ajax({
		url: linkURL+"/user/removeAddress",
		type: "POST",
		data: {
			id:addressID
		},
		success: function(res) {
			row.fadeOut(200, function() {
							$(this).remove();
						});
	
		},
		error: function() {
			console.log("Xóa sản phẩm thất bại!");
		}
	});
}

// thêm address
function addAddress(button, closet,linkURL) {

	const $btn = $(button);
	const getFullAddress = document.getElementById("address1").value;
	const getWard = document.getElementById("district").value;
	const getCity = document.getElementById("city").value;
	//const getCountry = document.getElementById("country").value;
	const getPhone = document.getElementById("phone").value;

	$.ajax({
		url: linkURL+"/user/addressUpdate",
		type: "POST",
		data: {
			fulladdress: getFullAddress,
			district: getWard,
			city: getCity,
			//country:getCountry,
			phone: getPhone
		},
		success: function(res) {
			
			const newAddressHtml = `
					                 <div class="location-display position-relative">
					                     <i class="fas fa-map-marker-alt"></i>
					                     <div>
					                    
					                         <p style="color: #666; margin-top: 0.5rem;">
					                             ${getFullAddress}, ${getWard}, ${getCity}, VN.
					                         </p>
					                         <p style="color: #666; margin-top: 0.5rem;">Phone: ${getPhone}</p>
					                     </div>
					                     <div class="position-absolute top-50 end-0 translate-middle-y me-3">
					                         <a href="#" class="text-decoration-none"> <i class="bi bi-check-lg"></i> </a>
					                         <a href="#" class="ms-2"> <i class="bi bi-trash text-danger"></i> </a>
					                     </div>
					                 </div>
					             `;

			$(closet).append(newAddressHtml);

			document.getElementById("address1").value = "";
			document.getElementById("district").value = "";
			document.getElementById("city").value = "";
			document.getElementById("phone").value = "";

		},
		error: function() {
			console.log("Xóa sản phẩm thất bại!");
		}
	});
}



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
			if (res.cartCount == 0) {
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
	try {
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
	}catch (error){
		console.log(error);
	}
	
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




