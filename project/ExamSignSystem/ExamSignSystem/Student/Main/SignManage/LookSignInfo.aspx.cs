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
    public partial class LookSignInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                StudentSignInfoMgr mgr = new StudentSignInfoMgr();
                StudentSignInfo signInfo = mgr.ShowSignInfo(ContextObjects.CurrentStudent.stuNo);
                this.stuName.InnerText = signInfo.stuName;
                this.stuSno.InnerText = signInfo.stuNo;
                this.stuMajor.InnerText = signInfo.stuMajor;
                this.stuClass.InnerText = signInfo.stuClass;
                this.stuMobile.InnerText = signInfo.stuMobile;
            }
        }
    }
}