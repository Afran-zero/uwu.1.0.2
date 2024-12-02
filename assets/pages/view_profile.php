<div class="profile">
    <h1><?= $profile['username'] ?>'s Profile</h1>
    <p><strong>Full Name:</strong> <?= $profile['first_name'] . ' ' . $profile['last_name'] ?></p>
    <p><strong>Email:</strong> <?= $profile['email'] ?></p>
    <p><strong>Status:</strong> <?= $profile['ac_status'] == 1 ? 'Active' : 'Blocked' ?></p>
    <a href="?admin_dashboard" style="color: blue;">Back to Dashboard</a>
</div>
