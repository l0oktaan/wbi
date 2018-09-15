<?php

namespace App;
use Article;
use SubjectTest;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $fillable = [
        'name'
        
    ];
    public function articles(){
        return $this->hasMany(Article::class);
    }

    public function subject_tests(){
        return $this->hasMany('App\SubjectTest');
    }


}
