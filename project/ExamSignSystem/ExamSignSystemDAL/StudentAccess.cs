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
    public class StudentAccess
    {
        /// <summary>
        /// 更新对象(补充)
        /// </summary>
        /// <param name="entityID">更新的实体对象的标识号</param>
        /// <param name="newEntity">待更新实体对象</param>
        /// <returns></returns>
        public static bool UpdateStudent(string stuNo, Student student)
        {
            string sql = "update [tb_Student] set stuMobile=@stuMobile,stuEmail=@stuEmail,stuPolitical=@stuPolitical,stuAddress=@stuAddress where stuNo = @stuNo ";
            SqlParameter[] prams =  { 
                new SqlParameter("@stuMobile",student.stuMobile),
                new SqlParameter("@stuEmail",student.stuEmail),
                new SqlParameter("@stuPolitical",student.stuPolitical),
                new SqlParameter("@stuAddress",student.stuAddress),
                new SqlParameter("@stuNo",stuNo)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="entityID">更新的实体对象的标识号</param>
        /// <param name="newEntity">待更新实体对象</param>
        /// <returns></returns>
        public static bool UpdatePassword(string stuNo,string stuPwd)
        {
            string sql = "update [tb_Student] set stuPwd=@stuPwd where stuNo= @stuNo ";
            SqlParameter[] prams =  { 
                new SqlParameter("@stuPwd",stuPwd),
                new SqlParameter("@stuNo",stuNo)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 更新信息(修改)
        /// </summary>
        /// <param name="stuNo"></param>
        /// <param name="newEntity"></param>
        /// <returns></returns>
        public static bool UpdateInfo(string stuNo, Student newEntity)
        {
            string sql = "update [tb_Student] set stuName=@stuName,stuSex=@stuSex,stuMobile=@stuMobile,stuEmail=@stuEmail,stuAddress=@stuAddress where stuNo= @stuNo ";

            SqlParameter[] prams =  { 
                new SqlParameter("@stuName",newEntity.stuName),
                new SqlParameter("@stuSex",newEntity.stuSex),
                new SqlParameter("@stuMobile",newEntity.stuMobile),
                new SqlParameter("@stuEmail",newEntity.stuEmail),
                new SqlParameter("@stuAddress",newEntity.stuAddress),
                new SqlParameter("@stuNo",stuNo)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
        /// <summary>
        /// 更新信息(报名信息修改)
        /// </summary>
        /// <param name="stuNo"></param>
        /// <param name="newEntity"></param>
        /// <returns></returns>
        public static bool UpdateSignInfo(string stuNo, Student newEntity)
        {
            string sql = "update [tb_Student] set stuName=@stuName,stuMajor=@stuMajor,stuClass=@stuClass,stuMobile=@stuMobile where stuNo= @stuNo ";

            SqlParameter[] prams =  { 
                new SqlParameter("@stuName",newEntity.stuName),
                new SqlParameter("@stuMajor",newEntity.stuMajor),
                new SqlParameter("@stuClass",newEntity.stuClass),
                new SqlParameter("@stuMobile",newEntity.stuMobile),
                new SqlParameter("@stuNo",stuNo)
            };
            return SqlHelper.ExecuteNonQuery(System.Data.CommandType.Text, sql, prams);
        }
         /// <summary>
        /// 查询获取特定条件下的对象集合(个人信息)
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Student> Select(string sqlWhere)
        {
            string sql = "select * from [tb_Student] where 1=1 " + sqlWhere;

            List<Student> result = SqlHelper.ExecuteReader<Student>(System.Data.CommandType.Text, sql, null);
            return result;
        }
        /// <summary>
        /// 查询获取特定条件下的对象集合
        /// </summary>
        /// <param name="sqlWhere">SQL语句的where子句</param>
        /// <returns></returns>
        public static List<Student> SelectEmail(string sqlWhere)
        {
            string sql = "select stuEmail from [tb_Student] where 1=1 " + sqlWhere;

            List<Student> result = SqlHelper.ExecuteReader<Student>(System.Data.CommandType.Text, sql, null);
            return result;
        }
    }
}
