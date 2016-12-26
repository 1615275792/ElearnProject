using CommonLibs.Utilities;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemDAL
{
    public class GradeAccess
    {
        /// <summary>
        /// 插入成绩
        /// </summary>
        /// <param name="msg">待插入的实体对象</param>
        /// <returns></returns>
        public static bool InsertGrade(Grade grade)
        {
            string sql = "insert into [tb_Grade] (gradeID,gradeSno,gradeSubject,gradeTime,gradeScore) values (@gradeID,@gradeSno,@gradeSubject ,@gradeTime,@gradeScore)";
            SqlParameter[] prams =  { 
                new SqlParameter("@gradeID",grade.gradeID),
                new SqlParameter("@gradeSno",grade.gradeSno),
                new SqlParameter("@gradeSubject",grade.gradeSubject),
                new SqlParameter("@gradeTime",grade.gradeTime),
                new SqlParameter("@gradeScore",grade.gradeScore) 
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 查询获取所有对象集合
        /// </summary>
        /// <returns></returns>
        public static List<Grade> SelectGrade()
        {
            string sql = "select * from [tb_Grade] ";
            List<Grade> result = SqlHelper.ExecuteReader<Grade>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Grade> SelectSingleGrade(string sqlWhere)
        {
            string sql = "select * from [tb_Grade] where 1=1 " + sqlWhere;
            List<Grade> result = SqlHelper.ExecuteReader<Grade>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
