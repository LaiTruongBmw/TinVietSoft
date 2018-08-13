using System;
using System.Configuration;
using System.Web;
using System.Text.RegularExpressions;


namespace ESys
{
    public class CGlobal
    {
        public CGlobal() { }
        //thanhdong
        public static int PageSize = ToInt(ConfigurationManager.AppSettings["PageSize"]);
        public static string AcceptedFileAttach = ConfigurationManager.AppSettings["AcceptedFileAttach"];
        public static string AcceptedImage = ConfigurationManager.AppSettings["AcceptedImage"];
        public static string defaultLanguage = ConfigurationManager.AppSettings["defaultLanguage"];

        public static string DirFileAttach = ConfigurationManager.AppSettings["Dir_File_Attach"];
        public static string DirImage = ConfigurationManager.AppSettings["Dir_Image"];
        public static string DirBrand = ConfigurationManager.AppSettings["Dir_Brand"];

        public static string ApplicationPath = HttpContext.Current.Request.ApplicationPath;

        //=================

        public static string MailServer = ConfigurationManager.AppSettings["MailServer"];
        public static string EmailTitle = ConfigurationManager.AppSettings["EmailTitle"];
        public static string EmailAdmin = ConfigurationManager.AppSettings["EmailAdmin"];

        public static int CookieExpire = Convert.ToInt32(ConfigurationManager.AppSettings["CookieExpire"]);


        public static bool CheckExtFile(string ext)
        {
            string[] arr = AcceptedFileAttach.Split(',');
            for (int i = 0; i < arr.Length; i++)
            {
                if (("." + arr[i]) == ext.ToLower()) return true;
            }
            return false;
        }

        public static bool CheckExtImage(string ext)
        {
            string[] arr = AcceptedImage.Split(',');
            for (int i = 0; i < arr.Length; i++)
            {
                if (("." + arr[i]) == ext.ToLower()) return true;
            }
            return false;
        }
        public static string ToTextArea(object obj)
        {
            if (obj == null) return "";
            string tmp = obj.ToString();
            tmp = tmp.Replace("<br>", ((char)13).ToString());
            return tmp;
        }
        public static string FromTextArea(object obj)
        {
            if (obj == null) return "";
            string tmp = obj.ToString();
            tmp = tmp.Replace(((char)13).ToString(), "<br>");
            return tmp;
        }
        public static int ToInt(object obj)
        {
            if (obj == null || obj.ToString().Length == 0) return 0;
            int val = 0;
            try
            {
                val = Convert.ToInt32(obj);
            }
            catch
            {
                //System.Web.HttpContext.Current.Response.Write("To Int" +obj.ToString());
                //System.Web.HttpContext.Current.Response.End();
            }
            return val;
        }

        public static int ToInt(object obj, int value2)
        {
            if (obj == null || obj.ToString().Length == 0) return value2;
            return Convert.ToInt32(obj);
        }
        public static double ToDouble(object obj)
        {
            if (obj == null || obj.ToString().Length == 0) return 0;
            double val = 0;
            try
            {
                val = Convert.ToDouble(obj);
            }
            catch
            {
                System.Web.HttpContext.Current.Response.Write("To Double" + obj.ToString());
                System.Web.HttpContext.Current.Response.End();
            }

            return val;
        }
        public static string ToStr(object obj)
        {
            if (obj == null || obj.ToString().Length == 0) return "";
            return Convert.ToString(obj);
        }
        public static DateTime ToDateTime(object obj)
        {
            if (obj == null || obj.ToString().Length == 0) return DateTime.Now;
            return DateTime.Parse(obj.ToString());
        }

        public static bool ToBool(object obj)
        {
            //			System.Web.HttpContext.Current.Response.Write(obj.ToString());
            if (obj == null || obj.ToString().Length == 0) return false;
            return Convert.ToBoolean(obj);
        }

        public static string ToYYYYMMDD(object ob)
        {
            DateTime dt;
            dt = ToDateTime(ob);
            return dt.ToString("yyyyMMdd");
        }
        public static string ToMM_DD_YYYY(object ob)
        {
            DateTime dt;
            dt = ToDateTime(ob);
            return dt.ToString("MM-dd-yyyy");

        }

