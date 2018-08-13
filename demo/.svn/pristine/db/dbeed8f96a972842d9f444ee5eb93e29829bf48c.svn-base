<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<!-- #include file="../../../../system/lib/form.inc"  -->
<script>
function BodyInit()
{
    MergeCell();
   // SetControlFormat();
   txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
function MergeCell()
{
	var fg = grdAP.GetGridControl(); 	
	    if(fg.Rows < 2)
		{
		   grdAP.AddRow();     
		}    
        fg.FixedRows   = 2;
        fg.MergeCells  = 5;	
		fg.MergeRow(0) = true;
      
	  	fg.Cell(0, 0, 1, 0, 2)  = "Contract";   
	    fg.Cell(0, 1, 1, 1) = "No";
	    fg.Cell(0, 1, 2, 1) = "Date";
        
		fg.MergeCol(3) = true;
		fg.Cell(0, 0, 3, 1, 3) = "Confirm Date";
		
		fg.Cell(0, 0, 5, 0, 6)  = "Customer";   
	    fg.Cell(0, 1, 5, 1) = "Code";
	    fg.Cell(0, 1, 6, 1) = "Name";
		
		fg.Cell(0, 0, 8, 0, 9)  = "Project";   
	    fg.Cell(0, 1, 8, 1) = "Code";
	    fg.Cell(0, 1, 9, 1) = "Name";
	    
		fg.MergeCol(10) = true;
		fg.Cell(0, 0, 10, 1, 10) = "Terms Type";
		
		fg.MergeCol(11) = true;
		fg.Cell(0, 0, 11, 1, 11) = "Contract Ccy";
		
        fg.Cell(0, 0, 12, 0, 14)  = "Amount";   
	    fg.Cell(0, 1, 12, 1) = "Contract";
	    fg.ColFormat(12) 		= "#,###,###,###,###.##";	
	    fg.Cell(0, 1, 13, 1) = "Adjust";
	    fg.ColFormat(13) 		= "#,###,###,###,###.##";	
		fg.Cell(0, 1, 14, 1) = "Final";
		fg.ColFormat(14) 		= "#,###,###,###,###.##";	
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4; 
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold		
		
		fg.ColWidth(0)=0;		// PK
		fg.ColWidth(1)=2000;	// CONTRACT NO
		fg.ColWidth(2)=1200;	// CONTRACT DATE
		
		fg.ColWidth(3)=1200;	// CONFIRM DATE
		
		fg.ColWidth(4)=0;		// CUST PK
		fg.ColWidth(5)=1200;	// CUST CODE
		fg.ColWidth(6)=2000;	// CUST NAME
		
		fg.ColWidth(7)= 0;	// TAC_ABPL_PK
		fg.ColWidth(8)=1200;	// PL_CD
	
		fg.ColWidth(9)=2000;	// PL_NM	
		fg.ColWidth(10)=0;	// TERMS_TYPE			
		fg.ColWidth(11)=1200;	// CONTRACT_CCY 
		fg.ColWidth(12)=1500;		// CONTRACT AMT
		
		fg.ColWidth(13)=1200;	// CONTRACT ADJ AMT
		fg.ColWidth(14)=2000;	// CONTRACT FINAL AMT
		
}

/*function SetControlFormat()
{
    txtPL_ID.SetEnable(0);
    txtPL_Nm.SetEnable(0);
    txtPartnerNm.SetEnable(0);
    txtPartnerID.SetEnable(0);
    
    grdAP.GetGridControl().FrozenCols =8;
    grdAP.GetGridControl().ScrollTrack=true; 
    
    var ctrl1 = grdAP.GetGridControl();
    ctrl1.ColFormat(7) = "###,###R";  
    ctrl1.ColFormat(8) = "###,###R";
    ctrl1.ColFormat(9) = "###,###R";
    ctrl1.ColFormat(10) = "###,###R";
    ctrl1.ColFormat(11) = "###,###R";
    ctrl1.ColFormat(12) = "###,###R";  
    
}*/

function OnShowPopup(index)
{
    switch (index)
    {
        case '0':
            var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtPartnerID.SetDataText(object[1]);//customer id
                    txtPartnerNm.SetDataText(object[2]);//customer name
                    txtPartnerPk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;
        case '1':
            fpath  = System.RootURL + "/standard/forms/60/02/60020070_plunit.aspx?"
                oValue = System.OpenModal( fpath , 400 , 500 , 'resizable:yes;status:yes');
                
                if ( oValue != null )
                {
                    if (oValue[0] != 0)
                    {
                        txtPL_PK.text=oValue;     // Center PK
                        dat_gfka00220_2.Call();
                    }            
                }                
            break;
    }
}
function onSearch()
{
    dat_gfqc00030_AP.Call("SELECT"); 
    
}
function OnDataReceive(obj)
{
    if (obj.id=="dat_gfqc00030_AP")
    {  
        MergeCell();   
        idRecord1.text="Total rows: " + (grdAP.rows-2);       
    }    
}
function onPrint(obj)
{
    switch(obj)
    {
        case 1:
            var url = '/standard/reports/gf/qc/gfqc00020_contractinqAP.aspx?p_company_pk=' + lstComp.GetData() + '&p_partner_pk=' + txtPartnerPk.GetData() + '&p_pl_pk=' + txtPL_PK.GetData()+ '&p_contr_no='+txtContractNo.GetData();
            System.OpenTargetPage( System.RootURL+url , "newform" );
        break;
        case 2:
            var url = '/standard/reports/gf/qc/gfqc00030.aspx?p_contract_no=' + txtContractNo.GetData() + '&tac_abplcenter_pk=' + txtPL_PK.GetData() + '&tco_buspartner_pk=' + txtPartnerPk.GetData() + '&from=' + txtFROM_DATE.GetData() + '&to=' + txtTO_DATE.GetData() + '&company=' + lstComp.GetData();
            System.OpenTargetPage( System.RootURL+url , "newform" );
        break;
    }
    
    
}   
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
</head>
<body >
<gw:data id="dat_gfqc00030_AP" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"  function="AC_sel_60020070_AP"   > 
            <input bind="grdAP">   
                <input bind="txtContractNo" />                 
                <input bind="txtPL_PK" />
                <input bind="txtPartnerPk" />  
                <input bind="txtFROM_DATE" />
                <input bind="txtTO_DATE" /> 
            </input> 
            <output bind="grdAP" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_gfka00220_2" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="AC_pro_60020070"  > 
                <input>
                    <input bind="txtPL_PK" />
                </input> 
                <output>
                    <output bind="txtPL_ID" />
                    <output bind="txtPL_Nm" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
   <!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020070_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstComp"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<!------------------------------------------------------------------------>
<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
	<tr style="width:100%;height:5%">
		<td>
		 <fieldset style=" height: 100%; padding: 0">
            <table border="0" cellpadding=1 cellspacing=1 width="100%" id="table1">
	            <tr>
		            <td width="13%" align="right">Company&nbsp;</td>
		            <td width="27%"><gw:list id="lstComp" style="width:100%" value="<%=Session("COMPANY_PK")%>">
                       <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All</data>
                       </gw:list>
                     </td>
		            <td width="15%"  align=right><a onclick="OnShowPopup('0')" title="Click here to select partner" href="#tips" style="text-decoration : none; color=#0000FF">Partner</a> &nbsp;</td>
		            <td width="45%">
		                <table style="width:100%" cellpadding="0" cellspacing="0">
		                    <tr>
		                        <td width="40%"><gw:textbox id="txtPartnerID" style="width:100%" /></td>
		                        <td width="60%"><gw:textbox id="txtPartnerNm" style="width:100%"/></td>
		                        <td><gw:textbox id="txtPartnerPk" style="display:none" /></td>
		                        <td><gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPartnerID.text='';txtPL_PK.text='';txtPartnerNm.text=''" /></td>
		                    </tr>
		                </table>
		            </td>
		            <td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" /></td>
                    <td ><gw:imgbtn id="btnPrint" img="excel" alt="printer" text="printer" onclick="onPrint(1)" /></td>
	            </tr>
	            <tr>
		            <td  align="right">Contract No&nbsp;</td>
		            <td ><gw:textbox id="txtContractNo" styles="width:100%" onenterkey="onSearch()"/></td>
		            <td  align="right"><a onclick="OnShowPopup('1')" title="Click here to select P/L" href="#tips" style="text-decoration : none; color=#0000FF">PL&nbsp;</a>&nbsp;</td>
                    <td >
                        <table style="width:100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="40%"><gw:textbox id="txtPL_ID" style="width:100%" text="" /></td>
                                <td width="60%" ><gw:textbox id="txtPL_Nm" style="width:100%" text="" /></td>
                                <td><gw:textbox id="txtPL_PK" style="display:none" text="" /></td>
                                <td><gw:imgbtn id="reset1" img="Reset" alt="Reset" onclick="txtPL_Nm.text='';txtPL_PK.text='';txtPL_ID.text=''" /></td>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                    <td ><gw:imgbtn id="btnPrint1" img="excel" alt="printer" text="printer" onclick="onPrint(2)" /></td>
	            </tr>
	            <tr>
	                <td  align="right">Contract Date&nbsp;</td>
	                <td >
	                    <table style="width:100%" cellpadding="0" cellspacing="0">
	                        <tr>
	                            <td width="45%"><gw:datebox id="txtFROM_DATE"   lang="1"/></td>
	                            <td width="45%" align=center>~</td>
	                            <td width="45%"><gw:datebox id="txtTO_DATE"   lang="1"/></td>
	                        </tr>
	                    </table>
	                </td>
	                <td colspan="4" ></td>
	            </tr>
            </table>
            </fieldset></td>
    </tr>
    <tr style="width:100%;height:1%">
            <!--<td align=left><b>A/P</b></td>-->
            <td colspan="6" align="center">&nbsp;<gw:label id="idRecord1" text="" style="font-family:Tahoma;color:Red" /></td>            
     </tr>
    <tr style="width:100%;height:94%">
        <td><gw:grid   
				id="grdAP"  
				header="pk|contractno|contractdate|confirmdate|custpk|custcd|custnm|termstype|ccy|amt|adjamt|finalamt|plpk|plcd|plnm"   
				format="0|0|0|0|0|0|0|0|0|1|1|1|1|1|0"  
				aligns="0|0|0|0|0|0|0|1|1|2|2|3|3|3|3"  
				defaults="||||||||||||||"  
			   editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
				widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				styles="width:100%; height:100%"   
				sorting="T" 
				 />
        </td>
    </tr>
</table> 
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
  </body>
</html>
