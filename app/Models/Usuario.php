<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{

    protected $table = 'usuario';
    protected $fillable = [
        "codigo",
        "nombre",
        "contrasena",
        "estado",
        "tipo",
        "email",
        "privilegios_id",

    ];

    protected $hidden = [

    ];

    protected $dates = [

    ];


    public $timestamps = false;

    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/usuarios/' . $this->getKey());
    }


}
