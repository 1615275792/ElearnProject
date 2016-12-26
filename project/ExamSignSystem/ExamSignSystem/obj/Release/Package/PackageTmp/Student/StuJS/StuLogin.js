/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 $(document).ready(function(){
               var txtArray=new Array();
               $('#marquee li a').each(function(){
                   txtArray.push($(this).attr("title"));
               });
               for(var j=0;j<txtArray.length;j++){
                   if(txtArray[j].length<=25){
                        $("#marquee li #span"+(j+1)+"").html(txtArray[j]);
                   }
                   else{
                      var txtSub=txtArray[j].substr(0,25);
                      txtSub+="...";
                      $("#marquee li #span"+(j+1)+"").html(txtSub);
                   }
               }
               //Enter事件登录
               $('.txtYanZheng,.checkPwd').keydown(function (e) {
                   if (e.which == 13) {
                       $('.subLogin').click();
                   }
               });
               $('.pwdHeader_right,.back').click(function(){
                   $('.bigBody').css("display","none");
                   $('.neiceng').css("display","none");
                   location.reload();
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
               $('.annnuciate').click(function () {
                   var id = $(this).attr('id');
                   layer.open({
                       type: 2,
                       area: ['760px', '465px'],
                       skin: 'layui-layer-rim', //加上边框
                       content: ['ShowAnnunciate.aspx?msgID=' + id + '']
                   });
               });
      });
