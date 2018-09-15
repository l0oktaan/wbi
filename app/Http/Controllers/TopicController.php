<?php

namespace App\Http\Controllers;

use App\Topic;
use App\Article;
use ArticleController;
use Illuminate\Http\Request;
use App\Http\Requests\TopicRequest;
use App\Http\Resources\TopicResource;
use App\Http\Resources\TopicCollection;
use Symfony\Component\HttpFoundation\Response;

class TopicController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth:api')->except('index','show');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Article $article)
    {       
        //return TopicResource::collection($article->topics);
        $topic = new Topic;
        $topic = $article->topics()->orderby('order','asc')->get();
        return TopicCollection::collection($topic);
        //return $article->topics;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TopicRequest $request,Article $article)
    {
        $topic = new Topic($request->all());
        $article->topics()->save($topic);

        return response([
            'data' => new TopicResource($topic)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article,Topic $topic)
    {
        //return $topic->id;
        /* return new TopicResource($article->topics()
            ->where('id','=',$topic->id)->get()); */
            return TopicResource::collection($article->topics()->where('id',$topic->id)->get());
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function edit(Topic $topic)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Article $article, Topic $topic)
    {
        $topic->update($request->all());
        return response([
            'data' => new TopicResource($topic)
        ],Response::HTTP_CREATED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Topic  $topic
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article,Topic $topic)
    {
        $topic->delete();
        return response(null,Response::HTTP_NO_CONTENT);
    }
}
