var cards = document.getElementsByClassName("card");
var updatedOrder = [];

var setPositions = function(){
    $(".card").each(function(ele){
        $(this).attr('data-pos', ele + 1);
        
    });
    // Array.prototype.forEach.call(cards, function(card){ how to use foreach on a nodeList
    //     console.log(card)
    // })
};


// let ready = function(){
//     setPositions();
//     $('.sortable').sortable();
//     $('.sortable').sortable().bind('sortupdate');
    
//     setPositions();
//     $('div[data-id]').each(function(ele){
//         console.log($(this).data.id)
//         updatedOrder.push(this);
//     });
//     $.ajax({
//         type: "PUT",
//         url: "/portfolios/sort",
//         data: updatedOrder
//     });
// }; 

// $(document).ready(ready);

var ready = function(){
    setPositions();
    $('.sortable').sortable();
    $('.sortable').sortable().bind('sortupdate', function(event, ui){
        setPositions();
        $('div[data-id]').each(function(ele){
            updatedOrder.push({
                id: $(this).data("id"), 
                position: ele + 1
            });  
        });
        $.ajax({
            beforeSend: function(xhr){
                xhr.setRequestHeader("X-CSRF-Token", $('meta[name="csrf-token"]').attr('content'))
            },
            type: "PUT",
            url: "portfolios/sort",
            data: {
                order: updatedOrder
            }
        });
    });
};


$(document).ready(ready);