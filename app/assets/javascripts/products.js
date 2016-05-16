
$('.dropdown-toggle').dropdown();
$('#velicina li').on('click', function() {
    $('#velicina-naziv').html($(this).find('a').html());
});​
