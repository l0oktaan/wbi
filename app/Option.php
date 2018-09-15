<?php

namespace App;
use Question;
use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    protected $fillable = [
        'question_id',
        'value',        
        'text',
        'status'        
    ];
    public function question(){
        return $this->belongsTo('App\Question');
    }
}
