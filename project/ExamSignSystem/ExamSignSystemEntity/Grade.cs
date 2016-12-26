using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamSignSystemEntity
{
    public class Grade
    {
        public int gradeID { get; set; }
        public string gradeSubject { get; set; }
        public int gradeScore { get; set; }
        public DateTime gradeTime { get; set; }
        public string gradeSno { get; set; }
    }
}
