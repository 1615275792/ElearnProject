<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifySignInfo.aspx.cs" Inherits="ExamSignSystem.Student.Main.SignManage.ModifySignInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改报名信息</title>
    <link href="../../StuCss/Commom.css" rel="stylesheet" />
      <style type="text/css">
            .info_warm{
                 padding-top: 20px;
                 font-family:'黑体'; 
                 font-size: 18px;
                 width:400px;
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
        <script>
            $(document).ready(function () {
                //判断s手机号（只能输入数字）
                $("#txtMobile").keyup(function () { //keyup事件处理 
                    var snoValue = $('#txtMobile').val();
                    if (snoValue.length === 0) {
                        alert("手机号不能为空");
                    }
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).bind("paste", function () { //CTR+V事件处理 
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).css("ime-mode", "disabled"); //CSS设置输入法不可用
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
                    <li>修改报名信息</li>
                </ul>
        </div>
        <div class="info_warm"><span>提示:</span>&nbsp;为了您方便报名考试,请核对您的报名信息</div>
        <div class="bottom">
            <table>
                  <tr>
                    <td>学号</td>
                    <td colspan="3">
                        <input type="text" required placeholder="输入学号" id="txtSno" disabled="disabled" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td>姓名</td>
                    <td colspan="3">
                        <input type="text" required placeholder="输入姓名" class="name" id="txtName" runat="server"/> 
                    </td>
                </tr>
                 <tr>
                    <td>联系电话</td>
                    <td colspan="3">
                        <input type="text" required placeholder="输入学号" class="mobile" id="txtMobile" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>所属专业</td>
                    <td colspan="3">
                        <input type="text" required placeholder="所属专业" id="txtMajor" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td>所属班级</td>
                    <td colspan="3">
                        <input type="text" required placeholder="所属班级" id="txtClass" runat="server"/>
                    </td>
                </tr>
            </table>
           <div>
            <div class="btnS">
                <input type="button" value="确认修改" class="btnSureModify" runat="server" onserverclick="ModifySign_Click"/>
            </div>
            <div class="btnC"> 
                <input type="button" value="返回" class="btnBack" onclick="javascript: history.back(-1);"/>
            </div>
        </div>
       </div>
    </div>
  </form>
</body>
</html>
