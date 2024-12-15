<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RiderRejectionMail extends Mailable
{
    // use Queueable, SerializesModels;

    // public $user;
    // public $reason;

    // public function __construct($user, $reason)
    // {
    //     $this->user = $user;
    //     $this->reason = $reason;
    // }

    // public function build()
    // {
    //     return $this->view('emails.rider-rejection')
    //                 ->subject('Your Rider Application Status');
    // }

    use Queueable, SerializesModels;
    
    public $user;
    public $reason;

    public function __construct($user, $reason)
    {
        $this->user = $user;
        $this->reason = $reason;
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Rider Application Status Update',
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.rider-rejection',
        );
    }
}