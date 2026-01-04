/**
 * 
 */

function getPriceShipping(linkurl) {

	const getValueStatus = $("#stausOrders").val();
	const getOrrderID = $("#orderId").val();
	 $.ajax({
		url: linkurl+"/admin/updateStatusOrders",
		type: "POST",
		data: {
			orderID:getOrrderID,
			status:getValueStatus
		},
		success: function() {
			location.reload();
	
		},
		error: function() {
			console.log("Cập Nhật Shipping Fee");
		}
	});
}
