function getValue(input, place){
	var val = $(input).val();
	$(place).html(val);
}
$(function(){
	$('.aritimeForm').submit(function(){
		event.preventDefault();
	});
})