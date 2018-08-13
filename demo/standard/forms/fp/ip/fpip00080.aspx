<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Reports</title>
</head>

<script type="text/javascript">
    //============================================================================
    function BodyInit() 
    {
        System.Translate(document);
        var ldate;

        ldate = dtFrom1.value;
        ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + '01';
        dtFrom1.value = ldate;

    }
    //============================================================================    
    function OnPopUp(pos) 
    {
        switch (pos) {
            case '10':
                var url = System.RootURL + '/reports/fp/pr/rpt_fppr00091.aspx?p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value;
                window.open(url);
                break;

            case '20':
                var url = System.RootURL + '/reports/fp/pr/rpt_fppr00092.aspx?p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value;
                window.open(url);
                break;
            
            case '30':
                var url = System.RootURL + '/reports/fp/pr/rpt_fppr00093.aspx?p_from_date=' + dtFrom3.value ;
                window.open(url);
                break;
        }
    }
    //============================================================================
</script>

<body>
    <!------------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 20%">
        </tr>
        <tr style="height: 60%">
            <td style="width: 20%">
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%; border: 1px solid #034D72">
                    <tr style="height: 20%">
                        <td align="center" style="border: 1px solid #034D72; width: 70%">
                            <b style="color: black; font-size: medium">REPORTS</b>
                        </td>
                        <td align="center" style="border: 1px solid #034D72; width: 30%">
                            <b style="color: black; font-size: medium">Date</b>
                        </td>
                    </tr>
                    <tr style="height: 20%">
                        <td style="border: 1px solid #034D72; width: 40%; white-space: nowrap; background-color: #B4E7FF;
                            width: 70%">
                            <b style="color: #1b2ff2; cursor: hand; font-size: medium;" onclick="OnPopUp('10')">
                                &nbsp;&nbsp;&nbsp;1. COMPONENT IN/OUT DAILY</b>
                        </td>
                        <td style="border: 1px solid #034D72; background-color: #B4E7FF; width: 30%" align="center">
                            <gw:datebox id="dtFrom1" lang="1" />
                            &nbsp;~&nbsp;
                            <gw:datebox id="dtTo1" lang="1" />
                        </td>
                    </tr>
                    <tr style="height: 20%">
                        <td style="border: 1px solid #034D72; background-color: #B4E7FF">
                            <b style="color: #1b2ff2; cursor: hand; font-size: medium; white-space: nowrap" onclick="OnPopUp('20')">
                                &nbsp;&nbsp;&nbsp;2. P/O PRODUCTION BALANCE </b>
                        </td>
                        <td style="border: 1px solid #034D72; background-color: #B4E7FF" align="center">
                            <gw:datebox id="dtFrom2" lang="1" />
                            &nbsp;~&nbsp;
                            <gw:datebox id="dtTo2" lang="1" />
                        </td>
                    </tr>
                    <tr style="height: 20%">
                        <td style="border: 1px solid #034D72; background-color: #B4E7FF">
                            <b style="color: #1b2ff2; cursor: hand; font-size: medium; white-space: nowrap" onclick="OnPopUp('30')">
                                &nbsp;&nbsp;&nbsp;3. DAILY LINE PRODUCTION </b>
                        </td>
                        <td style="border: 1px solid #034D72; background-color: #B4E7FF" align="center">
                            <gw:datebox id="dtFrom3" lang="1" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 20%">
            </td>
        </tr>
        <tr style="height: 20%">
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
</html>
