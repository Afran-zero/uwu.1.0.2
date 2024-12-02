<?php

require_once 'functions.php';
require_once 'send_code.php';


if(isset($_GET['test'])){
 
}

if(isset($_GET['block'])){
    $user_id = $_GET['block'];
    $user = $_GET['username']; 
      if(blockUser($user_id)){
          header("location:../../?u=$user");
      }else{
          echo "something went wrong";
      }
  
    
  }
  if (isset($_GET['deletepost'])) {
    $post_id = intval($_GET['deletepost']); // Sanitize input
    if (deletePost($post_id)) {
        $_SESSION['success'] = "Post deleted successfully.";
    } else {
        $_SESSION['error'] = "Failed to delete post.";
    }
    header("Location: {$_SERVER['HTTP_REFERER']}");
    exit;
}








// For managing signup
if(isset($_GET['signup'])){
    $response=validateSignupForm($_POST);
    if($response['status']){
        if(createUser($_POST)){
        header('location:../../?login&newuser');
        }else{
            echo "<script>alert('somethihng is wrong')</script>";
        }
       
    
    }else{
        $_SESSION['error']=$response;
        $_SESSION['formdata']=$_POST;
        header("location:../../?signup");
    }
        
    }
    
//for managing login
if(isset($_GET['login'])){

  
    $response=validateLoginForm($_POST);
  
    if($response['status']){
     $_SESSION['Auth'] = true;
     $_SESSION['userdata'] = $response['user'];

     if($response['user']['ac_status']==0){
     $_SESSION['code']=$code = rand(111111,999999);
     sendCode($response['user']['email'],'Verify Your Email',$code);
     }

     header("location:../../");

    }else{
        $_SESSION['error']=$response;
        $_SESSION['formdata']=$_POST;
        header("location:../../?login");
    }
        
    }


    if(isset($_GET['resend_code'])){
       
            $_SESSION['code']=$code = rand(111111,999999);
            sendCode($_SESSION['userdata']['email'],'Verify Your Email',$code);
            header('location:../../?resended');
    }

    if(isset($_GET['verify_email'])){
       $user_code = $_POST['code'];
       $code = $_SESSION['code'];
       if($code==$user_code){
       if(verifyEmail($_SESSION['userdata']['email'])){
        header('location:../../');
       }else{
           echo "something is wrong";
       }

       }else{
           $response['msg']='incorrect verifictaion code !';
           if(!$_POST['code']){
            $response['msg']='enter 6 digit code !';

           }
           $response['field']='email_verify';
        $_SESSION['error']=$response;
        header('location:../../');

       }
       
}


if(isset($_GET['forgotpassword'])){
    if(!$_POST['email']){
        $response['msg']="enter your email id !";
        $response['field']='email';
        $_SESSION['error']=$response;
        header('location:../../?forgotpassword');

    }elseif(!isEmailRegistered($_POST['email'])){
        $response['msg']="email id is not registered";
        $response['field']='email';
        $_SESSION['error']=$response;
        header('location:../../?forgotpassword');

    }else{
          $_SESSION['forgot_email']=$_POST['email'];
           $_SESSION['forgot_code']=$code = rand(111111,999999);
            sendCode($_POST['email'],'Forgot Your Password ?',$code);
            header('location:../../?forgotpassword&resended');
    }


}

//for logout the user
if(isset($_GET['logout'])){
    session_destroy();
    header('location:../../');

}
// for verify forgot code
if(isset($_GET['verifycode'])){
    $user_code = $_POST['code'];
    $code = $_SESSION['forgot_code'];
    if($code==$user_code){
    $_SESSION['auth_temp']=true;
     header('location:../../?forgotpassword');
    }else{
        $response['msg']='incorrect verifictaion code !';
        if(!$_POST['code']){
         $response['msg']='enter 6 digit code !';

        }
        $response['field']='email_verify';
     $_SESSION['error']=$response;
     header('location:../../?forgotpassword');

    }
    
}

if(isset($_GET['changepassword'])){
    if(!$_POST['password']){
        $response['msg']="enter your new password";
        $response['field']='password';
        $_SESSION['error']=$response;
        header('location:../../?forgotpassword');
    }else{
        resetPassword($_SESSION['forgot_email'],$_POST['password']);
        session_destroy();
        header('location:../../?reseted');
    }


}


