<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyInfo.aspx.cs" Inherits="ExamSignSystem.Student.Main.PersonManage.ModifyInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改个人信息</title>
    <link href="../../StuCss/Commom.css" rel="stylesheet" />
     <style type="text/css">
            .info_warm{
                 padding-top: 20px;
                 font-family:'黑体'; 
                 font-size: 18px;
                 width:500px;
                 margin: auto;
            }
            .info_warm span{
                color: red;
            }
            .bottom{
                width: 500px;
                height:400px;
                margin: auto;
                border-radius: 0px 0px 8px 8px;
                margin-top:20px;
            }
            table{
                background-color:#EBEEF2;
                width: 420px;
                border: 2px solid #ccc;
                height: 360px;
                border-radius: 8px;
                margin: auto;
            }
            tr input{
                width:260px; 
                height:30px; 
                border: 2px solid #aaa; 
                border-radius:5px;
                font-size: 16px;
            }
            tr td{
                padding-left:10px;
                color: #333333;
                font-size:16px;
                font-family:'黑体';
                font-weight: bolder;
            }
            span.inputMobile,span.inputEmail{
                font-size: 14px;
                position: relative;
                top:-12px;
                left:86px;
                color: #999999;
            }
            .btnSureModify{
                width:100px;
                height:36px;
                line-height: 32px;
                text-align: center;
                border-radius: 6px;
                background-color:#428BCA;
                font-family: '黑体';
                font-size:20px;
                color: white;
                border:2px solid #428BCA;
                cursor:pointer;
            }
           .btnBack{
                width: 80px;
                height:36px;
                line-height: 32px;
                text-align: center;
                border-radius: 6px;
                background-color:#428BCA;
                font-family: '黑体';
                font-size:20px;
                color: white;
                border:2px solid #ccc;
                cursor:pointer;
            }
            .trMobile,.trEmail{
               height: 20px;
            }
            .sp{
                color:red;
                font-family: '黑体';
            }
            .btnS{
                float: left;
                width:60px;
                margin-left: 100px;
                margin-top: 20px;
            }
            .btnC{
                float: left;
                width:80px;
                margin-left:200px;
                margin-top: 20px;
            }
        </style>
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.inputMobile').hide();
                $('.inputEmail').hide();
                //判断手机号（只能输入数字）
                $("#txtMobile").keyup(function () { //keyup事件处理 
                    var snoValue = $('#txtMobile').val();
                    if (snoValue.length === 0) {
                        $('.inputMobile').show();
                    }
                    else {
                        $('.inputMobile').hide();
                    }
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).bind("paste", function () { //CTR+V事件处理 
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).css("ime-mode", "disabled"); //CSS设置输入法不可用
                $('#txtMobile').blur(function () {
                    var snoValue = $('#txtMobile').val();
                    if (snoValue.length === 0) {
                        $('.inputMobile').show();
                    }
                    else {
                        $('.inputMobile').hide();
                    }
                });
                //判断邮箱
                $("#email").keyup(function () { //keyup事件处理 
                    var emailValue = $('#email').val();
                    var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email
                    if (emailValue.length === 0) {
                        $('.inputEmail').show();
                        $("#email").focus();
                    }
                    else {
                        $('.inputEmail').hide();
                        if (!preg.test(emailValue)) {
                            alert("请填写正确的邮箱！");
                            $('#email').val("").focus();
                        }
                    }
                });
                $('#email').blur(function () {
                    var snoValue = $('#email').val();
                    if (snoValue.length === 0) {
                        $('.inputEmail').show();
                    }
                    else {
                        $('.inputEmail').hide();
                    }
                });
            });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div class="info_top">
                <ul>
                    <li><img alt="" src="../../../Imgs/smallHomebule.png" style=" padding-top:8px;"/></li>
                    <li id='shouye'>首页</li>
                    <li>&nbsp;> 个人信息管理 >&nbsp;</li>  
                    <li>修改个人信息</li>
                </ul>
        </div>
        <div class="info_warm"><span>提示:</span>&nbsp;为了您方便找回密码,请填写正确的邮箱(<span>*</span>表示必填项)</div>
        <div class="bottom">
            <table>
                 <tr>
                    <td>姓名</td>
                    <td colspan="3">
                        <input type="text" placeholder="输入姓名" class="name" id="txtName" runat="server"/><span class="sp">*</span>
                    </td>
                </tr>
                 <tr>
                    <td>性别</td>
                    <td colspan="3">
                        <input type="text" placeholder="性别" id="txtSex" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td colspan="3">
                        <input type="text" placeholder="输入手机号" class="mobile" id="txtMobile" runat="server"/><span class="sp">*</span>
                    </td>
                </tr>
                <tr class="trMobile">
                    <td colspan="4">
                        <span class="inputMobile">请输入手机号</span>
                    </td>
                </tr>
                <tr>
                    <td>电子邮箱</td>
                    <td colspan="3">
                        <input type="text"  placeholder="输入邮箱" id="email" runat="server"/><span class="sp">*</span>
                    </td>
                </tr>
                <tr class="trEmail">
                    <td colspan="4">
                        <span class="inputEmail"> 请输入正确的邮箱,用于找回密码</span>
                    </td>
                </tr>
                 <tr>
                    <td>家庭住址</td>
                    <td colspan="3">
                        <input type="text" placeholder="家庭住址" id="txtAddress" runat="server"/>
                    </td>
                </tr>
            </table>
           <div>
            <div class="btnS">
                <input type="button" value="确认修改" class="btnSureModify" runat="server" onserverclick="SureModify_Click"/>
            </div>
            <div class="btnC"> 
                <input type="button" value="返回" class="btnBack" onclick=" location.href = 'LookInfo.aspx'"/>
            </div>
        </div>
       </div>
    </div>
    </form>
</body>
</html>
