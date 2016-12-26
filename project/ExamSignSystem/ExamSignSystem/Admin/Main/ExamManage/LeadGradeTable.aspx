<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeadGradeTable.aspx.cs" Inherits="ExamSignSystem.Admin.Main.ExamManage.LeadGradeTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>导入成绩表</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
      <style type="text/css">
            .report{
                background-color: #EBEEF2;
                width: 500px;
                height:100px;
                margin: auto;
                border-radius: 8px;
                margin-top:40px;
            }
            .reportGrade{
                margin: auto;
                padding-left: 60px; 
                padding-top: 40px;
            }
            .mould{
               width:80px; 
               margin-left:420px; 
               margin-top: -21px; 
            }
            .sub{
                background-color: #337AB7;
                color: white;
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
                    <li>&nbsp;> 考试科目管理 >&nbsp;</li>  
                    <li>导入考试成绩</li>
                </ul>
        </div>
        <div  class='report'> 
            <div class='reportGrade'> 
                <input type="file" name="excel" runat="server" id="fileName"/>
                <input type="submit" value="导入成绩" class='sub' runat="server" onserverclick="Lead_Click"/>
           </div>
            <div class="mould">
                <input type="submit" value="下载模板" class='sub' runat="server" onserverclick="Upload_Click"/>
            </div>
         </div>
    </div>
    </form>
</body>
</html>
