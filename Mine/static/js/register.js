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

    //刷新验证码
    $('.invisibility').click(function () {
        var name = $('#name').val()
        var phone = $('#phone').val()
        var password = $('#password').val()

        request_data = {
            'name':name,
            'phone':phone,
            'password':password
        }
        $.get('/update_data/',request_data,function (response) {
            window.location.reload()
            $('#name').val(response.u_name)
            $('#phone').val(response.u_phone)
            $('#password').val(response.u_password)
        })
    })

    $('#registe').click(function () {
        var isregister = 'true'
        $('.isregise').each(function () {
            var aa = $(this).attr('isrester')
            if (aa == 'false') {
                isregister = 'false'
            }
        })
        if (isregister == 'false') {
            $(this).prev().prev().show()
        } else {
            $('form').submit()
        }
    })

})
