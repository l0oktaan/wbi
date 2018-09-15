<?php

namespace App\Http\Controllers;
use App\Subject;
use App\SubjectTest;
use SubjectController;
use Illuminate\Http\Request;
use App\Http\Requests\TestRequest;
use App\Http\Resources\TestResource;
use App\Http\Resources\TestCollection;
use App\Http\Resources\TestController;
use App\Http\Resources\SubjectTestResource;
use App\Http\Resources\SubjectTestCollection;
use Symfony\Component\HttpFoundation\Response;

class SubjectTestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Subject $subject)
    {
        return SubjectTestResource::collection($subject->subject_tests);
        //return SubjectTestCollection::collection($subject->subject_tests);
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
    public function store(TestRequest $request,Subject $subject)
    {
        $test = new SubjectTest($request->all());
        $subject->subject_tests()->save($test);

        return response([
            'data' => new SubjectTestResource($test)
        ],Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function show(Subject $subject, SubjectTest $subjectTest)
    {
        return new SubjectTestCollection($subjectTest);
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
    public function update(Request $request,Subject $subject, SubjectTest $subjectTest)
    {
        $subjectTest->update($request->all());
        return response([
            'data' => new SubjectTestResource($subjectTest)
        ],Response::HTTP_CREATED);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SubjectTest  $subjectTest
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subject $subject, SubjectTest $subjectTest)
    {
        $subjectTest->delete();
        return response(null,Response::HTTP_NO_CONTENT);
    }
}
