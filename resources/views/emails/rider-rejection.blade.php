<!-- resources/views/emails/rider-rejection.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-bottom: 2px solid #dee2e6;
        }
        .content {
            padding: 20px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Application Status Update</h2>
        </div>
        
        <div class="content">
            <p>Dear {{ $user->first_name }},</p>
            
            <p>We regret to inform you that your rider application has been rejected.</p>
            
            <p><strong>Reason for rejection:</strong> {{ $reason }}</p>
            
            <p>If you believe this decision was made in error or if you would like to apply again after addressing the mentioned concerns, please contact our support team.</p>
            
            <p>Thank you for your interest in becoming a rider with our platform.</p>
            
            <p>Best regards,<br>
            The Support Team</p>
        </div>
        
        <div class="footer">
            <p>This is an automated message, please do not reply directly to this email.</p>
        </div>
    </div>
</body>
</html>