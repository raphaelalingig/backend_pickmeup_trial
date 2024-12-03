<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RiderVerificationNotification extends Mailable
{
    use Queueable, SerializesModels;
    
    public $status;
    
    public function __construct($status)
    {
        $this->status = $status;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Rider Verification Status Update',
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails/rider-verification',
        );
    }
}