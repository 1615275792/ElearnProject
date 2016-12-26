<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExamSignSystem.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考试后台管理系统</title>
    <link href="../AdminCSS/AdminFindPwd.css" rel="stylesheet" />
    <link href="../AdminCSS/AdminLogin.css" rel="stylesheet" />
    <script src="../../Jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
            $(document).ready(function () {
                $('.pwdHeader_right,.back').click(function () {
                    $('.bigBody').css("display", "none");
                    $('.neiceng').css("display", "none");
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
                //Enter事件登录
                $('.txtYanZheng').keydown(function (e) {
                    if (e.which == 13) {
                        $('.subLogin').click();
                    }
                });
                /*
           * 忘记密码 **/
                $('#forget').click(function () {
                    $('.bigBody').css("display", "block");
                    $('.neiceng').css("display", "block");
                    //Enter事件找回密码
                    $('#txtadminAccount,#inEmail').keydown(function (e) {
                        if (e.which == 13) {
                            $('.sure').click();
                        }
                    });
                    $('.sure').click(function () {
                        var adminAccount = $("#txtadminAccount").val();
                        alert(adminAccount);
                        var adminEmail = $("#inEmail").val();
                        if (adminAccount == "" || adminEmail == "") {
                            alert("学号或者邮箱不能为空！");
                        }
                        else {
                            var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email  
                            if (!preg.test(adminEmail)) {
                                alert("请填写正确的邮箱！");
                            }
                            else {
                                $.ajax({
                                    url: "Login.aspx/AdminFindPwd",
                                    type: "POST",
                                    dataType: "json",
                                    async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                                    contentType: "application/json; charset=utf-8",
                                    data: "{adminAccount:'" + adminAccount + "',adminEmail:'" + adminEmail + "'}",
                                    success: function (data) {
                                        if (data.d == "1") {
                                            alert("密码已发送到邮箱,请注意查收！");
                                            location.reload();
                                        }
                                        else {
                                            alert("学号或者邮箱输入错误！");
                                        }
                                    }
                                });
                            }
                        }
                    });
                });
            });
        </script>
</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
    <div>
        <div class="formbackground" style="position:absolute; width:100%; height:100%; z-index:-1">    
                <img src="../../Imgs/login.gif" />     
        </div> 
        <div class="top"> 
                 <div class="center_right_top">
                    <div class="labelAccount"><label>账号</label></div> 
                    <div class="Account">  
                         <input id='loginAccount' type="text"  class="txtAccount" required placeholder=" 请输入管理员账号" runat="server"/>
                   </div>
                </div>
                <div class="center_right_center">
                    <div class="labelPwd"><label>密码</label></div> 
                    <div  class="Pwd">
                     <input id='loginPwd' type="password" placeholder=" 请输入密码" class="txtPwd" runat="server"/> 
                   </div>
                </div>
                 <div class="center_right_end">
                    <div class="labelYanZheng"><label>验证</label></div> 
                    <div  class="YanZheng"><input type="text"  class="txtYanZheng" required placeholder=" 请输入验证码" name="imgId" id="txtVerify" runat="server"/> </div>
                    <div  class="YanZhengMa">  
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../PublicPage/CheckCode.aspx"  alt="验证码,看不清楚?请点击刷新验证码" style="cursor : pointer; height:30px; float:left;" onClick="this.src='../../PublicPage/CheckCode.aspx?t='+(new Date().getTime());"/>
                    </div>
                </div>
                <div>
                     <input type="submit" class="subLogin" value="登 录" runat="server" onserverclick="AdminLogin_Click"/> 
                </div>
                <div class="center_bottom">
                     <div style="float:left; margin-left:-200px; color:red;font-family:'黑体'" id="hint" runat="server"> 
                      </div>
                    <div style="float:left;"> 
                        <a href="#" id="forget">忘了密码?</a>
                   </div>
                </div>
         </div>
    </div>
   <div class="neiceng"></div>
<!-- 找回密码 -->
      <div class="bigBody">
            <div class="pwdHeader">
                <div class="pwdHeader_left">
                    找回密码
                </div>
                <div class="pwdHeader_right" title="关闭">
                    ×
                </div>
            </div> 
              <div class="pwdBottom">
                  <div class="title">
                      提示:请输入登录时填写的电子邮箱 
                  </div>
                    <div class="findPwd">
                        <div class="con">
                           <label>账号</label>
                           <input type="text" placeholder="输入账号" class="sno" id="txtadminAccount"/><span>***</span>
                        </div>
                        <div class="con">
                            <label>邮箱</label>
                            <input type="email" placeholder="输入邮箱" id='inEmail'/><span>***</span>
                        </div>
                    <div>
                    <div class="pwdEnd">
                        <div class="pwdSure">
                            <img src='../../Imgs/icon_correct.png'/>
                            <input type="button" value="确定" class="sure" />
                        </div>
                        <div class="pwdBack"> 
                            <img src='../../Imgs/bk.png'/>
                            <input type="button" value="返回登录" class="back"/>
                        </div>
                    </div>
                </div>
            </div>
          </div>
      </div>
    </form>
</body>
</html>
