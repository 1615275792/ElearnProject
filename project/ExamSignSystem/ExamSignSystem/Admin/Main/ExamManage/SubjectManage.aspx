<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectManage.aspx.cs" Inherits="ExamSignSystem.Admin.Main.ExamManage.SubjectManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考试科目管理</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
    <style type="text/css">
         table{
                width:1000px;
                border:1px solid #05A2DA;
                margin:auto;
                border-collapse:collapse;
            }
            td{
                border:1px solid #05A2DA;
                text-align: center;
            }
            .center{
                text-align: center;
            }
            table tr:first-child{
                background-color: #F9FAFA;
            }
            table tr:nth-child(even){background:#F4F4F4;}
            .btnDel,.btnModify{
                width:60px;
                height: 30px;
                border-radius: 6px;
                background-color: #CCC;
                font-family: '黑体';
                cursor:pointer;
            }
            .btnDelete{
                width:60px;
                height: 30px;
                border-radius: 6px;
                background-color: #CCC;
                font-family: '黑体';
                cursor:pointer;
            }
            .btnDel:hover,.btnModify:hover{
                  background-color:#79B35C;
            }
        /*分页控件*/  
        .paginator{  
            font: 11px Arial, Helvetica, sans-serif;  
            padding: 0px 5px 0px 15px;  
            margin: 0px;  
            font-family:'黑体';  
            font-size:18px;  
        }  
  
        /* 页面的背景以及字体*/  
        .paginator a{  
            padding: 1px 6px;  
            border: solid 1px #7EC0EE;  
            text-decoration: none;  
            margin-right: 2px;  
            color:#436EEE;  
        }  
  
        .paginator a:visited{  
            padding: 1px 6px;  
            border: solid 1px #99d6ff;  
            background: #fff;  
            text-decoration: none;  
            color:#4cb8ff;   
        }  
  
        .paginator .cpb{  
            padding: 1px 6px;  
            font-weight: bold;  
            font-size: 18px;  
            border: none;  
        }  
  
        .paginator a:hover{  
            color:#EE4000;  
            background: #ebf7ff;  
            border-color: #99d6ff;  
            text-decoration: none;  
        }  
  
        .paginator span{  
            color: #4cb8ff;  
        }
        .infoSubject label{
            padding-left:10px;
            color: #333333;
            font-size:20px;
            font-family:'黑体';
            font-weight: bolder;
       }
       .name,.find,.wran,.findAll{
          float: left;
       }
       .name input{
            width:220px; 
            height:25px; 
            border: 2px solid #aaa; 
            border-radius:5px;
            font-size: 16px;
            margin-top:10px;
       }
        .infoSubject{
            margin:auto;
            width:1000px;
        }
       .find,.subAllSubject{
            margin-left: 20px;
            margin-top:4px;
       }
      .subSubjectFind{
            width:80px;
            height:30px;
            margin-top:5px;
            text-align:center;
            border-radius: 6px;
            background: linear-gradient(to right,#79B35C,#B8D696);
            font-family: '黑体';
            font-size:20px;
            color: white;
            border:2px solid #7DB560;
            cursor:pointer;
            outline: none;
       }
       .subAllSubject{
            width:120px;
            height:30px;
            margin-top:9px;
            text-align:center;
            border-radius: 6px;
            background: linear-gradient(to right,#79B35C,#B8D696);
            font-family: '黑体';
            font-size:20px;
            color: white;
            border:2px solid #7DB560;
            cursor:pointer;
            outline: none;
       }
        #hint{
            font-family: '黑体';
            font-size: 20px;
            color: red;
            margin-top: 15px;
            margin-left:30px;
        }
    </style>
    <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var signID = "<%=signId%>";
            var subID = new Array();
            subID = signID.split(",");
            for (var i = 0; i < subID.length - 1; i++) {
                $("#btnDel" + subID[i] + "").attr("disabled", true);
                $("#btnDel" + subID[i] + "").attr("class", "btnDelete");
            }
            $(".btnModify").click(function () {
                var subjectID = $(this).attr("name");
                location.href = "ModifySubject.aspx?subjectID=" + subjectID + "";
            });
            $(".btnDel").click(function () {
                var subjectID = $(this).attr("name");
                if (confirm("确认要删除该科目吗？")) {
                    $.ajax({
                        url: "SubjectManage.aspx/DeleteSubject",
                        type: "POST",
                        dataType: "json",
                        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                        contentType: "application/json; charset=utf-8",
                        data: "{subjectID:'" + subjectID + "'}",
                        success: function (data) {
                            if (data.d == "1") {
                                alert("该科目已删除！");
                                $('.subAllSubject').click();
                                location.reload();
                            }
                            else {
                                alert("删除失败！");
                            }
                        }
                    });
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
                    <li>&nbsp;> 考试报名管理 >&nbsp;</li>  
                    <li>考试科目管理</li>
                </ul>
        </div>
         <div class="infoSubject">
                 <div class="name">
                    <label>科目名称</label>
                    <input type="text" placeholder="输入科目名称" id='txtSubjectName' runat="server"/>
                </div>
                 <div class="find">
                     <input type="button" value="查询" class="subSubjectFind" runat="server" onserverclick="Query_Click"/>
                </div>
                <div class="findAll" id="AllSubject" runat="server">
                     <input type="button" value="查看所有" class="subAllSubject" runat="server" onserverclick="LookAllSubject_Click"/>
                </div>
                <div class="wran" id="hint" runat="server">       
                </div>
            </div>
        <div style=" margin-top:60px;">
            <div class="scroll" id="subWarn" runat="server"></div>
            <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
              <table cellpadding="10" cellspacing="1" class="msg">
                <tr>
                    <th>科目名称</th>
                    <th>报名开始时间</th>
                    <th>报名结束时间</th>
                    <th>考试时间</th>
                    <th>考试地址</th>
                    <th>操作</th>
                </tr>       
            </HeaderTemplate>
            <ItemTemplate>
                     <tr>
                        <td><%#Eval("subjectName")%></td>
                        <td> <%#DateTime.Parse(Eval("subjectSignStartTime").ToString()).ToString("yyyy-MM-dd")%></td>
                        <td> <%#DateTime.Parse(Eval("subjectSignEndTime").ToString()).ToString("yyyy-MM-dd")%></td>
                        <td> <%#DateTime.Parse(Eval("subjectExamTime").ToString()).ToString("yyyy-MM-dd")%></td>
                        <td><%#Eval("subjectExamAddress")%></td>
                        <td>
                            <input type="button" value="修 改" name="<%#Eval("subjectID")%>" class="btnModify" title="点击修改"/>
                            <input type="button" value="删 除" name="<%#Eval("subjectID")%>" class="btnDel" title="点击删除" id="btnDel<%#Eval("subjectID")%>"/>
                        </td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
       </asp:Repeater>
        </div>
         <div style="top:490px; left:400px;position:absolute;" id="showPager" runat="server">
           <cc:AspNetPager ID="pager" AlwaysShow="true" OnPageChanged="pager_PageChanged" runat="server" FirstPageText="首页" LastPageText="尾页" CssClass="paginator" NextPageText="下一页" PrevPageText="上一页">
           </cc:AspNetPager>
        </div>
    </div>
    </form>
</body>
</html>
