using ExamSignSystem.Core;
using ExamSignSystemBLL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Student.Main.Query
{
    public partial class QueryOperate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Query_Click(object sender, EventArgs e)
        {
            string stuSno = this.txtGradeSno.Value.Trim();
            string Pwd = this.txtGradePwd.Value.Trim();
            if (stuSno == "" || Pwd == "")
            {
                this.hintGrade.InnerHtml = "学号或者密码不能为空！";
            }
            else
            {
                MD5Encrypt MD5 = new MD5Encrypt();
                string stuPwd = MD5.GetMD5(Pwd);
                StudentMgr mgr = new StudentMgr();
                ExamSignSystemEntity.Student student = mgr.Login(stuSno, stuPwd);
                if (student != null)
                {
                    GradeMgr grade = new GradeMgr();
                    List<Grade> list = grade.ShowGradeList(stuSno);
                    if (list != null)
                    {
                        this.showGrade.Attributes.Add("style", "display:block");
                        this.Repeater1.DataSource = list;
                        this.Repeater1.DataBind();
                        this.hintGrade.InnerHtml = "";
                    }
                    else
                    {
                        this.hintGrade.InnerHtml = "可能没有考试！";
                        this.showGrade.Attributes.Add("style", "display:none");
                    }
                }
                else
                {
                    this.hintGrade.InnerHtml = "账号或者密码输入错误！";
                    this.showGrade.Attributes.Add("style", "display:none");
                }
            }

        }
        //查询报名信息
        [System.Web.Services.WebMethod]
        public static string FindSignInfo(string stuSno, string stuPwd)
        {
            StudentSignInfoMgr mgr = new StudentSignInfoMgr();
            MD5Encrypt MD5 = new MD5Encrypt();
            string stuPassword = MD5.GetMD5(stuPwd);
            List<ExamSignSystemEntity.StudentSignInfo> signInfo = mgr.CheckLoginInfo(stuSno, stuPassword);
            if (signInfo != null)
            {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                return serializer.Serialize(signInfo);
            }
            else
            {
                return "false";
            }
        }
    }
}