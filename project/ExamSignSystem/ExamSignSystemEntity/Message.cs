using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemEntity
{
    public class Message
    {
        public int msgID { get; set; }
        public string msgTitle{ get; set; }
        public string msgLookTotal { get; set; }
        public DateTime msgTime { get; set; }
        public string  msgContents { get; set; }
    }
}
