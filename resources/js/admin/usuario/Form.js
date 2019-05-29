import AppForm from '../app-components/Form/AppForm';

Vue.component('usuario-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                codigo:  '' ,
                nombre:  '' ,
                contrasena:  '' ,
                estado:  '' ,
                tipo:  '' ,
                email:  '' ,
                privilegios_id:  '' ,
                
            }
        }
    }

});