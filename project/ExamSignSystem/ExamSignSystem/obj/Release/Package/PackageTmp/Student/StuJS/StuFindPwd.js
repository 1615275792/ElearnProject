$(document).ready(function () {
    $('.pwdHeader_right,.back').click(function () {
        $('.bigBody').css("display", "none");
        $('.neiceng').css("display", "none");
    });
    $('#forget').click(function () {
        $('.bigBody').css("display", "block");
        $('.neiceng').css("display", "block");
        $('#inEmail').keyup(function () {
            var emailValue = $('#inEmail').val();
            var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email  
            if (emailValue === '' || !preg.test(emailValue)) {
                alert("请填写正确的邮箱！");
            }
        });
        //判断学号（只能输入数字）
        $(".sno").keyup(function () { //keyup事件处理 
            $(this).val($(this).val().replace(/\D|^0/g, ''));
        }).bind("paste", function () { //CTR+V事件处理 
            $(this).val($(this).val().replace(/\D|^0/g, ''));
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用
    });
    //鼠标拖动div
    $('.pwdHeader').mousedown(function (e) {
        $(this).css("cursor", "move");//改变鼠标指针的形状 
        var isMove = true;
        //offset() 方法设置或返回被选元素 相对于文档的偏移坐标
        //pageX() 属性是鼠标指针的位置，相对于文档的左边缘。
        //pageY() 属性是鼠标指针的位置，相对于文档的上边缘。
        var page_x = e.pageX - $('.bigBody').offset().left;
        var page_y = e.pageY - $('.bigBody').offset().top;
        $(this).mousemove(function (ev) {
            if (isMove) {
                $('.bigBody').css({ 'left': ev.pageX - page_x, 'top': ev.pageY - page_y });
            }
        }).mouseup(function () {
            isMove = false;
            $(this).css("cursor", "");
        });
    });
});