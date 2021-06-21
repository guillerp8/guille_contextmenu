$(function(){
    document.onkeydown = function (k) {
        if (k.which == 27) {
            $("#all").fadeOut(500)
            $("tr").remove().fadeOut(1000)
            $("span").remove().fadeOut(1000)
            $(".arrow").remove().fadeOut(1000)
            
            $.post('https://guille_contextmenu/close', JSON.stringify({}))
        }
    }
    window.addEventListener("message", function(event) {
        let v = event.data
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
            `)
            for (var i = 0; i < v.data.length; i++) {

                $("#menu-table").append(`
                <tr class="te" text="${v.data[i]['text']}" execute="${v.data[i]['toDo']}"> 
                    <td class="table-container" id="table-container">
                        <th class="table-code" id="table-code">${v.data[i]['text']}</th>
                    </td>
                </tr>
                <tr class="space"></tr> 
                `)
            }
            if (v.useCoords == true) {
                $(".toAppend").append(`<div class="arrow"></div>`)
            }
            $("#all").fadeIn(500)
        }
        $('.te').on('click', function () {
            $("#all").fadeOut(500)
            $("tr").remove().fadeOut(1000)
            $("span").remove().fadeOut(1000)
            $(".arrow").remove().fadeOut(1000)
            $.post('https://guille_contextmenu/close', JSON.stringify({}))
            $.post('https://guille_contextmenu/interact', JSON.stringify({
                text : $(this).attr('text'),
                execute : $(this).attr('execute'),
            }));
        });
    })
})

document.addEventListener("DOMContentLoaded", function(event) {
    const element = document.getElementById("all")
    element.style = "display:none"
});