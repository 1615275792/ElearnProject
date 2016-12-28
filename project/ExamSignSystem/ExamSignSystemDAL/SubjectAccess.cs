using CommonLibs.Utilities;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemDAL
{
    public class SubjectAccess
    {
        /// <summary>
        /// 插入对象
        /// </summary>
        /// <param name="entity">待插入实体对象</param>
        /// <returns></returns>
        public static bool Insert(Subject entity)
        {
            string sql = "insert into [tb_Subject] (subjectName,subjectSignStartTime,subjectSignEndTime,subjectExamTime,subjectExamAddress) values (@subjectName,@subjectSignStartTime ,@subjectSignEndTime,@subjectExamTime,@subjectExamAddress)";
            SqlParameter[] prams =  { 
                new SqlParameter("@subjectName",entity.subjectName),
                new SqlParameter("@subjectSignStartTime",entity.subjectSignStartTime),
                new SqlParameter("@subjectSignEndTime",entity.subjectSignEndTime),
                new SqlParameter("@subjectExamTime",entity.subjectExamTime),
                new SqlParameter("@subjectExamAddress",entity.subjectExamAddress)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }

        /// <summary>
        /// 更新信息
        /// </summary>
        /// <param name="stuNo"></param>
        /// <param name="newEntity"></param>
        /// <returns></returns>
        public static bool UpdateInfo(int subjectID, Subject newEntity)
        {
            string sql = "update [tb_Subject] set subjectName=@subjectName,subjectSignStartTime=@subjectSignStartTime,subjectSignEndTime=@subjectSignEndTime,subjectExamTime=@subjectExamTime,subjectExamAddress=@subjectExamAddress where subjectID= @subjectID ";

            SqlParameter[] prams =  { 
                new SqlParameter("@subjectName",newEntity.subjectName),
                new SqlParameter("@subjectSignStartTime",newEntity.subjectSignStartTime),
                new SqlParameter("@subjectSignEndTime",newEntity.subjectSignEndTime),
                new SqlParameter("@subjectExamTime",newEntity.subjectExamTime),
                new SqlParameter("@subjectExamAddress",newEntity.subjectExamAddress),
                new SqlParameter("@subjectID",subjectID)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 删除对象
        /// </summary>
        /// <param name="entityID">待删除实体对象的标识号</param>
        /// <returns></returns>
        public static bool Delete(int subjectID)
        {
            string sql = "delete from [tb_Subject] where subjectID = @ID";
            SqlParameter[] prams =  { 
                new SqlParameter("@ID",subjectID)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 查询科目名称(管理员)
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Subject> SelectAdminSubjectName()
        {
            string sql = "select top 2 subjectName from [tb_Subject] where subjectSignEndTime < GETDATE() order by subjectSignEndTime ASC";
            List<Subject> result = SqlHelper.ExecuteReader<Subject>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询科目名称(学生)
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static string SelectSubjectName()
        {
            string sql = "select top 1 subjectName from ViewSubject order by subjectSignEndTime ASC";
            string result = SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sql, null).ToString();
            return result;
        }
        /// <summary>
        /// 查询对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Subject> SelectManageSubject()
        {
            string sql = "select  * from [tb_Subject] where 1=1";
            List<Subject> result = SqlHelper.ExecuteReader<Subject>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Subject> SelectALLSubject()
        {
            string sql = "select  * from [ViewSubject] where 1=1";
            List<Subject> result = SqlHelper.ExecuteReader<Subject>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Subject> SelectSingleSubject(string sqlWhere)
        {
            string sql = "select * from [tb_Subject] where 1=1 " + sqlWhere;
            List<Subject> result = SqlHelper.ExecuteReader<Subject>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Subject> SelectSignSubject(string sqlWhere)
        {
            string sql = "select * from [ViewSubject] where 1=1 " + sqlWhere;
            List<Subject> result = SqlHelper.ExecuteReader<Subject>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定科目下的报名结束时间
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static string SelectSignEndTime(string sqlWhere)
        {
            string sql = "select subjectSignEndTime from [tb_Subject] where 1=1 " + sqlWhere;
            string result = SqlHelper.ExecuteScalar(System.Data.CommandType.Text, sql, null).ToString();
            return result;
        }
        /// <summary>
        /// 分页查询(管理员)
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="tableColumns">表列</param>
        /// <param name="sqlSort">表排序</param>
        /// <param name="where">条件SQL子句</param>
        /// <param name="pageIndex">当前页码索引，从0开始</param>
        /// <param name="pageSize">每页显示条数</param>
        /// <param name="orderBy">排序</param>
        /// <returns></returns>
        public static Pager<Subject> Select(string where, int pageIndex, int pageSize, string orderBy)
        {
            // 定义结果
            Pager<Subject> pager = null;
            string tableName = " [tb_Subject] ";
            string tableColumns = " * ";
            string sqlSort = string.IsNullOrEmpty(orderBy) ? "subjectSignEndTime DESC" : orderBy;
            pager = SqlHelper.ExecutePager<Subject>(tableName, tableColumns, where, sqlSort, pageIndex, pageSize);
            if (pager == null)
            {
                throw new Exception("查找时发生异常");
            }
            return pager;
        }
        /// <summary>
        /// 分页查询(学生)
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="tableColumns">表列</param>
        /// <param name="sqlSort">表排序</param>
        /// <param name="where">条件SQL子句</param>
        /// <param name="pageIndex">当前页码索引，从0开始</param>
        /// <param name="pageSize">每页显示条数</param>
        /// <param name="orderBy">排序</param>
        /// <returns></returns>
        public static Pager<Subject> StuSelectSubject(string where, int pageIndex, int pageSize, string orderBy)
        {
            // 定义结果
            Pager<Subject> pager = null;
            string tableName = " [ViewSubject] ";
            string tableColumns = " * ";
            string sqlSort = string.IsNullOrEmpty(orderBy) ? "subjectID asc" : orderBy;
            pager = SqlHelper.ExecutePager<Subject>(tableName, tableColumns, where, sqlSort, pageIndex, pageSize);
            if (pager == null)
            {
                throw new Exception("查找时发生异常");
            }
            return pager;
        }
    }
}
