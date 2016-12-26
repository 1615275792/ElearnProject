using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
    public class GradeMgr
    {
        /// <summary>
        /// 数据插入
        /// </summary>
        /// <param name="emp"></param>
        /// <returns></returns>
        public Boolean AddGrade(Grade grade)
        {
            try
            {
                return GradeAccess.InsertGrade(grade);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 查看成绩列表：返回所有的成绩
        /// </summary>
        /// <returns></returns>
        public List<Grade> ShowMessageList()
        {
            try
            {
                return GradeAccess.SelectGrade();
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
        public List<Grade> ShowGradeList(string gradeSno)
        {
            try
            {
                string sqlWhere = string.Format(" and  gradeSno='{0}' ", gradeSno);
                List<Grade> list = GradeAccess.SelectSingleGrade(sqlWhere);
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
    }
}
