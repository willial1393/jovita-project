<div class="form-group row align-items-center" :class="{'has-danger': errors.has('venderProductos'), 'has-success': this.fields.venderProductos && this.fields.venderProductos.valid }">
    <label for="venderProductos" class="col-form-label text-md-right" :class="isFormLocalized ? 'col-md-4' : 'col-md-2'">{{ trans('admin.privilegio.columns.venderProductos') }}</label>
        <div :class="isFormLocalized ? 'col-md-4' : 'col-md-9 col-xl-8'">
        <input type="text" v-model="form.venderProductos" v-validate="'required'" @input="validate($event)" class="form-control" :class="{'form-control-danger': errors.has('venderProductos'), 'form-control-success': this.fields.venderProductos && this.fields.venderProductos.valid}" id="venderProductos" name="venderProductos" placeholder="{{ trans('admin.privilegio.columns.venderProductos') }}">
        <div v-if="errors.has('venderProductos')" class="form-control-feedback form-text" v-cloak>@{{ errors.first('venderProductos') }}</div>
    </div>
</div>


