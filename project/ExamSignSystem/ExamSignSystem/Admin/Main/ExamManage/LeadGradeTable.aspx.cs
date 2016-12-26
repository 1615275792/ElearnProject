using ExamSignSystem.Core;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.ExamManage
{
    public partial class LeadGradeTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //导入成绩表
        protected void Lead_Click(object sender, EventArgs e)
        {
            string filepath = "", fileExtName = "", mFileName, mPath;
            string newfilepath = "";

            if (this.fileName.PostedFile.FileName != "")
            {
                //取得文件路径  
                filepath = this.fileName.PostedFile.FileName;

                //取得文件扩展名,进行判断(xls或者xlsx)  
                fileExtName = filepath.Substring(filepath.LastIndexOf(".") + 1);
                if (fileExtName == "xls" || fileExtName == "xlsx")
                {
                    //取得服务器上的相对路径  
                    mPath = Server.MapPath("../../Upfile/");

                    //取得文件名  
                    mFileName = filepath.Substring(filepath.LastIndexOf("\\") + 1);

                    //保存文件到指定目录  
                    this.fileName.PostedFile.SaveAs(mPath + mFileName);

                    //保存新的文件地址
                    newfilepath = (mPath + mFileName);
                    LeadGrade fileSvr = new LeadGrade();
                    System.Data.DataTable dt = fileSvr.GetExcelDatatable(newfilepath, "mapTable");
                    if (fileSvr.InsetData(dt) != 0)
                    {
                        Response.Write(" <script>alert('数据已成功导入！');</script>");
                        File.Delete(newfilepath);
                    }
                    else
                    {
                        Response.Write(" <script>alert('excel表没有数据或者数据不完善！');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('选择导入的成绩表格式有误！');</script>");
                }
            }
            else 
            {
                Response.Write("<script>alert('还未选择需要导入的成绩表！');</script>");
            }
        }

        //下载模板
        protected void Upload_Click(object sender, EventArgs e)
        {
            // 导出时excel文件的重新定义的名称
            string outFileName = "GradeTemplate" + DateTime.Now.ToString("yyyyMMdd") + ".xls";

            #region 通过插件定制化excel内容，并输出

            ExcelEngine excelEngine = new ExcelEngine();
            try
            {
                //创建工作簿
                IWorkbook workbook = excelEngine.Excel.Workbooks.Create(1);
                // 创建sheet页
                IWorksheet sheet1 = workbook.Worksheets[0];
                sheet1.Name = "Sheet1";

                // 获取excel的列名
                string[] cols = new string[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
                // 获取实体类的属性
                string[] pis = {"序号","学生学号", "科目名称", "考试时间", "考试成绩"};
                int max = pis.Length - 1;
                // 设置初始化行号
                int row = 0;
                //设置表头标题
                row++;
                sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Color = Color.FromArgb(40, 153, 43);
                sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Font.RGBColor = Color.FromArgb(255, 255, 255);
                sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Font.Bold = true;
                sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.HorizontalAlignment = ExcelHAlign.HAlignCenter;
                sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Borders.Color = ExcelKnownColors.White;
                for (int i = 0; i <= max; i++)
                {
                    sheet1.Range[cols[i] + row].Value = pis[i];
                }
                //设置编码并输出Excel
                System.Web.HttpContext.Current.Response.ContentEncoding = Encoding.UTF8;
                System.Web.HttpContext.Current.Response.HeaderEncoding = Encoding.UTF8;
                //Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, Encoding.UTF8));
                workbook.SaveAs(outFileName, ExcelSaveType.SaveAsXLS, System.Web.HttpContext.Current.Response, ExcelDownloadType.PromptDialog);

                workbook.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                excelEngine.ThrowNotSavedOnDestroy = false;
                excelEngine.Dispose();
            }

            #endregion
        }
    }
}