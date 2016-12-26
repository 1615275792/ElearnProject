<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LookSignInfo.aspx.cs" Inherits="ExamSignSystem.Student.Main.SignManage.LookSignInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看报名信息</title>
     <style type="text/css">
         .baomingInfo{
              width:800px;
              height: 400px;
            }
            .baomingInfo ul{
                margin-top:20px;
                margin-left: 140px;
            }
            .baomingInfo li{
                background-image: url(../../../Imgs/info.gif);
                height: 55px;
                width: 454px;
                margin-top: 10px;
                list-style-type:none;
            }
            .content{
                float: left;
                padding-top:20px;
                margin-left:10px;
                font-size:18px;
                font-family:'黑体';
            }
            ul span{
                margin-left:120px;
                padding-top: -20px;
            }
            .title{
                color: #333333;
                font-size:20px;
                font-family:'黑体';
                font-weight: bolder;
                padding-top:20px;
                margin-left:60px;
                float: left;
            }
            .warn{
                font-family: '黑体'; 
                font-size:16px; 
                margin-left:190px; 
                width:500px;
                margin-top:10px;
            }
            .warn span{
                color: red;
                font-family: '黑体';
            }
            .btnSureSign{
                width:100px;
                height:36px;
                line-height: 32px;
                text-align: center;
                border-radius: 6px;
                background-color:#428BCA;
                font-family: '黑体';
                font-size:20px;
                color: white;
                border:2px solid #428BCA;
                cursor:pointer;
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
        <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.btnBack,.btnSureSign').click(function () {
                    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                    parent.layer.close(index);
                });
            });
        </script>
</head>
<body>
    <div>
        <div class="baomingInfo">
                <div class="warn">
                    <span>*</span>请核对一下您的报名信息是否符合，如不符合,请修改
                </div>
                <ul>
                        <li><div class="title">姓名:</div><div class="content" id="stuName" runat="server"></div></li>
                        <li><div class="title">学号:</div><div class="content" id="stuSno" runat="server"></div></li>
                        <li><div class="title">专业:</div><div class="content" id="stuMajor" runat="server"></div></li>
                        <li><div class="title">班级:</div><div class="content" id="stuClass" runat="server"></div></li>
                        <li><div class="title">联系电话:</div><div class="content" id="stuMobile" runat="server"></div></li>
                </ul>
           <div>
               <div style="float: left; margin-left: 260px;"><input type="button" value="确认" class="btnSureSign"/></div> 
               <div style="float: left; margin-left: 140px;"><input type="button" value="返回" class="btnBack"/></div>
           </div>
     </div>
    </div>
</body>
</html>
