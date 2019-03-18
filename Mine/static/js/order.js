$(function () {
    $('.remove').click(function () {
        var orders_id = $(this).attr('orders_id')
        var $this = $(this)
        reques_data = {
            'orders_id':orders_id
        }
        $.get('/remove_orders/',reques_data,function (response) {
            $this.parent().parent().remove()
        })
    })
})