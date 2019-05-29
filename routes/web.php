<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(function () {
    Route::get('/admin/admin-users',                            'Admin\AdminUsersController@index');
    Route::get('/admin/admin-users/create',                     'Admin\AdminUsersController@create');
    Route::post('/admin/admin-users',                           'Admin\AdminUsersController@store');
    Route::get('/admin/admin-users/{adminUser}/edit',           'Admin\AdminUsersController@edit')->name('admin/admin-users/edit');
    Route::post('/admin/admin-users/{adminUser}',               'Admin\AdminUsersController@update')->name('admin/admin-users/update');
    Route::delete('/admin/admin-users/{adminUser}',             'Admin\AdminUsersController@destroy')->name('admin/admin-users/destroy');
    Route::get('/admin/admin-users/{adminUser}/resend-activation','Admin\AdminUsersController@resendActivationEmail')->name('admin/admin-users/resendActivationEmail');
});

/* Auto-generated profile routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(function () {
    Route::get('/admin/profile',                                'Admin\ProfileController@editProfile');
    Route::post('/admin/profile',                               'Admin\ProfileController@updateProfile');
    Route::get('/admin/password',                               'Admin\ProfileController@editPassword');
    Route::post('/admin/password',                              'Admin\ProfileController@updatePassword');
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(function () {
    Route::get('/admin/usuarios',                               'Admin\UsuarioController@index');
    Route::get('/admin/usuarios/create',                        'Admin\UsuarioController@create');
    Route::post('/admin/usuarios',                              'Admin\UsuarioController@store');
    Route::get('/admin/usuarios/{usuario}/edit',                'Admin\UsuarioController@edit')->name('admin/usuarios/edit');
    Route::post('/admin/usuarios/{usuario}',                    'Admin\UsuarioController@update')->name('admin/usuarios/update');
    Route::delete('/admin/usuarios/{usuario}',                  'Admin\UsuarioController@destroy')->name('admin/usuarios/destroy');
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(function () {
    Route::get('/admin/privilegios',                            'Admin\PrivilegiosController@index');
    Route::get('/admin/privilegios/create',                     'Admin\PrivilegiosController@create');
    Route::post('/admin/privilegios',                           'Admin\PrivilegiosController@store');
    Route::get('/admin/privilegios/{privilegio}/edit',          'Admin\PrivilegiosController@edit')->name('admin/privilegios/edit');
    Route::post('/admin/privilegios/{privilegio}',              'Admin\PrivilegiosController@update')->name('admin/privilegios/update');
    Route::delete('/admin/privilegios/{privilegio}',            'Admin\PrivilegiosController@destroy')->name('admin/privilegios/destroy');
});