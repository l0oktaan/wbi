<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ArticleCollection extends Resource
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
            'article' => [
                'link' => route('articles.show',$this->id)
            ],
            'tests' => [
                'link' => route('article_tests.index',$this->id)
            ],
            
            
        ];
    }
}
