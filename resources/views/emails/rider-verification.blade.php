<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .logo {
            width: 150px;
            height: auto;
            margin-bottom: 20px;
        }
        .status-box {
            background-color: #f8f9fa;
            border-left: 4px solid #007bff;
            padding: 15px;
            margin: 20px 0;
        }
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
       <img src="{{ asset('images/logo.png') }}" alt="Pickmeup Logo" class="logo">
        <h2>Verification Status Update</h2>
    </div>

    <p>Dear Valued Rider,</p>

    <div class="status-box">
        <p>Your account verification status has been updated to: <strong>{{ $status }}</strong></p>
    </div>

    <p>This update reflects our commitment to maintaining the highest standards of service and safety within the Pickmeup community.</p>

    @if($status == 'Verified')
    <p>Congratulations! You're now fully verified and ready to start accepting rides through the Pickmeup platform.</p>
    @else
    <p>Our team is currently reviewing your documentation. We'll notify you of any updates or required actions.</p>
    @endif

    <p>If you have any questions about your verification status, please don't hesitate to contact our support team.</p>

    <p>Best regards,<br>
    The Pickmeup Team</p>

    <div class="footer">
        <p>© 2024 Pickmeup. All rights reserved.</p>
        <p>This is an automated message, please do not reply to this email.</p>
    </div>
</body>
</html>