        public static string DateToStr(object obj, int type)
        {
            DateTime dt;
            dt = ToDateTime(obj);
            switch (type)
            {
                case 1: return dt.ToString("dd-MM-yyyy");
                case 2: return dt.ToString("dd-MMM-yyyy");
                case 3: return dt.ToString("MM-dd-yyyy");
                case 4: return dt.ToString("MM/dd/yyyy");
            }
            return "";
        }
        public static string ReturnURL()
        {
            string strurl = System.Web.HttpContext.Current.Request.Url.ToString();
            string[] arr = strurl.Split('/');
            return arr[arr.Length - 1];
        }


        public static void MakePaging(int Page, int Total, string strLink, string Align)
        {
            string sOut = "";
            int TotalPage, TopRecord, MinRecord;
            TotalPage = Total / PageSize;

            if (Total == 0)
                MinRecord = 0;
            else
                MinRecord = ((PageSize * (Page - 1)) + 1);

            TopRecord = PageSize * Page;
            if (TopRecord > Total)
                TopRecord = Total;

            if (TotalPage * PageSize < Total)
                TotalPage += 1;
            sOut += "<table width=100% height=40 cellspacing=0 cellpadding=0>";
            sOut += "<tr>";
            sOut += "<td align='center'>";

            int i;
            for (i = 1; i <= TotalPage; i++)
            {
                if (i == Page)
                    sOut += "<font color=red>[<b>" + i + "</b>]</font>&nbsp;";
                else
                    sOut += "<A href='" + strLink + "&page=" + i + "' >" + i + "</a> ";
            }
            sOut += "</td>";
            sOut += "</tr></table>";
            HttpContext.Current.Response.Write(sOut);
        }
        public static string FStr(string strIn)
        {
            strIn = Regex.Replace(strIn, "<script((.|\n)*?)</script>", "", RegexOptions.IgnoreCase);
            strIn = Regex.Replace(strIn, @"<", "&lt;", RegexOptions.IgnoreCase);
            strIn = Regex.Replace(strIn, @">", "&gt;", RegexOptions.IgnoreCase);
            strIn = Regex.Replace(strIn, @"\n", "<br>", RegexOptions.IgnoreCase);
            return strIn;

        }
        public static string ClearBreak(string strIn)
        {
            strIn = Regex.Replace(strIn, "<DIV(.*?)>(.*?)</DIV>", "$2", RegexOptions.IgnoreCase);
            strIn = Regex.Replace(strIn, "<P(.*?)>(.*?)</P>", "$2", RegexOptions.IgnoreCase);
            return strIn;
        }
        public static string ClearHtml(string strIn)
        {
            strIn = Regex.Replace(strIn, @"&nbsp;", "  ", RegexOptions.IgnoreCase);
            return Regex.Replace(strIn, "<[^>]*>", "", RegexOptions.IgnoreCase);
        }
        /// <summary>
        /// Trích 1 so luong tu cua chuoi ban dau 
        /// </summary>
        /// <param name="strIn">Chuoi ban dau</param>
        /// <param name="len">so luong to trích ra</param>
        public static string Quote(string strIn, int len)
        {
            strIn = ClearHtml(strIn);
            int count = 0;
            int stoppoint = 0;
            for (int i = 0; i < strIn.Trim().Length; i++)
            {
                if (strIn[i].ToString() == " ")
                {
                    count++;
                    if (count == len)
                    {
                        stoppoint = i;
                        break;
                    }
                }
            }
            if (stoppoint == 0)
                return strIn;
            return strIn.Substring(0, stoppoint) + "...";
        }
        public static string Quote(string strIn, int len, string title)
        {
            strIn = Regex.Replace(strIn, "<table((.|\n)*?)</table>((.|\n)*?)", " ", RegexOptions.IgnoreCase);

            strIn = ClearHtml(strIn);
            title = ClearHtml(title);

            strIn = strIn.Replace(title, "").TrimStart();

            return Quote(strIn, len);

        }
        public static string LineSpacing(string strIn)
        {
            strIn = Regex.Replace(strIn, "<p(.*?)>", "<p style=\"line-height: 200%\" $1>", RegexOptions.IgnoreCase);
            return "<p style=\"line-height: 200%\">" + strIn + "</p>";
        }
    }
}
