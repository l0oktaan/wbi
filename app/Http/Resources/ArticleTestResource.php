<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ArticleTestResource extends Resource
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
            'tests' => [
                'link' => route('article_tests.show',['article' =>$this->article_id,'article_test' => $this->id])
            ],
            'qestion' => [
                'link' => route('article_questions.index',['article'=>$this->article_id,'article_test' => $this->id])
            ]         
        ];
    }
}
