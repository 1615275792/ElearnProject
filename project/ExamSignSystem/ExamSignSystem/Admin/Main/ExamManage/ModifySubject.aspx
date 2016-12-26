<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifySubject.aspx.cs" Inherits="ExamSignSystem.Admin.Main.ExamManage.ModifySubject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改科目</title>
     <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
      <style type="text/css">
            .big{
              width:750px; 
              height:400px; 
              border:2px solid #05A2DA; 
              border-radius:10px 10px 0px 0px;  
              margin: auto;
              margin-top:40px;
            }
            .top{
               height:40px; 
               background-color:#EBEEF2; 
               font-family:'黑体'; 
               font-size:20px; 
               padding-left:20px; 
               line-height:40px; 
               border-radius:10px 10px 0px 0px; 
            }
           .subLogin{
                width: 350px;
                height:40px;
                margin-top:10px;
                border-radius: 6px;
                background-color:#428BCA;
                font-family: '黑体';
                font-size:22px;
                color: white;
                border:2px solid #428BCA;
                cursor:pointer;
                margin-left:180px;
            }
            .content{
                font-family: '黑体';
                font-size: 18px;
                width:750px;
                height:300px; 
                margin-left:50px; 
                margin-top:40px;
            }
            .content input{
                font-family: '黑体';
                font-size: 18px;
                border-radius: 6px;
                width:300px;
                height:32px
            }
            .title{
                margin-bottom:20px;
            }
        </style>
     <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
     <script src="../../../3rdLibs/Time/Js/lhgcore.js"></script>
     <script src="../../../3rdLibs/Time/Js/lhgcalendar.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <div class="info_top">
                <ul>
                    <li><img alt="" src="../../../Imgs/smallHomebule.png" style=" padding-top:8px;"/></li>
                    <li id='shouye'>首页</li>
                    <li>&nbsp;> 考试报名管理 >&nbsp;</li>  
                    <li>修改科目</li>
                </ul>
        </div>
        <div class='big'>
            <div class="top">
                修改科目
            </div>
            <div style="background-color: white; height:300px;">
                <div class="content">
                    <div class='title' style=" margin-left:180px;">
                            <div>科目名称:</div>
                            <input type="text" required placeholder="输入科目名称" runat="server" id="txtSubjectName"/>
                    </div>
                    <div> 
                          <div class='title' style=" float: left;">
                                <div>报名开始时间:</div>
                                <input type="text" required placeholder="输入开始时间" onclick="J.calendar.get({ to: 'st,min' });" id="et" runat="server"/>
                        </div>
                        <div class='title' style=" float: left;  margin-left:30px;">
                                <div>报名结束时间:</div>
                                <input type="text"  required placeholder="输入结束时间" onclick="J.calendar.get({ to: 'et,max', dir: 'right' });" id="st" runat="server"/>
                        </div>
                    </div>
                    <div> 
                        <div class='title' style=" float: left;">
                                <div>考试时间:</div>
                                <input type="text" required placeholder="输入考试时间" onclick="J.calendar.get({ to: 'st,max', dir: 'left' });" id="txtExamTime" runat="server"/>
                        </div>
                        <div class='title'  style=" float: left; margin-left:30px;">
                                <div>考试地址:</div>
                                <input type="text" required placeholder="输入考试地址" id="txtAddress" runat="server"/>
                        </div>
                    </div>
                    <div>
                         <input type="button" class="subLogin" value="确 定" runat="server" onserverclick="Modify_Click"/> 
                         <input type="hidden" id="subjectID" runat="server"/>
                    </div>
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

