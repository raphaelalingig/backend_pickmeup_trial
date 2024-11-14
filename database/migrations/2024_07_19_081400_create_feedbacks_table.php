<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeedbacksTable extends Migration
{
    public function up()
    {
        Schema::create('feedbacks', function (Blueprint $table) {
            $table->id('feedback_id');
            $table->unsignedBigInteger('sender');
            $table->unsignedBigInteger('recipient');
            $table->text('comment')->nullable();
            $table->integer('rating');
            $table->unsignedBigInteger('ride_id');
            $table->timestamps();

            $table->foreign('ride_id')->references('ride_id')->on('ride_histories');
            $table->foreign('sender')->references('user_id')->on('users');
            $table->foreign('recipient')->references('user_id')->on('users');
        });
    }

    public function down()
    {
        Schema::dropIfExists('feedbacks');
    }
}
