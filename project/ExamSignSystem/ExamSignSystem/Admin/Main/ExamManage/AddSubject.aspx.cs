using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.ExamManage
{
    public partial class AddSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Add_Click(object sender, EventArgs e)
        {
            ExamSignSystemEntity.Subject subject = new ExamSignSystemEntity.Subject();
            SubjectMgr mgr = new SubjectMgr();
            if (this.txtSubjectName.Value == "" || this.txtExamAddress.Value == "" || this.txtEaxmTime.Value == "" || this.et.Value == "" || this.st.Value == "")
            {
                Response.Write("<script>alert('请将信息完善！');</script>");
            }
            else
            {
                subject.subjectName = this.txtSubjectName.Value.Trim();
                subject.subjectSignStartTime = DateTime.Parse(this.st.Value.Trim());
                subject.subjectSignEndTime = DateTime.Parse(this.et.Value.Trim());
                subject.subjectExamTime = DateTime.Parse(this.txtEaxmTime.Value.Trim());
                subject.subjectExamAddress = this.txtExamAddress.Value.Trim();
                mgr.AddSubject(subject);
                Response.Write("<script>alert('科目已添加成功！');</script>");
            }
        }
    }
}