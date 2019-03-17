$(function () {
    $('.isdelete').click(function () {
        console.log('asdfsfas')
        $(this).parent().parent().remove()
        var id = $(this).attr('o_goods')
        var reques_data = {
            'ordersdetail_id':id

        }
        $.get('/remove_orders_goods/',reques_data,function (response) {
            console.log(response)
        })
    })
})