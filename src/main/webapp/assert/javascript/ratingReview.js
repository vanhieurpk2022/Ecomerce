document.querySelectorAll(".review-modal").forEach(modal => {
    const stars = modal.querySelectorAll(".rating i");
    const ratingValueInput = modal.querySelector(".rating-value");
    const ratingText = modal.querySelector(".rating-text");
    const submitBtn = modal.querySelector(".btn-submit-review");

    // --- 1. Xử lý chọn sao (Chỉ thay đổi giao diện và lưu giá trị vào input ẩn) ---
    stars.forEach(star => {
        star.addEventListener("mouseover", () => highlightStars(stars, star.dataset.value));
        star.addEventListener("mouseout", () => highlightStars(stars, ratingValueInput.value));
        
        star.addEventListener("click", () => {
            ratingValueInput.value = star.dataset.value;
            ratingText.innerText = "Bạn đã chọn " + star.dataset.value + " sao";
            highlightStars(stars, star.dataset.value);
        });
    });

    // --- 2. Xử lý gửi dữ liệu khi bấm nút "Gửi đánh giá" ---
    submitBtn.addEventListener("click", function() {
        const odId = this.getAttribute("data-odid");
        const pId = this.getAttribute("data-pid");
		const url = this.getAttribute("data-url");

        const rating = ratingValueInput.value;
 
      sendReview(odId,pId, rating,url);
    });
});

// Hàm tô màu sao
function highlightStars(stars, value) {
    stars.forEach(star => {
        if (parseInt(star.dataset.value) <= parseInt(value)) {
            star.style.color = "#ffc107"; // Vàng
        } else {
            star.style.color = "#ccc"; // Xám
        }
    });
}

// Hàm gửi AJAX (Nên tách riêng để dễ quản lý)
function sendReview(oid,pid, rating,link) {
    $.ajax({
        url: link+'/user/reviews',
        type: 'POST',
        data: {
            orderDetailID: oid, // Truyền ID của sản phẩm cụ thể
			proid:pid,
            rating: rating
        },
        success: function(response) {
            location.reload(); // Load lại để ẩn nút review
        },
        error: function(xhr) {
            console.log('Lỗi! ' + xhr.status);
        }
    });
}