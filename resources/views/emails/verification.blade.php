<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Code</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            padding-bottom: 20px;
        }
        .code-container {
            background-color: #f8f9fa;
            padding: 15px;
            margin: 20px 0;
            text-align: center;
            border-radius: 5px;
        }
        .verification-code {
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 2px;
            color: #333;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Email Verification</h2>
        </div>

        <p>Hello,</p>
        
        <p>We received a request to verify your Email. Please use the following verification code to complete email verification:</p>

        <div class="code-container">
            <div class="verification-code">{{ $code }}</div>
        </div>

        <p>This code will expire in 15 minutes for security purposes.</p>

        <p>If you didn't request this, please ignore this email or contact support if you have concerns.</p>

        <div class="footer">
            <p>This is an automated email, please do not reply.</p>
            <p>© {{ date('Y') }} Pick Me Up. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
