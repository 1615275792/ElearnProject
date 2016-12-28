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
    public class SignAccess
    {
        /// <summary>
        /// Insert
        /// </summary>
        /// <param name="msg">待插入的实体对象</param>
        /// <returns></returns>
        public static bool InsertSign(Sign sign)
        {
            string sql = "insert into [tb_Sign] (stuNo,subjectID,signEndTime) values (@stuNo,@subjectID,@signEndTime)";
            SqlParameter[] prams =  { 
                new SqlParameter("@stuNo",sign.stuNo),
                new SqlParameter("@subjectID",sign.subjectID),
                new SqlParameter("@signEndTime",sign.signEndTime)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 取消报名
        /// </summary>
        /// <param name="entityID">待删除实体对象的标识号</param>
        /// <returns></returns>
        public static bool DeleteSign(int subjectID,string stuNo)
        {
            string sql = "delete from [tb_Sign] where subjectID = @ID and stuNo=@stuNo";
            SqlParameter[] prams =  { 
                new SqlParameter("@ID",subjectID),
                new SqlParameter("@stuNo",stuNo)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        ///删除过期的科目
        /// </summary>
        /// <param name="entityID">待删除实体对象的标识号</param>
        /// <returns></returns>
        public static bool DeleteSignSubject()
        {
            string sql = "delete from [tb_Sign] where signEndTime < GETDATE()";
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql,null);
        }
        /// <summary>
        ///查找过期的科目
        /// </summary>
        /// <param name="entityID">待删除实体对象的标识号</param>
        /// <returns></returns>
        public static List<Sign> SelectSignSubject()
        {
            string sql = "select * from [tb_Sign] where signEndTime < GETDATE()";
            List<Sign> result = SqlHelper.ExecuteReader<Sign>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Sign> SelectSignID()
        {
            string sql = "select distinct subjectID from [tb_Sign]";
            List<Sign> result = SqlHelper.ExecuteReader<Sign>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Sign> SelectSingleSign(string sqlWhere)
        {
            string sql = "select * from [tb_Sign] where 1=1 " + sqlWhere;
            List<Sign> result = SqlHelper.ExecuteReader<Sign>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
