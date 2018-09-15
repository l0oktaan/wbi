<?php

namespace App;
use ArticleTest;
use SubjectTest;
use Option;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $fillable = [
        'name',
        'test_id',
        'test_type',
        'order',
        'answer',
        'status'
    ];
    public function articleTest(){
        return $this->belongsTo(ArticleTest::class,["test_id","id"],["test_type",2]);
    }

    public function subjectTest(){
        return $this->belongsTo(SubjectTest::class,["test_id","id"],["test_type",1]);
    }

    
    
    public function options(){
        return $this->hasMany('App\Option');
    }
}
