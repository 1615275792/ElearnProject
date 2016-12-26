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
    public partial class ModifyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StudentMgr mgr = new StudentMgr();
                ExamSignSystemEntity.Student student = mgr.ShowStudentInfo(ContextObjects.CurrentStudent.stuNo);
                this.txtName.Value = student.stuName;
                this.txtSex.Value = student.stuSex;
                this.txtAddress.Value = student.stuAddress;
                this.email.Value = student.stuEmail;
                this.txtMobile.Value = student.stuMobile;
            }
        }
        protected void SureModify_Click(object sender, EventArgs e)
        {
            StudentMgr mgr = new StudentMgr();
            ExamSignSystemEntity.Student student = new  ExamSignSystemEntity.Student();
            student.stuName = this.txtName.Value.Trim();
            student.stuSex = this.txtSex.Value.Trim();
            student.stuAddress = this.txtAddress.Value.Trim();
            student.stuEmail = this.email.Value.Trim();
            student.stuMobile = this.txtMobile.Value.Trim();
            if (this.txtName.Value.Trim() == "" || this.txtSex.Value.Trim() == "" || this.txtAddress.Value.Trim() == "" || this.email.Value.Trim()=="" || this.txtMobile.Value.Trim()=="")
            {
                Response.Write("<script>alert('请将信息填写完整！');</script>");
            }
            else
            {
                //判断邮箱
                string emailPattern = @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"; 
                Regex emailEegex = new Regex(emailPattern);
                if (emailEegex.IsMatch(student.stuEmail))
                {
                    //判断手机号
                    Regex regex = new Regex("^1[34578]\\d{9}$");
                    if (regex.IsMatch(student.stuMobile))
                    {
                        mgr.UpdateStudent(ContextObjects.CurrentStudent.stuNo, student);
                        Response.Write("<script>alert('修改成功！');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('手机号码的格式不正确！');</script>");
                    }
                }
                else 
                {
                    Response.Write("<script>alert('邮箱的格式不正确！');</script>");
                }
           } 
        }
    }
}