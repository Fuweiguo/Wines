$(function () {
    //头部下拉框
    $('.h_b_b_title').mouseenter(function () {
        $('.h_b_b_t_nav').show();
    })
    $('.h_b_b_title').mouseleave(function () {
        $('.h_b_b_t_nav').hide();
    })
    //中间商品详情
    //小图片效果
    $('.content ul li').eq(0).addClass('select').siblings().addClass('select1');
    $('.content ul li').mouseenter(function () {
        $(this).addClass('select').siblings().removeClass('select').addClass('select1');
        $('.c_i_l_top img').attr('src', $(this).children('img').attr('src'));
        $('.bigImg').attr('src', $(this).children('img').attr('src'));
    })
    //左侧小图片转动按钮
    $('.left').click(function () {
        var left = $('.content ul').position().left
        left += 75;
        if (left >= 0) {
            left = 0;
            i--;
            if (i <= 0) {
                i = 0;
            }
            $('.content ul').css('left', left + "px");
            return;
        }
        $('.content ul').css('left', left + "px");
        i--;
    })
    //右侧小图片转动按钮
    var i = 0;
    $('.right').click(function () {
        var right = $('.content ul').position().left
        right -= 75;
        if (i >= $('.content ul li').length - 1) {
            return;
        }
        i++;
        $('.content ul').css('left', right + "px")
    })
    //放大镜效果
    var _smallImg = $(".smallImg"); //小图
    var _smallArea = $(".smallArea"); //小区域
    var _bigImg = $(".bigImg"); //大图
    var _bigArea = $(".bigArea"); //大区域
    //计算小区域_smallArea的宽高
    _smallArea.width(_smallImg.width() / _bigImg.width() * _bigArea.width());
    _smallArea.height(_smallImg.height() / _bigImg.height() * _bigArea.height());
    //放大系数(放大倍数)
    var scale = _bigImg.width() / _smallImg.width();
    //鼠标移动
    $(document).mousemove(function (e) {

        var leftSide = _smallImg.offset().left; //小图左边界
        var rightSide = leftSide + _smallImg.width(); //小图右边界
        var topSide = _smallImg.offset().top; //小图上边界
        var bottomSide = topSide + _smallImg.height(); //小图下边界
        //判断鼠标在小图中间
        if (e.pageX > leftSide && e.pageX < rightSide && e.pageY > topSide && e.pageY < bottomSide) {
            _smallArea.show(); //显示小区域
            _bigArea.show();  //显示大区域
            //移动小区域, 跟随鼠标移动
            var x = e.pageX - _smallImg.offset().left - _smallArea.width() / 2;
            var y = e.pageY - _smallImg.offset().top - _smallArea.height() / 2;
            //判断x不超出左边界,也不超出右边界
            if (x < 0) {
                x = 0;
            }
            else if (x > _smallImg.width() - _smallArea.width()) {
                x = _smallImg.width() - _smallArea.width();
            }
            //判断y不超出上边界,也不超出下边界
            if (y < 0) {
                y = 0;
            }
            else if (y > _smallImg.height() - _smallArea.height()) {
                y = _smallImg.height() - _smallArea.height();
            }
            _smallArea.css({left: x, top: y});
            //移动大图
            _bigImg.css({left: -x * scale, top: -y * scale});
        }
        else {
            _smallArea.hide();//隐藏小区域
            _bigArea.hide();  //隐藏大区域
        }
    })


    $('.c_i_c_b_right_a1').click(function () {
        var $user = $(this).attr('user')
        var $isnum = parseInt($('#num').html())
        var $goods = '/addgoods/' + $(this).attr('goods')
        //  $user = $(this).attr('user')   1 有用户　　０没用户
        if ($user == 1) {
            if ($isnum != 0) {
                reques_data = {
                    'num':$isnum
                }
                $.get($goods,reques_data ,function (response) {
                    $('#num').html(0)
                    // sta 1 购物车中有该商品　\\ 0购物车中没该商品
                    console.log(response )
                })
            }
        } else {
            window.open('/login/')
        }
    })


    $('.c_i_c_b_left > a:first').click(function () {
        console.log('bbbbbbbbbbb')

        var $num = parseInt($('#num').html())
        $num = $num + 1
        $('#num').html($num)

    })


    $('.c_i_c_b_left > a:last').click(function () {
        console.log('ssssss')
        var $num = parseInt($('#num').html())
        if ($num == 0) {
            $('#num').html($num)
        } else {
            $num = $num - 1
            $('#num').html($num)
        }
    })
})



















