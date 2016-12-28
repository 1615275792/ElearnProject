<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operate.aspx.cs" Inherits="ExamSignSystem.Student.Main.Operate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../3rdLibs/Layer/skin/layer.css" rel="stylesheet" />
    <title>考试报名系统</title>
     <style type="text/css">
            body{
                background-color:#EBEEF2;
            }
            .endExam{
                height:40px;
                font-size:22px;
                text-align: center;
                font-family: '黑体';
                color:black;
                background-color: white;
                line-height: 40px;
                opacity: 0.5; 
                filter: alpha(opacity=50);
                border-radius:0px 0px 6px 6px;
                margin-top:560px;
            }
            .north{
                height: 40px;  
                background: linear-gradient(to right,#79B35C,#B8D696,#79B35C);
            }
            .north_right{
                 float: left;
                 width:200px; 
                 height: 40px; 
                 font-family: '黑体'; 
                 font-size:20px; 
                 margin-left:800px; 
                 line-height: 40px;
            }
            .welcome{
                color:white;
                float: left;
            }
            .north_left{
              float: left;
              margin-left:30px; 
              width:200px; 
              height: 40px; 
              font-family: '黑体'; 
              font-size:24px; 
              line-height: 40px;
              text-align: center; 
              color:white;
              font-style: oblique;
              text-shadow: 0px 3px 3px #ccc;
            }
            .north_right img{
                position: absolute; 
                left:1106px; 
                top:11px; 
                cursor:pointer;
            }
            .north_right ul{
                box-shadow: 0px 0px 4px #ccc;
                opacity: 0.8; 
                filter: alpha(opacity=80);
                border-radius:0px 0px 6px 6px;
                position:absolute;
                left:1210px;
                top:28px;
                width:80px;
                text-align:center;
                background-color: white;
                display:none;
            }
            .north_right ul li{
                border-bottom:1px #ccc solid;
                list-style-type:none;
                margin-left:-40px;
                font-family: '黑体';
                font-size:18px;
            }
            .north_right li a{
                text-decoration:none;
                color: black;
            }
            .north_right li a:hover{
                text-decoration:none;
                color:#ff0000;
            }
            .sn{
                height:40px;
                width:120px;
                float:left;
                text-align:center;
                cursor:pointer;
            }
             #controll{
                height: 40px;
                width:10px;
                border-top:20px solid transparent;
                border-right: 20px solid transparent;
                border-bottom: 20px solid transparent;
                border-left:20px solid #ccc;
                position:relative;
                left:200px;
                top:250px;
                z-index: 999;
            }
            .sanjiaoxing{
                border-top: 8px solid transparent; 
                border-right: 12px solid white; 
                border-bottom: 8px solid transparent; 
                position: absolute;
                left:-18px;
                top:12px;
            }
            .sanjiaoxingWai{
                border-top: 8px solid transparent; 
                border-left: 12px solid white; 
                border-bottom: 8px solid transparent; 
                position: absolute;
                left:-16px;
                top:12px;
            }
            .ul_info,.ul_Baoming{
                width: 200px;
                display:none;
            }
            .ul_info li{
                border-bottom:1px #ccc solid;
                list-style-type:none;
                font-family: '黑体';
                font-size:18px;
                height:30px;
                margin-left: -40px;
                padding-left:40px;
                line-height: 30px;
                cursor:pointer;
            }
            .ul_Baoming li{
                 border-bottom:1px #ccc solid;
                list-style-type:none;
                font-family: '黑体';
                font-size:18px;
                height:30px;
                margin-left: -40px;
                padding-left:40px;
                line-height: 30px;
                cursor:pointer;
            }
           .ul_info li:hover{
                background-color: #EEEEEE;
            }
            .ul_Baoming li:hover{
                 background-color: #EEEEEE;
            }
           .ul_info li a{
                text-decoration:none;
                color:#999;
            }
            .ul_Baoming li a{
                text-decoration:none;
                color:#999;
            }
            .ul_info li a:hover{
                text-decoration:none;
                color:#ff0000;
            }
            .ul_Baoming li a:hover{
                text-decoration:none;
                color:#ff0000;
            }
            
            #msg{
                width:200px; 
                border-bottom:2px #79B35C solid; 
                height:40px; 
                margin-top:-80px; 
                cursor: pointer;
            }
            .img{
                margin-left: 20px; 
                padding-top: 12px; 
                float: left;
            }
            .Exam_Msg{
                margin-left:5px; 
                padding-top: 10px; 
                float: left; 
                font-family: '黑体'; 
                font-size:20px;
            }
            
            #baoming{
                width:200px; 
                border-bottom:2px #79B35C solid; 
                height:40px;
                margin-top:0px; 
                cursor: pointer;
            }
            .baoming_msg{
                margin-left:5px; 
                padding-top: 10px; 
                float: left; 
                font-family: '黑体'; 
                font-size:20px;
            }
            .title{
                height: 560px; 
                float: left; 
                width: 1100px; 
                background-color: white;
            }
            .operate{
                width:200px; 
                background-color:#ccc; 
                height:560px; 
                float: left;
            }
         .moveFont {
             float:left; 
             margin-top:32px; 
             margin-left:320px; 
             font-family:'黑体'; 
             font-size:20px; 
             color:red;
             width:800px;
         }
        </style>
        <script src="../../Jquery/jquery-1.10.2.min.js"></script>
        <script src="../../3rdLibs/Layer/layer.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#stuname,.north_right ul').mouseenter(function () {
                    $('.north_right ul').css('display', 'block');
                });
                $('.north_right ul,#stuname').mouseleave(function () {
                    $('.north_right ul').css('display', 'none');
                });
                $('body').on('click', '.content', function () {
                    $('.content').attr('class', 'contentWai');
                    $('.sanjiaoxing').attr('class', 'sanjiaoxingWai');
                    $('#controll').css('left', '4px');
                    $('.operate').css('width', '4');
                    $('.title').css('width', '1296');
                    $('.yuanxing').css('left', '560px');
                });
                $('body').on('click', '.contentWai', function () {
                    $('.contentWai').attr('class', 'content');
                    $('.sanjiaoxingWai').attr('class', 'sanjiaoxing');
                    $('#controll').css('left', '200px');
                    $('.operate').css('width', '200');
                    $('.title').css('width', '1100');
                });
                $('body').on('mouseenter', '.content', function () {
                    $('.content').css("border-left", "20px solid #79B35C");
                });
                $('body').on('mouseenter', '.contentWai', function () {
                    $('.contentWai').css("border-left", "20px solid #79B35C");
                });

                $('body').on('mouseleave', '.content', function () {
                    $('.content').css("border-left", "20px solid #ccc");
                });
                $('body').on('mouseleave', '.contentWai', function () {
                    $('.contentWai').css("border-left", "20px solid #ccc");
                });
                $('#msg').click(function () {
                    $('.ul_info').toggle();
                });
                $('#baoming').click(function () {
                    $('.ul_Baoming').toggle();
                });
                //个人信息管理
                $('#chakan').click(function () {
                    $('#show').attr('src', './PersonManage/LookInfo.aspx');
                });
                $('#xiugai').click(function () {
                    $('#show').attr('src', './PersonManage/ModifyInfo.aspx');
                });
                $('#password').click(function () {
                    $('#show').attr('src', './PersonManage/ModifyPwd.aspx');
                });
                //考试信息管理
                $('#sign').click(function () {
                    $('#show').attr('src', './SignManage/ExamSign.aspx');
                });
                $('#modifySign').click(function () {
                    $('#show').attr('src', './SignManage/ModifySignInfo.aspx');
                });
                $('#look').click(function () {
                    layer.open({
                        type: 2,
                        area: ['760px', '465px'],
                        skin: 'layui-layer-rim', //加上边框
                        content: ['./SignManage/LookSignInfo.aspx', 'no']
                    });
                });
            });
        </script>
