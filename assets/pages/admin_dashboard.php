<?php
require_once '../php/functions.php';

if(!isset($_SESSION['AdminAuth'])){
    header('Location: ?admin_login');
    exit;
}

$stats = [
    'users' => getUserCount(),
    'posts' => getPostCount(),
    'comments' => getCommentCount(),
    'likes' => getLikeCount()
];

$users = getAllUsers();
$reports = getAllReports(); // Fetch all reported posts
?>

<div class="dashboard" style="font-family: Arial, sans-serif; padding: 20px;">
    <h1 style="color: #333;">Admin Dashboard</h1>
    <div>
        <p style="color: #666;">Total Users: <?= $stats['users'] ?></p>
        <p style="color: #666;">Total Posts: <?= $stats['posts'] ?></p>
        <p style="color: #666;">Total Comments: <?= $stats['comments'] ?></p>
        <p style="color: #666;">Total Likes: <?= $stats['likes'] ?></p>
    </div>
    <h2 style="margin-top: 20px;">Manage Users</h2>
    <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
    <thead>
        <tr style="background-color: #f4f4f4;">
            <th style="padding: 10px; border: 1px solid #ddd;">ID</th>
            <th style="padding: 10px; border: 1px solid #ddd;">Username</th>
            <th style="padding: 10px; border: 1px solid #ddd;">Status</th>
            <th style="padding: 10px; border: 1px solid #ddd;">Action</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach($users as $user): ?>
            <tr>
    <td style="padding: 10px; border: 1px solid #ddd;"><?= $user['id'] ?></td>
    <td style="padding: 10px; border: 1px solid #ddd;"><?= $user['username'] ?></td>
    <td style="padding: 10px; border: 1px solid #ddd;">
        <?php 
            if ($user['ac_status'] == 0) {
                echo "Not Verified";
            } elseif ($user['ac_status'] == 1) {
                echo "Active";
            } else {
                echo "Blocked";
            }
        ?>
    </td>
    <td style="padding: 10px; border: 1px solid #ddd;">
        <?php if ($user['ac_status'] == 0): ?>
            <button disabled style="color: white; background-color: gray; border: none; padding: 5px 10px; cursor: not-allowed;">
                Not Verified
            </button>
        <?php else: ?>
            <form method="post" action="../php/actions.php?toggle_user_status=<?= $user['id'] ?>" style="display: inline;">
                <button type="submit" style="color: white; background-color: <?= $user['ac_status'] == 2 ? 'green' : 'red'; ?>; border: none; padding: 5px 10px; cursor: pointer;">
                    <?= $user['ac_status'] == 1 ? 'Block' : 'Unblock' ?>
                </button>
            </form>
        <?php endif; ?>
       
    </td>
</tr>

        <?php endforeach; ?>
    </tbody>
</table>
<h2 style="margin-top: 40px;">Reported Posts</h2>
    <table style="width: 100%; border-collapse: collapse; margin-top: 10px;">
    <thead>
    <tr style="background-color: #f4f4f4;">
        <th style="padding: 10px; border: 1px solid #ddd;">Report ID</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Post ID</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Reported By</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Posted By</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Image</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Reported At</th>
        <th style="padding: 10px; border: 1px solid #ddd;">Action</th>
    </tr>
</thead>

        <tbody>
        <?php foreach ($reports as $report): ?>
    <tr>
        <!-- Report ID -->
        <td style="padding: 10px; border: 1px solid #ddd;"><?= $report['report_id'] ?></td>

        <!-- Post ID -->
        <td style="padding: 10px; border: 1px solid #ddd;"><?= $report['post_id'] ?></td>

        <!-- Reporter Username -->
        <td style="padding: 10px; border: 1px solid #ddd;">
            <?= isset($report['reporter_id']) && getUser($report['reporter_id']) 
                ? getUser($report['reporter_id'])['username'] 
                : 'N/A' ?>
        </td>

        <!-- Poster Username -->
        <td style="padding: 10px; border: 1px solid #ddd;">
            <?= isset($report['poster_id']) && getUser($report['poster_id']) 
                ? getUser($report['poster_id'])['username'] 
                : 'N/A' ?>
        </td>

        <!-- Post Image -->
        <td style="padding: 10px; border: 1px solid #ddd;">
            <img src="../assets/images/posts/<?= $report['post_img'] ?>" alt="Post Image" style="max-height: 100px; max-width: 100px;">
        </td>

        <!-- Reported At -->
        <td style="padding: 10px; border: 1px solid #ddd;"><?= $report['reported_at'] ?></td>

        <!-- Actions -->
        <td style="padding: 10px; border: 1px solid #ddd;">
        <form method="post" action="assets/php/actions.php">
    <input type="hidden" name="deletepost" value="<?= $report['post_id'] ?>">
    <button type="submit">Delete</button>
</form>



        </td>
    </tr>
<?php endforeach; ?>


        </tbody>
    </table>
</div>
