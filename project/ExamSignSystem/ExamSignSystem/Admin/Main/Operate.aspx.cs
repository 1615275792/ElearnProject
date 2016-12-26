using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main
{
    public partial class Operate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                SubjectMgr mgr = new SubjectMgr();
                List<Subject> list = mgr.FindOldSubject();
                if (list.Count==0)
                {
                    this.move.Visible = false;
                }
                else if (list.Count == 1)
                {
                    this.subName.InnerText = list[0].subjectName; 
                    this.name.InnerText = "";
                }
                else
                {
                    this.subName.InnerText = list[0].subjectName;
                    this.name.InnerText = list[1].subjectName;
                }
            }
        }
    }
}