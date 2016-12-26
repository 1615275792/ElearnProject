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
    public partial class LookInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                StudentMgr mgr = new StudentMgr();
                ExamSignSystemEntity.Student student = mgr.ShowStudentInfo(ContextObjects.CurrentStudent.stuNo);
                this.stuName.InnerText = student.stuName;
                this.stuSex.InnerText = student.stuSex;
                this.stuAddress.InnerText = student.stuAddress;
                this.stuEmail.InnerText = student.stuEmail;
                this.stuMobile.InnerText = student.stuMobile;
            }
        }
    }
}