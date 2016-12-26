using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main.PersonManage
{
    public partial class CompleteInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CompleteClick(object sender, EventArgs e)
        {
            ExamSignSystemEntity.Student student = new ExamSignSystemEntity.Student();
            StudentMgr mgr = new StudentMgr();
            string stuNo = ContextObjects.CurrentStudent.stuNo;
            student.stuMobile = this.txtMobile.Value.Trim();
            student.stuEmail = this.inputEmail.Value.Trim();
            student.stuPolitical = this.txtPolitical.Value.Trim();
            student.stuAddress = this.txtAddress.Value.Trim();
            if (student.stuMobile == "" || student.stuEmail == "")
            {
                Response.Write("<script>alert('手机号或者电子邮箱不能为空！');</script>");
            }
            else 
            {
                Regex regex = new Regex("^1[34578]\\d{9}$");
                if (regex.IsMatch(student.stuMobile))
                {
                    mgr.UpdateStudent(stuNo, student);
                    Response.Write("<script>alert('信息已完善！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('手机号码的格式不正确！');</script>");
                }
            }
        }
    }
}