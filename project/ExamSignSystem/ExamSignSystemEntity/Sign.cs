using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemEntity
{
    public class Sign
    {
        public int signID { get; set; }
        public string stuNo { get; set; } 
        public int subjectID { get; set; }
        public DateTime signEndTime { get; set; }
    }
}
