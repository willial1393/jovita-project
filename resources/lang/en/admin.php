<?php

return [
    'admin-user' => [
        'title' => 'Users',

        'actions' => [
            'index' => 'Users',
            'create' => 'New User',
            'edit' => 'Edit :name',
            'edit_profile' => 'Edit Profile',
            'edit_password' => 'Edit Password',
        ],

        'columns' => [
            'id' => "ID",
            'first_name' => "First name",
            'last_name' => "Last name",
            'email' => "Email",
            'password' => "Password",
            'password_repeat' => "Password Confirmation",
            'activated' => "Activated",
            'forbidden' => "Forbidden",
            'language' => "Language",
                
            //Belongs to many relations
            'roles' => "Roles",
                
        ],
    ],

    'usuario' => [
        'title' => 'Usuario',

        'actions' => [
            'index' => 'Usuario',
            'create' => 'New Usuario',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => "ID",
            'codigo' => "Codigo",
            'nombre' => "Nombre",
            'contrasena' => "Contrasena",
            'estado' => "Estado",
            'tipo' => "Tipo",
            'email' => "Email",
            'privilegios_id' => "Privilegios",
            
        ],
    ],

    'privilegio' => [
        'title' => 'Privilegios',

        'actions' => [
            'index' => 'Privilegios',
            'create' => 'New Privilegio',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => "ID",
            'venderProductos' => "VenderProductos",
            
        ],
    ],

    // Do not delete me :) I'm used for auto-generation
];