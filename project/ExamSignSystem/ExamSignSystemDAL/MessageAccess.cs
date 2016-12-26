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
    public class MessageAccess
    {
        /// <summary>
        /// 插入通告
        /// </summary>
        /// <param name="msg">待插入的实体对象</param>
        /// <returns></returns>
        public static bool InsertMessage(Message msg)
        {
            string sql = "insert into [tb_Message] (msgTitle,msgLookTotal,msgTime,msgContents) values (@msgTitle,@msgLookTotal ,@msgTime,@msgContents)";
            SqlParameter[] prams =  { 
                new SqlParameter("@msgTitle",msg.msgTitle),
                new SqlParameter("@msgLookTotal",msg.msgLookTotal),
                new SqlParameter("@msgTime",msg.msgTime),
                new SqlParameter("@msgContents",msg.msgContents)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }

        /// <summary>
        /// 更新通告
        /// </summary>
        /// <param name="entityID">更新的实体对象的标识号</param>
        /// <param name="newEntity">待更新实体对象</param>
        /// <returns></returns>
        public static bool Update(int msgID)
        {
            string sql = "update [tb_Message] set msgLookTotal += @Num where msgID= @ID ";
            SqlParameter[] prams =  { 
                new SqlParameter("@Num",1),
                new SqlParameter("@ID",msgID)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }

        /// <summary>
        /// 删除通告
        /// </summary>
        /// <param name="entityID">待删除实体对象的标识号</param>
        /// <returns></returns>
        public static bool DeleteMessage(int msgID)
        {
            string sql = "delete from [tb_Message] where msgID = @ID";
            SqlParameter[] prams =  { 
                new SqlParameter("@ID",msgID)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 查询获取所有通告对象集合
        /// </summary>
        /// <returns></returns>
        public static List<Message> SelectMessage()
        {
            string sql = "select * from [tb_Message] ";
            List<Message> result = SqlHelper.ExecuteReader<Message>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Message> SelectSingleMessage(string sqlWhere)
        {
            string sql = "select * from [tb_Message] where 1=1 " + sqlWhere;
            List<Message> result = SqlHelper.ExecuteReader<Message>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <param name="tableColumns">表列</param>
        /// <param name="sqlSort">表排序</param>
        /// <param name="where">条件SQL子句</param>
        /// <param name="pageIndex">当前页码索引，从0开始</param>
        /// <param name="pageSize">每页显示条数</param>
        /// <param name="orderBy">排序</param>
        /// <returns></returns>
        public static Pager<Message> Select(string where, int pageIndex, int pageSize,string orderBy)
        {
            // 定义结果
            Pager<Message> pager = null;
            string tableName = " [tb_Message] ";
            string tableColumns = " * ";
            string sqlSort = string.IsNullOrEmpty(orderBy) ? "msgID asc" : orderBy;
            pager = SqlHelper.ExecutePager<Message>(tableName, tableColumns, where, sqlSort, pageIndex, pageSize);
            if (pager == null)
            {
                throw new Exception("查找时发生异常");
            }
            return pager;
        }
    }
}
