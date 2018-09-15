<?php

namespace App;
use Article;
use Subject;
use Question;
use Illuminate\Database\Eloquent\Model;

class Test extends Model
{
    public function article(){
        return $this->belongsTo('App\Article');
    }

    public function subject(){
        return $this->belongsTo('App\Subject');
    }

    public function questions(){
        return $this->hasMany('App\Question');
    }
}
