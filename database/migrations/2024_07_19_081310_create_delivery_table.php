<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryTable extends Migration
{
    public function up()
    {
        Schema::create('delivery', function (Blueprint $table) {
            $table->id('delivery_id');
            $table->unsignedBigInteger('ride_id');
            $table->string('delivery_type');
            $table->string('instructions');
            $table->timestamps();

            $table->foreign('ride_id')->references('ride_id')->on('ride_histories')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('delivery');
    }
}
