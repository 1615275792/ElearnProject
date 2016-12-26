<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportSignTable.aspx.cs" Inherits="ExamSignSystem.Admin.Main.ExamManage.ExportSignTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>导出报名表</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
    <style type="text/css">
             .excelBottom{
                background-color: #EBEEF2;
                width: 500px;
                height:180px;
                margin: auto;
                border-radius: 8px;
                margin-top:40px;
             }
            .txtName{
                width:220px; 
                height:30px; 
                border: 2px solid #aaa; 
                border-radius:5px;
                font-size: 16px;
                margin-top:10px;
            }
            .excelBottom label{
                padding-left:10px;
                color: #333333;
                font-size:18px;
                font-family:'黑体';
            }
            .name{
                margin-left:70px;
            }
          .btnSure{
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
            .name span{
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
                    <li>&nbsp;> 考试科目管理 >&nbsp;</li>  
                    <li>导出报名表</li>
                </ul>
        </div>
        <div class="excelBottom">
            <div class="title">
                提示:请输入正确的科目名称,用于导出该科目的报名情况
            </div>
            <div class="name">
                    <div>
                        <label>科目名称</label>
                        <input type="text" required placeholder="输入科目名称" class="txtName" id="txtsubjectName" runat="server"/> 
                    </div>
                    <div>
                        <div class="excelEnd">
                            <input type="submit" value="导 出" class="btnSure" runat="server" onserverclick="Export_Click"/>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
