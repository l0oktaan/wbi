<?php

namespace App\Http\Controllers;
use App\Option;
use App\Question;
use QuestionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\OptionRequest;
use App\Http\Resources\OptionResource;
use Symfony\Component\HttpFoundation\Response;

class OptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Question $question)
    {
        $options = DB::table('options')
            ->where('question_id','=',$question->id)
            ->orderBy('value','asc')
            ->get();
        return OptionResource::collection($options);
        //return OptionResource::collection($question->options);
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
    public function store(OptionRequest $request,Question $question)
    {
        $option = new Option($request->all());
        $question->options()->save($option);
        return response([
            'data' => new OptionResource($option)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Option  $option
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question, Option $option)
    {
        return new OptionResource($option);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Option  $option
     * @return \Illuminate\Http\Response
     */
    public function edit(Option $option)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Option  $option
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Question $question, Option $option)
    {
        $option->update($request->all());
        return response([
            'data' => new OptionResource($option)
        ],Response::HTTP_CREATED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Option  $option
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question,Option $option)
    {
        $option->delete();
        return response(null,Response::HTTP_NO_CONTENT);
    }
}
