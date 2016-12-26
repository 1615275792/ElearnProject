using ExamSignSystemBLL;
using ExamSignSystemEntity;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamSignSystem.Admin.Main.ExamManage
{
    public partial class ExportSignTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Export_Click(object sender, EventArgs e)
        {
            string subjectName = this.txtsubjectName.Value.Trim();
            ExportInfoMgr mgr = new ExportInfoMgr();
            List<ExportInfo> list = mgr.ShowList(subjectName);
            if (list == null)
            {
                Response.Write("<script>alert('科目名称输入错误或者不存在！');</script>");
            }
            else
            {
                // 导出时excel文件的重新定义的名称
                string outFileName = subjectName + "的报名情况" + DateTime.Now.ToString("yyyyMMdd") + ".xls";

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
                    string[] pis = { "学生学号", "学生姓名", "学生班级", "联系方式", "科目名称", "考试时间" };
                    int max = pis.Length - 1;
                    // 设置初始化行号
                    int row = 1;

                    // 设置表头描述
                    sheet1.Range[row, 1, row, max + 1].Merge();
                    sheet1.Range[row, 1, row, max + 1].CellStyle.Font.Bold = true;
                    sheet1.Range[row, 1, row, max + 1].CellStyle.HorizontalAlignment = ExcelHAlign.HAlignCenter;
                    sheet1.Range[row, 1, row, max + 1].CellStyle.Font.RGBColor = Color.FromArgb(55, 96, 145);
                    sheet1.Range[row, 1, row, max + 1].Value = "考试报名情况表";

                    //设置表头标题
                    row++;
                    sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Color = Color.FromArgb(40, 153, 43);
                    sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Font.RGBColor = Color.FromArgb(255, 255, 255);
                    sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Font.Bold = true;
                    sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.HorizontalAlignment = ExcelHAlign.HAlignCenter;
                    sheet1.Range["A" + row + ":" + cols[max] + row].CellStyle.Borders.Color = ExcelKnownColors.Black;
                    for (int i = 0; i <= max; i++)
                    {
                        sheet1.Range[cols[i] + row].Value = pis[i];
                    }

                    // 开始数据填充
                    if (list.Count > 0)
                    {
                        foreach (ExportInfo info in list)
                        {
                            row++;

                            sheet1.Range[cols[0] + row].Value = info.stuNo.ToString();
                            sheet1.Range[cols[1] + row].Value = info.stuName.ToString();
                            sheet1.Range[cols[2] + row].Value = info.stuClass.ToString();
                            sheet1.Range[cols[3] + row].Value = info.stuMobile.ToString();
                            sheet1.Range[cols[4] + row].Value = info.subjectName.ToString();
                            sheet1.Range[cols[5] + row].Value = info.subjectExamTime.ToString("yyyy-MM-dd");
                        }

                        //设置sheet的页面背景色为黑白
                        sheet1.UsedRange.AutofitColumns();
                        sheet1.PageSetup.BlackAndWhite = true;
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
}