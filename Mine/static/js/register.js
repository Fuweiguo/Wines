$(function () {
    $('#name').blur(function () {
        var lent = $(this).val().length
        if (!(lent >= 3 && lent <= 6)) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','true')
        }
    })
    $('#phone').blur(function () {
        var phone = $(this).val()
        if (!(/^1[34578]\d{9}$/.test(phone))) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','true')
        }
    })

    $('#password').blur(function () {
        var password = $(this).val()
        if (!(/^[a-zA-Z0-9_-]{4,16}$/.test(password))) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','true')
        }
    })

    $('#password_two').blur(function () {
        var passwordtwo = $(this).val()
        var password = $('#password').val()
        if (password != passwordtwo) {
            $(this).prev().show()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','false')
        } else {
            $(this).prev().hide()
            $(this).removeAttr('isrester')
            $(this).attr('isrester','true')
        }
    })

    $('#registe').click(function () {
        var isregister = 'true'
        $('.isregise').each(function () {
            var aa = $(this).attr('isrester')
            console.log( aa,$(this).attr('name'))
            if (aa == 'false') {
                console.log('丑ｓｓｓｓ')
                isregister = 'false'
            }
        })
        console.log('yyyyyyy')
        if(isregister=='false'){
            $(this).prev().prev().show()
            console.log('1111yyyy')
        }else {
            $('form').submit()
            console.log('22222yy')
        }

    })

})
