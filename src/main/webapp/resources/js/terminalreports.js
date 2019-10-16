/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

console.log('bhguhygu');
$(document).on('show.bs.modal', '#terminalreportsdownload', function (event) {
    var button = $(event.relatedTarget);
    var modal = $(this);
    var terminal_id = button.data('terminal_id');
    console.log(terminal_id);
    modal.find('[name=terminal_id]').val(terminal_id);
});