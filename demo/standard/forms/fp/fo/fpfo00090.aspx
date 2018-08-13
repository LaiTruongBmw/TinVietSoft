<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Label Print</title>
    <%  ESysLib.SetUser("inv")%>

    <script>
     function BodyInit()
      {
        var data="";
        data = "DATA|10|Request IQC|20|Lost label|30|Product label";    
        lstPrintType.SetDataText(data);
        var data1="";
        data1 = "DATA|10|NORMAL|20|MATERIAL|30|PRODUCT|40|UTILITY|50|MATERIAL 2 |60|NOMARL2";    
        lstLabelType.SetDataText(data1);
        
        OnSearch();
       
      }
      function OnReportA()
      {
           var pk = GetPK();//check data 
           var url;
           if(pk == "")//if not check
            {
                alert("Please select atleast one item to print.");
                return;
           }
           if(lstLabelType.value == "10"){
                url = System.RootURL + "/reports/fp/fo/fpfo00090.aspx?p_pk="+ pk;
           }
           else if(lstLabelType.value == "20"){
                url = System.RootURL + "/reports/fp/fo/fpfo00090_a4.aspx?p_pk="+ pk;
           }
           else if(lstLabelType.value == "50"){
                url = System.RootURL + "/reports/fp/fo/fpfo00090_a42.aspx?p_pk="+ pk;
           }
           else if(lstLabelType.value == "60"){
                url = System.RootURL + "/reports/fp/fo/fpfo00090_Normal2.aspx?p_pk="+ pk;
           }
           System.OpenTargetPage(url);
      }
      function OnSearch(){
        dat_fbfo00090.Call("SELECT");
      }
      function GetPK()// use print report
      {
        var pk="";
        for(var i=1;i<grdLabelPrint.rows;i++)
        {
            if(grdLabelPrint.GetGridData(i,0) == -1)//checked
            {
              pk += grdLabelPrint.GetGridData(i,1)+"|";
            }
        }
        if(pk.length > 0) pk=pk.substr(0,pk.length-1);
        return pk;
      }
      function OnNew()
      {
        if(lstPrintType.GetData() == "10"){//iqc label(new label)
            var url = System.RootURL + "/form/fp/fo/fpfo00090_1.aspx";
            var obj = System.OpenModal(url,800,500,"status:yes;resizable:yes");
            if(obj != null){
               for(var i=0;i<obj.length;i++){
                    grdLabelPrint.AddRow();
                    var aTemp = obj[i];
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,18,   aTemp[1]);//TCO_BUSPARTNER_PK            
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,9,   aTemp[8]);//Unit
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,7,   aTemp[6]);//itemcode
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,4,   aTemp[5]);//supplier name
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,5,   aTemp[0]);//table_pk
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,6,   "TPR_REQIQCD");//set data hard to grid
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,8,   aTemp[7]);//itemName
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,10,   aTemp[9]);//print Qty
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,11,   aTemp[10]);//lot Qty
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,3,   aTemp[4]);//Req No
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,16,   aTemp[2]);//tco_Item pk
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,14,  lstPrintType.GetData());// control "print_type" plus data down grid
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,15,  lstLabelType.GetData());
               }
            }
        }
        else if(lstPrintType.GetData() == "20"){//lost label
            var url = System.RootURL + "/form/fp/fo/fpfo00090_popup.aspx?group_type=||Y|Y||";
            var obj = System.OpenModal(url,800,500,"status:yes;resizable:yes");
            if(obj != null){
               for(var i=0;i<obj.length;i++){
                    grdLabelPrint.AddRow();
                    var aTemp = obj[i];
                    //grdLabelPrint.SetGridText(grdLabelPrint.rows-1,18,   aTemp[1]);//TCO_BUSPARTNER_PK            
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,9,   aTemp[5]);//Unit
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,7,   aTemp[1]);//itemcode
                    //grdLabelPrint.SetGridText(grdLabelPrint.rows-1,4,   aTemp[5]);//supplier name
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,5,   aTemp[0]);//table_pk
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,6,   "TCO_ITEM");//set data hard to grid
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,8,   aTemp[2]);//itemName
                    //grdLabelPrint.SetGridText(grdLabelPrint.rows-1,10,   aTemp[9]);//print Qty
                    //grdLabelPrint.SetGridText(grdLabelPrint.rows-1,11,   aTemp[10]);//lot Qty
                    //grdLabelPrint.SetGridText(grdLabelPrint.rows-1,3,   aTemp[4]);//Req No
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,16,   aTemp[0]);//tco_Item pk
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,14,  lstPrintType.GetData());// control "print_type" plus data down grid
                    grdLabelPrint.SetGridText(grdLabelPrint.rows-1,15,  lstLabelType.GetData());
               }
            }
        }
      }
      function OnDeleteRow()
      {
        grdLabelPrint.DeleteRow();
      }
      function UnDelete()
      {
        grdLabelPrint.OnUnDelete();
      }
      function OnSave()
      {
        if(CheckDataIsValid() == true){
            dat_fbfo00090.Call();
        }
      }
      function CheckDataIsValid()
      {
        for(var i=1;i<grdLabelPrint.rows;i++)
        {
            if(grdLabelPrint.GetGridData(i,10)<=0)
            {
                alert("Please input Print Quantity > 0!");
                return false;
            }
            else if(grdLabelPrint.GetGridData(i,11)<=0)
            {
                alert("Please input Lot Quantity > 0!");
                return false;
            }
        }
        return true;
      }
    </script>

