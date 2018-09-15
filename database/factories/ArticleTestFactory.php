<?php

use Faker\Generator as Faker;

$factory->define(App\ArticleTest::class, function (Faker $faker) {
    return [
       'name' => $faker->word,
       'type' => 2,       
        'article_id' => function () {
            return App\Article::all()->random();
        },        
        'status' => 1
    ];
});
