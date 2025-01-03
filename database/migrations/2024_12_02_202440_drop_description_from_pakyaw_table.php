<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropDescriptionFromPakyawTable extends Migration
{
    public function up()
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->dropColumn('description');
        });
    }

    public function down()
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->string('description')->nullable();
        });
    }
}
