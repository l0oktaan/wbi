<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::Resource('/articles', 'ArticleController');

Route::Resource('/questions/{question}/options','OptionController');

Route::group(['prefix'=>'articles'],function(){
    Route::apiResource('/{article}/topics','TopicController');
    Route::apiResource('/{article}/article_tests','ArticleTestController');
    Route::apiResource('/{article}/article_tests/{article_test}/article_questions','QuestionController');
    //Route::apiResource('/{article}/article_tests/{article_test}/article_questions/{article_question}/options','OptionController');
});
Route::Resource('/subjects', 'SubjectController');
Route::group(['prefix'=>'subjects'],function(){
    Route::apiResource('/{subject}/subject_tests','SubjectTestController');  
    Route::apiResource('/{subject}/subject_tests/{subject_test}/subject_questions','QuestionController');
});
Route::get('files', 'FileController@index');
Route::post('files/upload-file', 'FileController@uploadFile');


