<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class SubjectTestCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
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
            'tests' => [
                'link' => route('subject_tests.show',['subject' =>$this->subject_id,'subject_test' => $this->id])
            ],
            'questions' => [
                'link' => route('subject_questions.index',['subject'=>$this->subject_id,'subject_test' => $this->id])
            ]  
        ];
    }
}
