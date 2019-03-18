$(function () {
    $('.isdelete').click(function () {
        $(this).parent().parent().remove()
        var id = $(this).attr('o_goods')
        var reques_data = {
            'ordersdetail_id':id

        }
        $.get('/remove_orders_goods/',reques_data,function (response) {
        })
    })

    $('.pay').click(function () {
        var orders_number = $(this).attr('orders_number')
        var requse_data = {
            'orders_number':orders_number,
        }
        $.get('/pay/',requse_data,function (response) {
            if(response.status == 1){
                window.open(response.alipayurl,target='_self')
            }
        })
    })
})