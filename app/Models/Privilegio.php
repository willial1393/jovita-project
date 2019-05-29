<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Privilegio extends Model
{

    protected $table = 'privilegios';
    protected $fillable = [
        "venderProductos",
    
    ];
    
    protected $hidden = [
    
    ];
    
    protected $dates = [
    
    ];
    
    
    public $timestamps = false;
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute() {
        return url('/admin/privilegios/'.$this->getKey());
    }

    
}
