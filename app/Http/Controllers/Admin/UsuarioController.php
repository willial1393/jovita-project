<?php namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests\Admin\Usuario\IndexUsuario;
use App\Http\Requests\Admin\Usuario\StoreUsuario;
use App\Http\Requests\Admin\Usuario\UpdateUsuario;
use App\Http\Requests\Admin\Usuario\DestroyUsuario;
use Brackets\AdminListing\Facades\AdminListing;
use App\Models\Usuario;

class UsuarioController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param  IndexUsuario $request
     * @return Response|array
     */
    public function index(IndexUsuario $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Usuario::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'codigo', 'nombre', 'contrasena', 'estado', 'tipo', 'email', 'privilegios_id'],

            // set columns to searchIn
            ['id', 'nombre', 'contrasena', 'estado', 'tipo', 'email']
        );

        if ($request->ajax()) {
            return ['data' => $data];
        }

        return view('admin.usuario.index', ['data' => $data]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function create()
    {
        $this->authorize('admin.usuario.create');

        return view('admin.usuario.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreUsuario $request
     * @return Response|array
     */
    public function store(StoreUsuario $request)
    {
        // Sanitize input
        $sanitized = $request->validated();

        // Store the Usuario
        $usuario = Usuario::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/usuarios'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/usuarios');
    }

    /**
     * Display the specified resource.
     *
     * @param  Usuario $usuario
     * @return void
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Usuario $usuario)
    {
        $this->authorize('admin.usuario.show', $usuario);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Usuario $usuario
     * @return Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function edit(Usuario $usuario)
    {
        $this->authorize('admin.usuario.edit', $usuario);

        return view('admin.usuario.edit', [
            'usuario' => $usuario,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateUsuario $request
     * @param  Usuario $usuario
     * @return Response|array
     */
    public function update(UpdateUsuario $request, Usuario $usuario)
    {
        // Sanitize input
        $sanitized = $request->validated();

        // Update changed values Usuario
        $usuario->update($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/usuarios'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/usuarios');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  DestroyUsuario $request
     * @param  Usuario $usuario
     * @return Response|bool
     * @throws \Exception
     */
    public function destroy(DestroyUsuario $request, Usuario $usuario)
    {
        $usuario->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    }
