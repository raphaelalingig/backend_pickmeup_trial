<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UnclearDocumentationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $reason;

    public function __construct($user, $reason)
    {
        $this->user = $user;
        $this->reason = $reason;
    }

    public function build()
    {
        return $this->view('emails.unclear-documentation')
                    ->subject('Action Required: Documentation Issues with Your Application')
                    ->with([
                        'userName' => $this->user->first_name,
                        'reason' => $this->reason
                    ]);
    }
}