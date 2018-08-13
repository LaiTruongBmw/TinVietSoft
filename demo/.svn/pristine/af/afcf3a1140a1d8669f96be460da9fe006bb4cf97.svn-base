<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%> 
<script>
//var Insert      = 'F';
//var Modify      = 'F';
//var Delete    = 'F';

function BodyInit()
{   
            System.Translate(document);
			
           BindingDataList();
           
}
function BindingDataList()
{
        txtCompany.text = "<%=Session("COMPANY_PK") %>";
       //----- Depr. method 
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 20, "SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACDF0060'")%>; 
       //--------CCY
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 28,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110'")%>; 
       //--------Status------------
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 29,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACDF0070'")%>; 
       //------Kind----------
       <%=CtlLib.SetGridColumnComboFormat("grdDetail", 17,"SELECT b.CODE, b.code||'--'||B.CODE_NM from tco_abcodegrp a, tco_abcode b where a.pk = b.tco_abcodegrp_pk  and a.del_if = 0 and b.del_if = 0 and a.id = 'ACDF0010'" )%>; 
	   //------Location----------
	   
	   <%=CtlLib.SetGridColumnComboFormat("grdDetail", 3,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'GFQC0025' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM" )%>; 
	   var trl = grdDetail.GetGridControl();
	 	trl.FrozenCols = 4;
        var lsAssetType      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0025') FROM DUAL")%>|ALL|[SELECT ALL]";
        lstAsset_Type.SetDataText(lsAssetType);
        lstAsset_Type.value = 'ALL';
		
		txtUser_Pk.text = "<%=Session("USER_PK")%>";
		dso_getCompany.Call();
	   
}
//-----------------------------------------------------------------------------------------
function OnSearch()
{
        dat_Update.Call("SELECT");
}
//----------------------------------------------------

function OnPrint()
{
                var url = System.RootURL + "/standard/reports/gf/gf/gfgf00090.aspx?company_pk=" +lstCompany.value  + '&Asset=' + txtVoucher.text + '&Asset_type=' + lstAsset_Type.value;     
                 System.OpenTargetPage(url);      
}
function OnNew()
{
            var i = 0;
            
             grdDetail.AddRow();
          for(i=1; i < grdDetail.rows; i++)
           {
                   grdDetail.SetGridText(grdDetail.rows-1, 0, i);
                 
           }     
      
}

function OnSave()
{
           for(i=1; i < grdDetail.rows; i++)
           {
                   grdDetail.SetGridText(grdDetail.rows-1, 0, i);
                   if(grdDetail.GetGridData(i,51) == '')
                   { 
                        grdDetail.SetGridText(i, 51, lstCompany.value); 
                    } 
           }     
           
        dat_Update.Call();
}

function OnUpdateAll()
{
	for(i=1; i < grdDetail.rows; i++)
   {
	   grdDetail.SetGridText(i, grdDetail.GetGridControl().Cols- 1 , 0x10);
	   
   } 
	dat_Update_All.Call();   
}

function OnDelete(obj)
{
        switch(obj)
        {
                case 1:
                        if(confirm("Are you sure you want to delete?"))
						{    
							grdDetail.DeleteRow();     
							dat_Update.Call();
						}
                break;
                case 2:
                            if(confirm("Are you sure you want to delete all data?"))
                            {
                                    dso_Delete.Call();
                            } 
                break;
        } 
        
}
function OnRefresh()
{
        grdDetail.GridRefresh();

}
function OnDataReceive(obj)
{
       if(obj.id=='dso_Delete')
       {
                OnSearch();
       }
}
function OnTotal_Month()
{
            var Year = Number(grdDetail.GetGridData(grdDetail.row, 24));
            var Month = Number(grdDetail.GetGridData(grdDetail.row, 25));
            var Total_Month = Number((Year * 12) + Month);
            grdDetail.SetGridText(grdDetail.row, 26, Total_Month);  
}
</script>

<body>
<gw:data id="dat_Update"   onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60" function="ac_sel_60130220_grid" procedure="ac_upd_60130170_grid"   > 
            <input bind="grdDetail">                    
               
                <input bind="lstCompany" /> 
                <input bind="txtVoucher" /> 
                <input bind="lstAsset_Type"/>
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>   

