using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AdminLogin_Click(object sender, EventArgs e) 
        {
            string adminAccount = this.loginAccount.Value.Trim();
            string adminPwd = this.loginPwd.Value.Trim();
            MD5Encrypt MD5 = new MD5Encrypt();
            string adminPassword = MD5.GetMD5(adminPwd);

            if (Session["CheckCode"] != null)
            {
                //这样写可以不能区分大小写
                if (Session["CheckCode"].ToString().ToUpper() == this.txtVerify.Value.Trim().ToString().ToUpper())
                {
                    AdminMgr mgr = new AdminMgr();
                    ExamSignSystemEntity.Admin admin = mgr.Login(adminAccount, adminPassword);
                    if (admin != null)
                    {
                        // 把当前用户保存下来
                        ContextObjects.CurrentAdmin= admin;
                        Response.Redirect("../Main/Operate.aspx", true);
                    }
                    else
                    {
                        string sp = "账号或密码错误";
                        this.hint.InnerHtml = sp;
                        this.txtVerify.Value = "";
                    }
                }
                else
                {
                    this.hint.InnerHtml = "验证码错误";
                    this.txtVerify.Value = "";
                }
            }
        }
        /// <summary>
        /// 找回密码
        /// </summary>
        /// <param name="adminAccount"></param>
        /// <param name="adminEmail"></param>
        /// <returns></returns>
        [System.Web.Services.WebMethod]
        public static int AdminFindPwd(string adminAccount, string adminEmail)
        {
            AdminMgr mgr = new AdminMgr();
            ExamSignSystemEntity.Admin admin = mgr.CheckEmail(adminAccount, adminEmail);
            if (admin != null)
            {
                MailFindPwd mail = new MailFindPwd();
                DateTime time = DateTime.Now;
                Boolean bl = mail.SendEmail(adminEmail, "找回密码", "亲爱的" + adminAccount + "：<br/>您在" + time + "提交了找回密码请求,系统为您的账号" + adminAccount + "重置了密码。<br/>重置密码为123456");
                MD5Encrypt MD5 = new MD5Encrypt();
                string adminNewPwd = MD5.GetMD5("123456");
                mgr.UpdateAdminPassword(adminAccount, adminNewPwd);
                return 1;
            }
            else
            {
                return 0;
            }
        }
    }
}