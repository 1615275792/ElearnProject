using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.AnnunciateManage
{
    public partial class AddAnnunciate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //添加通告
        [System.Web.Services.WebMethod]
        public static int Add(string msgTitle, string msgContent)
        {
            ExamSignSystemEntity.Message msg = new ExamSignSystemEntity.Message();
            MessageMgr mgr = new MessageMgr();
            msg.msgContents = msgContent;
            msg.msgTitle = msgTitle;
            msg.msgLookTotal = "0";
            msg.msgTime = DateTime.Now;
            if (mgr.AddMessage(msg))
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