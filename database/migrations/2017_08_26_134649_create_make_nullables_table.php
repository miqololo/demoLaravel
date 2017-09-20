<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMakeNullablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('category', function($table)
        {
            $table->integer('parent_id')->default(0)->change();
            $table->string('type','sasdad')->default("default type")->change();
        });
        Schema::table('images', function($table)
        {
            $table->string('table_name')->default("")->change();
            $table->integer('entity_id')->default(1)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
