<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamSign.aspx.cs" Inherits="ExamSignSystem.Student.Main.SignManage.ExamSign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考试报名</title>
    <link href="../../StuCss/Commom.css" rel="stylesheet" />
     <style type="text/css">
           .Rep_tab {
                width: 100%;
                margin: 0px auto;
                font: Georgia 11px;
                font-size: 14px;
                font-family: "黑体";
                color: #333333;
                vertical-align: middle;
                border-collapse: collapse; /*  细线表[xian biao]格代码[dai ma]  */
            }
            /*  　Repeater内部Table的td样式   */
            .Rep_tab td {
                border: 1px solid #7DB560;
                height: 30px;
                text-align: center;
            }
            /*  　Repeater内部Table的caption样式   */
            .Rep_tab caption {
                text-align: center;
                font-size: 14px;
                font-weight: bold;
                margin: 0 auto;
            }
        /*  　Repeater内部Table的TR的奇数行样式   */
           .Rep_Tab_OddTr {
                background-color: #f8fbfc;
                color: #000000;
                height: 25px;
             }
        /*  　Repeater内部Table的TR的偶数行样式   */
            .Rep_Tab_EvenTr {
                background-color: #F9F9F9;
                color: #000000;
                height: 30px;
             }

            .Rep_Tab_HeaderTr {
                background-color: #ffffee;
                color: #000000;
             }
            .gradeShow{
                width:900px; 
                margin: auto;
                margin-top:70px;
             }
           .Rep_tab th {
                color:black;
                font-family:'黑体';
                font-size:18px;
            }
            .btnSign{
                width: 80px;
                height:24px;
                background-color: #ccc ;
                border:2px #888888 solid;
                border-radius: 5px;
                font-family: '黑体';
                cursor:pointer;
                font-size: 16px;
                display:block;
                margin-left:40px;
            }
            .btnAlreadySign{
                width: 80px;
                height:24px;
                background: linear-gradient(to right,#FC7500,#EFD025);
                border:2px #888888 solid;
                border-radius: 5px;
                font-family: '黑体';
                font-size: 16px;
                color:white;
                cursor:pointer;
                display:none;
            }
            .btnSign:hover{
                background-color:#79B35C;
            }
              /*分页控件*/  
        .paginator  
        {  
            font: 11px Arial, Helvetica, sans-serif;  
            padding: 0px 5px 0px 15px;  
            margin: 0px;  
            font-family:'黑体';  
            font-size:18px;  
        }  
  
        /* 页面的背景以及字体*/  
        .paginator a  
        {  
            padding: 1px 6px;  
            border: solid 1px #7EC0EE;  
            text-decoration: none;  
            margin-right: 2px;  
            color:#436EEE;  
        }  
  
        .paginator a:visited  
        {  
            padding: 1px 6px;  
            border: solid 1px #99d6ff;  
            background: #fff;  
            text-decoration: none;  
            color:#4cb8ff;   
        }  
  
        .paginator .cpb  
        {  
            padding: 1px 6px;  
            font-weight: bold;  
            font-size: 18px;  
            border: none;  
        }  
  
        .paginator a:hover  
        {  
            color:#EE4000;  
            background: #ebf7ff;  
            border-color: #99d6ff;  
            text-decoration: none;  
        }  
  
        .paginator span  
        {  
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
            width:900px;
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
        #hint{
            font-family: '黑体';
            font-size: 20px;
            color: red;
            margin-top: 15px;
            margin-left:30px;
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
        </style>
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var signID = "<%=signId%>";
                var subID = new Array();
                subID = signID.split(",");
                for (var i = 0; i < subID.length - 1; i++) {
                    $("#btnAlreadySign"+subID[i]+"").show();
                    $("#btnSign" + subID[i] + "").hide();
                    $(".btnAlreadySign" + subID[i] + "").show();
                    $(".btnSign" + subID[i] + "").hide();
                }
                //开始报名
                $('.btnSign').click(function () {
                    var subjectID = $(this).attr("name");
                    if (confirm("确认要报名吗？")) {
                        $.ajax({
                            url: "ExamSign.aspx/StartSign", 
                            type: "POST",
                            dataType: "json",
                            async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                            contentType: "application/json; charset=utf-8",
                            data: "{subjectID:'" + subjectID + "'}",
                            success: function (data) {
                                if (data.d == "1") {
                                    alert("报名成功！");
                                    location.reload();
                                }
                                else {
                                    alert("报名失败！");
                                }
                            }
                        });
                    }
                });
                //取消报名
                $('.btnAlreadySign').click(function () {
                    var subjectID = $(this).attr("name");
                    if (confirm("确认要取消报名吗？")) {
                        $.ajax({
                            url: "ExamSign.aspx/CancelSign",
                            type: "POST",
                            dataType: "json",
                            async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                            contentType: "application/json; charset=utf-8",
                            data: "{subjectID:'" + subjectID + "'}",
                            success: function (data) {
                                if (data.d == "1") {
                                    alert("取消报名成功！");
                                    location.reload();
                                }
                                else {
                                    alert("取消报名失败！");
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
                    <li>考试报名</li>
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
                     <input type="button" value="查看所有" class="subAllSubject" runat="server" onserverclick="FindAllSubject_Click"/>
                </div>
                <div class="wran" id="hint" runat="server">       
                </div>
            </div>
       <div class="gradeShow">
         <div class="scroll" id="msgWarn" runat="server"></div>
         <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                 <table id="Tab" class="Rep_tab">
                     <tr>
                        <th>科目名称</th>
                        <th>报名开始时间</th>
                        <th>报名结束时间</th>
                        <th>考试时间</th>
                        <th>考试地址</th>
                        <th>是否报名</th>
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
                            <span class="btnAlreadySign<%#Eval("subjectID")%>" style="display:none">已报名</span>
                            <span class="btnSign<%#Eval("subjectID")%>" style="display:block">未报名</span>
                        </td>
                        <td>
                           <input type="button" value="取消报名" class="btnAlreadySign" title="点击取消报名" id="btnAlreadySign<%#Eval("subjectID")%>" name="<%#Eval("subjectID")%>"/> 
                           <input type="button" value="开始报名" class="btnSign" title="点击报名" id="btnSign<%#Eval("subjectID")%>" name="<%#Eval("subjectID")%>"/>
                       </td>
                   </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
       </asp:Repeater>
            </div>
        <div style="top:500px; left:400px;position:absolute;" id="showPager" runat="server">
           <cc:AspNetPager ID="pager" AlwaysShow="true" OnPageChanged="pager_PageChanged" runat="server" FirstPageText="首页" LastPageText="尾页" CssClass="paginator" NextPageText="下一页" PrevPageText="上一页">
           </cc:AspNetPager>
        </div>
      <script type="text/javascript">
          function SetTableColor(TableID) {
              var Ptr = document.getElementById(TableID).getElementsByTagName("tr");
              for (i = 1  ; i < Ptr.length + 1  ; i++) {
                  Ptr[i - 1].className = (i % 2 > 0) ? "Rep_Tab_EvenTr" : "Rep_Tab_OddTr";
              }
          }
          window.onload = SetTableColor("Tab");
    </script>
    </div>
    </form>
</body>
</html>
