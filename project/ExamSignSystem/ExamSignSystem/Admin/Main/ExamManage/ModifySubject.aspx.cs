using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.ExamManage
{
    public partial class ModifySubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int subjectID = int.Parse(Request.QueryString["subjectID"]);
                this.subjectID.Value = subjectID.ToString();
                SubjectMgr mgr = new SubjectMgr();
                ExamSignSystemEntity.Subject subject = mgr.ShowSingleSubject(subjectID);
                this.txtSubjectName.Value = subject.subjectName;
                this.txtAddress.Value = subject.subjectExamAddress;
                this.txtExamTime.Value = subject.subjectExamTime.ToString("yyyy-MM-dd");
                this.et.Value = subject.subjectSignEndTime.ToString("yyyy-MM-dd");
                this.st.Value = subject.subjectSignStartTime.ToString("yyyy-MM-dd");
            }
        }
        protected void Modify_Click(object sender, EventArgs e)
        {
            int subjectId = int.Parse(this.subjectID.Value.Trim());
            ExamSignSystemEntity.Subject subject = new ExamSignSystemEntity.Subject();
            if (this.txtSubjectName.Value == "" || this.txtSubjectName.Value == "" || this.txtExamTime.Value == "" || this.et.Value == "" || this.st.Value == "")
            {
                Response.Write("<script>alert('请将信息完善！');</script>");
            }
            else
            {
                SubjectMgr mgr = new SubjectMgr();
                subject.subjectName = this.txtSubjectName.Value.Trim();
                subject.subjectSignEndTime = DateTime.Parse(this.st.Value.Trim());
                subject.subjectSignStartTime = DateTime.Parse(this.et.Value.Trim());
                subject.subjectExamTime = DateTime.Parse(this.txtExamTime.Value.Trim());
                subject.subjectExamAddress = this.txtAddress.Value.Trim();
                mgr.UpdateSubject(subjectId, subject);
                Response.Write("<script>alert('科目已修改成功！');</script>");
            }
        }
    }
}