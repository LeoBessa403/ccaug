$(function () {
    function disabilitaCamposnovaMateria() {
        if ($("#nova_materia").prop('checked')) {
            $("#co_materia").parent(".form-group").hide();
            $("#ds_materia").parent(".form-group").show();
            $("#co_materia").removeClass('ob');
        } else {
            $("#co_materia").parent(".form-group").show();
            $("#ds_materia").parent(".form-group").hide();
            $("#ds_materia").removeClass('ob');
        }
    }

    disabilitaCamposnovaMateria();

    $("#nova_materia").change(function () {
        disabilitaCamposnovaMateria();
    });

});