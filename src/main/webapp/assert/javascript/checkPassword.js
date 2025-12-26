/**
 * kiểm tra và nhận code ở signup
 */
function sendData() {

         const email = document.getElementById("email_signup").value;
		 
		if(email === null || email.trim() === ""){
			return;
		}
		 const contextPath = window.location.pathname.split("/")[1];

         // Gửi POST request đến servlet
         fetch(`/${contextPath}/verifyCode`, {
             method: "POST",
             headers: {
                 "Content-Type": "application/x-www-form-urlencoded"
             },
             body: `email=${encodeURIComponent(email)}`
         })
         .then(response => response.text())
         .then(data => {
             console.log("Response from servlet:", data);
             
         })
         .catch(error => console.error("Error:", error));
     }
function timeCodeVerify() {
    try {
        const btn = document.getElementById("btn_verify");

        // Kiểm tra xem nút có tồn tại không
        if (!btn) {
            throw new Error("Không tìm thấy nút #btn_verify trên trang!");
        }

        btn.addEventListener("click", function () {
            btn.style.fontSize = "12px";

            let timeLeft = 60;

            btn.disabled = true;
            btn.textContent = `Wait (${timeLeft})`;

            const timer = setInterval(() => {
                try {
                    timeLeft--;
                    btn.textContent = `Wait (${timeLeft})`;

                    if (timeLeft <= 0) {
                        clearInterval(timer);
                        btn.disabled = false;
                        btn.textContent = "Send";
                    }
                } catch (err) {
                    // Nếu lỗi xảy ra trong interval, log ra nhưng không crash toàn trang
                    console.error("Lỗi trong setInterval:", err);
                    clearInterval(timer);
                }
            }, 1000);
        });
    } catch (e) {
        console.error("Có lỗi trong timeCodeVerify:", e);
    }
}

// check pass realtime
function checkPasswordRealtime(pwdId, confirmId, msgId, btnId) {
    try {
        const password = document.getElementById(pwdId);
        const confirmPassword = document.getElementById(confirmId);
        const msg = document.getElementById(msgId);
        const btn = document.getElementById(btnId);

        // Nếu không tồn tại element nào => thoát
        if (!password || !confirmPassword || !msg || !btn) return;

        const validate = () => {
            const pwd = password.value.trim();
            const confirm = confirmPassword.value.trim();

            if (!pwd && !confirm) {
                msg.textContent = "";
                btn.disabled = true;
                return;
            }

            if (pwd.length < 6) {
                msg.style.color = "red";
                msg.textContent = "❌ Password must be at least 6 characters";
                btn.disabled = true;
                return;
            }

            if (pwd === confirm) {
                msg.style.color = "green";
                msg.textContent = "✅ Passwords match!";
                btn.disabled = false;
            } else {
                msg.style.color = "red";
                msg.textContent = "❌ Passwords do not match";
                btn.disabled = true;
            }
        };

        // Gắn sự kiện realtime
        password.addEventListener("input", validate);
        confirmPassword.addEventListener("input", validate);
    } catch (error) {
        console.error("Error in checkPasswordRealtime:", error);
    }
}


 

timeCodeVerify();
