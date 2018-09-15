<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Article;
class Topic extends Model
{
    protected $fillable = [
        'name',
        'detail',
        'order',
        'status'
    ];
    public function article(){
        return $this->belongsTo('App\Article');
    }
}
