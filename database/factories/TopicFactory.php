<?php

use Faker\Generator as Faker;

$factory->define(App\Topic::class, function (Faker $faker) {
   return [
        'name' => $faker->word,
        'article_id' => function () {
            return App\Article::all()->random();
        },
        'detail' => $faker->paragraph,
        'status' => $faker->numberBetween(0,1)
        
    ];
});
