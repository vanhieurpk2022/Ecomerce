<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History | Cara Clothes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	          
	      <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assert/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assert/img/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/assert/img/favicon/site.webmanifest">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/style.css">
    <style>
        body { background: #f4f5fa; }
        .order-history-wrapper {
            max-width: 980px;
            margin: 34px auto 22px auto;
            padding: 32px 16px 32px 16px;
            border-radius: 16px;
            background: #fff;
            box-shadow: 0 10px 24px rgba(140,150,216,.09), 0 2.5px 8px rgba(90,110,220,.04);
        }
        .order-history-title {
            font-size: 2rem;
            font-weight: 700;
            color: #324076;
            margin-bottom: 1px;
            display: flex;
            gap: 12px;
            align-items: center;
        }
        .order-history-desc {
            color: #7a88a3;
            margin: 8px 0 20px 2px;
            font-size: 1.01rem;
        }
        .oh-tabs { 
            display: flex; gap: 10px; 
            margin-bottom: 28px; 
            border-bottom: 2px solid #e5e9f2; 
            padding-left: 2px;
        }
        .oh-tab-btn { 
            padding: 10px 16px 10px 16px; 
            cursor: pointer; background: none; border: none; outline: none;
            color: #859bcb; font-size: 0.96rem; font-weight: 700; position: relative;
            border-radius: 12px 12px 0 0; transition: all 0.16s;
        }
        .oh-tab-btn.active { color: #445ad1; background: #f4f7ff; box-shadow: 0 -2.5px 0 #445ad1 inset;}
        .oh-card-list { display: flex; flex-direction: column; gap: 22px; }
        .oh-order-card {
            background: linear-gradient(93deg,#fafdff 95%,#e8f2ff 100%);
            border-radius: 10px; box-shadow: 0 2px 12px rgba(138,146,216,.07);
            padding: 18px 12px 12px 12px; border-left: 5px solid #a7bbea; position: relative;
        }
        .oh-order-header { 
            display: flex; 
            flex-direction: row; 
            justify-content: space-between; 
            align-items: flex-start; 
            border-bottom: 1px solid #e8eaf3; 
            padding-bottom: 8px; margin-bottom: 7px; 
        }
        .oh-order-id-date { display: flex; flex-direction: column; gap: 2.5px; align-items: flex-start; }
        .oh-order-id { font-size: 1.01rem; font-weight: 650; color: #295afd; }
        .oh-order-date { color: #8fa3b9; font-size: 0.92rem; font-weight: 500; }
        .oh-status { 
            font-size: 0.92rem; font-weight: 650; padding: 5px 15px; 
            border-radius: 18px; min-width: 80px;
            display: flex; align-items: center; gap:4px;
        }
        .status-delivered { background: #e6f9f3; color: #2dc57f; }
        .status-shipping { background: #fff9e7; color: #e3a130; }
        .status-pending { background: #e2eaf5; color: #4a84ed;}
        .oh-products-list { display: flex; flex-direction: column; gap: 9px;}
        .oh-product-row { display: flex; gap: 11px; align-items: center; }
        .oh-product-img { width: 41px; height:41px; border-radius: 7px; object-fit: cover; border: 1px solid #e6e9f2;}
        .oh-product-info { flex: 1; }
        .oh-product-name { font-weight: 650; color: #2a2b3d; font-size: 0.96rem; margin-bottom: 2px; }
        .oh-product-qty { color: #6c7ba0; font-size: .9rem; }
        .oh-product-price { font-size: 0.99rem; font-weight: 620; color: #484fef; margin-left: 12px; }
        .oh-order-footer { margin-top: 12px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; }
        .oh-order-total { font-size: 1.04rem; font-weight: 650; color: #2c3857; letter-spacing: .2px; }
        .oh-order-actions { display: flex; gap: 6px; }
        .oh-btn { padding: 6px 14px; border-radius: 8px; border: none; color: #fff; font-weight: 650; font-size: .94rem; cursor: pointer;
            background: linear-gradient(95deg,#5565d0 0%,#80b7a4 100%); box-shadow: 0 2px 8px rgba(110,132,220,0.07); transition: background .14s, box-shadow .14s;}
        .oh-btn.review { background: linear-gradient(92deg,#f7af4c 0%,#e07268 100%);}
        .oh-btn:active { box-shadow: none; }
        .oh-btn[disabled] { background: #eee !important; color: #aaa !important; cursor: not-allowed; }
        .oh-footer-link { text-align:center; font-size:1em; opacity:.71; margin-top:25px;}
        .oh-footer-link a { color:#677eea; text-decoration: underline; font-weight: 500; }
        /* Popup rating for mobile and larger devices */
        .product-rating-modal-bg { display: none; position: fixed; z-index: 5000; left: 0; top: 0; right: 0; bottom: 0; background: rgba(50,50,60,0.19); align-items: center; justify-content: center; }
        .product-rating-modal-bg.active { display: flex; }
        .product-rating-modal {
            background: #fff; border-radius: 13px; box-shadow: 0 8px 32px rgba(130,145,210,0.16);
            padding: 18px 7vw 16px 7vw; max-width: 410px; width: 95vw; box-sizing: border-box;
            text-align: center; position: relative; animation: scaleIn .18s cubic-bezier(.31,1.26,.66,.99);}
        @keyframes scaleIn { 0%{transform:scale(.87);} 100%{transform:scale(1);} }
        .product-rating-title { font-size: 1rem; font-weight: 700; margin-bottom: 15px; color: #272e47;}
        .product-rating-close { position: absolute; right: 18px; top: 16px; color: #a9add9; font-size: 22px; cursor: pointer; transition: color .13s;}
        .product-rating-close:hover { color: #27347a; }
        .product-rating-img img { width: 75px; height: 75px; object-fit: cover; border-radius: 8px; border: 1.5px solid #ececf2; box-shadow: 0 2px 10px #dde3f4a0; margin-bottom: 10px;}
        .product-rating-name { font-weight: 580; font-size: 0.97rem; color: #263c59; margin-bottom: 16px;}
        .star-rating { display: flex; gap: 10px; justify-content: center; margin-bottom: 3px; margin-top: 3px;}
        .star-label { display: flex; flex-direction: column; align-items: center; cursor: pointer; color: #b3b9c5; font-size: .85rem; font-weight: 500;}
        .star-label input[type="radio"] { display: none; }
        .star-icon { font-size: 1.6em; transition: color 0.18s;}
        .star-label.selected .star-icon,
        .star-label:hover .star-icon { color: #fbb604 !important; }
        .star-label input[type="radio"]:checked ~ .star-icon { color: #fbb604 !important;}
        .product-rating-label { font-size: 0.78em; margin-top: 4px;}
        .rating-submit-btn {
            margin-top: 10px; padding: 5px 18px; border: none; border-radius: 7px;
            background: linear-gradient(99deg,#4b57df 0%,#43c1a1 100%); color: #fff; font-weight:650;
            font-size: 0.92em; cursor:pointer;
        }
        @media (max-width:540px){
            .order-history-wrapper{padding:8px 2vw;}
            .order-history-title{font-size:1.07rem;gap:6px;}
            .oh-order-card {padding:9px 3vw;}
            .oh-tabs{gap:2px;}
            .oh-product-row{gap:7px;}
            .oh-order-id{font-size:.93rem;}
            .oh-order-date{font-size:.85rem;}
            .oh-status{font-size:.85rem;min-width:65px;}
            .oh-product-img{width:28px;height:28px;}
            .oh-product-name{font-size:.87rem;}
            .oh-order-total{font-size:.94rem;}
            .oh-btn{font-size:.85rem;}
            .product-rating-modal{padding:9px 2vw;}
            .product-rating-name{font-size:.87rem;}
            .star-label .star-icon{font-size:1.25em;}
            .product-rating-title{font-size:.89rem;}
        }
    </style>
</head>
<body>
<jsp:include page="../includes/header.jsp"></jsp:include>
<div class="order-history-wrapper">
    <div class="order-history-title"><i class="bi bi-clipboard2-data" style="color:#6176c6;"></i> Order History</div>
    <div class="order-history-desc">Track your purchases—shipping, delivery and rate products.</div>
    <div class="oh-tabs">
        <button class="oh-tab-btn active" id="btn_all" onclick="showTab('all')"><i class="fa-solid fa-clipboard-list"></i> All</button>
        <button class="oh-tab-btn" id="btn_shipping" onclick="showTab('shipping')"><i class="fa-solid fa-truck-fast"></i> Shipping</button>
        <button class="oh-tab-btn" id="btn_delivered" onclick="showTab('delivered')"><i class="fa-solid fa-box-archive"></i> Delivered</button>
    </div>
    <!-- All Orders -->
    <div id="tab_all" class="oh-card-list">
        <!-- Đã giao -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251118</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-24</div>
                </div>
                <span class="oh-status status-delivered"><i class="fa-solid fa-box-archive"></i> Delivered</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn" alt="Winter Navy Jacket">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Winter Navy Jacket</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫1,050,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫1,050,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Winter Navy Jacket','https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn')"
                        type="button"><i class="fa-solid fa-star"></i> Review</button>
                </div>
            </div>
        </div>
        <!-- Thêm nhiều ví dụ sản phẩm các trạng thái khác phía dưới (Summer Hat, T-shirt, Sweater, Socks) như cũ -->
        <!-- Đã giao - Summer Hat -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251121</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-19</div>
                </div>
                <span class="oh-status status-delivered"><i class="fa-solid fa-box-archive"></i> Delivered</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn" alt="Unisex Summer Hat">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Unisex Summer Hat</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫85,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫85,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Unisex Summer Hat','https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn')"
                        type="button"><i class="fa-solid fa-star"></i> Review</button>
                </div>
            </div>
        </div>
        <!-- Đang giao -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251222</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-03</div>
                </div>
                <span class="oh-status status-shipping"><i class="fa-solid fa-truck-fast"></i> Shipping</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/sg-11134004-7rbkh-locis5kgu7th66" alt="Vintage Cara T-shirt">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Vintage Cara T-shirt</div>
                        <div class="oh-product-qty">Qty: 2</div>
                    </div>
                    <div class="oh-product-price">₫390,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫780,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-clock"></i> Awaiting</button>
                </div>
            </div>
        </div>
        <!-- Đang giao - Sweater -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20252000</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-08</div>
                </div>
                <span class="oh-status status-shipping"><i class="fa-solid fa-truck-fast"></i> Shipping</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/vn-11134211-7qukw-ad7s3v7z4js41c" alt="Cara Basic Sweater">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Cara Basic Sweater</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫340,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫340,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-clock"></i> Awaiting</button>
                </div>
            </div>
        </div>
        <!-- Chưa giao (pending) -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251788</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-07</div>
                </div>
                <span class="oh-status status-pending"><i class="fa-solid fa-tag"></i> Awaiting Payment</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/sg-11134201-7qvef-lp77lzyft53e8d" alt="Cara Logo Socks">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Cara Logo Socks</div>
                        <div class="oh-product-qty">Qty: 4</div>
                    </div>
                    <div class="oh-product-price">₫45,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫180,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-ban"></i> Not Delivered</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Shipping Tab -->
    <div id="tab_shipping" class="oh-card-list" style="display:none">
        <!-- Các sản phẩm đang giao -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251222</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-03</div>
                </div>
                <span class="oh-status status-shipping"><i class="fa-solid fa-truck-fast"></i> Shipping</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/sg-11134004-7rbkh-locis5kgu7th66" alt="Vintage Cara T-shirt">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Vintage Cara T-shirt</div>
                        <div class="oh-product-qty">Qty: 2</div>
                    </div>
                    <div class="oh-product-price">₫390,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫780,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-clock"></i> Awaiting</button>
                </div>
            </div>
        </div>
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20252000</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-08</div>
                </div>
                <span class="oh-status status-shipping"><i class="fa-solid fa-truck-fast"></i> Shipping</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/vn-11134211-7qukw-ad7s3v7z4js41c" alt="Cara Basic Sweater">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Cara Basic Sweater</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫340,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫340,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-clock"></i> Awaiting</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Delivered Tab -->
    <div id="tab_delivered" class="oh-card-list" style="display:none">
        <!-- Các sản phẩm đã giao -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251118</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-24</div>
                </div>
                <span class="oh-status status-delivered"><i class="fa-solid fa-box-archive"></i> Delivered</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn" alt="Winter Navy Jacket">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Winter Navy Jacket</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫1,050,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫1,050,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Winter Navy Jacket','https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn')"
                        type="button"><i class="fa-solid fa-star"></i> Review</button>
                </div>
            </div>
        </div>
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id">Order #20251121</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-19</div>
                </div>
                <span class="oh-status status-delivered"><i class="fa-solid fa-box-archive"></i> Delivered</span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn" alt="Unisex Summer Hat">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Unisex Summer Hat</div>
                        <div class="oh-product-qty">Qty: 1</div>
                    </div>
                    <div class="oh-product-price">₫85,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total">Total: <span style="color:#205bfd">₫85,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Unisex Summer Hat','https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn')"
                        type="button"><i class="fa-solid fa-star"></i> Review</button>
                </div>
            </div>
        </div>
    </div>
    <div class="oh-footer-link">Need help? <a href="help.jsp">Contact Support</a></div>
</div>

<!-- POPUP rating sản phẩm -->
<div id="productRatingModalBg" class="product-rating-modal-bg" onclick="modalBgClose(event)">
    <div class="product-rating-modal" onclick="event.stopPropagation()">
        <span class="product-rating-close" onclick="closeProductRatingModal()">&times;</span>
        <div class="product-rating-title">Đánh giá sản phẩm</div>
        <div class="product-rating-img">
            <img id="popupRatingImg" src="" alt="Ảnh sản phẩm">
        </div>
        <div class="product-rating-name" id="popupRatingName"></div>
        <form id="starRatingForm">
            <div class="star-rating" id="starList">
                <label class="star-label">
                    <input type="radio" name="rating" value="1">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label">Rất tệ</div>
                </label>
                <label class="star-label">
                    <input type="radio" name="rating" value="2">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label">Tệ</div>
                </label>
                <label class="star-label">
                    <input type="radio" name="rating" value="3">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label">Tạm ổn</div>
                </label>
                <label class="star-label">
                    <input type="radio" name="rating" value="4">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label">Tốt</div>
                </label>
                <label class="star-label">
                    <input type="radio" name="rating" value="5">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label">Rất tốt</div>
                </label>
            </div>
            <button type="submit" class="rating-submit-btn">Lưu đánh giá</button>
        </form>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
<script>
    function showTab(tab) {
        document.querySelectorAll('.oh-tab-btn').forEach(btn => btn.classList.remove('active'));
        document.querySelectorAll('.oh-card-list').forEach(list => list.style.display='none');
        document.getElementById('tab_'+tab).style.display='flex';
        document.getElementById('btn_'+tab).classList.add('active');
    }
    function openProductRatingModal(name,img) {
        document.getElementById('popupRatingName').innerText = name;
        document.getElementById('popupRatingImg').src = img;
        document.getElementById('productRatingModalBg').classList.add('active');
        document.querySelectorAll('#starList input[type="radio"]').forEach(input=>input.checked=false);
        document.querySelectorAll('#starList .star-label').forEach(label=>label.classList.remove('selected'));
    }
    function closeProductRatingModal() {
        document.getElementById('productRatingModalBg').classList.remove('active');
    }
    function modalBgClose(e) {
        if(e.target.id==='productRatingModalBg') closeProductRatingModal();
    }
    document.addEventListener('DOMContentLoaded',function(){
        let labels = document.querySelectorAll('#starList .star-label');
        labels.forEach((label,idx)=>{
            label.addEventListener('mouseover',()=>{
                labels.forEach((l,i)=>{
                    l.classList.toggle('selected',i<=idx);
                });
            });
            label.addEventListener('mouseout',()=>{
                let checked = -1;
                labels.forEach((l,i)=>{if(l.querySelector('input').checked) checked=i;});
                labels.forEach((l,i)=>{
                    l.classList.toggle('selected',i<=checked);
                });
            });
            label.querySelector('input').addEventListener('click',()=>{
                labels.forEach((l,i)=>{
                    l.classList.toggle('selected',i<=idx);
                });
            });
        });
        document.getElementById('starRatingForm').onsubmit = function(e){
            let rate = document.querySelector('#starList input[type="radio"]:checked');
            if(!rate){
                alert("Vui lòng chọn số sao để đánh giá!");
                e.preventDefault();
                return false;
            }
            alert("Đánh giá của bạn đã được lưu (Demo, chưa kết nối backend)!");
            closeProductRatingModal();
            e.preventDefault();
            return false;
        };
    });
</script>

       <script src="${pageContext.request.contextPath}/assert/javascript/script.js"></script>

</body>
</html>