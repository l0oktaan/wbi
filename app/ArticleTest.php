<?php

namespace App;
use Article;
use Question;
use Illuminate\Database\Eloquent\Model;

class ArticleTest extends Model
{
    protected $fillable = [
        'name',
        'subject_id',
        'type',
        'status'
    ];
    public function article(){
        return $this->belongsTo(Article::class);
    }
    public function questions()
    {
        return $this->hasMany('App\Question',"test_id")->where("test_type",2);
    }
    
}
