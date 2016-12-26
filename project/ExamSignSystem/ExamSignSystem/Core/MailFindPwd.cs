using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystem.Core
{
    public class MailFindPwd
    {
        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="mailTo">收件人</param>
        /// <param name="mailSubject">主题</param>
        /// <param name="mailContent">内容</param>
        /// <returns></returns>
        public bool SendEmail(string mailTo, string mailSubject, string mailContent)
        {
            // 设置发送方的邮件信息,例如使用网易的smtp
            string smtpServer = "smtp.163.com"; //SMTP服务器
            string mailFrom = "15551212527@163.com"; //登陆用户名
            string userPassword = "xvvseirpwnfvrtst";//163登陆密码

            // 邮件服务设置
            SmtpClient smtpClient = new SmtpClient(smtpServer);
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;//指定电子邮件发送方式
            //smtpClient.Host = smtpServer; //指定SMTP服务器
            //smtpClient.UseDefaultCredentials = true;
            smtpClient.Credentials = new System.Net.NetworkCredential(mailFrom, userPassword);//用户名和密码

            // 发送邮件设置        
            MailMessage mailMessage = new MailMessage(mailFrom, mailTo);  
            mailMessage.From = new MailAddress(mailFrom);
            mailMessage.Subject = mailSubject; 
            mailMessage.Body = mailContent; 
            mailMessage.BodyEncoding = Encoding.UTF8;//正文编码
            mailMessage.IsBodyHtml = true;//设置为HTML格式
            mailMessage.Priority = MailPriority.Low;//优先级


            try
            {
                smtpClient.Send(mailMessage);
                return true;
            }
            catch (SmtpException ex)
            {
                return false;
            }
        }

    }
}
