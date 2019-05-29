<?php namespace App\Http\Requests\Admin\Usuario;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class UpdateUsuario extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return  bool
     */
    public function authorize()
    {
        return Gate::allows('admin.usuario.edit', $this->usuario);
    }

/**
     * Get the validation rules that apply to the request.
     *
     * @return  array
     */
    public function rules()
    {
        return [
            'codigo' => ['sometimes', Rule::unique('Usuario', 'codigo')->ignore($this->usuario->getKey(), $this->usuario->getKeyName()), 'integer'],
            'nombre' => ['sometimes', 'string'],
            'contrasena' => ['sometimes', 'string'],
            'estado' => ['sometimes', 'string'],
            'tipo' => ['sometimes', 'string'],
            'email' => ['sometimes', 'email', Rule::unique('Usuario', 'email')->ignore($this->usuario->getKey(), $this->usuario->getKeyName()), 'string'],
            'privilegios_id' => ['sometimes', 'integer'],
            
        ];
    }
}
