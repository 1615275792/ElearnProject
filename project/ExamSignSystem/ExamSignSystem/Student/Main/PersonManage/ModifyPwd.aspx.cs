using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main.PersonManage
{
    public partial class ModifyPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Sure_Click(object sender, EventArgs e)
        {
            string newPwd = this.newPassword.Value.Trim();
            string surePwd = this.surePassword.Value.Trim();
            StudentMgr mgr = new StudentMgr();
            string stuNo = ContextObjects.CurrentStudent.stuNo;
            if (newPwd=="" || surePwd=="")
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
                string stuPwd = MD5.GetMD5(newPwd);
                mgr.UpdateStudentPassword(stuNo, stuPwd);
                Response.Write("<script>alert('密码已修改,请记住修改后的密码！');</script>");
            }
        }
    }
}