</head>
<body>
     <div  style="width:1300px;height:700px; margin: auto; ">
        <div  style="height:120px; border-radius:6px 6px 0px 0px;">
                <div class="north">
                    <div class="north_left">
                         考试报名系统 
                    </div>
                    <div class="north_right">
                        <div class="welcome">欢迎您:</div> 
                    <div class='sn' id='stuname'>
                         <span id="stuName" runat="server">
                               
                         </span>
                       </div>
                       <ul>
                           <li><a href="./PersonManage/LookInfo.aspx" target="show">个人信息</a></li>
                           <li><a href="../StuLogin/StudentLogin.aspx">切换账号</a></li>
                           <li><a href="../StuLogin/studentLogin.aspx">退出系统</a></li>
                       </ul>
                    </div>
                </div>
                <div style=" height:78px;">
                    <div class="moveFont" id="move" runat="server">
                       <marquee onmouseover=this.stop() onmouseout=this.start()>
                           提示:<span id="subName" runat="server"></span>的考试报名快要截止了,请同学们抓紧报名！
                       </marquee>
                    </div>
                    <div class="moveFont" id="showSign" runat="server" style="display:none;">
                       <marquee onmouseover=this.stop() onmouseout=this.start()>
                           提示: 考试报名开始了,请同学们踊跃报名
                       </marquee>
                    </div>
                </div>
            </div>
            <div class="center">
                <div  class="operate">
                      <div class='content' id='controll'>
                         <div class='sanjiaoxing'></div>
                      </div>
                    <div id='msg'>
                        <div class='img'><img alt="" src="../../Imgs/admin.gif"/></div>
                        <div class="Exam_Msg">考试报名管理</div>
                    </div>
                    <ul class="ul_info">
                        <li id="sign"><a href="./SignManage/ExamSign.aspx" target="show">考试报名</a></li>
                        <li id='modifySign'><a href="./SignManage/ModifySignInfo.aspx" target="show">修改报名信息</a></li>
                        <li id='look'><a href="#">查看报名信息</a></li>
                    </ul>
                     <div id='baoming'>
                        <div class='img'><img alt="" src="../../Imgs/admin.gif"/></div>
                        <div class="baoming_msg">个人信息管理</div> 
                    </div>
                    <ul class="ul_Baoming">
                        <li id="chakan"><a href="./PersonManage/LookInfo.aspx" target="show">查看个人信息</a></li>
                        <li id="xiugai"><a href="./PersonManage/ModifyInfo.aspx" target="show">修改个人信息</a></li>
                        <li id="password"><a href="./PersonManage/ModifyPwd.aspx" target="show">修改个人密码</a></li>
                    </ul>
		   </div>
           <div class="title">
                    <iframe name='show' id="show"  style=" width:100%; height:100%" frameborder='0' scrolling='no' src='./PersonManage/CompleteInfo.aspx'></iframe>
	     	</div>
            </div>
             <div class="endExam">
                      Copyright @ 2016 安徽信息工程学院报名考试--文津校区考点
              </div>
	</div> 
</body>
</html>
