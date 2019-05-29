<?php

/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(Brackets\AdminAuth\Models\AdminUser::class, function (Faker\Generator $faker) {
    return [
        'first_name' => $faker->firstName,
        'last_name' => $faker->lastName,
        'email' => $faker->email,
        'password' => bcrypt($faker->password),
        'remember_token' => null,
        'activated' => true,
        'forbidden' => $faker->boolean(),
        'language' => 'en',
        'deleted_at' => null,
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        
    ];
});/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Usuario::class, function (Faker\Generator $faker) {
    return [
        'codigo' => $faker->randomNumber(5),
        'nombre' => $faker->sentence,
        'contrasena' => $faker->sentence,
        'estado' => $faker->sentence,
        'tipo' => $faker->sentence,
        'email' => $faker->email,
        'privilegios_id' => $faker->randomNumber(5),
        
        
    ];
});

/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Privilegio::class, function (Faker\Generator $faker) {
    return [
        'venderProductos' => $faker->sentence,
        
        
    ];
});