if(isset($_GET['updateprofile'])){

    $response=validateUpdateForm($_POST,$_FILES['profile_pic']);

    if($response['status']){
       
        if(updateProfile($_POST,$_FILES['profile_pic'])){
            header("location:../../?editprofile&success");

        }else{
            echo "something is wrong";
        }
       
    
    }else{
        $_SESSION['error']=$response;
        header("location:../../?editprofile");
    }
     
}


//for managing add post
if(isset($_GET['addpost'])){
    $response = validatePostImage($_FILES['post_img']);
 
    if($response['status']){
 if(createPost($_POST,$_FILES['post_img'])){
     header("location:../../?new_post_added");
 }else{
     echo "something went wrong";
 }
    }else{
     $_SESSION['error']=$response;
     header("location:../../");
    }
 }
  // manage login admin

  if (isset($_GET['admin_login'])) {
      $username = mysqli_real_escape_string($db, $_POST['username']);
      $password = md5($_POST['password']); // Hash password with MD5 (ensure it matches how it's stored in the DB)
  
      // Query to validate admin credentials
      $query = "SELECT * FROM admins WHERE email='$username' OR full_name='$username' AND password='$password'";
      $result = mysqli_query($db, $query);
      $admin = mysqli_fetch_assoc($result);
  
      if ($admin) {
          // Admin login successful
          $_SESSION['AdminAuth'] = true;
          $_SESSION['AdminData'] = [
              'id' => $admin['id'],
              'full_name' => $admin['full_name'],
              'email' => $admin['email']
          ];
          // Redirect to the admin dashboard
          header('Location: ../pages/admin_dashboard.php');
          exit;
      } else {
          // Admin login failed
          $_SESSION['error'] = ['field' => 'admin_login', 'msg' => 'Invalid admin credentials.'];
          header('Location: ../../?admin_login');
          exit;
      }
  }
  
 // Handle toggling user status (block/unblock)
if (isset($_GET['toggle_user_status'])) {
    $user_id = intval($_GET['toggle_user_status']);
    // Fetch the current status of the user
    $query = "SELECT ac_status FROM users WHERE id = $user_id";
    $result = mysqli_query($db, $query);
    $user = mysqli_fetch_assoc($result);

    if ($user) {
        if ($user['ac_status'] == 0) {
            // Do not allow toggling for "not verified" users
            $_SESSION['error'] = "Cannot toggle status for not verified users.";
        } else {
            // Toggle the status
            $new_status = $user['ac_status'] == 1 ? 2 : 1; // Block or Unblock
            $update_query = "UPDATE users SET ac_status = $new_status WHERE id = $user_id";
            if (mysqli_query($db, $update_query)) {
                $_SESSION['success'] = "User status updated successfully.";
            } else {
                $_SESSION['error'] = "Failed to update user status.";
            }
        }
    } else {
        $_SESSION['error'] = "User not found.";
    }

    // Redirect back to the admin dashboard
    header('Location: ../pages/admin_dashboard.php');
    exit;
}















  
  // Handle admin profile update
  if (isset($_GET['edit_admin'])) {
      $admin_id = $_SESSION['AdminData']['id'];
      $full_name = mysqli_real_escape_string($db, $_POST['full_name']);
      $email = mysqli_real_escape_string($db, $_POST['email']);
      $password = !empty($_POST['password']) ? md5($_POST['password']) : null;
  
      // Update admin information
      $query = "UPDATE admins SET full_name='$full_name', email='$email'";
      if ($password) {
          $query .= ", password='$password'";
      }
      $query .= " WHERE id=$admin_id";
  
      if (mysqli_query($db, $query)) {
          $_SESSION['success'] = "Admin profile updated successfully.";
          $_SESSION['AdminData']['full_name'] = $full_name;
          $_SESSION['AdminData']['email'] = $email;
      } else {
          $_SESSION['error'] = "Failed to update admin profile.";
      }
      // Redirect to the admin dashboard
      header('Location: ../pages/admin_dashboard.php');
      exit;
  }








  if (isset($_GET['reportpost'])) {
    $post_id = intval($_GET['reportpost']);
    if (reportPost($post_id)) {
        $_SESSION['success'] = "Post reported successfully.";
        header("location:{$_SERVER['HTTP_REFERER']}");
    } else {
        $_SESSION['error'] = "Failed to report the post. Try again.";
        header("location:{$_SERVER['HTTP_REFERER']}");
    }
}








?>
