using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
    public class AdminMgr
    {
        /// <summary>
        /// 管理员登录：输入账号密码，如果登录成功返回当前账号对象，否则返回NULL
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Admin Login(string account, string password)
        {
            if (string.IsNullOrEmpty(account))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and adminAccount ='{0}' and adminPwd='{1}'", account, password);
                List<Admin> list = AdminAccess.Select(sqlWhere);
                if (list != null && list.Count == 1)
                {
                    return list[0];
                }
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 更新管理员信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateAdmin(string adminAccount, Admin admin)
        {
            AdminAccess.UpdateAdmin(adminAccount, admin);
            return true;
        }
        /// <summary>
        /// 更新管理员密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateAdminPassword(string adminAccount, string adminPwd)
        {
            AdminAccess.UpdatePassword(adminAccount, adminPwd);
            return true;
        }
        /// <summary>
        ///  检查邮箱
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Admin CheckEmail(string adminAccount, string adminEmail)
        {
            if (string.IsNullOrEmpty(adminAccount))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and adminAccount ='{0}' and adminEmail='{1}'", adminAccount, adminEmail);
                List<Admin> list = AdminAccess.SelectEmail(sqlWhere);
                if (list != null && list.Count == 1)
                {
                    return list[0];
                }
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
         
    }
}
