//find the element with the class of vkeypad
//on focs show a keypad
    //add a background
    //show keypad like a modal
 var vkVal;
 var velem;
$(document).on('focus', '.vkeypad', function(){
    velem = $(this).keydown(false);
    var backdrop = `<div class="backdrop" style="width:100%; top:0; left:0; position: fixed; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1080;"></div>`;
    var allkeys = '';
    for(var i = 1; i < 10; i++){
        allkeys += `<button class="btn btn-info m-1 vkey" value="${i}">${i}</button>`;
    }
    allkeys += '<button class="btn btn-info vkey m-1" value="0">0</button>'+
            '<button class="btn btn-warning m-1" id="vkCancel">Cancel</button>'+
            '<button class="btn btn-primary m-1" id="vkOk">Ok</button>';
    
    var keypad = '<div id="vkeypadbox" class="p-3 bg-white position-fixed rounded" style="top: 30%;left:0px; right:0px; width: 300px; margin: 0 auto; z-index: 1090;">'+
                '<input class="form-control mb-3" id="vkDisplay" type="password">'+ allkeys +'</div>';
    $('body').append(backdrop);
    $('body').append(keypad);
    var display = $('#vkDisplay');
    display[0].focus();
    display.keydown(false);
});
$(document).on('click', '#vkOk', function(){
    vkVal = $('#vkDisplay').val();
    velem.val(vkVal);
    $('.backdrop').remove();
    $('#vkeypadbox').remove();
});
$(document).on('click', '#vkCancel', function(){
    vkVal = $('#vkDisplay').val('');
    velem.val('');
    $('.backdrop').remove();
    $('#vkeypadbox').remove();
});
$(document).on('click', '.vkey', function(){
    $('#vkDisplay').val($('#vkDisplay').val() + $(this).val());
});