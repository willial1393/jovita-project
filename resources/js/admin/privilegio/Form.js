import AppForm from '../app-components/Form/AppForm';

Vue.component('privilegio-form', {
    mixins: [AppForm],
    data: function() {
        return {
            form: {
                venderProductos:  '' ,
                
            }
        }
    }

});