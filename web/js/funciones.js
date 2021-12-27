
function siguienteCampo(actual,siguiente,preventDefault){
    $(actual).keydown(function(event){
        if(event.which===13){
            if(preventDefault){
                event.preventDefault();
            }
            $(siguiente).focus();
            $(siguiente).focus();
        }
    });
}

