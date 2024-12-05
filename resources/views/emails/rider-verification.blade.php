<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.8;
            color: #2d3748;
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #f7fafc;
        }
        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .logo {
            width: 100%;
            max-width: 300px;
            height: auto;
            margin-bottom: 30px;
            object-fit: contain;
            aspect-ratio: 2/1;
        }
        .status-box {
            background-color: #ebf8ff;
            border-left: 4px solid #4299e1;
            padding: 20px;
            margin: 30px 0;
            border-radius: 0 4px 4px 0;
            transition: all 0.3s ease;
        }
        .status-box:hover {
            transform: translateX(5px);
        }
        .status-box p {
            margin: 0;
            font-size: 1.1em;
        }
        .status-box strong {
            color: #2b6cb0;
        }
        p {
            margin: 20px 0;
            font-size: 16px;
        }
        .footer {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
            font-size: 14px;
            color: #718096;
            text-align: center;
        }
        .footer p {
            margin: 10px 0;
        }
        .signature {
            margin: 30px 0;
            padding-left: 20px;
            border-left: 3px solid #4299e1;
        }
        @media (max-width: 600px) {
            body {
                padding: 20px 10px;
            }
            .container {
                padding: 20px;
            }
            .logo {
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
         
            <h2 style="color: #2d3748; margin: 0;">Verification Status Update</h2>
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

        <div class="signature">
            <p>Best regards,<br>
            The Pickmeup Team</p>
        </div>

        <div class="footer">
            <p>© 2024 Pickmeup. All rights reserved.</p>
            <p>This is an automated message, please do not reply to this email.</p>
        </div>
    </div>
</body>
</html>