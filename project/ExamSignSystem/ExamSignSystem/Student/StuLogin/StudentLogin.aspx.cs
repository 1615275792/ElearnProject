using CommonLibs.Utilities;
using ExamSignSystem.Core;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student
{
    public partial class Login : System.Web.UI.Page
    {
        public string password = string.Empty;
        public Boolean CheckStatus
        {
            get
            {
                if (this.Session["CheckStatus"] == null)
                {
                    this.Session["CheckStatus"] = false;
                }
                return Boolean.Parse(this.Session["CheckStatus"].ToString());
            }
            set
            {
                this.Session["CheckStatus"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(this.CheckStatus == true)
                {
                    this.txtSno.Value = ContextObjects.CurrentStudent.stuNo;
                    password = ContextObjects.CurrentStudent.stuPwd;
                    this.checkPassword.Checked = true;
                }
                this.pager.PageSize =10;
                LoadPage();
            }
            Boolean status = this.checkPassword.Checked;
            this.CheckStatus = status;
        }
        //学生登录
        protected void LoginClick(object sender, EventArgs e)
        {
            string stuSno = this.txtSno.Value.Trim();
            string Pwd = this.stuPwd.Value.Trim();
            MD5Encrypt MD5 = new MD5Encrypt();
            string stuPwd = MD5.GetMD5(Pwd);
            //隐藏框的值
            string hint = this.ps.Value.Trim();
            if (Session["CheckCode"] != null && hint == "")
            {
                //这样写可以不能区分大小写
                if (Session["CheckCode"].ToString().ToUpper() == this.txtVerificate.Value.Trim().ToString().ToUpper())
                {
                    StudentMgr mgr = new StudentMgr();
                    ExamSignSystemEntity.Student student = mgr.Login(stuSno, stuPwd);
                    if (student != null)
                    {
                        // 把当前用户保存下来
                        ContextObjects.CurrentStudent = student;
                        Response.Redirect("../Main/Operate.aspx", true);
                    }
                    else
                    {
                        string sp = "账号或密码错误";
                        this.hint.InnerHtml = sp;
                        this.txtVerificate.Value = "";
                    }
                }
                else
                {
                    this.hint.InnerHtml = "验证码错误";
                    this.txtVerificate.Value = "";
                }
            }
            else if (Session["CheckCode"] != null && hint != "")
            {
                string stuPassword = this.stuPwd.Value.Trim();
                //这样写可以不能区分大小写
                if (Session["CheckCode"].ToString().ToUpper() == this.txtVerificate.Value.Trim().ToString().ToUpper())
                {
                    StudentMgr mgr = new StudentMgr();
                    ExamSignSystemEntity.Student student = mgr.Login(stuSno,stuPassword);
                    if (student != null)
                    {
                        // 把当前用户保存下来
                        ContextObjects.CurrentStudent = student;
                        Response.Redirect("../Main/Operate.aspx", true);
                    }
                    else
                    {
                        string sp = "账号或密码错误";
                        this.hint.InnerHtml = sp;
                        this.txtVerificate.Value = "";
                    }
                }
                else
                {
                    this.hint.InnerHtml = "验证码错误";
                    this.txtVerificate.Value = "";
                }
            }
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            LoadPage();
        }
        //分页显示
        private void LoadPage()
        {
            //rows是Message的列表
            MessageMgr msg = new MessageMgr();
            Pager<Message> allMsg = msg.ShowPagerMessageList(this.pager.CurrentPageIndex-1, this.pager.PageSize);
            this.MsgRepeater.DataSource = allMsg.rows;
            this.MsgRepeater.DataBind();
            this.pager.RecordCount = allMsg.total;
            if (allMsg == null)
            {
                string warn = "暂时没有通告";
                this.msgWarn.InnerHtml = warn;
            }

        }
        [System.Web.Services.WebMethod]
        public static int FindPwd(string stuSno,string stuEmail)
        {
            StudentMgr mgr = new StudentMgr();
            ExamSignSystemEntity.Student student = mgr.CheckEmail(stuSno, stuEmail);
            if (student != null)
            {
                MailFindPwd mail = new MailFindPwd();
                DateTime time = DateTime.Now;
                Boolean bl = mail.SendEmail(stuEmail, "找回密码", "亲爱的" + stuEmail + "：<br/>您在" + time + "提交了找回密码请求,系统为您的学号" + stuSno + "重置了密码。<br/>重置密码为123456");
                MD5Encrypt MD5 = new MD5Encrypt();
                string stuNewPwd = MD5.GetMD5("123456");
                mgr.UpdateStudentPassword(stuSno, stuNewPwd);
                return 1;
            }
            else 
            {
                return 0;
            }
        }
    }
}