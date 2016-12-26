using CommonLibs.Utilities;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.ExamManage
{
    public partial class SubjectManage : System.Web.UI.Page
    {
        public string signId = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            SignMgr signMgr = new SignMgr();
            List<Sign> signList = signMgr.ShowSignIDList();
            if (signList != null)
            {
                for (int j = 0; j < signList.Count; j++)
                {
                    signId += signList[j].subjectID + ",";
                }
            }
            this.AllSubject.Visible = false;
            this.pager.PageSize =6;
            LoadPage();
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            LoadPage();
        }
        protected void LookAllSubject_Click(object sender, EventArgs e)
        {
            this.AllSubject.Visible = false;
            this.pager.PageSize = 6;
            this.showPager.Visible = true;
            this.txtSubjectName.Value = "";
            LoadPage();
        }
        //分页显示
        private void LoadPage()
        {
            SubjectMgr msg = new SubjectMgr();
            Pager<Subject> allSubject = msg.ShowPagerAdminMessageList(this.pager.CurrentPageIndex - 1, this.pager.PageSize);
            this.Repeater1.DataSource = allSubject.rows;
            this.Repeater1.DataBind();
            this.pager.RecordCount = allSubject.total;
            if (allSubject == null)
            {
                string warn = "暂时没有报名科目";
                this.subWarn.InnerHtml = warn;
            }

        }
        protected void Query_Click(object sender, EventArgs e)
        {
            this.AllSubject.Visible= true;
            string subjectName = this.txtSubjectName.Value.Trim();
            if (subjectName=="")
            {
                this.hint.InnerHtml = "请输入科目名称";
                this.AllSubject.Visible = false;
                this.showPager.Visible = true;
            }
            else
            {
                SubjectMgr mgr = new SubjectMgr();
                List<Subject> subject = mgr.FindSingleSubject(subjectName);
                if (subject != null)
                {
                    this.Repeater1.DataSource = subject;
                    this.Repeater1.DataBind();
                    this.showPager.Visible = false;
                    this.hint.InnerHtml = "";
                }
                else
                {
                    this.hint.InnerHtml = "科目名称输入错误";
                    this.AllSubject.Visible = false;
                    this.showPager.Visible = true;
                }
            }
        }
        //删除科目
        [System.Web.Services.WebMethod]
        public static int DeleteSubject(int subjectID)
        {
            SubjectMgr sm = new SubjectMgr();
            if (sm.DeleteSubject(subjectID))
            {
                return 1;
            }
            else 
            {
                return 0;
            }
        }
    }
}