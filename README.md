Uwu Connect - Social Media Platform

Uwu Connect is a dynamic social media platform built to foster connections through user interactions, content sharing, and community engagement. It allows users to register, interact with others, share media, and manage their profiles, with robust admin controls for user and content moderation.

Live Site: uwuconnect.my.id

Site Name: uwuconnect.my.id

Project By: MD Kaif Afran Khan (2222134642, CSE311.10)
Features

    User Authentication:
        Register with email verification for secure account creation.
        Login to access personalized features.
    Dynamic Homepage:
        Displays posts from followed users and trending content.
    User Interactions:
        Follow/unfollow other users to curate your feed.
        Block users to restrict interactions.
        Private text messaging between users.
    Content Sharing:
        Upload pictures and videos.
        Comment, love, or dislike posts.
        Report inappropriate posts for admin review.
    Profile Management:
        Edit profile details (e.g., bio, profile picture).
    Admin Panel:
        Manage users (view, edit, terminate accounts).
        Review and resolve reported posts.
    Responsive Design:
        Built with Bootstrap and custom CSS for a seamless experience across devices.

Technologies Used

    Backend: PHP
    Database: MySQL
    Frontend: Bootstrap, HTML, CSS
    Email Verification: PHP mailer or SMTP integration (assumed based on feature)
    Hosting: Live on uwuconnect.my.id

Prerequisites

    Web Server: Apache (e.g., XAMPP, WAMP, or a live server)
    PHP: Version 7.4 or higher
    MySQL: Version 5.7 or higher
    Composer (optional): For PHP dependencies (if used)
    Git: For cloning the repository
    Browser: Modern browser (Chrome, Firefox, etc.)

Setup Instructions

    Clone the Repository:
    bash

git clone https://github.com/yourusername/uwu-connect.git
cd uwu-connect
Replace yourusername with the actual repository owner’s GitHub username.
Set Up the Web Server:

    Local (XAMPP):
        Place the project folder in C:\xampp\htdocs\uwu-connect.
        Start Apache and MySQL in XAMPP Control Panel.
    Live Server:
        Upload files to your hosting provider’s root directory (e.g., /public_html).

Configure the Database:

    Open http://localhost/phpmyadmin (or your server’s phpMyAdmin).
    Create a database named uwu_connect_db.
    Import the provided database.sql file (if included) or run the following to create tables:
    sql

    CREATE DATABASE uwu_connect_db;
    USE uwu_connect_db;
    -- Add table creation queries for users, posts, follows, reports, etc.
    (Note: Replace with actual schema if provided in your project.)

Configure Environment:

    Copy .env.example to .env (if applicable):
    bash

cp .env.example .env
Edit .env or config.php with your database credentials:
text

    DB_HOST=localhost
    DB_USER=root
    DB_PASSWORD=
    DB_NAME=uwu_connect_db
    Update email settings (e.g., SMTP for verification) if required.

Install Dependencies (if any):

    If using Composer:
    bash

        composer install
    Run the Application:
        Local:
            Open http://localhost/uwu-connect in a browser.
        Live:
            Visit uwuconnect.my.id.
        Default admin credentials (if set): Check admin.php or contact the project owner.

Usage

    User Flow:
        Register with a valid email and verify via the confirmation link.
        Log in to access the homepage.
        Follow users, post content, comment, love/dislike, or send messages.
        Edit your profile or report inappropriate posts.
    Admin Flow:
        Log in to the admin panel (e.g., uwuconnect.my.id/admin).
        Manage users, review reports, and terminate accounts if necessary.
    Content Moderation:
        Users can report posts, which admins review and act upon (delete or dismiss).

Contribution Guidelines

    Create a Branch:
    bash

git checkout -b yourname-feature
Example: git checkout -b kaif-add-chat.
Make Changes:

    Work in the src/ or relevant folder (e.g., php/, css/).
    Test changes locally before committing.

Commit and Push:
bash
git add .
git commit -m "Added feature X"
git push origin yourname-feature
Create a Pull Request:

    Go to the GitHub repository.
    Click Compare & pull request for your branch.
    Describe changes and submit for review.

Sync with Main:
bash

    git checkout main
    git pull origin main
    git checkout yourname-feature
    git merge main
    Resolve conflicts if any.

File Structure

    index.php: Homepage entry point.
    config.php: Database and app configuration.
    database.sql: Database schema (if included).
    css/: Custom styles and Bootstrap overrides.
    js/: JavaScript for dynamic features.
    admin/: Admin panel scripts.
    uploads/: User-uploaded media (pics, videos).
    .env: Environment variables (database, email settings).

Troubleshooting

    Database Errors:
        Verify DB_HOST, DB_USER, DB_PASSWORD, and DB_NAME in config.php or .env.
        Ensure MySQL is running in XAMPP or your server.
    Email Verification Issues:
        Check SMTP settings in config.php or .env.
        Test with a valid email provider (e.g., Gmail SMTP).
    Upload Failures:
        Ensure uploads/ has write permissions (chmod 777 uploads/ on Linux).
        Check file size limits in php.ini (upload_max_filesize, post_max_size).
    Other Issues:
        Contact MD Kaif Afran Khan or raise a GitHub issue.

Notes

    Security:
        Ensure user inputs are sanitized to prevent SQL injection or XSS.
        Use HTTPS on the live site for secure data transfer.
    Future Improvements:
        Add notifications for follows, comments, or messages.
        Implement real-time chat with WebSockets.
        Enhance media support (e.g., video thumbnails).
    Hosting:
        The live site is hosted at uwuconnect.my.id. Local setup mirrors this environment.

License

This project is for academic purposes and not licensed for commercial use. Contact kaifafran_zero@yahoo.com for permissions.
Acknowledgments

    Bootstrap: For responsive design.
    PHP & MySQL: For robust backend functionality.
    XAMPP: For local development support.
