using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
    public class StudentMgr
    {
        /// <summary>
        /// 学生登录：输入账号密码，如果登录成功返回当前账号对象，否则返回NULL
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Student Login(string account, string password)
        {
            if (string.IsNullOrEmpty(account))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and stuNo ='{0}' and stuPwd='{1}'", account, password);
                List<Student> list = StudentAccess.Select(sqlWhere);
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
        /// 更新学生信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateStudent(string stuNo, Student stu)
        {
            StudentAccess.UpdateInfo(stuNo, stu);
            return true;
        }
        /// <summary>
        /// 更新学生信息(报名信息)
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateSign(string stuNo, Student stu)
        {
            StudentAccess.UpdateSignInfo(stuNo, stu);
            return true;
        }
        /// <summary>
        /// 更新学生密码
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateStudentPassword(string stuNo,string stuPwd)
        {
            StudentAccess.UpdatePassword(stuNo, stuPwd);
            return true;
        }
        /// <summary>
        ///  检查邮箱
        /// </summary>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Student CheckEmail(string stuNo, string stuEmail)
        {
            if (string.IsNullOrEmpty(stuNo))
            {
                return null;
            }
            try
            {
                string sqlWhere = string.Format(" and stuNo ='{0}' and stuEmail='{1}'", stuNo, stuEmail);
                List <Student> list= StudentAccess.SelectEmail(sqlWhere);
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
        /// 查看列表
        /// </summary>
        /// <returns></returns>
        public Student ShowStudentInfo(string stuNo)
        {
            try
            {
                string sqlWhere = string.Format(" and  stuNo='{0}' ", stuNo);
                List<Student> list = StudentAccess.Select(sqlWhere);
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
