$(function () {
    $('#name').blur(function () {
        var lent = $(this).val().length
        if (!(lent >= 3 && lent <= 6)) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'true')
        }
    })
    $('#phone').blur(function () {
        var phone = $(this).val()
        var $this = $(this)
        if (!(/^1[34578]\d{9}$/.test(phone))) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'true')
            requet_data = {
                'phone': phone
            }
            $.get('/is_register/', requet_data, function (response) {
                if (response.msg == 1) {
                    $this.prev().html(response.status)
                    $this.prev().show()
                }

            })
        }
    })

    $('#password').blur(function () {
        var password = $(this).val()
        if (!(/^[a-zA-Z0-9_-]{4,16}$/.test(password))) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'true')
        }
    })

    $('#password_two').blur(function () {
        var passwordtwo = $(this).val()
        var password = $('#password').val()
        if (password != passwordtwo) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester', 'true')
        }
    })

    //验证码
    $('#code').blur(function () {
        $this = $(this)
        reques_data = {
            'code': $this.val()
        }
        $.get('/code/', reques_data, function (response) {
            console.log(response)
            //验证失败
            if (response.msg == 0) {
                $this.prev().show()
                $this.removeAttr('isrester')
                $this.attr('isrester', 'false')
            } else {
                $this.prev().hide()
                $this.removeAttr('isrester')
                $this.attr('isrester', 'true')
            }
        })
    })

    $('#registe').click(function () {
        var isregister = 'true'
        $('.isregise').each(function () {
            var aa = $(this).attr('isrester')
            console.log(aa, $(this).attr('name'))
            if (aa == 'false') {
                isregister = 'false'
            }
        })
        console.log('yyyyyyy')
        if (isregister == 'false') {
            $(this).prev().prev().show()
        } else {
            $('form').submit()
        }
    })

})
