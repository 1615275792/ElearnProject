using CommonLibs.Utilities;
using ExamSignSystem.Core;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main.SignManage
{
    public partial class ExamSign : System.Web.UI.Page
    {
        public string signId=string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.AllSubject.Visible = false;
            string stuSno = ContextObjects.CurrentStudent.stuNo;
            SignMgr signMgr = new SignMgr();
            List<Sign> list = signMgr.ShowOldSign();
            if(list.Count!=0)
            {
                signMgr.DeleteSubject();
            }
            List<Sign> signList = signMgr.ShowSignList(stuSno);
            if (signList!=null)
            {
                for (int j = 0; j < signList.Count; j++)
                {
                    signId += signList[j].subjectID + ",";
                }
            }
            this.pager.PageSize = 10;
            LoadPage();
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            LoadPage();
        }
        //查看所有
        protected void FindAllSubject_Click(object sender, EventArgs e)
        {
            this.txtSubjectName.Value = "";
            this.AllSubject.Visible = false;
            string stuSno = ContextObjects.CurrentStudent.stuNo;
            SignMgr signMgr = new SignMgr();
            List<Sign> signList = signMgr.ShowSignList(stuSno);
            if (signList!=null)
            {
                for (int j = 0; j < signList.Count; j++)
                {
                    signId += signList[j].subjectID + ",";
                }
            }
            this.pager.PageSize = 10;
            LoadPage();
            this.showPager.Visible = true;
        }
        //查询
        protected void Query_Click(object sender, EventArgs e)
        {
            this.AllSubject.Visible = true;
            string subjectName = this.txtSubjectName.Value.Trim();
            if (subjectName == "")
            {
                this.hint.InnerHtml = "请输入科目名称";
                this.showPager.Visible = true;
                this.AllSubject.Visible = false;
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
                    this.hint.InnerHtml = "科目名称输入错误或者报名已截止";
                    this.showPager.Visible = true;
                    this.AllSubject.Visible = false;
                }
            }
        }
        //分页显示
        private void LoadPage()
        {
            SubjectMgr mgr = new SubjectMgr();
            Pager<Subject> allSubject = mgr.ShowPagerMessageList(this.pager.CurrentPageIndex - 1, this.pager.PageSize);
            this.Repeater1.DataSource = allSubject.rows;
            this.Repeater1.DataBind();
            this.pager.RecordCount = allSubject.total;
            if (allSubject == null)
            {
                string warn = "暂时没有报名科目";
                this.msgWarn.InnerHtml = warn;
            }

        }
        [System.Web.Services.WebMethod]
        public static int StartSign(int subjectID)
        {
            SubjectMgr mgr=new SubjectMgr();
            SignMgr sm = new SignMgr();
            Sign sign = new Sign();
            sign.subjectID = subjectID;
            sign.stuNo = ContextObjects.CurrentStudent.stuNo;
            sign.signEndTime = DateTime.Parse(mgr.ShowSignEndTime(subjectID));
            if (sm.AddSign(sign))
            {
                return 1;
            }
            else
            {
                return 0;
            }
            
        }
        [System.Web.Services.WebMethod]
        public static int CancelSign(int subjectID)
        {
            SignMgr sm = new SignMgr();
            string stuNo = ContextObjects.CurrentStudent.stuNo;
            if (sm.DeleteSign(subjectID,stuNo))
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