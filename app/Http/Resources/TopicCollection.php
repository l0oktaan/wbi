<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class TopicCollection extends Resource
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
            'order' => $this->order,
            'detail' => $this->detail,
            'link' => [
                'href' => route('topics.show',['article' =>$this->article_id,'topics' => $this->id])
            ]
            
        ];
    }
}
