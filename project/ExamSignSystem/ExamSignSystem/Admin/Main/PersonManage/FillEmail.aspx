<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillEmail.aspx.cs" Inherits="ExamSignSystem.Admin.Main.PersonManage.FillEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>填写邮箱</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
      <style type="text/css">
             .emailBottom{
                background-color: #EBEEF2;
                width: 500px;
                height:200px;
                margin: auto;
                border-radius: 8px;
                margin-top:100px;
             }
            .txtEmail{
                width:220px; 
                height:30px; 
                border: 2px solid #aaa; 
                border-radius:5px;
                font-size: 16px;
                margin-top:10px;
            }
            .emailBottom label{
                padding-left:10px;
                color: #333333;
                font-size:18px;
                font-family:'黑体';
            }
            .modify{
                margin-left:70px;
                margin-top:20px;
            }
          .sure{
                width:220px;
                height:36px;
                border-radius: 10px;
                background-color:#428BCA;
                font-family: '黑体';
                font-size:18px;
                color: white;
                border:2px solid #428BCA;
                cursor:pointer;
                text-align: center;
                margin-top:24px;
                margin-left:90px;
            }
            .title{
                 width:500px;
                 height:30px;
                 text-align: center;
                 font-family:'黑体';
                 font-size:18px;
                 color: red; 
                 padding-top:20px; 
            }
            .modify span{
                color:red;
                font-family: '黑体';
            }
        </style>
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
              $(document).ready(function () {
                  //判断邮箱
                  $(".sure").click(function () {
                      var emailValue = $('#email').val();
                      var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email
                      if (emailValue.length === 0) {
                          alert("请填写邮箱！")
                      }
                      else {
                          if (!preg.test(emailValue)) {
                              alert("请填写正确的邮箱！");
                              $('#email').val("").focus();
                          }
                          else {
                              $.ajax({
                                  url: "FillEmail.aspx/WriteEamil",
                                  type: "POST",
                                  dataType: "json",
                                  async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                                  contentType: "application/json; charset=utf-8",
                                  data: "{emailValue:'" + emailValue + "'}",
                                  success: function (data) {
                                      if (data.d == "1") {
                                          alert("邮箱填入成功！");
                                          location.reload();
                                      }
                                      else {
                                          alert("失败！");
                                      }
                                  }
                              });
                          }
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
                    <li>&nbsp;>填写个人电子邮箱</li>  
                </ul>
        </div>
        <div class="emailBottom">
            <div class="title">
                提示:请填写正确的邮箱,用于找回密码<br />
                    &nbsp;  &nbsp;(已填写的不需要重复填写)
            </div>
            <div class="modify">
                <div>
                    <label>电子邮箱</label>
                    <input type="text" placeholder="输入电子邮箱" class="txtEmail" id="email" runat="server"/> 
                </div>
                <div>
                    <div class="pwdEnd">
                        <input type="button" value="确 定" class="sure" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
