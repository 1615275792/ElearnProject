<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowAnnunciate.aspx.cs" Inherits="ExamSignSystem.Student.StuLogin.ShowAnnunciate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <style type="text/css">
        .back{
            margin-top:240px;
            margin-left:600px;
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
     </style>
    <title></title>
    <script src="../../Jquery/jquery-1.10.2.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('.btnBack').click(function () {
                 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                 parent.layer.close(index);
             });
         });
    </script>
</head>
<body>
      <div style="text-align: center;"><h2 id="title" runat="server"></h2></div>
      <div id="contents" runat="server"></div>
      <div class="back"><input type="button" value="返回" class="btnBack"/></div> 
</body>
</html>
