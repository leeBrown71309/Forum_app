<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TopicFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "title"=> $this->faker->sentence(),
            "content" => $this->faker->paragraph(),
            "user_id" => rand(1,10),
        ];
    }
}
