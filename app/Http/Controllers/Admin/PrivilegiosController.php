<?php namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests\Admin\Privilegio\IndexPrivilegio;
use App\Http\Requests\Admin\Privilegio\StorePrivilegio;
use App\Http\Requests\Admin\Privilegio\UpdatePrivilegio;
use App\Http\Requests\Admin\Privilegio\DestroyPrivilegio;
use Brackets\AdminListing\Facades\AdminListing;
use App\Models\Privilegio;

class PrivilegiosController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @param  IndexPrivilegio $request
     * @return Response|array
     */
    public function index(IndexPrivilegio $request)
    {
        // create and AdminListing instance for a specific model and
        $data = AdminListing::create(Privilegio::class)->processRequestAndGet(
            // pass the request with params
            $request,

            // set columns to query
            ['id', 'venderProductos'],

            // set columns to searchIn
            ['id', 'venderProductos']
        );

        if ($request->ajax()) {
            return ['data' => $data];
        }

        return view('admin.privilegio.index', ['data' => $data]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function create()
    {
        $this->authorize('admin.privilegio.create');

        return view('admin.privilegio.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StorePrivilegio $request
     * @return Response|array
     */
    public function store(StorePrivilegio $request)
    {
        // Sanitize input
        $sanitized = $request->validated();

        // Store the Privilegio
        $privilegio = Privilegio::create($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/privilegios'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/privilegios');
    }

    /**
     * Display the specified resource.
     *
     * @param  Privilegio $privilegio
     * @return void
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function show(Privilegio $privilegio)
    {
        $this->authorize('admin.privilegio.show', $privilegio);

        // TODO your code goes here
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Privilegio $privilegio
     * @return Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function edit(Privilegio $privilegio)
    {
        $this->authorize('admin.privilegio.edit', $privilegio);

        return view('admin.privilegio.edit', [
            'privilegio' => $privilegio,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdatePrivilegio $request
     * @param  Privilegio $privilegio
     * @return Response|array
     */
    public function update(UpdatePrivilegio $request, Privilegio $privilegio)
    {
        // Sanitize input
        $sanitized = $request->validated();

        // Update changed values Privilegio
        $privilegio->update($sanitized);

        if ($request->ajax()) {
            return ['redirect' => url('admin/privilegios'), 'message' => trans('brackets/admin-ui::admin.operation.succeeded')];
        }

        return redirect('admin/privilegios');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  DestroyPrivilegio $request
     * @param  Privilegio $privilegio
     * @return Response|bool
     * @throws \Exception
     */
    public function destroy(DestroyPrivilegio $request, Privilegio $privilegio)
    {
        $privilegio->delete();

        if ($request->ajax()) {
            return response(['message' => trans('brackets/admin-ui::admin.operation.succeeded')]);
        }

        return redirect()->back();
    }

    }
