using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
/// <summary>
/// Summary description for CommondLib
/// </summary>
public  class CommondLib
{
	public CommondLib()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    public static double ConvertToDbl(object strValue)
    {
        if (strValue.ToString() == "")
            return 0;
        return Convert.ToDouble (strValue);
    }

    public static string GetString()
    {
        return "abc";
    }

    public static string bodau(string accented)
    {
        System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"\p{IsCombiningDiacriticalMarks}+");
        string strFormD = accented.Normalize(System.Text.NormalizationForm.FormD);
        return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }

    public static string Num2VNText(string s,string ccy)
    {
        //process minus case
        string minus = "";
        if (s.Substring(0, 1) == "-")
        {
            s = s.Replace("-", "").Trim();
            minus = "Trừ ";
        }

        string rtnf = "";
        int l = 0;
        int i = 0;
        int j = 0;
        int dk = 0;
        string[] A = new string[32];
        s = s.Replace(",", "");
        string s1 = "";
        string strTmp = "";
        if (s.Contains("."))
        {
            s1 = s.Substring(s.IndexOf(".") + 1);
            s = s.Substring(0, s.IndexOf("."));
        }
        string[] B = new string[8];
        s = s.Trim();
        l = s.Length;
        if (l > 32)
        {
            rtnf = "Number Very Large!";
            return rtnf;
        }
        for (i = 0; i < l; i++)
        {
            A[i] = s.Substring(i, 1);
        }
        for (i = 0; i < l; i++)
        {
            if (((l - i) % 3 == 0) && (A[i] == "0") && ((A[i + 1] != "0") || (A[i + 2] != "0")))
            {
                rtnf += " Không";
            }
            if (A[i] == "2") { rtnf += " Hai"; }
            if (A[i] == "3") { rtnf += " Ba"; }
            if (A[i] == "4") { rtnf += " Bốn"; }
            if (A[i] == "6") { rtnf += " Sáu"; }
            if (A[i] == "7") { rtnf += " Bảy"; }
            if (A[i] == "8") { rtnf += " Tám"; }
            if (A[i] == "9") { rtnf += " Chín"; }
            if (A[i] == "5")
            {
                if ((i > 0) && ((l - i) % 3 == 1) && (A[i - 1] != "0"))
                {
                    rtnf += " Lăm";
                }
                else
                {
                    rtnf += " Năm";
                }
            }
            if ((i > 2) && (A[i] == "1") && ((l - i) % 3 == 1) && (Int32.Parse(A[i - 1]) > 1))
            {
                rtnf += " Mốt";
            }
            else if ((A[i] == "1") && ((l - i) % 3 != 2))
            {
                rtnf += " Một";
            }
            if ((l - i) % 3 == 2 && A[i] != "0" && A[i] != "1")
            {
                rtnf += " Mươi";
            }
            else if ((l - i) % 3 == 2 && A[i] != "0")
            {
                rtnf += " Mười";
            }
            if (i == 0)
            {
                if ((l - i) % 3 == 2 && A[i] == "0" && A[i + 1] != "0")
                {
                    rtnf += " Không";
                }
            }
            else
            {
                if ((l - i) % 3 == 2 && A[i] == "0" && A[i + 1] != "0")
                {
                    rtnf += " Lẻ";
                }
            }
            if ((l - i) % 3 == 0 && (A[i + 1] != "0" || A[i + 2] != "0"))
            {
                rtnf += " Trăm";
            }
            else if ((l - i) % 3 == 0 && A[i] != "0")
            {
                rtnf += " Trăm";
            }
            if ((l - i) == 4)
            {
                rtnf += " Nghìn";
            }
            if ((l - i) == 7)
            {
                rtnf += " Triệu";
            }
            if ((l - i) == 10)
            {
                rtnf += " Tỷ";
            }
            if ((l - i) == 13)
            {
                rtnf += " Nghìn Tỷ";
            }
            if ((l - i) == 16)
            {
                rtnf += " Triệu Tỷ";
            }
            if ((l - i) == 19)
            {
                rtnf += " Tỷ Tỷ";
            }
            if ((l - i) == 22)
            {
                rtnf += " Triệu Tỷ Tỷ";
            }
            if ((l - i) == 25)
            {
                rtnf += " Triệu Tỷ Tỷ";
            }
            if ((l - i) == 28)
            {
                rtnf += " Tỷ Tỷ Tỷ";
            }
            if ((l - i) % 3 == 0 && A[i] == "0" && A[i + 1] == "0" && A[i + 2] == "0")
            {
                i = i + 2;
            }
            if ((l - i) % 3 == 1)
            {
                dk = 1;
                for (j = i; j < l; j++)
                {
                    if (A[j] != "0")
                    {
                        dk = 0;
                    }
                }
            }
            if (dk == 1) break;
        }

        if (ccy == "USD")
        {
            rtnf += " Đô";
            if (s1.Length > 0) //Đọc số lẻ 
            {
                l = s1.Length;
                if (l > 8)
                {
                    rtnf += " ERROR!!!";
                    return rtnf;
                }
                for (i = 0; i < l; i++)
                {
                    B[i] = s1.Substring(i, 1);
                }
                strTmp = "";
                //Dịch Tạm
                for (i = 0; i < 2; i++)
                {
                    if ((i > 0) && (B[0] != "0") && (B[0] != "1"))
                    {
                        strTmp += " Mươi";
                    }

                    if (B[i] == "1")
                    {
                        if (i == 0)
                        {
                            strTmp += " Mười";
                        }
                        else
                        {
                            if (B[0] == "1")
                            {
                                strTmp += " Một";
                            }
                            else
                            {
                                strTmp += " Mốt";
                            }
                        }
                    }

                    switch (B[i])
                    {
                        case "2":
                            strTmp += " Hai";
                            break;
                        case "3":
                            strTmp += " Ba";
                            break;
                        case "4":
                            strTmp += " Bốn";
                            break;
                        case "5":
                            strTmp += " Năm";
                            break;
                        case "6":
                            strTmp += " Sáu";
                            break;
                        case "7":
                            strTmp += " Bảy";
                            break;
                        case "8":
                            strTmp += " Tám";
                            break;
                        case "9":
                            strTmp += " Chín";
                            break;
                    }
                }
            }
            if (strTmp != "")
            {
                rtnf = rtnf + " Và" + strTmp + " Cen";
            }
        }
        
        if (ccy == "VND")
        {
            rtnf += " Đồng";
        }

        rtnf = minus + rtnf; //process minus case  

        return rtnf;
    }

    public static string Num2EngText(string s, string ccy)
    {
        //process minus case
        string minus = "";
        if (s.Substring(0, 1) == "-")
        {
            s = s.Replace("-", "").Trim();
            minus = "Minus ";
        }
        string rtnf = "";
        string Dollars = "";
        string Cents = "";
        string strTemp = "";
        string[] strPlace = new string[9];
        string s1 = "";
        string strTmp = "";
        int iTmp = 0;
        strPlace[2] = " Thousand ";
        strPlace[3] = " Million ";
        strPlace[4] = " Billion ";
        strPlace[5] = " Trillion ";
        s = s.Replace(",", "").Trim();
        string[] strTens ={ "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
        string[] strTens2 ={ "", "", "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety " };
        string[] Digits = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine" };
        if (s.Contains("."))
        {
            s1 = s.Substring(s.IndexOf(".") + 1);
            s = s.Substring(0, s.IndexOf("."));
        }
        int iCount = 1;

        while (s != "")
        {
            strTmp = "";
            if (s.Length < 3)
            {
                s = s.PadLeft(3, '0');
            }
            strTemp = s.Substring(s.Length - 3);
            //Read strTemp
            if (strTemp.Substring(0, 1) != "0") //Read Hundred
            {
                iTmp = int.Parse(strTemp.Substring(0, 1));
                strTmp = Digits[iTmp] + " Hundred ";
            }
            if (strTemp.Substring(1, 1) != "0")
            {
                //Get Tens
                iTmp = int.Parse(strTemp.Substring(1, 1));
                if (strTemp.Substring(1, 1) == "1")
                {
                    iTmp = int.Parse(strTemp.Substring(1, 2)) - 10;
                    strTmp = strTmp + strTens[iTmp];
                }
                else
                {
                    iTmp = int.Parse(strTemp.Substring(1, 1));
                    strTmp = strTmp + strTens2[iTmp];
                    iTmp = int.Parse(strTemp.Substring(2, 1));
                    strTmp = strTmp + Digits[iTmp];
                }
            }
            else
            {
                iTmp = int.Parse(strTemp.Substring(2, 1));
                strTmp = strTmp + Digits[iTmp];
            }
            //After Read
            if (strTmp != "")
            {
                Dollars = strTmp + strPlace[iCount] + Dollars;
            }
            if (s.Length > 3)
            {
                s = s.Substring(0, s.Length - 3);
            }
            else
            {
                s = "";
            }
            iCount = iCount + 1;
        }

        //Read Cents
        if ((s1 != "") && (ccy == "USD"))
        {
            s1 = s1 + "00";
            s1 = s1.Substring(0, 2);
            if (s1.Substring(0, 1) == "1")
            {
                iTmp = int.Parse(s1) - 10;
                Cents = strTens[iTmp];
            }
            else
            {
                iTmp = int.Parse(s1.Substring(0, 1));
                Cents = strTens2[iTmp];
                iTmp = int.Parse(s1.Substring(1, 1));
                Cents = Cents + Digits[iTmp];
            }
        }
        if (ccy == "USD")
        {
            switch (Dollars)
            {
                case "":
                    Dollars = "Zero Dollars";
                    break;
                case "One":
                    Dollars = "One Dollar";
                    break;
                default:
                    Dollars = Dollars + " Dollars";
                    break;
            }
            switch (Cents)
            {
                case "":
                    break;
                case "One":
                    Cents = " and One Cent";
                    break;
                default:
                    Cents = " and " + Cents + " Cents";
                    break;
            }

        }

        if (ccy == "VND")
        {
            switch (Dollars)
            {
                case "":
                    Dollars = "Zero Viet Nam Dong";
                    break;
                default:
                    Dollars = Dollars + " Viet Nam Dong";
                    break;
            }
            Cents = "";
        }
        rtnf = minus + Dollars + Cents; //process minus case
        return rtnf;
    } 

    public static string changeNumericToWords(double numb)
    {

        string num = numb.ToString();

        return changeToWords(num, false);
    }



    //public static string changeCurrencyToWords(string numb)
    //{

    //    return changeToWords(numb, true);

    //}

    public static string changeNumericToWords(string numb)
    {

        return changeToWords(numb, false);

    }

    public static string changeCurrencyToWords(string numb)
    {

        return changeToWords(numb, true);

    }

    public static string changeCurrencyToWords(string numb, string ccy)
    {

        return changeToWords(numb, true,ccy );

    }

    private static string changeToWords(string numb, bool isCurrency)
    {

        String val = "", wholeNo = numb, points = "", andStr = "", pointStr = "";

        string tmpNum = "";
        tmpNum = numb.Replace(",", "");
        String endStr = (isCurrency) ? ("Only") : ("");

        try
        {

            int decimalPlace = tmpNum.IndexOf(".");

            if (decimalPlace > 0)
            {

                wholeNo = tmpNum.Substring(0, decimalPlace);

                points = tmpNum.Substring(decimalPlace + 1);

                if (Convert.ToInt32(points) > 0)
                {

                    andStr = (isCurrency) ? ("and") : ("point");// just to separate whole numbers from points/cents

                    endStr = (isCurrency) ? ("Cents " + endStr) : ("");

                    pointStr = translateCents(points);

                }

            }

            val = String.Format("{0} {1}{2} {3}", translateWholeNumber(wholeNo).Trim(), andStr, pointStr, endStr);

        }

        catch { ;}

        return val;

    }

    private static string changeToWords(string numb, bool isCurrency, string ccy)
    {

        String val = "", wholeNo = numb, points = "", andStr = "", pointStr = "", tmpNum = "", ccyStr="", tmpCcy="";
                       
        tmpNum = numb.Replace(",", "");
        String endStr = (isCurrency) ? ("Only") : ("");
               
        switch (ccy)
        {
            case "USD":
                tmpCcy="Dollar ";
            break ;
            case "EUR":                
                tmpCcy="Euro ";
            break ;
        }
        ccyStr = (isCurrency) ? tmpCcy : ("");
        try
        {

            int decimalPlace = tmpNum.IndexOf(".");

            if (decimalPlace > 0)
            {

                wholeNo = tmpNum.Substring(0, decimalPlace);

                points = tmpNum.Substring(decimalPlace + 1);

                if (Convert.ToInt32(points) > 0)
                {

                    andStr = (isCurrency) ? ("and") : ("point");// just to separate whole numbers from points/cents

                    endStr = (isCurrency) ? ("Cents " + endStr) : ("");

                    pointStr = translateCents(points);

                }

            }

            val = String.Format("{0} {1}{2} {3} {4}", translateWholeNumber(wholeNo).Trim(), ccyStr, andStr, pointStr, endStr);

        }

        catch { ;}

        return val;

    }

    private static string translateWholeNumber(string number)
    {

        string word = "";

        try
        {
            string tmp = number.Trim();
            bool beginsZero = false;//tests for 0XX

            bool isDone = false;//test if already translated

            double dblAmt = (Convert.ToDouble(tmp));

            //if ((dblAmt > 0) && number.StartsWith("0"))

            if (dblAmt > 0)
            {//test for zero or digit zero in a nuemric

                beginsZero = tmp.StartsWith("0");

               
                int numDigits = tmp.Length;

                int pos = 0;//store digit grouping

                String place = "";//digit grouping name:hundres,thousand,etc...

                switch (numDigits)
                {

                    case 1://ones' range

                        word = ones(tmp);

                        isDone = true;

                        break;

                    case 2://tens' range

                        word = tens(tmp);

                        isDone = true;

                        break;

                    case 3://hundreds' range

                        pos = (numDigits % 3) + 1;

                        place = " Hundred ";

                        break;

                    case 4://thousands' range

                    case 5:

                    case 6:

                        pos = (numDigits % 4) + 1;

                        place = " Thousand ";

                        break;

                    case 7://millions' range

                    case 8:

                    case 9:

                        pos = (numDigits % 7) + 1;

                        place = " Million ";

                        break;

                    case 10://Billions's range

                        pos = (numDigits % 10) + 1;

                        place = " Billion ";

                        break;

                    //add extra case options for anything above Billion...

                    default:

                        isDone = true;

                        break;

                }

                if (!isDone)
                {//if transalation is not done, continue...(Recursion comes in now!!)

                    word = translateWholeNumber(tmp.Substring(0, pos)) + place + translateWholeNumber(tmp.Substring(pos));

                    //check for trailing zeros

                    if (beginsZero) word = " and " + word.Trim();

                }

                //ignore digit grouping names

                if (word.Trim().Equals(place.Trim())) word = "";

            }

        }

        catch { ;}

        return word.Trim();

    }

    private static string tens(string digit)
    {

        int digt = Convert.ToInt32(digit);

        String name = null;

        switch (digt)
        {

            case 10:

                name = "Ten";

                break;

            case 11:

                name = "Eleven";

                break;

            case 12:

                name = "Twelve";

                break;

            case 13:

                name = "Thirteen";

                break;

            case 14:

                name = "Fourteen";

                break;

            case 15:

                name = "Fifteen";

                break;

            case 16:

                name = "Sixteen";

                break;

            case 17:

                name = "Seventeen";

                break;

            case 18:

                name = "Eighteen";

                break;

            case 19:

                name = "Nineteen";

                break;

            case 20:

                name = "Twenty";

                break;

            case 30:

                name = "Thirty";

                break;

            case 40:

                name = "Fourty";

                break;

            case 50:

                name = "Fifty";

                break;

            case 60:

                name = "Sixty";

                break;

            case 70:

                name = "Seventy";

                break;

            case 80:

                name = "Eighty";

                break;

            case 90:

                name = "Ninety";

                break;

            default:

                if (digt > 0)
                {

                    name = tens(digit.Substring(0, 1) + "0") + " " + ones(digit.Substring(1));

                }

                break;

        }

        return name;

    }

    private static string ones(string digit)
    {

        int digt = Convert.ToInt32(digit);

        String name = "";

        switch (digt)
        {

            case 1:

                name = "One";

                break;

            case 2:

                name = "Two";

                break;

            case 3:

                name = "Three";

                break;

            case 4:

                name = "Four";

                break;

            case 5:

                name = "Five";

                break;

            case 6:

                name = "Six";

                break;

            case 7:

                name = "Seven";

                break;

            case 8:

                name = "Eight";

                break;

            case 9:

                name = "Nine";

                break;

        }

        return name;

    }

    private static string translateCents(string cents)
    {

        String cts = "", digit = "", engOne = "";
        string tmpCents;
        tmpCents = cents.Trim();

        if (tmpCents[0].ToString().Equals("0"))
        {
            for (int i = 0; i < tmpCents.Length; i++)
            {

                digit = tmpCents[i].ToString();

                if (digit.Equals("0"))
                {

                    engOne = "Zero";

                }

                else
                {

                    engOne = ones(digit);

                }

                cts += " " + engOne;

            }
        }
        else
        {
            cts = " " + translateWholeNumber(tmpCents);
        }

        return cts;

    }

    /// <summary>
    /// Check string for numeric
    /// </summary>
    /// <param name="strNum">string for check</param>
    /// <returns>True : if is numeric, False : if not</returns>
    public bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true; ;
        }
        catch
        {
            return false;
        }
    }


}
