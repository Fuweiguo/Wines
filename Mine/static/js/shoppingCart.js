$(function () {
    total()

    //显示总价钱
    function total() {
        var $totals = 0
        $('.cart_message1_content > ul').each(function () {
            var $pricestr = $(this).children('.cart_message1_content_li2').html()
            var $price = parseFloat($pricestr.substring(1, $pricestr.length))
            var $number = parseInt($(this).children('.cart_message1_content_li3').children().val())
            var $total = Math.floor($price * $number * 100) / 100
            $totals += ($price * $number)
            $(this).children('.cart_message1_content_li4').html($total.toFixed(2))
        })
        $('#totals').html('￥' + $totals.toFixed(2))
        $('.end > ul>li>em').html('￥' + $totals.toFixed(2))
        console.log($totals, $('#totals'))
    }


    //减
    $('.minus').click(function () {
        var $cartsid = parseInt($(this).attr('cartsid'))
        var $num = parseInt($(this).prev().children().val())
        var $this = $(this)
        console.log($cartsid, '数量', $num)
        reques_data = {
            'cartsid': $cartsid,
            'num': $num
        }
        if ($num <= 1) {
            $.get(/minus_carts_goods/, reques_data, function (response_data) {
                console.log(response_data)
                $($this).parent().parent().remove()
                total()
                $('.cart_message1_bottom > div em').html(response_data.counts)
                if (response_data.counts == 0 || response_data.counts == '0') {
                    console.log('减　进了')

                    $($this).parent().parent().hide()
                    total()
                    isnot()
                }
            })

        } else {
            $.get(/minus_carts_goods/, reques_data, function (response_data) {
                console.log(response_data)
                $($this).prev().children().val(response_data.num)
                total()
                $('.cart_message1_bottom > div em').html(response_data.counts)
            })
        }
    })


    //加
    $('.add').click(function () {
        var $cartsid = parseInt($(this).attr('cartsid'))
        var $this = $(this)
        console.log($cartsid)
        reques_data = {
            'cartsid': $cartsid
        }
        $.get('/add_carts_goods/', reques_data, function (response_data) {
            console.log(response_data)
            $($this).prev().prev().children().val(response_data.num)
            total()
            $('.cart_message1_bottom > div em').html(response_data.counts)
        })
    })


    //删
    $('.cart_message1_content_li5').click(function () {
        var $cartsid = parseInt($(this).attr('cartsid'))
        var $this = $(this)
        console.log($cartsid)
        reques_data = {
            'cartsid': $cartsid
        }
        $.get('/remove_carts_goods/', reques_data, function (response_data) {
            console.log('counts',typeof(response_data.counts))
            if (response_data.counts == 0 || response_data.counts == '0') {
                $($this).parent().parent().hide()
                total()
                console.log('进了')
                isnot()
            }
            $('.cart_message1_bottom > div em').html(response_data.counts)
            $($this).parent().parent().remove()
            total()
        })
    })
    function isnot() {
        $('.end > ul>li>em').children().html('￥ 00.00')
        $('.cart_message1_bottom > div em').html('0')
        $('.cart_message1_bottom span').html('￥ 00.00')
    }
})


