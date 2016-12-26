using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
    public class StudentSignInfoMgr
    { 
        /// <summary>
        ///  检查Login信息
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public List<StudentSignInfo> CheckLoginInfo(string stuNo, string stuPwd)
        {
            if (string.IsNullOrEmpty(stuNo))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and stuNo ='{0}' and stuPwd='{1}'", stuNo, stuPwd);
                List<StudentSignInfo> list = StudentSignInfoAccess.SelectSignInfo(sqlWhere);
                if (list != null && list.Count > 0)
                {
                    return list;
                }
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        ///  检查Login信息
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public StudentSignInfo ShowSignInfo(string stuNo)
        {
            if (string.IsNullOrEmpty(stuNo))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and stuNo ='{0}'", stuNo);
                List<StudentSignInfo> list = StudentSignInfoAccess.SelectSignInfo(sqlWhere);
                if (list != null && list.Count > 0)
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
