using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main
{
    public partial class Operate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.stuName.InnerText = ContextObjects.CurrentStudent.stuName;
                SubjectMgr mgr = new SubjectMgr();
                string subjectName = mgr.ShowSubjectName();
                this.subName.InnerText = subjectName;
            }
        }
    }
}