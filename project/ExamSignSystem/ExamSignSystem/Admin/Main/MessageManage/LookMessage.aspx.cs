using CommonLibs.Utilities;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.AnnunciateManage
{
    public partial class LookAnnunciate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.AllMessage.Visible = false;
            this.pager.PageSize =5;
            LoadPage();
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            LoadPage();
        }
        //查看所有
        protected void LookAllMessage_Click(object sender, EventArgs e)
        {
            this.AllMessage.Visible = false;
            this.pager.PageSize = 5;
            this.showPager.Visible = true;
            this.txtMessageTitle.Value = "";
            LoadPage();
        }
        //分页显示
        private void LoadPage()
        {
            //rows是Message的列表
            MessageMgr msg = new MessageMgr();
            Pager<Message> allMsg = msg.ShowPagerMessageList(this.pager.CurrentPageIndex - 1, this.pager.PageSize);
            this.MsgRepeater.DataSource = allMsg.rows;
            this.MsgRepeater.DataBind();
            this.pager.RecordCount = allMsg.total;
            if (allMsg == null)
            {
                string warn = "暂时没有通告";
                this.msgWarn.InnerHtml = warn;
            }

        }
        //删除通告
        [System.Web.Services.WebMethod]
        public static int DeleteMessage(int msgID)
        {
            MessageMgr sm = new MessageMgr();
            if (sm.DeleteAnnunciate(msgID))
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据标题查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Query_Click(object sender, EventArgs e)
        {
            this.AllMessage.Visible = true;
            string msgName = this.txtMessageTitle.Value.Trim();
            if (msgName == "")
            {
                this.hint.InnerHtml = "请输入标题";
                this.AllMessage.Visible = false;
                this.showPager.Visible = true;
            }
            else
            {
                MessageMgr mgr = new MessageMgr();
                List<Message> message = mgr.LookSingleMessage(msgName);
                if (message != null)
                {
                    this.MsgRepeater.DataSource = message;
                    this.MsgRepeater.DataBind();
                    this.showPager.Visible = false;
                    this.hint.InnerHtml = "";
                }
                else
                {
                    this.hint.InnerHtml = "标题输入错误或者不存在";
                    this.AllMessage.Visible = false;
                    this.showPager.Visible = true;
                }
            }
        }
    }
}