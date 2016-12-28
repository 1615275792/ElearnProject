﻿using CommonLibs.Utilities;
using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
   public class SignMgr
    {
       public Boolean AddSign(Sign sign)
       {
           // 判断数据的有效性
           try
           {
               return SignAccess.InsertSign(sign);
           }
           catch (Exception ex)
           {
               return false;
           }
       }
       /// <summary>
       ///取消报名
       /// </summary>
       /// <param name="diaryID"></param>
       /// <returns></returns>
       public Boolean DeleteSign(int subjectID,string stuNo)
       {
           try
           {
               return SignAccess.DeleteSign(subjectID,stuNo);
           }
           catch (Exception ex)
           {
               return false;
           }
       }
       /// <summary>
       ///删除过期的科目
       /// </summary>
       /// <param name="diaryID"></param>
       /// <returns></returns>
       public Boolean DeleteSubject()
       {
           try
           {
               return SignAccess.DeleteSignSubject();
           }
           catch (Exception ex)
           {
               return false;
           }
       }
       /// <summary>
       /// 查看有没有过期的科目
       /// </summary>
       /// <returns></returns>
       public List<Sign> ShowOldSign()
       {
           try
           {
               List<Sign> list = SignAccess.SelectSignSubject();
               return list;
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
       public List<Sign> ShowSignIDList()
       {
           try
           {
               List<Sign> list = SignAccess.SelectSignID();
               return list;
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
        public List<Sign> ShowSignList(string stuNo)
        {
            try
            {
                string sqlWhere = string.Format(" and  stuNo='{0}' ", stuNo);
                List<Sign> list =SignAccess.SelectSingleSign(sqlWhere);
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
