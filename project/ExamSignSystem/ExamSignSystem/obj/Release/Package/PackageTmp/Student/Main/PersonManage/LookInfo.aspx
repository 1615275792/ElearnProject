<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LookInfo.aspx.cs" Inherits="ExamSignSystem.Student.Main.PersonManage.LookInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看个人信息</title>
    <link href="../../StuCss/Commom.css" rel="stylesheet" />
    <style type="text/css">
            .baomingInfo{
              width:800px;
              margin: auto;
              height:450px;
              margin-top:30px; 
              border:2px solid #7DB560;
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
            }
            .warn span{
                color: red;
                font-family: '黑体';
            }
        </style>
</head>
<body>
     <div> 
           <div class="info_top">
                <ul>
                    <li><img alt="" src="../../../Imgs/smallHomebule.png" style=" padding-top:8px;"/></li>
                    <li id='shouye'>首页</li>
                    <li>&nbsp;> 个人信息管理 >&nbsp;</li>  
                    <li>查看个人信息</li>
                </ul>
            </div>
            <div class="baomingInfo">
                <ul>
                    <li><div class="title">姓名:</div><div class="content" id="stuName" runat="server"></div></li>
                    <li><div class="title">性别:</div><div class="content" id="stuSex" runat="server"></div></li>
                    <li><div class="title">家庭住址:</div><div class="content" id="stuAddress" runat="server"></div></li>
                    <li><div class="title">手机号码:</div><div class="content" id="stuMobile" runat="server"></div></li>
                    <li><div class="title">电子邮箱:</div><div class="content" id="stuEmail" runat="server"></div></li>
                </ul>
                <div class="warn">
                    <span>*</span>请核对一下您的个人信息是否符合，如不符合,请修改
                </div>
            </div>
       </div>
</body>
</html>
