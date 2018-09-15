<?php

use Faker\Generator as Faker;

$factory->define(App\Article::class, function (Faker $faker) {
    return [
        'name' => $faker->word,        
        'subject_id' => function(){
            return App\Subject::all()->random();
        },
        'status' => $faker->numberBetween(0,1)
    ];
});
