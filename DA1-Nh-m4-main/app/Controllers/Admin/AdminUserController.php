<?php
class AdminUserController {
    public function index(){
        $users = (new Account)->all();
        $message = session_flash('message');
        return view('Admin.users.list', compact('users', 'message'));
    }

    public function UpdateForm(){
        $id = $_GET['id'] ?? "";    
        $user = (new Account)->find($id);
        $message = session_flash('message');
        return view('Admin.users.update', compact('user', 'message'));
    }

    public function update($id) {
        if (isset($_POST['sbm_update_user'])) {
            $data = $_POST;

            if (empty($data['fullname']) || empty($data['email']) || empty($data['phone']) || empty($data['role'])) {
                $_SESSION['message'] = "Vui lòng điền đầy đủ thông tin";
                header("Location: index.php?role=admin&act=UpdateUserForm&id=" . $id);
                exit;
            }

            $data['fullname'] = htmlspecialchars($data['fullname']);
            $data['email']    = htmlspecialchars($data['email']);
            $data['phone']    = htmlspecialchars($data['phone']);
            $data['role']     = htmlspecialchars($data['role']);
            $data['status']   = htmlspecialchars($data['status']);

            if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                $_SESSION['message'] = "Địa chỉ email không hợp lệ.";
                header("Location: index.php?role=admin&act=UpdateUserForm&id=" . $id);
                exit;
            }

            if (empty($data['password'])) {
                unset($data['password']);
            } else {
                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            }

            $result = (new Account)->update($id, $data);

            if ($result) {
                $_SESSION['message'] = "Cập nhật thông tin người dùng thành công.";
                header("Location: index.php?role=admin&act=User");
                exit;
            } else {
                $_SESSION['message'] = "Có lỗi xảy ra trong quá trình cập nhật.";
            }

            header("Location: index.php?role=admin&act=UpdateUserForm&id=" . $id);
            exit;
        } else {
            header("Location: index.php?role=admin&act=UpdateUserForm&id=" . $id);
            exit;
        }
    }     

    // =========================
    // THÊM CHỨC NĂNG XOÁ USER
    // =========================
    public function delete($id) {
        if (!empty($id)) {
            $result = (new Account)->delete($id); // Gọi hàm xóa trong Model Account
            if ($result) {
                $_SESSION['message'] = "Xóa tài khoản thành công.";
            } else {
                $_SESSION['message'] = "Không thể xóa tài khoản, vui lòng thử lại.";
            }
        } else {
            $_SESSION['message'] = "ID người dùng không hợp lệ.";
        }
        header("Location: index.php?role=admin&act=User");
        exit;
    }
}
