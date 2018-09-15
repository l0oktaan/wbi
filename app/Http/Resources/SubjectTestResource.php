<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class SubjectTestResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       return [
            'id' => $this->id,
            'name' => $this->name,
            'type' => $this->type,
            'typetext' => ($this->type == 1 ? "Pre-Test" : ($this->type == 2 ? "Post-Test" : "")),
            
            'tests' => route('subject_tests.show',['subject' =>$this->subject_id,'subject_test' => $this->id]),
            'questions' => route('subject_questions.index',['subject'=>$this->subject_id,'subject_test' => $this->id])           
        ];
    }
}
