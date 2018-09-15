<?php

use Faker\Generator as Faker;

$factory->define(App\Question::class, function (Faker $faker) {
    return [
        'name' => $faker->word,
        'test_id' => $faker->numberBetween(1,12)
    
        
    ];
});
