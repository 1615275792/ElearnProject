using CommonLibs.Utilities;
using ExamSignSystemDAL;
using ExamSignSystemEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemBLL
{
    public class MessageMgr
    {
        /// <summary>
        /// 添加通告
        /// </summary>
        /// <param name="emp">实体类对象</param>
        /// <returns></returns>
        public Boolean AddMessage(Message msg)
        {
            // 判断数据的有效性
            try
            {
                return MessageAccess.InsertMessage(msg);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 查看通告列表：返回所有的通告
        /// </summary>
        /// <returns></returns>
        public List<Message> ShowMessageList()
        {
            try
            {
                return MessageAccess.SelectMessage();
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 更新通告查阅次数
        /// </summary>
        /// <param name="id"></param>
        /// <param name="diary"></param>
        /// <returns></returns>
        public Boolean UpdateMessageTotal(int msgID)
        {
            MessageAccess.Update(msgID);
            return true;
        }
        /// <summary>
        ///删除通告
        /// </summary>
        /// <param name="diaryID"></param>
        /// <returns></returns>
        public Boolean DeleteAnnunciate(int msgID)
        {
            try
            {
                return MessageAccess.DeleteMessage(msgID);
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// 分页显示
        /// </summary>
        /// <param name="pageIndex">几页</param>
        /// <param name="pageSize">每页的数量</param>
        /// <returns></returns>
        public Pager<Message> ShowPagerMessageList(int pageIndex, int pageSize)
        {
            List<Message> rows = new List<Message>();
            rows = MessageAccess.SelectMessage();
            for (int i = 0; i < pageSize; i++)
            {
                if (pageIndex * pageSize + i < rows.Count)
                {
                    rows.Add(rows[pageIndex * pageSize + i]);
                }
            }
            try
            {
                return MessageAccess.Select("", pageIndex, pageSize, "msgID asc");
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 查看单个通告(根据ID)
        /// </summary>
        /// <returns></returns>
        public Message ShowSingleMessage(int msgID)
        {
            try
            {
                string sqlWhere = string.Format(" and  msgId= {0}", msgID);
                List<Message> list = MessageAccess.SelectSingleMessage(sqlWhere);
                if (list != null && list.Count > 0)
                {
                    return list[0];
                }
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        /// <summary>
        /// 查看单个通告(根据标题)
        /// </summary>
        /// <returns></returns>
        public List<Message> LookSingleMessage(string msgTitle)
        {
            try
            {
                string sqlWhere = string.Format(" and  msgTitle= '{0}'", msgTitle);
                List<Message> list = MessageAccess.SelectSingleMessage(sqlWhere);
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
