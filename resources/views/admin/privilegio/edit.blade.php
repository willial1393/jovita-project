@extends('brackets/admin-ui::admin.layout.default')

@section('title', trans('admin.privilegio.actions.edit', ['name' => $privilegio->id]))

@section('body')

    <div class="container-xl">

        <div class="card">

            <privilegio-form
                :action="'{{ $privilegio->resource_url }}'"
                :data="{{ $privilegio->toJson() }}"
                inline-template>
            
                <form class="form-horizontal form-edit" method="post" @submit.prevent="onSubmit" :action="this.action" novalidate>

                    <div class="card-header">
                        <i class="fa fa-pencil"></i> {{ trans('admin.privilegio.actions.edit', ['name' => $privilegio->id]) }}
                    </div>

                    <div class="card-body">

                        @include('admin.privilegio.components.form-elements')

                    </div>

                    <div class="card-footer">
	                    <button type="submit" class="btn btn-primary" :disabled="submiting">
		                    <i class="fa" :class="submiting ? 'fa-spinner' : 'fa-download'"></i>
		                    {{ trans('brackets/admin-ui::admin.btn.save') }}
	                    </button>
                    </div>

                </form>

        </privilegio-form>

    </div>

</div>

@endsection