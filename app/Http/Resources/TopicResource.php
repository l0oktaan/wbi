<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class TopicResource extends Resource
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
            'article_id' => $this->article_id,
            'order' => $this->order,
            'detail' => $this->detail,
            
        ];
    }
}
