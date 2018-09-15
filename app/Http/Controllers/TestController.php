<?php

namespace App\Http\Controllers;
use ArticleController;
use SubjectController;
use App\Subject;
use App\Article;
use App\Test;
use Illuminate\Support\Facades\DB;
use Response;
use Illuminate\Http\Request;
use App\Http\Resources\TestResource;

class TestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getTest($id,$type)
    {
        $testType = '';
        switch ($type) {
            case 1:
                $testType = "subject_id";
                break;
            case 2:
                $testType = "subject_id";
                break;
            case 3:
                $testType = "article_id";
                break;
            case 4:
                $testType = "article_id";
                break;
        }

        return DB::table('tests')
            ->where($testType,'=',$id)
            ->where('type','=',$type)
            ->where('status','=',1)
            ->first()->get();
    }
    public function getPosttest($id){

    }
    public function index(Request $request,$type)
    {
        
       $path = $request->path();
       $arrPath = explode('/', trim($path));
      if ($arrPath[1]=='articles'){
          $pretest = DB::table('tests')
            ->where('type','=','3')
            ->where('article_id','=',$article->id)->get();
        return response()->json($pretest);
        return new TestResource($pretest);
      } 
      
      $id = $article->id;
      $pretest = Test::whereHas('article', function($query){
          $query->where('article_id','=','1')
            ->where('type','=','3');
      })->get();
      //json_decode($pretest,true)
      //return $pretest;
      return TestResource::collection($pretest);
      
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
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Test  $test
     * @return \Illuminate\Http\Response
     */
    public function show(Test $test)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Test  $test
     * @return \Illuminate\Http\Response
     */
    public function edit(Test $test)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Test  $test
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Test $test)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Test  $test
     * @return \Illuminate\Http\Response
     */
    public function destroy(Test $test)
    {
        //
    }
}
