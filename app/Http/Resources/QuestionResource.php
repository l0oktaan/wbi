<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class QuestionResource extends Resource
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
            'test_id' => $this->test_id,
            'test_type' =>$this->test_type,
            'answer' => $this->answer,          
            'order' => $this->order,
            'options' => [
                'link' => route('options.index',$this->id)                
            ],
            
        ];
    }
}
