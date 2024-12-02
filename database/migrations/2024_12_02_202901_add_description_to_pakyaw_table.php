<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDescriptionToPakyawTable extends Migration
{
    public function up()
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->string('description')->nullable()->after('return_date'); // Adjust column position
        });
    }

    public function down()
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->dropColumn('description');
        });
    }
}
