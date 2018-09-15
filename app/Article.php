<?php

namespace App;
use Topic;
use Subject;
use ArticleTest;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $fillable = [
        'name',
        'subject_id',
        'order',
        'status'
    ];
    public function topics(){
        return $this->hasMany('App\Topic');
    }

    public function subject(){
        return $this->belongsTo(Subject::class);
    }

    public function article_tests(){
        return $this->hasMany('App\ArticleTest');
    }
}
