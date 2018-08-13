<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BarCode Status</title>

    <script language="javascript">
    function BodyInit(){
       var d = new Date();
       var mm = d.getMonth()+1;
       var dd = d.getDate();
       mm=mm<10?"0"+mm:mm;
       dd=dd<10?"0"+dd:dd;
       
       var ymd=d.getFullYear()+mm+dd;
       dtFrom.SetDataText(System.AddDate(ymd,-7));
       OnSearch();
    }
    function OnSearch()
    {//-7 day with today
       dat_fpfo00100.Call("SELECT"); 
    }
    function GridOnCellClick()
    {
        txtMasterPK.text=grdMaster.GetGridData(grdMaster.row,0);//pk of master
        dat_fpfo00100_1.Call("SELECT");
    }
    function OnSaveDetail()
    {
        dat_fpfo00100_1.Call();
    }
    function OnReport()
      {
           var pk = GetPK();//check data 
           if(pk == "")//if not check
           {
                alert("Please select atleast one item to print.");
                return;
           }
            var url = System.RootURL + "/reports/fp/fo/fpfo00100.aspx?p_pk="+pk;
            System.OpenTargetPage(url);
      }
      function GetPK()// use print report
      {
        var pk="";
        for(var i=1;i<grdDetail.rows;i++)
        {
            if(grdDetail.GetGridData(i,0) == -1)//checked
            {
              pk += grdDetail.GetGridData(i,1)+"|";
            }
        }
        if(pk.length > 0) pk=pk.substr(0,pk.length-1);
        return pk;
      }
    </script>

</head>
<body>
    <gw:data id="dat_fpfo00100"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_fpfo00100"> 
                <input bind="grdMaster"> 
                    <input bind="txtReqIQCNo" />              
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dat_fpfo00100_1"> 
        <xml> 
            <dso id="1" type="grid" parameter="1,4" function="inv.sp_sel_fpfo00100_1" procedure="inv.sp_upd_fpfo00100_1"> 
                <input bind="grdDetail"> 
                    <input bind="txtMasterPK" />
                </input>               
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 4%">
            <td>
                <table width="100%">
                    <tr style="height: 100%">
                        <td width="8%">
                            Req IQC No
                        </td>
                        <td width="10%">
                            <gw:textbox id="txtReqIQCNo"></gw:textbox>
                        </td>
                        <td width="6%">
                        </td>
                        <td width="8%">
                            Doc Date
                        </td>
                        <td width="10%">
                            <gw:datebox id="dtFrom" lang="1" />
                        </td>
                        <td width="2%">
                            <b>~</b></td>
                        <td width="10%">
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td width="40%">
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="Search" alt="Search" id="ibtnSearch" onclick="OnSearch()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="excel" alt="Report" id="idBtnReportA" onclick="OnReport()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="10">
                <table width="100%" style="height: 100%">
                    <tr style="height: 100%">
                        <td>
                            <gw:grid id='grdMaster' header='_pk|RIQC_NO|PRINT_TYPE|DOC_DATE|LABEL_TYPE|ITEM_CODE|ITEM_NAME|UOM|PRINT_QTY|LOT_QTY|LOT_UNIT|PARTNER_NAME|DESCRIPTION'
                                format='0|0|0|4|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|1|0|0|0|1|1|0|0|0' defaults='||||||||||||'
                                autosize="true"
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|0'
                                sorting='T' oncellclick="GridOnCellClick()"
                                 styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        <td>
        <table table width="100%" style="height: 100%">
        <tr style="height: 100%" style="background-color:Gray">
        <td width="100%">
        </td>
        <td>
        <gw:imgbtn img="save" alt="Save" id="idBtnUpdate" onclick="OnSaveDetail()" />
        </td>
        </tr>
        </table>
        </td>
        </tr>
        <tr style="height: 48%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 100%">
                        <td td colspan="10">
                            <gw:grid id='grdDetail' header='CHK|_PK|BC_SEQ|ITEM_BC|LOT_QTY|ITEM_CODE|ITEM_NAME' 
                            format='3|0|0|0|0|0|0' aligns='0|1|1|1|0|1|1'
                            defaults='||||||' editcol='1|0|0|0|1|0|0' autosize="true"
                            widths='1200|0|1600|1600|0|2000|0' sorting='T' 
                            styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtMasterPK" styles="display:none" />
</body>
</html>
