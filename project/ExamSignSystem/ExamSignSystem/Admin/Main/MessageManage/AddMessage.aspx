<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMessage.aspx.cs" Inherits="ExamSignSystem.Admin.Main.AnnunciateManage.AddAnnunciate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加通告</title>
    <link href="../../AdminCSS/AdminCommom.css" rel="stylesheet" />
    <link href="../../../3rdLibs/Kindeditor/Themes/default/default.css" rel="stylesheet" />
      <style type="text/css">
          .info_top{
                border-bottom: 2px solid #e5e5e5;
                line-height: 39px;
                height: 39px;
                overflow: hidden;
            }
            #shouye{
                color:#79B35C;
                font-size:20px;
            }
            .info_top ul{
                margin-top: -3px;
                margin-left: -10px;
            }
            .info_top ul li{
                 list-style: none;
                 float:left;
                 font-family: '黑体';
                 font-size: 18px;
            }
        .center{
            width: 800px;
            height: 40px;
            margin-left:150px;
            margin-top: 20px;
        }
        .center_c {
            width: 200px;
            height: 30px;
            margin-left:182px;
            margin-top: 10px;
        }
       .center_c span{
            color:red;
            font-weight:bolder;
        }
       .buttom {
            width: 750px;
            height:300px;
            margin-left:244px;
        }
       .center input {
            width: 690px;
            height: 25px;
            margin-left: 20px;
            border-right: 3px solid #808080;
            border-left: 3px solid #808080;
            border-top: 3px solid #808080;
        }
       .end input{
            width: 70px;
            height: 30px;
            margin-left:960px;
            margin-top:50px;
            color:#0026ff;
            font-weight:bolder;
            font-size:larger;
            cursor: pointer;
        }
        </style>
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script src="../../../3rdLibs/Kindeditor/Js/kindeditor-all-min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var editor;
                KindEditor.ready(function (K) {
                    editor = K.create('#txtContent', {
                        cssPath: '../../AdminCSS/prettify.css',
                        uploadJson: '../../../3rdLibs/Kindeditor/Asp.net/upload_json.ashx',
                        fileManagerJson: '../../../3rdLibs/Kindeditor/Asp.net/file_manager_json.ashx',
                        allowFileManager: true,
                        afterCreate: function () {
                            this.sync();
                        },
                        afterBlur: function () {
                            this.sync();
                        }
                    });
                    prettyPrint();
                });
                $('#btnAdd').click(function () {
                    var msgTitle = $('#txtTitle').val();
                    var msgContent = editor.html();
                    if (msgTitle.length == 0 || msgContent.length == 0) {
                        alert("请完善所有信息！！");
                    }
                    else {
                        $.ajax({
                            url: "AddMessage.aspx/Add",
                            type: "POST",
                            dataType: "json",
                            async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                            contentType: "application/json; charset=utf-8",
                            data: "{msgTitle:'" + msgTitle + "',msgContent:'" + msgContent + "'}",
                            success: function (data) {
                                if (data.d == "1") {
                                    alert("通告添加已成功！");
                                    location.reload();
                                }
                                else {
                                    alert("失败！");
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
                    <li>发布通告</li>
                </ul>
        </div>
        <div> 
            <div class="center">
              <strong>通告标题:</strong><input type="text" id="txtTitle" />
            </div>
            <div class="center_c">
                  <strong>内容:</strong> 
            </div>
            <div class="buttom">
                <textarea id="txtContent" cols="100" rows="8" name="content"></textarea> 
            </div>
            <div class="end">
                <input type="submit" value="发  布" id='btnAdd'/>
            </div>
     </div>
    </div>
    </form>
</body>
</html>
