<?php include_once VIEW . "Client/base/header.php" ?>
<link rel="stylesheet" href="Assets/Client/Css/cart.css">
<div class="container">
    <div class="product-list">
        <h2>Sản phẩm trong giỏ hàng</h2>
        <form action="index.php?act=Cart" method="post">
            <?php foreach($carts as $key => $cart) : ?>
            <div class="product">
                <input type="hidden" name="" id="">
                <img src="<?= $cart['image'] ?>" alt="Sản phẩm 1">
                <div class="product-info">
                    <h3><?= $cart['name'] ?></h3>
                    <p>Giá: <?= number_format($cart['price']) ?> VNĐ</p>
                    Số lượng: <input type="number" style="all: unset;width: 50px;" value="<?= $cart['quantity'] ?>" name="quantities[<?= $key ?>]">
                    <br>
                    thành tiền: <input type="text" style="all: unset;width: 640px;" value="<?= number_format($cart['price'] * $cart['quantity']) ?> VNĐ" name="" id="">
                    <a href="index.php?act=DeleteInCart&id=<?= $key ?>"><button type="button" class="remove-btn">Xóa</button></a>
                </div>
            </div>
            <?php endforeach; ?>
    </div>
    <div class="cart-details">
        <h2>Thông tin giỏ hàng</h2>
        <br>
        <div class="cart-summary">
            <div class="upper-section">
                <ul>
                <?php 
                $count = 1;
                foreach($carts as $cart) : ?>
                    <li><?= $cart['name'] ?>: <?= number_format($cart['price'] * $cart['quantity']) ?> ₫</li>
                <?php endforeach; ?>
                </ul>
                <br><br><br>
                <p>Tổng sản phẩm: <?= count($carts) ?></p>
                <p class="total-price">Tổng tiền: <?= number_format($sumPrice, 0, ',', '.') ?> VNĐ</p>
                <button type="submit" formaction="index.php?act=CheckOutForm" class="checkout-btn">Thanh toán</button>
                <button type="submit" formaction="index.php?act=UpdateCart" class="update-btn">Cập nhật</button>
            </div>
            <div class="lower-section">
        
            </div>
        </div>
    </div>
        </form>
</div>
<?php include_once VIEW . "Client/base/foot.php" ?>
