<?php

namespace App\Http\Controllers;
use Exception;
use App\Article;
use App\Subject;
use App\Question;
use App\ArticleTest;
use App\SubjectTest;
use ArticleTestController;
use SubjectTestController;
use Illuminate\Http\Request;
use App\Http\Requests\QuestionRequest;
use App\Http\Resources\QuestionResource;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function count()
    {
        return 2;
    }
    public function index(Subject $subject,SubjectTest $subject_test,
        Article $article,ArticleTest $article_test)
    {
        $question = new Question;
        if ($article_test->id == "")
        {
            return QuestionResource::collection(DB::table('questions')
                ->where('test_id',$subject_test->id)
                ->where('test_type',1)->get());
        }else{
            return QuestionResource::collection(DB::table('questions')
                ->where('test_id',$article_test->id)
                ->where('test_type',2)->get());
        }
         /* $question = new Question;
        if ($article_test->id == "")
        {
            $question = $subject_test->questions;
        }else{
            $question = $article_test->questions;
        }
        return QuestionResource::collection($question); */
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
    
    public function store(Request $request,
        Subject $subject,SubjectTest $subject_test,
        Article $article,ArticleTest $article_test)
    {
       
        $question = new Question;
        $question->name = $request->name;        
        $question->answer = $request->answer;
        $question->order = $request->order;
        $question->status = $request->status;
        
        $err = '';
        if ($article_test->id == "")
        {           
            $question->test_id = $subject_test->id;
            $question->test_type = 1;
            $err="subject";
        }else{
            $question->test_id = $article_test->id;
            $question->test_type = 2;
        }
        $question->save();
        return new QuestionResource($question);

    }

    

    /**
     * Display the specified resource.
     *
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function edit(Question $question)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function update(QuestionRequest $request,
        Subject $subject,SubjectTest $subject_test,
        Article $article,ArticleTest $article_test,$question_id)
    {
        $question = Question::find($question_id);
        $question->update($request->all());
        
        return new QuestionResource($question);
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Question  $question
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subject $subject,SubjectTest $subject_test,
        Article $article,ArticleTest $article_test,$question_id)
    {
        if ($article_test->id != "" || $subject_test->id != ""){
            Question::find($question_id)->delete();
            return response(null,Response::HTTP_NO_CONTENT);
        }else{
            return "Noting to delete";
        }
        
    }
}
