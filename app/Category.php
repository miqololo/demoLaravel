<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';


    protected $fillable = ['id', 'name','description','type','parent_id', 'created_at', 'updated_at'];
}
