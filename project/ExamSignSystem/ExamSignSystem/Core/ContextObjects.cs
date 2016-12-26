using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamSignSystem.Core
{
    public class ContextObjects
    {
        public static ExamSignSystemEntity.Student CurrentStudent
        {
            get
            {
                if (HttpContext.Current.Session["studentInfo"] == null)
                {
                    return null;
                }
                return HttpContext.Current.Session["studentInfo"] as ExamSignSystemEntity.Student;
            }
            set
            {
                HttpContext.Current.Session["studentInfo"] = value;
            }
        }
        public static ExamSignSystemEntity.Admin CurrentAdmin
        {
            get
            {
                if (HttpContext.Current.Session["AdminInfo"] == null)
                {
                    return null;
                }
                return HttpContext.Current.Session["AdminInfo"] as ExamSignSystemEntity.Admin;
            }
            set
            {
                HttpContext.Current.Session["AdminInfo"] = value;
            }
        }
    }
}