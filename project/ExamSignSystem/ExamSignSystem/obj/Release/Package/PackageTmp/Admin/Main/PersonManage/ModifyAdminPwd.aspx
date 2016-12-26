<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyAdminPwd.aspx.cs" Inherits="ExamSignSystem.Admin.Main.PersonManage.ModifyAdminPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改密码</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
    <style type="text/css">
             .pwdBottom{
                background-color: #EBEEF2;
                width: 500px;
                height:220px;
                margin: auto;
                border-radius: 8px;
                margin-top:40px;
             }
            .surePwd,.newPwd{
                width:220px; 
                height:30px; 
                border: 2px solid #aaa; 
                border-radius:5px;
                font-size: 16px;
                margin-top:10px;
            }
            .pwdBottom label{
                padding-left:10px;
                color: #333333;
                font-size:18px;
                font-family:'黑体';
            }
            .modify{
                margin-left:70px;
            }
            .pwdEnd{
                margin-top:10px;
                margin-left:60px;   
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
                margin-top:14px;
                margin-left: 30px;
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <div class="info_top">
                <ul>
                    <li><img alt="" src="../../../Imgs/smallHomebule.png" style=" padding-top:8px;"/></li>
                    <li id='shouye'>首页</li>
                    <li>&nbsp;> 个人信息管理 >&nbsp;</li>  
                    <li>修改密码</li>
                </ul>
        </div>
        <div class="pwdBottom">
            <div class="title">
                提示:请记住修改后的密码 
            </div>
            <div class="modify">
                <div>
                    <label> &nbsp;&nbsp;新密码</label>
                    <input type="password" required placeholder="输入新密码" class="newPwd" id="newPassword" runat="server"/> 
                </div>
                <div>
                    <label>确认密码</label>
                    <input type="password" required placeholder="输入确认密码"  class="surePwd" id="surePassword" runat="server"/> 
                </div>
                <div>
                    <div class="pwdEnd">
                        <input type="button" value="确 定" class="sure" runat="server" onserverclick="ModifyPwd_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
