<?php

namespace App;
use Subject;
use Question;
use Illuminate\Database\Eloquent\Model;

class SubjectTest extends Model
{
    protected $fillable = [
        'name',
        'subject_id',
        'type',
        'status'
    ];
    public function subject(){
        return $this->belongsTo(Subject::class);
    }
    public function questions()
    {
        return $this->hasMany('App\Question',"test_id")->where("test_type",1);
    }
}
