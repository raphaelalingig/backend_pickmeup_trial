<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReportsTable extends Migration
{
    public function up()
    {
        Schema::create('reports', function (Blueprint $table) {
            $table->id('report_id');
            $table->unsignedBigInteger('sender');
            $table->unsignedBigInteger('recipient');
            $table->text('reason');
            $table->text('comment')->nullable();
            $table->unsignedBigInteger('ride_id');
            $table->timestamps();

            $table->foreign('ride_id')->references('ride_id')->on('ride_histories');
            $table->foreign('sender')->references('user_id')->on('users');
            $table->foreign('recipient')->references('user_id')->on('users');
        });
    }

    public function down()
    {
        Schema::dropIfExists('reports');
    }
}