</head>
<body>
    <gw:data id="dat_fbfo00090"> 
    <xml> 
        <dso id="1" type="grid" parameter="1,3,5,6,10,11,12,14,15,16,18,19" function="inv.sp_sel_fpfo00090"   procedure="inv.sp_upd_fpfo00090"> 
            <input bind="grdLabelPrint">                    
                <input bind="dtFrom" /> 
                <input bind="dtTo" /> 
                <input bind="lstPrintType" />
                <input bind="txtRiqc_No" />
                <input bind="txtItemCode" />
                <input bind="txtPartner_Name" />
                <input bind="lstLabelType" />
            </input> 
            <output bind="grdLabelPrint" /> 
        </dso> 
    </xml> 
</gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td>
                <table width="100%">
                    <tr>
                        <td width="4%">
                            <b>Date</b></td>
                        <td width="10%">
                            <gw:datebox id="dtFrom" lang="<%=Session("lang")%>" />
                        </td>
                        <td width="2%">
                            <b>~</b></td>
                        <td width="10%">
                            <gw:datebox id="dtTo" lang="<%=Session("lang")%>" />
                        </td>
                        <td width="8%" align="right">
                            <b>Print Type</b></td>
                        <td width="15%">
                            <gw:list id="lstPrintType" styles="width:100%" />
                        </td>
                        <td width="2">
                        </td>
                        <td width="8%" align="right">
                            <b>Label Type</b></td>
                        <td width="16%">
                            <gw:list id="lstLabelType" styles="width:100%" />
                        </td>
                        <td width="7%">
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="Search" alt="Search" id="ibtnSearch" onclick="OnSearch()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="new" alt="New" id="idBtnAdd" onclick="OnNew()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="excel" alt="Report" id="idBtnReportA" onclick="OnReportA()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="delete" alt="Delete" id="idBtnDelete" onclick="OnDeleteRow()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="ibtnUnDelete" img="udelete" alt="Undelete" onclick="OnUnDelete()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn img="save" alt="Save" id="idBtnUpdate" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
        </tr>
        <tr style="height: 2%">
            <td>
                <table width="100%">
                    <tr>
                        <td width="5%" align="right">
                            <b>Riqc No</b></td>
                        <td width="20%">
                            <gw:textbox id="txtRiqc_No" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td width="7%" align="right">
                            <b>Item Code</b></td>
                        <td width="1%">
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtItemCode" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td width="10%" align="right">
                            <b>Partner Name</b></td>
                        <td width="15%">
                            <gw:textbox id="txtPartner_Name" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td width="27%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 96%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr>
                        <td>
                            <gw:grid id="grdLabelPrint" header="Print|_PK|Doc Date|Riqc No|Supplier name|_table_pk|_Table_Name|Item_Code|Item_Name|UOM|Print_Qty|Lot_Qty|Lot Unit|Label Qty|_Print Type|_Label Type|_TCO_Item_PK|_Last_Print_Emp_PK|_Supplier_PK|Description"
                                format="3|0|4|0|0|0|0|0|0|0|1|1|0|1|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|3|3|1|3|1|1|1|0|1|0"
                                defaults="|||||||||||||||||||" autosize="true" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="1000|1000|1200|1500|2000|2000|1500|1500|2400|1500|1200|1000|1500|1200|1500|1200|1400|1800|1300|0"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:list id="lstBookingCcy_Tmp" style="display: none"></gw:list>
</body>
</html>
