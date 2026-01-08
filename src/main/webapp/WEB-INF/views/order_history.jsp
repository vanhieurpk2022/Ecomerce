<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="i18n.messages" />
<fmt:message key="rating.product.imageAlt" var="ratingImgAlt" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="orderHistory.pageTitle" /> | <fmt:message key="brand.name" /></title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="apple-touch-icon" sizes="180x180" href="${ctx}/assert/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${ctx}/assert/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${ctx}/assert/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="${ctx}/assert/img/favicon/site.webmanifest">

    <link rel="stylesheet" href="${ctx}/assert/css/style.css">

    <style>
        body { background: #f7f8fd; }
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
        .order-history-desc { color: #7a88a3; margin: 8px 0 20px 2px; font-size: 1.05rem; }

        .oh-tabs { display: flex; gap: 10px; margin-bottom: 24px; flex-wrap: wrap; }
        .oh-tab-btn {
            border: none;
            background: #f2f4fa;
            color: #345;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 12px;
            cursor: pointer;
            transition: .15s;
            display: flex;
            gap: 8px;
            align-items: center;
        }
        .oh-tab-btn:hover { background: #e7ecff; }
        .oh-tab-btn.active { background: #6176c6; color: #fff; box-shadow: 0 6px 16px rgba(97,118,198,.2); }

        .oh-card-list { display: flex; flex-direction: column; gap: 18px; }
        .oh-order-card {
            background: #fbfcff;
            border-radius: 16px;
            padding: 18px 18px;
            border: 1px solid #eef0f7;
            box-shadow: 0 4px 12px rgba(70,90,140,.04);
        }
        .oh-order-header { display: flex; justify-content: space-between; align-items: center; gap: 16px; flex-wrap: wrap; }
        .oh-order-id-date { display: flex; flex-direction: column; gap: 2px; }
        .oh-order-id { font-size: 1.15rem; font-weight: 700; color: #2b3a5a; }
        .oh-order-date { color: #7f8aa8; font-size: .98rem; display: flex; gap: 7px; align-items: center; }

        .oh-status {
            font-size: .96rem;
            font-weight: 700;
            padding: 7px 14px;
            border-radius: 999px;
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }
        .status-delivered { background: #e7fbef; color: #22885a; }
        .status-shipping { background: #e8f3ff; color: #2257a0; }
        .status-pending { background: #fff5df; color: #a06b1c; }

        .oh-products-list { margin-top: 14px; display: flex; flex-direction: column; gap: 12px; }
        .oh-product-row { display: flex; gap: 14px; align-items: center; padding: 10px 0; border-bottom: 1px dashed #edf0f7; }
        .oh-product-row:last-child { border-bottom: none; }
        .oh-product-img { width: 60px; height: 60px; border-radius: 12px; object-fit: cover; background: #f1f2f7; }
        .oh-product-info { flex: 1; display: flex; flex-direction: column; gap: 1px; }
        .oh-product-name { font-weight: 650; color: #2e3d61; font-size: 1.02rem; }
        .oh-product-qty { color: #8592b2; font-size: .94rem; }
        .oh-product-price { font-weight: 700; color: #263c59; font-size: 1.02rem; white-space: nowrap; }

        .oh-order-footer { display: flex; justify-content: space-between; align-items: center; margin-top: 12px; flex-wrap: wrap; gap: 14px; }
        .oh-order-total { font-weight: 700; color: #2b385d; font-size: 1.03rem; }

        .oh-order-actions { display: flex; gap: 10px; flex-wrap: wrap; }
        .oh-btn {
            border: none;
            border-radius: 12px;
            padding: 8px 14px;
            font-weight: 700;
            background: #f2f4fa;
            color: #2b3a5a;
            cursor: pointer;
            transition: .15s;
            display: flex;
            gap: 8px;
            align-items: center;
        }
        .oh-btn:hover { background: #e7ecff; }
        .oh-btn.review { background: #6176c6; color: #fff; }
        .oh-btn.review:hover { filter: brightness(.95); }

        .oh-footer-link { margin-top: 18px; text-align: right; color: #7f8aa8; }
        .oh-footer-link a { color: #6176c6; font-weight: 700; text-decoration: none; }
        .oh-footer-link a:hover { text-decoration: underline; }

        .product-rating-modal-bg {
            position: fixed;
            inset: 0;
            background: rgba(30,33,52,.32);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }
        .product-rating-modal-bg.active { display: flex; }
        .product-rating-modal {
            background: #fff;
            border-radius: 18px;
            max-width: 420px;
            width: 92%;
            padding: 22px 18px 18px 18px;
            position: relative;
            animation: scaleIn .18s cubic-bezier(.31,1.26,.66,.99);
        }
        @keyframes scaleIn { 0%{transform:scale(.87);} 100%{transform:scale(1);} }
        .product-rating-title { font-size: 1rem; font-weight: 700; margin-bottom: 15px; color: #272e47; }
        .product-rating-close { position: absolute; right: 18px; top: 12px; color: #9aa4d9; font-size: 22px; cursor: pointer; transition: color .13s; }
        .product-rating-close:hover { color: #27347a; }
        .product-rating-img img { width: 75px; height: 75px; object-fit: cover; border-radius: 15px; border: 1px solid #ececf2; box-shadow: 0 2px 10px #dde3f4a0; margin-bottom: 10px; }
        .product-rating-name { font-weight: 580; font-size: 0.97rem; color: #263c59; margin-bottom: 16px; }
        .star-rating { display: flex; gap: 10px; justify-content: center; margin-bottom: 3px; margin-top: 3px; }
        .star-label { display: flex; flex-direction: column; align-items: center; cursor: pointer; color: #b3b9c5; font-size: .85rem; font-weight: 500; }
        .star-label input[type="radio"] { display: none; }
        .star-icon { font-size: 1.6em; transition: color 0.18s; }
        .star-label.selected .star-icon,
        .star-label:hover .star-icon { color: #fbb604 !important; }
        .star-label input[type="radio"]:checked ~ .star-icon { color: #fbb604 !important; }
        .product-rating-label { margin-top: 2px; font-size: .8rem; color: #6d7ea6; }
        .rating-submit-btn {
            width: 100%;
            padding: 9px 0;
            border: none;
            border-radius: 12px;
            background: linear-gradient(90deg,#7c87d0 0%,#5b7f6d 100%);
            font-weight: 700;
            color: #fff;
            margin-top: 16px;
            box-shadow: 0 2px 10px rgba(110,132,220,0.10);
        }
        .rating-submit-btn:hover { filter: brightness(.97); }
    </style>
</head>

<body>
<jsp:include page="../includes/header.jsp"></jsp:include>

<div class="order-history-wrapper">
    <div class="order-history-title">
        <i class="bi bi-clipboard2-data" style="color:#6176c6;"></i>
        <fmt:message key="orderHistory.title"/>
    </div>
    <div class="order-history-desc">
        <fmt:message key="orderHistory.desc"/>
    </div>

    <div class="oh-tabs">
        <button class="oh-tab-btn active" id="btn_all" onclick="showTab('all')">
            <i class="fa-solid fa-clipboard-list"></i> <fmt:message key="orderHistory.tab.all"/>
        </button>
        <button class="oh-tab-btn" id="btn_shipping" onclick="showTab('shipping')">
            <i class="fa-solid fa-truck-fast"></i> <fmt:message key="orderHistory.tab.shipping"/>
        </button>
        <button class="oh-tab-btn" id="btn_delivered" onclick="showTab('delivered')">
            <i class="fa-solid fa-box-archive"></i> <fmt:message key="orderHistory.tab.delivered"/>
        </button>
    </div>

    <!-- All Orders -->
    <div id="tab_all" class="oh-card-list">

        <!-- Delivered -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251118</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-24</div>
                </div>
                <span class="oh-status status-delivered">
                    <i class="fa-solid fa-box-archive"></i> <fmt:message key="orderHistory.status.delivered"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn" alt="Winter Navy Jacket">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Winter Navy Jacket</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 1</div>
                    </div>
                    <div class="oh-product-price">₫1,050,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫1,050,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Winter Navy Jacket','https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn')"
                        type="button"><i class="fa-solid fa-star"></i> <fmt:message key="orderHistory.btn.review"/></button>
                </div>
            </div>
        </div>

        <!-- Delivered - Summer Hat -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251121</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-19</div>
                </div>
                <span class="oh-status status-delivered">
                    <i class="fa-solid fa-box-archive"></i> <fmt:message key="orderHistory.status.delivered"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn" alt="Unisex Summer Hat">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Unisex Summer Hat</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 1</div>
                    </div>
                    <div class="oh-product-price">₫85,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫85,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Unisex Summer Hat','https://down-vn.img.susercontent.com/file/5834f902358ab994b65ea95fd43e9924_tn')"
                        type="button"><i class="fa-solid fa-star"></i> <fmt:message key="orderHistory.btn.review"/></button>
                </div>
            </div>
        </div>

        <!-- Pending payment -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251788</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-07</div>
                </div>
                <span class="oh-status status-pending">
                    <i class="fa-solid fa-tag"></i> <fmt:message key="orderHistory.status.awaitingPayment"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/vn-11134211-7qukw-ad7s3v7z4js41c" alt="Cara Basic Sweater">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Cara Basic Sweater</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 1</div>
                    </div>
                    <div class="oh-product-price">₫340,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫340,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled>
                        <i class="fa-solid fa-clock"></i> <fmt:message key="orderHistory.status.awaiting"/>
                    </button>
                </div>
            </div>
        </div>

        <!-- Shipping -->
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251222</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-03</div>
                </div>
                <span class="oh-status status-shipping">
                    <i class="fa-solid fa-truck-fast"></i> <fmt:message key="orderHistory.status.shipping"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/sg-11134004-7rbkh-locis5kgu7th66" alt="Vintage Cara T-shirt">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Vintage Cara T-shirt</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 2</div>
                    </div>
                    <div class="oh-product-price">₫520,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫520,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled>
                        <i class="fa-solid fa-ban"></i> <fmt:message key="orderHistory.status.notDelivered"/>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Shipping Tab -->
    <div id="tab_shipping" class="oh-card-list" style="display:none">
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251222</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-12-03</div>
                </div>
                <span class="oh-status status-shipping">
                    <i class="fa-solid fa-truck-fast"></i> <fmt:message key="orderHistory.status.shipping"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/sg-11134004-7rbkh-locis5kgu7th66" alt="Vintage Cara T-shirt">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Vintage Cara T-shirt</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 2</div>
                    </div>
                    <div class="oh-product-price">₫520,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫520,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn" disabled><i class="fa-solid fa-clock"></i> <fmt:message key="orderHistory.status.awaiting"/></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delivered Tab -->
    <div id="tab_delivered" class="oh-card-list" style="display:none">
        <div class="oh-order-card">
            <div class="oh-order-header">
                <div class="oh-order-id-date">
                    <div class="oh-order-id"><fmt:message key="orderHistory.orderPrefix"/> #20251118</div>
                    <div class="oh-order-date"><i class="fa-regular fa-clock"></i> 2025-11-24</div>
                </div>
                <span class="oh-status status-delivered">
                    <i class="fa-solid fa-box-archive"></i> <fmt:message key="orderHistory.status.delivered"/>
                </span>
            </div>
            <div class="oh-products-list">
                <div class="oh-product-row">
                    <img class="oh-product-img" src="https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn" alt="Winter Navy Jacket">
                    <div class="oh-product-info">
                        <div class="oh-product-name">Winter Navy Jacket</div>
                        <div class="oh-product-qty"><fmt:message key="orderHistory.label.qty"/>: 1</div>
                    </div>
                    <div class="oh-product-price">₫1,050,000</div>
                </div>
            </div>
            <div class="oh-order-footer">
                <div class="oh-order-total"><fmt:message key="orderHistory.label.total"/>: <span style="color:#205bfd">₫1,050,000</span></div>
                <div class="oh-order-actions">
                    <button class="oh-btn review"
                        onclick="openProductRatingModal('Winter Navy Jacket','https://down-vn.img.susercontent.com/file/510be481ad14ae6bec84adc3479a0db1_tn')"
                        type="button"><i class="fa-solid fa-star"></i> <fmt:message key="orderHistory.btn.review"/></button>
                </div>
            </div>
        </div>
    </div>

    <div class="oh-footer-link">
        <fmt:message key="orderHistory.help.needHelp"/> <a href="help.jsp"><fmt:message key="orderHistory.help.contactSupport"/></a>
    </div>
</div>

<!-- POPUP rating -->
<div id="productRatingModalBg" class="product-rating-modal-bg" onclick="modalBgClose(event)">
    <div class="product-rating-modal" onclick="event.stopPropagation()">
        <span class="product-rating-close" onclick="closeProductRatingModal()">&times;</span>
        <div class="product-rating-title"><fmt:message key="rating.product.title"/></div>

        <div class="product-rating-img">
            <img id="popupRatingImg" src="" alt="${ratingImgAlt}">
        </div>

        <div class="product-rating-name" id="popupRatingName"></div>

        <form id="starRatingForm">
            <div class="star-rating" id="starList">
                <label class="star-label">
                    <input type="radio" name="rating" value="1">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label"><fmt:message key="rating.label.1"/></div>
                </label>

                <label class="star-label">
                    <input type="radio" name="rating" value="2">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label"><fmt:message key="rating.label.2"/></div>
                </label>

                <label class="star-label">
                    <input type="radio" name="rating" value="3">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label"><fmt:message key="rating.label.3"/></div>
                </label>

                <label class="star-label">
                    <input type="radio" name="rating" value="4">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label"><fmt:message key="rating.label.4"/></div>
                </label>

                <label class="star-label">
                    <input type="radio" name="rating" value="5">
                    <span class="star-icon"><i class="fa-regular fa-star"></i></span>
                    <div class="product-rating-label"><fmt:message key="rating.label.5"/></div>
                </label>
            </div>

            <button type="submit" class="rating-submit-btn"><fmt:message key="rating.save"/></button>
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
                labels.forEach((l,i)=> l.classList.toggle('selected',i<=idx));
            });
            label.addEventListener('mouseout',()=>{
                let checked = [...labels].findIndex(l=>l.querySelector('input').checked);
                labels.forEach((l,i)=> l.classList.toggle('selected',checked>=0 && i<=checked));
            });
            label.querySelector('input').addEventListener('change',()=>{
                labels.forEach((l,i)=> l.classList.toggle('selected',i<=idx));
            });
        });

        document.getElementById('starRatingForm').onsubmit = function(e){
            alert("<fmt:message key='rating.savedAlert'/>");
            closeProductRatingModal();
            e.preventDefault();
            return false;
        };
    });
</script>

<script src="${ctx}/assert/javascript/script.js"></script>
</body>
</html>
