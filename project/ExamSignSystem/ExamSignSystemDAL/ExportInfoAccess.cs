using CommonLibs.Utilities;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemDAL
{
    public class ExportInfoAccess
    {
        /// <summary>
        /// 查询对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<ExportInfo> SelectSubject(string sqlWhere)
        {
            string sql = "select tb_Student.stuNo,stuName,stuClass,stuMobile,subjectName,subjectExamTime from [tb_Sign],[tb_Subject],[tb_Student] where tb_Sign.subjectID=tb_Subject.subjectID and tb_Sign.stuNo=tb_Student.stuNo" + sqlWhere;
            List<ExportInfo> result = SqlHelper.ExecuteReader<ExportInfo>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
