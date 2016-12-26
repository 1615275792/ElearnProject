using ExamSignSystem.Core;
using ExamSignSystemBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.PersonManage
{
    public partial class FillEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //填写邮箱
        [System.Web.Services.WebMethod]
        public static int WriteEamil(string emailValue)
        {
            ExamSignSystemEntity.Admin admin = new ExamSignSystemEntity.Admin();
            AdminMgr am = new AdminMgr();
            string adminAccount = ContextObjects.CurrentAdmin.adminAccount;
            admin.adminEmail = emailValue.Trim();
            if (am.UpdateAdmin(adminAccount, admin))
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