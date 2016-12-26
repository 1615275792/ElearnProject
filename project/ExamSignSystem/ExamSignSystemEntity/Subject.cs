using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemEntity
{
    public class Subject
    {
        public int subjectID { get; set; }
        public DateTime subjectExamTime { get; set; }
        public string  subjectName { get; set; }
        public DateTime subjectSignStartTime { get; set; }
        public DateTime subjectSignEndTime { get; set; }
        public string subjectExamAddress { get; set; }
    }
}
