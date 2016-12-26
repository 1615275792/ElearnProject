<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LookMessage.aspx.cs" Inherits="ExamSignSystem.Admin.Main.AnnunciateManage.LookAnnunciate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看通告</title>
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
            }
            .center{
                text-align: center;
            }
            table tr:first-child{
                background-color: #F9FAFA;
            }
            table tr:nth-child(even){background:#F4F4F4;}
            .btnDel{
                width:80px;
                height: 30px;
                border-radius: 6px;
                background-color: #CCC;
                font-family: '黑体';
                cursor:pointer;
            }
            .btnDel:hover{
                  background-color:#79B35C;
            }
         .infoMessage label{
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
        .infoMessage{
            margin:auto;
            width:1000px;
        }
       .find,.subAllMessage{
            margin-left: 20px;
            margin-top:4px;
       }
      .subMessageFind{
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
       .subAllMessage{
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
         #txtMessageTitle {
             width:500px;
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
        </style>
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.btnDel').click(function () {
                    var msgID = $(this).attr("id");
                    if (confirm("确认要删除该通告吗？")) {
                        $.ajax({
                            url: "LookMessage.aspx/DeleteMessage",
                            type: "POST",
                            dataType: "json",
                            async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                            contentType: "application/json; charset=utf-8",
                            data: "{msgID:'" + msgID + "'}",
                            success: function (data) {
                                if (data.d == "1") {
                                    alert("该科目已删除！");
                                    $('.subAllMessage').click();
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
                    <li>&nbsp;> 通告信息管理 >&nbsp;</li>  
                    <li>查看通告</li>
                </ul>
        </div>
         <div class="infoMessage">
                 <div class="name">
                    <label>通告标题</label>
                    <input type="text" placeholder="输入通告标题" id='txtMessageTitle' runat="server"/>
                </div>
                 <div class="find">
                     <input type="button" value="查询" class="subMessageFind" runat="server" onserverclick="Query_Click"/>
                </div>
                <div class="findAll" id="AllMessage" runat="server">
                     <input type="button" value="查看所有" class="subAllMessage" runat="server" onserverclick="LookAllMessage_Click"/>
                </div>
                <div class="wran" id="hint" runat="server">       
                </div>
            </div>
        <div style=" margin-top:60px">
             <div class="scroll" id="msgWarn" runat="server"></div>
            <asp:Repeater ID="MsgRepeater" runat="server">
            <HeaderTemplate>
              <table cellpadding="10" cellspacing="1" class="msg">
                <tr>
                    <th style=" width:140px;">通告标题</th>
                    <th style=" width:100px;">查阅人数</th>
                    <th style=" width:120px;">发布时间</th>
                    <th>通告内容</th>
                    <th>操作</th>      
                </tr>       
            </HeaderTemplate>
            <ItemTemplate>
                   <tr>
                        <td><%#Eval("msgTitle")%></td>
                        <td class='center'><%#Eval("msgLookTotal")%></td>
                        <td class='center'><%#DateTime.Parse(Eval("msgTime").ToString())%></td>
                        <td><%#Eval("msgContents")%></td>
                        <td class='center' style="width: 40px;">
                            <input type="button" value="删 除" id="<%#Eval("msgID")%>" class="btnDel" title="点击删除"/>
                        </td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
       </asp:Repeater>
        <div style="top:40px;position:relative; padding-left:400px;" id="showPager" runat="server">
           <cc:AspNetPager ID="pager" AlwaysShow="true" OnPageChanged="pager_PageChanged" runat="server" FirstPageText="首页" LastPageText="尾页" CssClass="paginator" NextPageText="下一页" PrevPageText="上一页">
           </cc:AspNetPager>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
