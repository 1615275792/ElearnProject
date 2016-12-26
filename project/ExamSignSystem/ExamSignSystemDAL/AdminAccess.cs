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
   public class AdminAccess
    {
        /// <summary>
        /// 更新对象
        /// </summary>
        /// <param name="entityID">更新的实体对象的标识号</param>
        /// <param name="newEntity">待更新实体对象</param>
        /// <returns></returns>
        public static bool UpdateAdmin(string adminAccount, Admin admin)
        {
            string sql = "update [tb_Admin] set adminEmail=@adminEmail where adminAccount = @adminAccount ";
            SqlParameter[] prams =  { 
                new SqlParameter("@adminEmail",admin.adminEmail),
                new SqlParameter("@adminAccount",adminAccount)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="entityID">更新的实体对象的标识号</param>
        /// <param name="newEntity">待更新实体对象</param>
        /// <returns></returns>
        public static bool UpdatePassword(string adminAccount, string adminPwd)
        {
            string sql = "update [tb_Admin] set adminPwd=@adminPwd where adminAccount= @adminAccount ";
            SqlParameter[] prams =  { 
                new SqlParameter("@adminPwd",adminPwd),
                new SqlParameter("@adminAccount",adminAccount)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Admin> Select(string sqlWhere)
        {
            string sql = "select * from [tb_Admin] where 1=1 " + sqlWhere;

            List<Admin> result = SqlHelper.ExecuteReader<Admin>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Admin> SelectEmail(string sqlWhere)
        {
            string sql = "select adminEmail from [tb_Admin] where 1=1 " + sqlWhere;

            List<Admin> result = SqlHelper.ExecuteReader<Admin>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
