using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamSignSystem.Core
{
    public class BasePage:System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            // 如果是登录页面的话，则进入登录
            if (Request.Url.ToString().ToLower().Contains("Login"))
            {
                return;
            }
            // 非登录页都要进行验证账号
            if (ContextObjects.CurrentStudent == null)
            {
                Response.Redirect("../Student/StuLogin/Login.aspx", true);
            }
        }
    }
}