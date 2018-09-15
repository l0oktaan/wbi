<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        //factory(App\Article::class,5)->create();
        //factory(App\Topic::class,20)->create();
        //factory(App\Test::class,50)->create();
        //factory(App\Question::class,60)->create();
        factory(App\ArticleTest::class,5)->create();
        factory(App\SubjectTest::class,1)->create();
    }
}
