<?php

namespace App\Http\Controllers;
use App\Article;

use App\ArticleTest;
use ArticleController;
use Illuminate\Http\Request;
use App\Http\Requests\TestRequest;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\TestCollection;
use App\Http\Resources\ArticleTestResource;
use Symfony\Component\HttpFoundation\Response;

class ArticleTestController extends Controller
{
   public function index(Article $article)
    {
        return ArticleTestResource::collection($article->article_tests);       
    }
    public function store(TestRequest $request,Article $article)
    {
        $test = new ArticleTest($request->all());
        $article->article_tests()->save($test);
        return response([
            'data' => new ArticleTestResource($test)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article, ArticleTest $articleTest)
    {
        return new TestCollection($articleTest);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function edit(SubjectTest $subjectTest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function update(TestRequest $request,Article $article, ArticleTest $articleTest)
    {
        
        $articleTest->update($request->all());
        return response([
            'data' => new TestCollection($articleTest)
        ],Response::HTTP_CREATED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article, ArticleTest $articleTest)
    {
        $articleTest->delete();
        return response(null,Response::HTTP_NO_CONTENT);
    }
}
