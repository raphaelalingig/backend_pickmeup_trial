<!-- resources/views/emails/unclear-documentation.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            margin-bottom: 30px;
        }
        .content {
            padding: 20px;
        }
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            text-align: center;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Documentation Review Required</h2>
    </div>

    <div class="content">
        <p>Dear {{ $userName }},</p>

        <p>During the review of your application, we noticed some issues with your submitted documentation that need to be addressed:</p>

        <p><strong>Issue: {{ $reason }}</strong></p>

        <p>To proceed with your application, please:</p>
        <ol>
            <li>Log in to your account</li>
            <li>Navigate to the Get Verified section</li>
            <li>Review the mentioned issue</li>
            <li>Upload clear, updated documentation</li>
        </ol>

        <p>Common tips for document submission:</p>
        <ul>
            <li>Ensure all text is clearly readable</li>
            <li>Submit documents in their original size</li>
            <li>Make sure all corners of the document are visible</li>
            <li>Avoid glare or shadows in photos</li>
        </ul>

        <p>Your application will be reviewed again once you've updated your documentation.</p>

        <p>If you have any questions, please don't hesitate to contact our support team.</p>
    </div>

    <div class="footer">
        <p>Thank you for your cooperation.</p>
    </div>
</body>
</html>