<div class="login">
    <div class="col-sm-12 col-md-4 bg-dark border rounded p-4 shadow-sm mx-auto">
        <form method="post" action="assets/php/actions.php?login">
            <div class="d-flex justify-content-center">
            <span class="logo-text">uwu</span>
                <img class="mb-4" src="assets/images/bg_signup" alt="" height="45">
            </div>
            <h1 class="h4 mb-3 fw-normal text-center welcome-heading">Sign In</h1>
            <div class="form-floating">
                <input type="text" name="username_email" value="<?=showFormData('username_email')?>" class="form-control rounded-0" placeholder="username/email">
                <label for="floatingInput">username/email</label>
            </div>
            <?=showError('username_email')?>
            <div class="form-floating mt-1">
                <input type="password" name="password" class="form-control rounded-0" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword">password</label>
            </div>
            <?=showError('password')?>
            <?=showError('checkuser')?>

            <div class="mt-3 d-flex justify-content-between align-items-center">
                <button class="btn btn-custom" type="submit">Sign in</button>
                <a href="?signup" class="btn btn-custom text-decoration-none" role="button">Create New Account</a>
            </div>

            <div class="mt-2 text-center">
                <a href="?forgotpassword&newfp" class="forgot-link text-decoration-none">Forgot password?</a>
                <br>
                <div class="text-center mt-3">
    <a href="?admin_login" class="text-decoration-none">Admin Login</a>
</div>
              
            </div>
        </form>
    </div>
</div>

<!-- Footer placed outside the login box -->
<footer style="color : white ; width: 100%; text-align: center; padding: 20px;  position: fixed; bottom: 0;">
    <p>&copy; 2024 uwu. All rights reserved by Md. Kaif Afran.</p>
</footer>