<gw:data id="dat_Update_All"   onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58" function="ac_sel_60130220_grid" procedure="ac_upd_60130220_grid1"   > 
            <input bind="grdDetail">                    
               
                <input bind="lstCompany" /> 
                <input bind="txtVoucher" /> 
                <input bind="lstAsset_Type"/>
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>   
 
  <gw:data id="dso_Delete" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60130170_mst" >
                <input> 
					<input bind="tac_gffa_mst_pk" />       
					<input bind="lstAsset_Type"/>
					<input bind="lstCompany" /> 
                </input>  
                <output>
                     <output bind="txtReturn" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="background: #BDE9FF; height: 100%; width: 100%" >
        <tr>
      
            <td style="background: white; width: 100%" id="idRIGHT">
                <table cellpadding="0" cellspacing="0" style="height: 100%; width: 100%" border="0">
                    <tr style="height: 5%" width="100%">
                        <td width="100%">
                            <fieldset style="padding:4">
                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" width="8%">Company&nbsp;</td>
                                        <td  width="30%"><gw:list id="lstCompany" style="width:100%" value="<%=Session("COMPANY_PK")%>" maxlen=100>                                
                                                <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data>
                                            </gw:list>
                                         </td>
                                        
                                        <td align="right" width="10%">Asset&nbsp;</td>
                                        <td width="20%"> <gw:textbox id="txtVoucher" onenterkey="OnSearch()" styles='width:100%;' /></td>
                                        <td style="width:12% " align="right">Asset Type&nbsp;</td>
                                        <td style="width:15% " colspan=''><gw:list id="lstAsset_Type" styles="width: 100%" onchange="OnSearch()" /></td>

                                       <td width="5%"></td> 
                                       
                                        <td><gw:imgbtn img="search" alt="Search" onclick="OnSearch()" /></td>
                                       <td><gw:button img="save" alt="Save" onclick="OnUpdateAll()" /></td> 
                                       <td><gw:button img="delete" alt="Delete" onclick="OnDelete(1)" /></td> 
									   <td><gw:button img="excel" text="Print" alt="Print" onclick="OnPrint()" /></td>
                                    </tr>
                                   
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%" width="100%">
                        <td>
                            <!--header='0.No|1.Asset Code|2.Ref.No|3.Asset/Tool|4.Asset Name|5.Local Name|6.Kor.Name|7.Account Code|8.Acc.Name|9.Acc.Depr Code|10.Acc.Depr Name|11.Acc.Expense Code|12.Acc.Expense Name|13.P/L Unit Code|14.P/L Unit Name|15.P/L Center Code|16.P/L Center Name|17.Kind|18.Department|19.Charger|20.Depr. Method|21.Depr. Rate|22.Service Date|23.Depr. Date|24.Estime life(year)|25.Month(s)|26.Total month(s)|27.Day(s)|28.CCY|29.Status|30.Prod Year|31.Invoice Date|32.Invoice No|33.Serial No|34.Voucher No|35.Price|36.Amount|37.Origin|38.Quantity|39.Capacity|40.Model|41.Engine No|42.Location|43.Description|44.Local Description|45._pk|46._acc_pk|47._acc_exp_pk|48._acc_depr_pk|49._plunit_pk|50._plcenter_pk|51._company_pk|52._department_pk|53.Book Rate|54.Supplier|55.Depreciated (End date)|56.Remain Day|57.FA_STATUS|58.DISPOSAL_DT|59.UNUSED_DT|60.INSTRUMENT'-->
                            <gw:grid id="grdDetail" 
                                header='No|Asset Code|Ref.No|Asset/Tool|Asset Name|Local Name|Kor.Name|Account Code|Acc.Name|Acc.Depr Code|Acc.Depr Name|Acc.Expense Code|Acc.Expense Name|P/L Unit Code|P/L Unit Name|P/L Center Code|P/L Center Name|Kind|Department|Charger|Depr. Method|Depr. Rate|Service Date|Depr. Date|Estime life(year)|Month(s)|Total month(s)|Day(s)|CCY|Status|Prod Year|Invoice Date|Invoice No|Serial No|Voucher No|Price|Amount|Origin|Quantity|Capacity|Model|Engine No|Location|Description|Local Description|_pk|_acc_pk|_acc_exp_pk|_acc_depr_pk|_plunit_pk|_plcenter_pk|_company_pk|_department_pk|Book Rate|Supplier|Depreciated (End date)|Remain Day|Disposal Date|Unused Date'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|4|0|4|4' 
                                aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|3|1|1|3|3|3|3|1|1|1|1|0|0|0|3|3|0|3|0|1|0|1|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0' 
                                defaults='||||||||||||||||||||||||||||||A|||||||||||||||||||||||||||' 
                               editcol='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='500|2000|2000|1500|3000|3000|3000|2000|3000|2000|3000|2000|3000|2000|3000|2000|3000|3000|4000|3000|1500|1500|1200|1200|2000|2000|2000|2000|2000|1200|1000|1200|2000|2000|2000|2000|2000|3000|2000|2000|1500|2000|1500|3000|3000|0|0|0|0|0|0|0|0|0|1000|2500|0|2000|2000' 
                                sorting='T' styles="width:100%;height:100%" 
                               acceptNullDate
							   autosize='T'
                               onafteredit="OnTotal_Month()"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtCompany" styles='width:100%;display:none' />
	<gw:textbox id="txtUser_Pk" styles='width:100%;display:none' />
    <gw:textbox id="tac_gffa_mst_pk" styles='width:100%;display:none' />
        <gw:textbox id="txtReturn" styles='width:100%;display:none' />

    <!---------------------------------------------------------------------->
</body>
</html>
