<?php namespace App\Http\Requests\Admin\Usuario;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class StoreUsuario extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return  bool
     */
    public function authorize()
    {
        return Gate::allows('admin.usuario.create');
    }

/**
     * Get the validation rules that apply to the request.
     *
     * @return  array
     */
    public function rules()
    {
        return [
            'codigo' => ['required', Rule::unique('Usuario', 'codigo'), 'integer'],
            'nombre' => ['required', 'string'],
            'contrasena' => ['required', 'string'],
            'estado' => ['required', 'string'],
            'tipo' => ['required', 'string'],
            'email' => ['required', 'email', Rule::unique('Usuario', 'email'), 'string'],
            'privilegios_id' => ['required', 'integer'],
            
        ];
    }
}
