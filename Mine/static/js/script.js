// $(function () {
//     console.log('8888888')
//     $('img').each(function () {
//         var img_url = $(this).attr('srt')
//         img_url = "{% static '" + img_url + "' %}"
//         $(this).attr('srt',img_url)
//     })
//

// })
$(function () {
     $('img').each(function () {
        var img_url = $(this).attr('src')
        img_url = "{% static '" + img_url + "' %}"
        $(this).attr('src',img_url)
    })
    console.log($('body').html())
})