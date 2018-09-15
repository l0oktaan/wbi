<?php

use Faker\Generator as Faker;

$factory->define(App\SubjectTest::class, function (Faker $faker) {
    return [
       'name' => $faker->word,
       'type' => 2,       
        'subject_id' => function () {
            return App\Subject::all()->random();
        },
        'status' => 1       
        
    ];
});
