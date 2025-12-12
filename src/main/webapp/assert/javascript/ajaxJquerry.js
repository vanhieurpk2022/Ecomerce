/**
 * 
 */
function sendDataCart(variantId, quanity) {

	$.ajax({
		url: 'cart?action=AddProduct',
		type: 'POST',
		data: {
			variantID: variantId,
			quanity: quanity,
		},
		success: function(cartSize) {
			var cleanCartSize = cartSize.toString().trim();
		
			// Cập nhật số
			    $("#cart_count_mobile").text(cleanCartSize);
			    $("#cart_count").text(cleanCartSize);

			    // ===== ẨN / HIỆN BADGE =====
			    if (cleanCartSize > 0) {
			        $("#cart_count_mobile").show();
			        $("#cart_count").show();
			    } else {
			        $("#cart_count_mobile").hide();
			        $("#cart_count").hide();
			    }
		
			
		},
		error: function(xhr, status, error) {
			alert('Lỗi! ' + xhr.status + " - " + xhr.responseText);
		}
	});
}

function changeQuanity(productsId, element) {
	const getValue = element.value;

	$.ajax({
		url: 'cart?action=OnchangeQuanity',
		type: 'POST',
		data: {
			id: productsId,
			quanity: getValue
		},
		success: function() { // cartSize là giá trị trả về từ Servlet
			console.log("Success AJAX");

			location.reload();
		},
		error: function(xhr, status, error) {
			alert('Lỗi! ' + xhr.status + " - " + xhr.responseText);
		}
	});
}


// 1. Hàm hiển thị giá tiền (Đã sửa để không cần tham số đầu vào)
function updatePriceDisplay() {
	const select = document.getElementById("selectTagSize");
	const displayPrice = document.getElementById("displayPrice");

	// Lấy option đang chọn
	const selectedOption = select.options[select.selectedIndex];

	if (selectedOption) {
		// Lấy giá đã tính sẵn từ data-final-price
		// Nếu không có giá (VD: variants rỗng), mặc định lấy 0
		const price = parseFloat(selectedOption.dataset.finalPrice) || 0;

		// Format sang tiền Việt: 120000 -> 120.000 VNĐ
		displayPrice.innerText = price.toLocaleString('vi-VN') + " VNĐ";
	}
}

// 2. Hàm cập nhật số lượng tồn kho
function updateStockDisplay() {
	const select = document.getElementById("selectTagSize");
	const remainSpan = document.getElementById("remainSpan");
	const selectedOption = select.options[select.selectedIndex];

	if (selectedOption) {
		remainSpan.textContent = selectedOption.dataset.stock;
	}
}

// 3. Hàm thêm vào giỏ hàng (Giữ nguyên logic của bạn)
function addToCart() {
	const select = document.getElementById("selectTagSize");
	const qtyInput = document.getElementById("quanity");
	const selectedOption = select.options[select.selectedIndex];

	const variantID = selectedOption.dataset.variantid;
	const stock = parseInt(selectedOption.dataset.stock);
	const quantity = parseInt(qtyInput.value);

	if (!variantID) {
		alert("Vui lòng chọn kích thước sản phẩm!");
		return;
	}
	if (quantity <= 0) {
		alert("Số lượng phải lớn hơn 0");
		return;
	}
	if (quantity > stock) {
		alert("Xin lỗi, trong kho chỉ còn " + stock + " sản phẩm cho size này.");
		return;
	}

	// Gọi hàm AJAX gửi đi
	sendDataCart(variantID, quantity);
}

// --- MAIN: Kích hoạt mọi thứ khi trang load ---
document.addEventListener("DOMContentLoaded", function() {
	const select = document.getElementById("selectTagSize");

	// Gán sự kiện change: Khi đổi size -> Cập nhật Tồn kho VÀ Cập nhật Giá
	select.addEventListener("change", function() {
		updateStockDisplay();
		updatePriceDisplay();
	});

	// Chạy 1 lần ngay khi vào trang để hiển thị thông tin của Size đầu tiên
	updateStockDisplay();
	updatePriceDisplay();
});