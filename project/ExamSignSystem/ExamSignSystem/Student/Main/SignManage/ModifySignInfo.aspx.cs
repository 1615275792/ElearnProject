using ExamSignSystem.Core;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main.SignManage
{
    public partial class ModifySignInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                StudentSignInfoMgr mgr = new StudentSignInfoMgr();
                StudentSignInfo signInfo = mgr.ShowSignInfo(ContextObjects.CurrentStudent.stuNo);
                this.txtName.Value = signInfo.stuName;
                this.txtSno.Value = signInfo.stuNo;
                this.txtMajor.Value = signInfo.stuMajor;
                this.txtClass.Value = signInfo.stuClass;
                this.txtMobile.Value = signInfo.stuMobile;
            }
        }
        //修改
        protected void ModifySign_Click(object sender, EventArgs e) 
        {
            StudentMgr mgr = new StudentMgr();
            ExamSignSystemEntity.Student student = new ExamSignSystemEntity.Student();
            student.stuName = this.txtName.Value.Trim();
            student.stuMajor=this.txtMajor.Value.Trim();
            student.stuClass = this.txtClass.Value.Trim();
            student.stuMobile = this.txtMobile.Value.Trim();
            if (this.txtName.Value.Trim() == "" || this.txtMajor.Value.Trim() == "" || this.txtClass.Value.Trim() == "" || this.txtMobile.Value.Trim() == "")
            {
                Response.Write("<script>alert('请将信息填写完整！');</script>");
            }
            else
            {
                Regex regex = new Regex("^1[34578]\\d{9}$");
                if (regex.IsMatch(student.stuMobile))
                {
                    mgr.UpdateSign(ContextObjects.CurrentStudent.stuNo, student);
                    Response.Write("<script>alert('修改成功！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('手机号码的格式不正确！');</script>");
                }
            }
            
        }
    }
}