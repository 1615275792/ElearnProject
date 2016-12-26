using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace ExamSignSystem.Core
{
    public class MD5Encrypt
    {
        public string GetMD5(string pwd)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] bt = md5.ComputeHash(Encoding.GetEncoding("UTF-8").GetBytes(pwd));
            StringBuilder sb = new StringBuilder(32);
            for (int i = 0; i < bt.Length; i++)
            {
                sb.Append(bt[i].ToString("x").PadLeft(2, '0'));
            }
            return sb.ToString();
        }
    }
}