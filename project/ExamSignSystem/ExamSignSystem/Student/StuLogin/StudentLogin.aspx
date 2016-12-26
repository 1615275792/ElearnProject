<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="ExamSignSystem.Student.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../StuCss/StuFindPwd.css" rel="stylesheet" />
    <link href="../StuCss/StuLogin.css" rel="stylesheet" />
    <title>考试报名系统</title>
    <style type="text/css">
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
    </style>
    <script src="../../Jquery/jquery-1.10.2.min.js"></script>
    <script src="../StuJS/StuLogin.js"></script>
    <script src="../../3rdLibs/Layer/layer.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var stuPwd = "<%=password%>";
            if (stuPwd != "")
            {
                $('.txtPwd').attr("value", stuPwd);
                $('#ps').attr("value","pwd");
            }
            //判断登录学号（只能输入数字）
            $("#txtSno").keyup(function () {
                $(this).val($(this).val().replace(/\D|^0/g, ''));
            }).bind("paste", function () {
                $(this).val($(this).val().replace(/\D|^0/g, ''));
            }).css("ime-mode", "disabled");
            /** 忘记密码 **/
            $('#forget').click(function () {
                $('.bigBody').css("display", "block");
                $('.neiceng').css("display", "block");
                //Enter事件登录
                $('#txtStnNo,#inEmail').keydown(function (e) {
                    if (e.which == 13) {
                        $('.sure').click();
                    }
                });
                //判断学号（只能输入数字）
                $("#txtStnNo").keyup(function () {
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).bind("paste", function () {  
                    $(this).val($(this).val().replace(/\D|^0/g, ''));
                }).css("ime-mode", "disabled");  

                $('.sure').click(function () {
                    var Sno = $("#txtStnNo").val();
                    var Email = $("#inEmail").val();
                    if (Sno == "" ||  Email == "") {
                        alert("学号或者邮箱不能为空！");
                    }
                    else {
                        var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email  
                        if (!preg.test(Email)) {
                            alert("请填写正确的邮箱！");
                        }
                        else {
                            $.ajax({
                                url: "Login.aspx/FindPwd",//发送到本页面后台FindPwd方法
                                type: "POST",
                                dataType: "json",
                                async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
                                contentType: "application/json; charset=utf-8",
                                data: "{stuSno:'" + Sno + "',stuEmail:'" + Email + "'}",
                                success: function (data) {
                                    if (data.d == "1") {
                                        alert("密码已发送到邮箱,请注意查收！");
                                        location.reload();
                                    }
                                    else {
                                        alert("学号或者邮箱输入错误！");
                                    }
                                } 
                            });
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="big"> 
        <div class="top">
            <div class="top_left"> 
                <img alt="" src="../../Imgs/exam.png" class="top_left_img"/>
            </div>
            <div class="top_center"> 
                <h1 class="top_h1">安徽信息工程学院考试报名系统</h1>
                <h2 class="top_h2">(文津校区考点）</h2>
            </div>
            <div class="top_right">
                <div class="top_right_header">
                    <a href="../Main/Query/QueryOperate.aspx">报名信息查询</a></div>
                <div class="top_right_end">
                    <a href="../Main/Query/QueryOperate.aspx">成绩查询</a></div>
            </div>
        </div>
        <div class="center">
            <div class="center_left">
                <h3>通知公告</h3>
                <div class="scroll" id="msgWarn" runat="server">
                     <ul id="marquee">
                        <asp:Repeater ID="MsgRepeater" runat="server">
                           <ItemTemplate>
                            <li>
                                <a href="javascript:;" style="display: block" title="<%#Eval("msgTitle")%>" id="<%#Eval("msgID")%>" class="annnuciate">
                                    <span id="span<%#Eval("msgID")%>"> <%#Eval("msgTitle")%> </span> 
                                    <small class="pull-right" >查看人数:<%#Eval("msgLookTotal")%>  发布时间：<%#DateTime.Parse(Eval("msgTime").ToString())%> </small>               
                                </a>               
                            </li>
                          </ItemTemplate>
                       </asp:Repeater>
                   </ul>
               </div>
                <div style="top:630px; left:360px;position:absolute;">
                   <cc:AspNetPager ID="pager" AlwaysShow="true" OnPageChanged="pager_PageChanged" runat="server" FirstPageText="首页" LastPageText="尾页" CssClass="paginator" NextPageText="下一页" PrevPageText="上一页">
                   </cc:AspNetPager>
                </div>
            </div>
             <div class="center_right">
               <div class="center_right_top">
                    <div class="labelAccount"><label>学号</label></div> 
                    <div class="txtAccount">  
                         <input id="txtSno" type="text"  class="txtAccount"  placeholder=" 请输入学号" runat="server"/>
                    </div>
                </div>
                <div class="center_right_center">
                    <div class="labelPwd"><label>密码</label></div> 
                    <div  class="txtPwd">
                      <input id="stuPwd" type="password"  placeholder=" 请输入密码" class="txtPwd" runat="server"/>
                      <input type="hidden" id="ps" runat="server"/>
                   </div>
                </div>
                 <div class="center_right_end">
                    <div class="labelYanZheng"><label>验证</label></div> 
                    <div  class="txtYanZheng">
                        <input type="text"  class="txtYanZheng"  placeholder=" 请输入验证码" id="txtVerificate" runat="server"/> 
                    </div>
                    <div  class="YanZhengMa">  
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../PublicPage/CheckCode.aspx"  alt="验证码,看不清楚?请点击刷新验证码" style="cursor : pointer; height:30px; float:left;" onClick="this.src='../../PublicPage/CheckCode.aspx?t='+(new Date().getTime());"/>
                    </div>
                </div>
                 
                <div class="rememberPwd">
                     <label for="checkPassword" class="checkPassword">
                         <input type="checkbox" class="checkPwd" id='checkPassword' name='checkPassword' runat="server"/><span>记住密码</span> 
                     </label>
                </div>
                 <div>
                     <input type="button" class="subLogin" value="登 录" runat="server" onserverclick="LoginClick"/> 
                </div>
                <div class="center_bottom">
                      <div style="float:left; margin-left:40px; color:red;font-family:'黑体'" id="hint" runat="server"> 
                      </div>
                    <div style="float:left; margin-left:260px;"> 
                        <a href="#" id="forget">忘了密码?</a>
                   </div>
                </div>
                 <div> 
                 </div> 
            </div>
      </div>
     </div>
     <div class="endExam">
             Copyright @ 2016 安徽信息工程学院报名考试--文津校区考点
     </div>
     <div class="neiceng"></div>
<!-- 找回密码 -->
      <div class="bigBody">
            <div class="pwdHeader">
                <div class="pwdHeader_left">
                    找回密码
                </div>
                <div class="pwdHeader_right" title="关闭">
                    ×
                </div>
            </div> 
              <div class="pwdBottom">
                  <div class="title">
                      提示:请输入登录时填写的电子邮箱 
                  </div>
                    <div class="findPwd">
                        <div class="con">
                           <label>学号</label>
                           <input type="text" placeholder="输入学号" class="sno" id="txtStnNo"/><span>***</span>
                        </div>
                        <div class="con">
                            <label>邮箱</label>
                            <input type="email" placeholder="输入邮箱" id='inEmail'/><span>***</span>
                        </div>
                    <div>
                    <div class="pwdEnd">
                        <div class="pwdSure">
                            <img src='../../Imgs/icon_correct.png'/>
                            <input type="button" value="确定" class="sure" />
                        </div>
                        <div class="pwdBack"> 
                            <img src='../../Imgs/bk.png'/>
                            <input type="button" value="返回登录" class="back"/>
                        </div>
                    </div>
                </div>
            </div>
          </div>
      </div>
  </form>
</body>
</html>
