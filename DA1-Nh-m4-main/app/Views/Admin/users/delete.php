<?php include_once VIEW . "Admin/base/header.php" ?>
<link rel="stylesheet" href="Assets/Admin/Css/UpdateUser.css">
<div id="container">
    <div id="main">
        <form method="POST" action="index.php?role=admin&act=DeleteUser&id=<?= $user['id'] ?>" class="login">
            <h3>Xóa người dùng</h3>

            <p><strong>Họ tên:</strong> <?= htmlspecialchars($user['fullname'] ?? '') ?></p>
            <p><strong>Email:</strong> <?= htmlspecialchars($user['email'] ?? '') ?></p>
            <p><strong>Số điện thoại:</strong> <?= htmlspecialchars($user['phone'] ?? '') ?></p>
            <p><strong>Quyền:</strong> <?= htmlspecialchars($user['role'] ?? '') ?></p>
            <p><strong>Trạng thái:</strong> <?= htmlspecialchars($user['status'] ?? '') ?></p>

            <h4 style="color: red; margin: 20px 0; text-align: center;">
                Bạn có chắc chắn muốn xóa tài khoản này?
            </h4>

            <div style="display: flex; gap: 10px;">
                <button type="submit" name="sbm_delete_user" class="btn btn-danger" style="width: 100%;">Xóa</button>
                <button type="button" class="btn btn-secondary" style="width: 100%;" onclick="window.location.href='index.php?API=list_user'">Hủy</button>
            </div>

            <h4 style="color: red; margin-top: 20px; text-align: center;">
                <?= isset($message) ? htmlspecialchars($message) : '' ?>
            </h4>
        </form>
    </div>
</div>
<?php include_once VIEW . "Admin/base/footer.php" ?>
