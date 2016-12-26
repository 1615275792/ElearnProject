using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.StuLogin
{
    public partial class ShowAnnunciate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int msgID = int.Parse(Request.QueryString["msgID"]);
                MessageMgr msg = new MessageMgr();
                Message allMsg = msg.ShowSingleMessage(msgID);
                this.title.InnerText = allMsg.msgTitle;
                this.contents.InnerHtml = allMsg.msgContents;
                msg.UpdateMessageTotal(msgID);
            }
        }
    }
}