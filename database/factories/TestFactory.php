<?php

use Faker\Generator as Faker;

$factory->define(App\Test::class, function (Faker $faker) {
    return [
       'name' => $faker->word,
       'type' => $faker->numberBetween(1,3),
       'subject_id' => function () {
            return App\Subject::all()->random();
        },
        'article_id' => function () {
            return App\Article::all()->random();
        },        
        'status' => $faker->numberBetween(0,1)
    ];
});
