<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->dateTime('return_date')->after('scheduled_date')->nullable();
        });
            
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pakyaw', function (Blueprint $table) {
            $table->dropColumn('return_date');
        });
    }
};
