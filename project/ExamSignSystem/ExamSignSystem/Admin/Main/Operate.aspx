<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operate.aspx.cs" Inherits="ExamSignSystem.Admin.Main.Operate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>考试报名后台管理系统</title>
    <link href="../../3rdLibs/Layer/skin/layer.css" rel="stylesheet" />
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
                 width:100px; 
                 height: 40px; 
                 font-family: '黑体'; 
                 font-size:20px; 
                 margin-left:800px; 
                 line-height: 40px;
            }
            .welcome{
                float: left;
                width: 150px;
            }
            .welcome a{
                text-decoration: none;
                color:white;
            }
             .welcome a:hover{
                color: red;
            }
            .north_left{
              float: left;
              margin-left:30px; 
              width:300px; 
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
                position: relative; 
                left:7px; 
                top:2px; 
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
            .ul_info,.ul_Admin,.ul_Annunciate{
                width: 200px;
                display:none;
            }
            .ul_info li,.ul_Admin li,.ul_Annunciate li{
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
           .ul_info li:hover,.ul_Admin li:hover,.ul_Annunciate li:hover{
                background-color: #EEEEEE;
            }
           .ul_info li a,.ul_Admin li a,.ul_Annunciate li a{
                text-decoration:none;
                color:#999;
            }
            .ul_info li a:hover,.ul_Admin li a:hover,.ul_Annunciate li a:hover{
                text-decoration:none;
                color:#ff0000;
            }
           /*  　考试报名管理   */
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
            .exam_msg{
                margin-left:5px; 
                padding-top: 10px; 
                float: left; 
                font-family: '黑体'; 
                font-size:20px;
            }
           /*  　个人信息管理   */
            #admin{
                 width:200px; 
                 border-bottom:2px #79B35C solid; 
                 height:40px;
                 margin-top:0px; 
                 cursor: pointer;
            }
            .person_msg{
                margin-left:5px; 
                padding-top: 10px; 
                float: left; 
                font-family: '黑体'; 
                font-size:20px;
            }
          /*  　通告信息管理   */
            #annunciate{
                width:200px; 
                border-bottom:2px #79B35C solid; 
                height:40px;
                margin-top:0px; 
                cursor: pointer;
            }
            .annunciate_msg{
                margin-left:5px; 
                padding-top: 10px; 
                float: left; 
                font-family: '黑体'; 
                font-size:20px;
            }
            .title{
                height:560px; 
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
                //考试报名管理
                $('#msg').click(function () {
                    $('.ul_info').toggle();
                });
                $('#sign').click(function () {
                    $('#show').attr('src', './ExamManage/LeadGradeTable.aspx');
                });
                $('#modifySign').click(function () {
                    $('#show').attr('src', './ExamManage/ExportSignTable.aspx');
                });
                $('#subjectMsg').click(function () {
                    $('#show').attr('src', './ExamManage/SubjectManage.aspx');
                });
                $('#subjectAddSub').click(function () {
                    $('#show').attr('src', './ExamManage/AddSubject.aspx');
                });
                //个人信息管理
                $('#admin').click(function () {
                    $('.ul_Admin').toggle();
                });
                $('#password').click(function () {
                    $('#show').attr('src', './PersonManage/ModifyAdminPwd.aspx');
                });
                //通告信息管理
                $('#annunciate').click(function () {
                    $('.ul_Annunciate').toggle();
                });
                $('#add').click(function () {
                    $('#show').attr('src', './MessageManage/AddMessage.aspx');
                });
                $('#see').click(function () {
                    $('#show').attr('src', './MessageManage/LookMessage.aspx');
                });
            });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div  style="width:1300px;height:700px; margin: auto; ">
            <div  style="height:120px; border-radius:6px 6px 0px 0px;">
                <div class="north">
                    <div class="north_left">
                         考试报名后台管理系统 
                    </div>
                    <div class="north_right">
                        <div class="welcome">
                            <img alt="" src="../../Imgs/smallHome.png"/>
                            <a href="../AdminLogin/Login.aspx">退出系统</a>
                        </div> 
                    </div>
                </div>
                <div style=" height:78px;">
                    <div class="moveFont" id="move" runat="server">
                       <marquee onmouseover=this.stop() onmouseout=this.start()>
                           提示:<span id="subName" runat="server"></span>、<span id="name" runat="server"></span>的考试报名已截止了,请及时清除！
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
                        <div class="img"><img alt="" src="../../Imgs/admin.gif"/></div>
                        <div class='exam_msg'>考试报名管理</div>
                    </div>
                    <ul class="ul_info">
                        <li id="sign"><a href="./ExamManage/LeadGradeTable.aspx" target="show">导入考试成绩</a></li>
                        <li id='modifySign'><a href="./ExamManage/ExportSignTable.aspx" target="show">导出报名表</a></li>
                        <li id='subjectMsg'><a href="./ExamManage/SubjectManage.aspx" target="show">考试科目管理</a></li>
                        <li id='subjectAddSub'><a href="./ExamManage/AddSubject.aspx" target="show">添加科目</a></li>
                    </ul>
                     <div id='admin'>
                        <div  class="img"><img alt="" src="../../Imgs/admin.gif"/></div>
                        <div  class='person_msg'>个人信息管理</div> 
                    </div>
                    <ul class="ul_Admin">
                        <li id="password"><a href="./PersonManage/ModifyAdminPwd.aspx" target="show">修改个人密码</a></li>
                    </ul>
                     <div  id='annunciate'>
                        <div class="img"><img alt="" src="../../Imgs/admin.gif"/></div>
                        <div class='annunciate_msg'>通告信息管理</div> 
                    </div>
                    <ul class="ul_Annunciate">
                        <li id="add"><a href="./MessageManage/AddMessage.aspx" target="show">发布通告</a></li>
                        <li id="see"><a href="./MessageManage/LookMessage.aspx" target="show">查看通告</a></li>
                    </ul>
		</div>
                <div class="title">
                    <iframe name='show' id="show"  style=" width:100%; height:100%" frameborder='0' src='./PersonManage/FillEmail.aspx'></iframe>
		</div>
            </div>
             <div class="endExam">
                      Copyright @ 2016 安徽信息工程学院报名考试--文津校区考点
              </div>
	</div> 
    </div>
    </form>
</body>
</html>
