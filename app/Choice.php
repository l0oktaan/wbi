<?php

namespace App;
use Question;
use Illuminate\Database\Eloquent\Model;

class Choice extends Model
{
    public function question(){
        return $this->belongsTo(Question::class);
    }
}
