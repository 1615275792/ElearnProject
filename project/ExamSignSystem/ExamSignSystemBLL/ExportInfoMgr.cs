using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
   public class ExportInfoMgr
    {
        /// <summary>
        /// 查看列表
        /// </summary>
        /// <returns></returns>
        public List<ExportInfo> ShowList(string subjectName)
        {
            try
            {
                string sqlWhere = string.Format(" and  subjectName='{0}' ", subjectName);
                List<ExportInfo> list = ExportInfoAccess.SelectSubject(sqlWhere);
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
