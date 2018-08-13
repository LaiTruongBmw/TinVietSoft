<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>IQC Result</title>
    <%ESysLib.SetUser("prod")%>
 <script>
 //---------------------------------------------------------
 var status_control = 0; //1 :Delete , 2 :Save
 
 var last_row_no = 0;
 var curr_row_no = 0;
 
 function BodyInit()
 { 
    BindingDataList();
 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {   
        var data1 ="<%= ESysLib.SetListDataSQL(" select pk,partner_id from tco_company where del_if = 0") %>";
        cboCompany.SetDataText(data1);
        txtVendor.SetEnable(false);
        //IQC Type
        <%=ESysLib.SetGridColumnComboFormat("grdIQCResult", 13, "SELECT CODE, CODE_NM FROM comm.TCO_ABCODE a, comm.TCO_ABCODEGRP b WHERE a.TCO_ABCODEGRP_PK = b.PK and b.ID = 'COCI0090' and a.DEL_IF = 0 and b.DEL_IF = 0 order by CODE_NM")%>; 
        //IQC Level
        <%=ESysLib.SetGridColumnComboFormat("grdIQCResult", 14, "SELECT CODE, CODE_NM FROM comm.TCO_ABCODE a, comm.TCO_ABCODEGRP b WHERE a.TCO_ABCODEGRP_PK = b.PK and b.ID = 'COCI0100' and a.DEL_IF = 0 and b.DEL_IF = 0 order by CODE_NM")%>; 
        var ctr = grdIQC2.GetGridControl();
        ctr.ColAlignment(3) = flexAlignRightCenter;

 }
function onVendorClick()
{
    var fpath = System.RootURL + "/form/ag/ec/agec00010_p.aspx";
    oValue = System.OpenModal( fpath , 600 , 350, 'resizable:yes;status:yes');

    if ( oValue != null)
    {
        txtVendor.text = oValue[1]+'-'+oValue[2];
        txtVendorPK.text = oValue[0]; 
    }
}

function onResetVendor()
{
    txtVendor.text = '';
    txtVendorPK.text = '';
} 

function OnSearchMasterClick()
{
    grdIQCResult.ClearData();
    grdIQC2.ClearData(); 
    last_row_no = 0;
    curr_row_no = 0; 
    datIQCResult.Call('SELECT');
}

function OnGridClick()
{
    var f_critical, f_major, f_minor, f_defect_rate, f_tested_qty, f_judge, f_fault, f_description; 
    curr_row_no = grdIQCResult.row;
    
    if ((last_row_no != curr_row_no) && (curr_row_no!=0))
   {
        if (last_row_no !=0 )
        {
            //update old row from detail
            f_critical = grdIQC2.GetGridData(1,0);
            grdIQCResult.SetGridText(last_row_no, 20,f_critical);
            f_major =  grdIQC2.GetGridData(1,1);
            grdIQCResult.SetGridText(last_row_no, 21,f_major);
            f_minor =  grdIQC2.GetGridData(1,2);
            grdIQCResult.SetGridText(last_row_no, 22,f_minor);
            f_defect_rate =  grdIQC2.GetGridData(1,3);
            grdIQCResult.SetGridText(last_row_no, 23,f_defect_rate);
            f_tested_qty =  grdIQC2.GetGridData(1,4);
            grdIQCResult.SetGridText(last_row_no, 24,f_tested_qty);
            f_judge =  grdIQC2.GetGridData(1,5);
            grdIQCResult.SetGridText(last_row_no, 25,f_judge);
            f_fault =  grdIQC2.GetGridData(1,6);
            grdIQCResult.SetGridText(last_row_no, 26,f_fault);
            f_description =  grdIQC2.GetGridData(1,7);
            grdIQCResult.SetGridText(last_row_no, 27,f_description);
            
         }
        
        //Add new row on detail and load data
        if (curr_row_no!=0)
        {
            grdIQC2.ClearData();
            grdIQC2.AddRow(); 
            grdIQC2.SetGridText(1,0,grdIQCResult.GetGridData(curr_row_no,20));
            grdIQC2.SetGridText(1,1,grdIQCResult.GetGridData(curr_row_no,21));
            grdIQC2.SetGridText(1,2,grdIQCResult.GetGridData(curr_row_no,22));
            grdIQC2.SetGridText(1,3,grdIQCResult.GetGridData(curr_row_no,23));
            grdIQC2.SetGridText(1,4,grdIQCResult.GetGridData(curr_row_no,24));
            grdIQC2.SetGridText(1,5,grdIQCResult.GetGridData(curr_row_no,25));
            grdIQC2.SetGridText(1,6,grdIQCResult.GetGridData(curr_row_no,26));
            grdIQC2.SetGridText(1,7,grdIQCResult.GetGridData(curr_row_no,27));
        }
        else
        {  
            grdIQC2.ClearData();
        }
        last_row_no = curr_row_no;
        if ((grdIQCResult.GetRowStatus(curr_row_no) != 80)&& (curr_row_no!=0))
        {
            //alert("modify"+  curr_row_no);
            grdIQCResult.SetRowStatus(curr_row_no,16);//Set Status modify to row
        }
   } 
}

function OnGridDBClick()
{
        if (event.col =="19") //open empolyee popup
       {
            var fpath;
            var oValue;
            fpath = System.RootURL + "/form/bd/dp/bddp00011.aspx";
            oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');

            if ( oValue != null )
            {               
                grdIQCResult.SetGridText(grdIQCResult.row, 18,oValue[0]);
                grdIQCResult.SetGridText(grdIQCResult.row, 19,oValue[2]);  
            }

       }
}

function onReceiveSearch()
{
        last_row_no = 0;
        curr_row_no = 0; 
       grdIQC2.ClearData();
}

function OnSaveMasterClick()
{
    if (confirm("Do you want to save ?"))
   { 
        var f_critical, f_major, f_minor, f_defect_rate, f_tested_qty, f_judge, f_fault, f_description; 
        //Update detail data first
        if (last_row_no !=0 )
        {
            //update old row from detail
            f_critical = grdIQC2.GetGridData(1,0);
            grdIQCResult.SetGridText(last_row_no, 20,f_critical);
            f_major =  grdIQC2.GetGridData(1,1);
            grdIQCResult.SetGridText(last_row_no, 21,f_major);
            f_minor =  grdIQC2.GetGridData(1,2);
            grdIQCResult.SetGridText(last_row_no, 22,f_minor);
            f_defect_rate =  grdIQC2.GetGridData(1,3);
            grdIQCResult.SetGridText(last_row_no, 23,f_defect_rate);
            f_tested_qty =  grdIQC2.GetGridData(1,4);
            grdIQCResult.SetGridText(last_row_no, 24,f_tested_qty);
            f_judge =  grdIQC2.GetGridData(1,5);
            grdIQCResult.SetGridText(last_row_no, 25,f_judge);
            f_fault =  grdIQC2.GetGridData(1,6);
            grdIQCResult.SetGridText(last_row_no, 26,f_fault);
            f_description =  grdIQC2.GetGridData(1,7);
            grdIQCResult.SetGridText(last_row_no, 27,f_description);
         }
    
        datIQCResult.Call('');
     }
}

function OnDeleteMasterClick()
{
     if (confirm("Do you want to delete ?"))
   { 
        grdIQC2.ClearData();
        grdIQCResult.DeleteRow();
        //alert("delete status"+ grdIQCResult.GetRowStatus(grdIQCResult.row));
        datIQCResult.Call('');
     }
}


 </script>
  </head>
<body>
 <gw:data id="datIQCResult"   onreceive="onReceiveSearch()">
    <xml> 
        <dso id="1" type="grid" parameter="0,13,14,15,16,17,18,20,21,22,23,24,25,26,27" function="inv.sp_sel_iqcresult" procedure = "inv.sp_upd_iqcresult" > 
            <input bind="grdIQCResult" >
                <input bind="cboCompany" />
				<input bind="txtVendorPK" />
                <input bind="dtbFrom" />
                <input bind="dtbTo" />
               <input bind="txtReqNo" />  
               <input bind="txtItem" /> 
            </input>
            <output bind="grdIQCResult" />
        </dso>
    </xml>
</gw:data>

        <table border="2" cellpadding="0" cellspacing="0" width="100%" style=" border-color: #BDE9FF; border-style:solid; border-width:medium;  margin:0; padding:0">
            <tr valign="top">
                    <td>
                       <table border="0" cellpadding="0" cellspacing="0" style=" margin-top:2;">
                            <tr>
                                    <td width="12%" ><b>&nbsp;&nbsp;Company&nbsp;</b></td>
                                    <td width="10%"><gw:list id="cboCompany"   styles="width:98%;margin-left:3;" ></gw:list></td>
                                    <td  width="13%" >&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: #1b2ff2; cursor: hand" onclick="onVendorClick()">Vendor </b></td>
                                    <td  width="35%" colspan="2">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="95%"><gw:textbox id="txtVendor" styles='width:100%' onenterkey="SearchOnClick()" /></td>
                                            <td width="5%"><gw:imgBtn id="ibtnResetVendor" img="reset" alt="Reset Vendor" text="Reset Vendor" onclick="onResetVendor()" /></td>
                                        </tr>
                                    </table>
                                    </td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="15%" align="right">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="85%"></td>
                                                <td width="5%"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" text="Search"  onclick="OnSearchMasterClick()" /></td>
                                                <td width="5%"><gw:imgBtn id="ibtnSave" img="save" alt="Save" text="Save"  onclick="OnSaveMasterClick()" /></td> 
                                                <td width="5%"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" text="Delete"  onclick="OnDeleteMasterClick()" /></td>
                                            </tr>
                                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td  ><b>&nbsp;&nbsp;Request Date</b></td>
                                <td align="left">
                                        <table border="0" cellpadding="1" cellspacing="2">
                                            <tr>
                                                <td width="45%"  align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01"  /></td>
                                                <td width="10%"><b>&nbsp;~&nbsp;</b></td>
                                                <td width="45%"><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01"    /></td>
                                            </tr>
                                        </table>
                                </td>
                                <td ><b>&nbsp;&nbsp;&nbsp;&nbsp;Request No</b>&nbsp;</td>
                                <td width="25%"><gw:textbox id="txtReqNo" styles="width:100%"  onenterkey="OnSearchMasterClick()" /></td>
                                <td width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Item</b>&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtItem" styles="width:98%"  onenterkey="OnSearchMasterClick()" /></td>
                           </tr>
                        </table> 
                </td>
        </tr>
        <tr >
                <td valign="top">
						<gw:grid id='grdIQCResult'
                            header='_PK|Req. date|Req. No|_TCO_BUSPARTNER_PK|Vendor|_RECEIVE_FROM_PK|Receiver from|_Item_PK|Item code|Item name|Unit|Req. Qty|Lot No|IQC Type|IQC Level|Sample Q.ty|Real Q.ty|IQC Date|_IQC_EMP_PK|Charger|_CRITICAL|_MAJOR|_MINOR|_IQC_DEFECT_RATE|_TESTED_QTY|_JUDGE|_CONTENT_OF_FAULT|_DESCRIPTION'
                            format='0|0|0|0|0|0|0|0|0|0|0|1|0|2|2|1|1|4|0|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='|||||||||||||||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='0|1350|1740|0|1935|0|1860|0|1995|1980|1005|1215|1320|1395|1440|1470|1350|1590|0|2640|0|0|0|0|0|0|0|0'
                            sorting='F'
                            styles='width:100%; height:340'
                            oncellclick="OnGridClick()" 
                            oncelldblclick="OnGridDBClick()"  
                        />
                </td>
        </tr>
        
        <tr valign="top">
            <td>
                   <gw:grid id='grdIQC2'
                        header='Critical|Major|Minor|Defect rate|Tested Q.ty|Judge|Content of fault|Remark'
                        format ='1|1|1|0|1|3|0|0'
                        aligns  ='0|0|0|2|0|0|0|2'
                        defaults='|||||||'
                        editcol='1|1|1|1|1|1|1|1'
                        widths='1515|1305|1000|2205|1710|1000|1860|1000'
                        sorting='T'
                        styles='width:100%; height:50'
                    />
            </td>
        </tr>
  </table>
<gw:textbox id="txtVendorPK" styles='width:100%;display:none;' />
</body>
</html>