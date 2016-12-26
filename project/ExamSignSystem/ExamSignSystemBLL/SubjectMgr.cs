using CommonLibs.Utilities;
using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
   public class SubjectMgr
    {
        /// <summary>
        /// 添加科目
        /// </summary>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean AddSubject(Subject subject)
        {
            try
            {
                return SubjectAccess.Insert(subject);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 更新科目信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateSubject(int subjectID, Subject sub)
        {
            SubjectAccess.UpdateInfo(subjectID, sub);
            return true;
        }
        /// <summary>
        ///删除科目
        /// </summary>
        /// <param name="diaryID"></param>
        /// <returns></returns>
        public Boolean DeleteSubject(int subjectID)
        {
            try
            {
                return SubjectAccess.Delete(subjectID);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 显示科目的名称
        /// </summary>
        /// <returns></returns>
        public string ShowSubjectName()
        {
            try
            {
                return SubjectAccess.SelectSubjectName();
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 查看过时科目
        /// </summary>
        /// <returns></returns>
        public List<Subject> FindOldSubject()
        {
            try
            {
                List<Subject> list = SubjectAccess.SelectAdminSubjectName();
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 查看单个科目(根据科目名称)
        /// </summary>
        /// <returns></returns>
        public List<Subject> FindSingleSubject(string subjectName)
        {
            try
            {
                string sqlWhere = string.Format(" and  subjectName= '{0}'", subjectName);
                List<Subject> list = SubjectAccess.SelectSignSubject(sqlWhere);
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
        /// 查看单个科目（根据ID）
        /// </summary>
        /// <returns></returns>
        public Subject ShowSingleSubject(int subjectID)
        {
            try
            {
                string sqlWhere = string.Format(" and  subjectID= {0}", subjectID);
                List<Subject> list = SubjectAccess.SelectSingleSubject(sqlWhere);
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
        /// <summary>
        /// 分页显示
        /// </summary>
        /// <param name="pageIndex">几页</param>
        /// <param name="pageSize">每页的数量</param>
        /// <returns></returns>
        public Pager<Subject> ShowPagerMessageList(int pageIndex, int pageSize)
        {
            List<Subject> rows = new List<Subject>();
            rows = SubjectAccess.SelectALLSubject();
            for (int i = 0; i < pageSize; i++)
            {
                if (pageIndex * pageSize + i < rows.Count)
                {
                    rows.Add(rows[pageIndex * pageSize + i]);
                }
            }
            try
            {
                return SubjectAccess.StuSelectSubject("", pageIndex, pageSize, "subjectID asc");
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 分页显示(管理员)
        /// </summary>
        /// <param name="pageIndex">几页</param>
        /// <param name="pageSize">每页的数量</param>
        /// <returns></returns>
        public Pager<Subject> ShowPagerAdminMessageList(int pageIndex, int pageSize)
        {
            List<Subject> rows = new List<Subject>();
            rows = SubjectAccess.SelectManageSubject();
            for (int i = 0; i < pageSize; i++)
            {
                if (pageIndex * pageSize + i < rows.Count)
                {
                    rows.Add(rows[pageIndex * pageSize + i]);
                }
            }
            try
            {
                return SubjectAccess.Select("", pageIndex, pageSize, "subjectSignEndTime DESC");
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
