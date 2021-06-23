$(function() {
    document.onkeydown = function(k) {
        if (k.which == 27) {
            
            $("#all").addClass('cerrarmenu').fadeOut(400, function() {
                cleanMenu();
                $(this).removeClass('cerrarmenu');
                $.post('https://guille_contextmenu/close', JSON.stringify({}))
            });
           
        }
    }
    window.addEventListener("message", function(event) {
        // COMPRUEBA SI HAY ALGÚN MENÚ AUN CARGADO Y SI LO HAY, ESPERA A QUE SE OCULTE EL ANTERIOR
        if($(".te").length==0){
            drawMenu(event.data);
        } else {
            setTimeout( function(){
                drawMenu(event.data);
            }, 500);
        }
    });
});

document.addEventListener("DOMContentLoaded", function(event) {
    const element = document.getElementById("all")
    element.style = "display:none"
});

function cleanMenu() {
    $(".te").remove();
    $("span").remove();
    $(".arrow").remove();
}


function drawMenu(v){
        if (v.title) {
            if (v.useCoords == true) {
                $("#all").css("left", v.x + "%")
                $("#all").css("top", v.y + "%")
            } else {
                $("#all").css("left", "60%")
                $("#all").css("top", "30%")
            }
            $("#menu").append(`
                <span class="title">${v.title}</span>
            `);
            for (var i = 0; i < v.data.length; i++) {
                let icono = 'fa-chevron-circle-right';
                if (v.data[i]['icon'] != undefined) {
                    icono = v.data[i]['icon'];
                }

                let delay = i/10;  //DELAY DE ANIMACIÓN AL MOSTRAR LISTA 
                $("#menu-container").append(`
                <div class="te table-code hvr-rectangle-out hvr-icon-forward" style="animation-delay:${delay}s" text="${v.data[i]['text']}" execute="${v.data[i]['toDo']}"> 
                ${v.data[i]['text']}<i class="fas ${icono}"></i>
                </div>
                
                `);
                if (i == v.data.length - 1) {
                    if (v.useCoords == true) {
                        $(".toAppend").append(`<div class="arrow"></div>`)
                    }
                    $("#all").fadeIn(500)
                }
            }

        }
        $('.te').off('click').on('click', function() {
            $("#all").addClass('cerrarmenu').fadeOut(400, function() {
                cleanMenu();
                $(this).removeClass('cerrarmenu');
            });

            $.post('https://guille_contextmenu/close', JSON.stringify({}))
            $.post('https://guille_contextmenu/interact', JSON.stringify({
                text: $(this).attr('text'),
                execute: $(this).attr('execute'),
            }));
        });
    
}