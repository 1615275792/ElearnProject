using CommonLibs.Utilities;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemDAL
{
    public class StudentSignInfoAccess
    {
        /// <summary>
        /// 查询获取特定条件下的对象集合(报名信息)
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<StudentSignInfo> SelectSignInfo(string sqlWhere)
        {
            string sql = "select * from [ViewSignInfo] where 1=1 " + sqlWhere;

            List<StudentSignInfo> result = SqlHelper.ExecuteReader<StudentSignInfo>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
