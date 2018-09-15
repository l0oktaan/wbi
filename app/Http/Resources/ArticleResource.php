<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;
use Illuminate\Support\Facades\Route;
class ArticleResource extends Resource
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
            'order' => $this->order,
            'topics' => [
                'topic' => route('topics.index',$this->id)
            ],
            'tests' => [
                'link' => route('article_tests.index',$this->id)
            ],
            
        ];
        
    }
}
