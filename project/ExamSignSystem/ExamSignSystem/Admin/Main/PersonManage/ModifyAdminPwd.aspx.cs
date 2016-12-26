using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.PersonManage
{
    public partial class ModifyAdminPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ModifyPwd_Click(object sender, EventArgs e)
        {
            string newPwd = this.newPassword.Value.Trim();
            string surePwd = this.surePassword.Value.Trim();
            AdminMgr mgr = new AdminMgr();
            string adminAccount= ContextObjects.CurrentAdmin.adminAccount;
            if (newPwd == "" || surePwd == "")
            {
                Response.Write("<script>alert('新密码不能为空！');</script>");
            }
            else if (newPwd != surePwd)
            {
                Response.Write("<script>alert('两次输入的密码不一样！');</script>");
            }
            else
            {
                MD5Encrypt MD5 = new MD5Encrypt();
                string adminPassword = MD5.GetMD5(newPwd);
                mgr.UpdateAdminPassword(adminAccount, adminPassword);
                Response.Write("<script>alert('密码已修改,请记住修改后的密码！');</script>");
            }
        }
    }
}