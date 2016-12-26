<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryOperate.aspx.cs" Inherits="ExamSignSystem.Student.Main.Query.QueryOperate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../StuCss/Inquiry.css" rel="stylesheet" />
    <title>查询</title>
    <style type="text/css">
          .info,.infoGrade{
              width:900px;
              margin:auto;
            }
            .baomingInfo,.gradeShow{
              width:800px;
              margin-left:210px;
              height:100%;
              margin-top:130px; 
              border:2px solid #7DB560;
            }
            .sno,.pwd,.find{
                float: left;
            }
             .sno input,.pwd input{
                width:220px; 
                height:25px; 
                border: 2px solid #aaa; 
                border-radius:5px;
                font-size: 16px;
                margin-top:10px;
            }
            .info,.infoGrade label{
                padding-left:10px;
                color: #333333;
                font-size:20px;
                font-family:'黑体';
                font-weight: bolder;
            }
            .find{
                margin-left: 20px;
                margin-top:4px;
            }
             .subFind,.subGradeFind{
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
            .yuanxing{
                position: absolute;
                top:210px;
                left:640px;
                z-index: 999;
            }
            .yuanxingWai{
                width: 180px; 
                height: 180px; 
                background-color:white; /* Can be set to transparent */ 
                border: 3px #79B35C solid; 
                -webkit-border-radius:90px; 
            }
            .top_left_img{
                width: 160px; 
                height: 160px; 
                -webkit-border-radius:80px; 
                margin:auto; 
            }
            .yuanxingNei{
                width: 160px; 
                height: 160px; 
                background-color:#efefef; /* Can be set to transparent */ 
                border: 3px #79B35C solid; 
                -webkit-border-radius:80px; 
                margin:auto;
                margin-top:8px;
            }
            .baomingInfo ul{
                margin-top:100px;
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
                margin-left:180px; 
                width:500px;
            }
            .warn span{
                color: red;
                font-family: '黑体';
            }
            .show,.gradeShow{
                display: none;
            }
            #hint,#hintGrade,#fa{
                font-family:'黑体';
                font-size:20px; 
                color: red; 
                margin-top: 15px;
            }
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
                border-left: 0px;
                height: 30px;
            }
            /*  　Repeater内部Table的caption样式   */
            .Rep_tab caption {
                text-align: center;
                font-size: 12px;
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
                width: 800px; 
                margin: auto;
                display:none;
                margin-top: 100px;
             }
           .Rep_tab th {
                color: #5CCDDE;
                font-family:'黑体';
                font-size: 20px;
            }
            #content td{
                text-align: center;
                font-family: '黑体';
                font-size: 18px;
            }
    </style>
    <script src="../../../Jquery/jquery-1.10.2.min.js"></script>
      <script type="text/javascript"> 
          $(document).ready(function() {
              $(".tab_content").hide();  
              $("ul.tabs li:first").addClass("active").show(); 
              $(".tab_content:first").show(); 
              $("ul.tabs li").click(function() {
                  $("ul.tabs li").removeClass("active");  
                  $(this).addClass("active"); 
                  $(".tab_content").hide();  
                  var activeTab = $(this).find("a").attr("href");  
                  $(activeTab).fadeIn(); 
                  return false;
              });
              //判断学号（只能输入数字）
              $("#txtGradeSno,#txtSno").keyup(function () {
                  $(this).val($(this).val().replace(/\D|^0/g, ''));
              }).bind("paste", function () {
                  $(this).val($(this).val().replace(/\D|^0/g, ''));
              }).css("ime-mode", "disabled");
              //绑定Enter事件
              $('.info input').keydown(function(e){
                  if(e.which == 13){
                      $('.subFind').click();
                  }
              });
              //Enter绑定事件
              $('.infoGrade input').keydown(function (e) {
                  if(e.which == 13){
                      $('.subGradeFind').click();
                  }
              });
              $('.subFind').click(function () {
                  var stuSno = $('#txtSno').val();
                  var stuPwd = $('#txtPwd').val();
                  if (stuSno.length == 0 || stuPwd.length == 0) {
                      $("#fa").html("学号或者密码不能为空！");
                  }
                  else {
                      $.ajax({
                          url: "QueryOperate.aspx/FindSignInfo",
                          type: "POST",
                          dataType: "json",
                          async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                          contentType: "application/json; charset=utf-8",
                          data: "{stuSno:'" + stuSno + "',stuPwd:'" + stuPwd + "'}",
                          success: function (data) {
                              if(data.d=="false"){
                                  $("#fa").html("账号或者密码输入错误");
                              }
                              else {
                                  $('.show').css('display', 'block');
                                  $('#hint').css('display', 'none');
                                  $('#fa').css('display', 'none');
                                  var myobj = eval(data.d);
                                  $("#snoInfo").html(myobj[0].stuNo);
                                  $("#nameInfo").html(myobj[0].stuName);
                                  $("#majorInfo").html(myobj[0].stuMajor);
                                  $("#classInfo").html(myobj[0].stuClass);
                                  $("#modileInfo").html(myobj[0].stuMobile);
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
       <div class="scoreTop">
            <div class="scoreTop_left">
                <img alt="" src="../../../Imgs/exam.png" class="scoreTop_left_img"/>
            </div>
            <div class="scoreTop_center">
                 <img alt="" src="../../../Imgs/chaxun.png" class="scoreTop_right_img"/>
            </div>
            <div class="scoreTop_right">
                查 询
            </div>
            <div class="scoreTop_r">
                <a href="../../StuLogin/StudentLogin.aspx"> 
                  <img alt="" src="../../../Imgs/home.png" class="scoreTop_r_img"/>
                </a>
            </div>
        </div> 
       <div class="container">
        <ul class="tabs">
            <li class="active"><a href="#tab1">成绩查询</a></li>
            <li><a href="#tab2">报名信息查询</a></li>
        </ul>
       <div class="tab_container">
        <div id="tab1" class="tab_content" style="display: block; ">
              <div class="infoGrade">
                 <div class="sno">
                    <label>学号</label>
                    <input type="text" placeholder="输入学号" id='txtGradeSno' runat="server"/>
                </div>
                 <div class="pwd">
                    <label>密码</label>
                    <input type="password"  placeholder="输入密码" id='txtGradePwd' runat="server"/>
                </div>
                 <div class="find">
                     <input type="button" value="查询" class="subGradeFind" runat="server" onserverclick="Query_Click"/>
                </div>
            </div>
          <div id='hintGrade' runat="server"></div>
          <div class="gradeShow" runat="server" id="showGrade">
          <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table id="Tab" class="Rep_tab">
                      <tr>
                        <th>考试科目</th>
                        <th>成绩</th>
                        <th>报名时间</th>
                     </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr id="content" class="tableContent">
                    <td>
                        <%#Eval("gradeSubject")%>
                    </td>
                    <td>
                        <%#Eval("gradeScore")%>分
                    </td>
                    <td>
                        <%#DateTime.Parse(Eval("gradeTime").ToString()).ToString("yyyy-MM-dd")%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
       </asp:Repeater>
      </div>
       </div>
      <div id="tab2" class="tab_content" style="display: none; ">
             <div class="info">
                 <div class="sno">
                    <label>学号</label>
                    <input type="text" required placeholder="输入学号" id='txtSno'/>
                </div>
                 <div class="pwd">
                    <label>密码</label>
                    <input type="password"  required placeholder="输入密码" id='txtPwd'/>
                </div>
                 <div class="find">
                     <input type="button" value="查询" class="subFind"/>
                </div>
            </div>
          <div id='fa'></div>
          <div class="show"> 
            <div class="yuanxing"> 
                <div class="yuanxingWai">
                    <div class="yuanxingNei">
                        <img src="../../../Imgs/title.png" class="top_left_img" alt=""/>
                    </div>
                </div>
             </div>
            <div class="baomingInfo">
                <ul>
                    <li><div class="title">学号:</div><div class="content" id="snoInfo"></div></li>
                    <li><div class="title">姓名:</div><div class="content" id="nameInfo"></div></li>
                    <li><div class="title">专业:</div><div class="content" id="majorInfo"></div></li>
                    <li><div class="title">班级:</div><div class="content" id="classInfo"></div></li>
                    <li><div class="title">联系电话:</div><div class="content" id="modileInfo"></div></li>
                </ul>
                <div class="warn">
                      <span>*</span>请核对一下您的个人报名信息是否符合，如不符合，请登录修改
                </div>
            </div>
         </div>
        </div>
    </div>
   </div>
  </form>
    <script type="text/javascript">
        function SetTableColor(TableID) {
            var Ptr = document.getElementById(TableID).getElementsByTagName("tr");
            for (i = 1  ; i < Ptr.length + 1  ; i++) {
                Ptr[i - 1].className = (i % 2 > 0) ? "Rep_Tab_EvenTr" : "Rep_Tab_OddTr";
            }
        }
        window.onload = SetTableColor("Tab");
    </script>
</body>
</html>
