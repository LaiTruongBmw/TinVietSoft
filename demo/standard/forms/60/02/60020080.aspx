<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<script>
function BodyInit()
{
    SetGridFormat()
    SetControlFormat();
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}
function SetGridFormat()
{
       if(grdAR.rows <2)
       {
            grdAR.AddRow();
       } 
        var fg=grdAR.GetGridControl();
		
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

		fg.MergeCol(0) = true;
        fg.Cell(0, 0, 0, 1, 0) = "No";
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "Contrat No";
		
		
		fg.Cell(0, 0, 2, 0, 3) = "Partner";  
		fg.Cell(0, 0, 4, 0, 5) = "P/L";
		fg.Cell(0, 0, 6, 0, 7) = "Contract";
		
		fg.Cell(0, 1, 2, 1) = "Code";
		fg.Cell(0, 1, 3, 1) = "Name";
		
		fg.Cell(0, 1, 4, 1) = "Code";
		fg.Cell(0, 1, 5, 1) = "Name";
		
		fg.Cell(0, 1, 6, 1) = "Ccy";
		fg.Cell(0, 1, 7, 1) = "Amount";
		
		fg.Cell(0, 0, 8, 0, 11) = "Schedule payment";  
		fg.Cell(0, 1, 8, 1) = "No";
		fg.Cell(0, 1, 9, 1) = "Date";
		fg.Cell(0, 1, 10, 1) = "Amount";
		fg.Cell(0, 1, 11, 1) = "Remark";
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		/*
		fg.ColWidth(0)=500;
		fg.ColWidth(1)=1500;
		fg.ColWidth(2)=1000;
		
		fg.ColWidth(3)=2500;
		fg.ColWidth(4)=1000;
		
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=500;
		
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
		fg.ColWidth(11)=2000;
		fg.ColWidth(12)=2000;
		
		
		fg.ColFormat(7) = "#,###,###,###,###.##";
		fg.ColFormat(8) = "#,###,###,###,###.##";
		fg.ColFormat(9) = "#,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###.##";
		fg.ColFormat(11) = "#,###,###,###,###.##";
		fg.ColFormat(12) = "#,###,###,###,###.##";
		
		fg.ColAlignment(7) = flexAlignRightCenter;
		fg.ColAlignment(8) = flexAlignRightCenter;
		fg.ColAlignment(9) = flexAlignRightCenter;
		fg.ColAlignment(10) = flexAlignRightCenter;
		fg.ColAlignment(11) = flexAlignRightCenter;
		fg.ColAlignment(12) = flexAlignRightCenter;	*/
}
function SetControlFormat()
{
    txtPL_ID.SetEnable(0);
    txtPL_Nm.SetEnable(0);
    txtPartnerNm.SetEnable(0);
    txtPartnerID.SetEnable(0);
    
    grdAR.GetGridControl().FrozenCols =8;
    grdAR.GetGridControl().ScrollTrack=true; 
    
    var ctrl1 = grdAR.GetGridControl();
    ctrl1.ColFormat(7) = "###,###R";  
    ctrl1.ColFormat(8) = "###,###R";
    ctrl1.ColFormat(9) = "###,###R";
    ctrl1.ColFormat(10) = "###,###R";
    ctrl1.ColFormat(11) = "###,###R";
    ctrl1.ColFormat(12) = "###,###R";  
    
}

function OnShowPopup(index)
{
    switch (index)
    {
        case 0:
            var fpath = System.RootURL + "/standard/forms/60/05/60050010_popup_4.aspx?partner_type=AR"; //customs
                aValue = System.OpenModal( fpath , 900 , 500, 'resizable:yes;status:yes');
	            if ( aValue != null )
	            {          
	                txtPartnerNm.SetDataText(aValue[2]); 	               
	                txtPartnerPk.SetDataText(aValue[0]); 
	                txtPartnerID.SetDataText(aValue[1]);                    
	            }	
                break;
        case 1:
            fpath  = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstComp.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
                oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                
                if ( oValue != null )
                {
                    txtPL_PK.text   = oValue[2]; 
                    txtPL_Nm.text   = oValue[1];
                    txtPL_ID.text   = oValue[0];
                }                
            break;
    }
}
function onSearch()
{
    dat_gfqc00030_AR.Call("SELECT"); 
    
}
function OnDataReceive(obj)
{
    if (obj.id=="dat_gfqc00030_AR")
    {  
        SetGridFormat()     
        idRecord1.text="Total rows: " + (grdAR.rows-2);       
		var fg=grdAR.GetGridControl();    
            fg.MergeCells =3 ;
            fg.MergeCol(5) =true ;
            fg.MergeCol(2) =true ;
            fg.MergeCol(3) =true ;
            fg.MergeCol(4) =true ;
			fg.MergeCol(6) =true ;
			fg.MergeCol(7) =true ;
    }    
}

function onPrint()
{
    var url = '/standard/reports/gf/qc/gfqc00010_contractinqAR_2.aspx?p_company_pk=' + lstComp.GetData() + '&p_partner_pk=' + txtPartnerPk.GetData() + '&p_pl_pk=' + txtPL_PK.GetData();
    System.OpenTargetPage( System.RootURL+url , "newform" );
}                
</script>
<body >
<gw:data id="dat_gfqc00030_AR"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid"  function="AC_sel_60020080_AR"   > 
            <input bind="grdAR">                    
                <input bind="lstComp" /> 
                <input bind="txtContractNo" />                 
                <input bind="txtPL_PK" />
                <input bind="txtPartnerPk" />
                <input bind="dtContractDt_Fr" />
                <input bind="dtContractDt_To" />
				<input bind="lstContract_Type" />
				<input bind="lstMaintenance" />
            </input> 
            <output bind="grdAR" /> 
        </dso> 
    </xml> 
</gw:data>
  <!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_sel_60020060_entry" > 
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
<table  cellpadding="0" cellspacing="0" style="width:100%;height:100%">
	    <tr style="height:4%">
	                <td>
	                        <fieldset style="padding:0"> 
	                            <table cellpadding="1" cellspacing="1" width="100%">
	                                    <tr>
											<td width="10%" align="right">Company</td>
											<td width="25%"><gw:list id="lstComp" style="width:100%" value="<%=Session("COMPANY_PK")%>">
											   <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All</data>
											   </gw:list>
											 </td>
											 <td  width="10%"  align="right"><a onclick="OnShowPopup(0)" title="Click here to select partner" href="#tips" style="text-decoration:none; color:#0000FF">Partner</a></td> 
											<td width="25%">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td width="40%"><gw:textbox id="txtPartnerID" style="width:100%"  /></td>
														<td width="60%"><gw:textbox id="txtPartnerNm" style="width:100%"  /></td>
														<td><gw:textbox id="txtPartnerPk" style="display:none" /></td>
														<td width=""><gw:imgbtn id="reset" img="Reset" alt="Reset" onclick="txtPartnerID.text='';txtPartnerNm.text='';txtPartnerNm.text=''" /></td>
													</tr>
												</table>
											</td>
											<td width="15%" align="right">Contract Type</td>
											<td width="15%"><gw:list id="lstContract_Type" style="width:100%" ></gw:list>
											 </td>
											<td ><gw:imgbtn id="btnPrint" img="printer" alt="printer" text="printer" onclick="onPrint()" /></td> 
	                                    </tr>
	                                   <tr>
											<td width="" align="right">Contract No</td>
											<td width="">
												<table cellpadding="1" cellspacing="1" width="100%">
													<tr>
														<td width="80%"><gw:textbox id="txtContractNo" styles="width:100%" onenterkey="onSearch()"/></td>
														<td align="right" width="20%">Date</td>
														<td width=""><gw:datebox id="dtContractDt_Fr" lang="1" /></td>
														<td>~</td>
														<td width=""><gw:datebox id="dtContractDt_To" lang="1" /></td>
													</tr>
												</table>   
											</td>
											<td width="" align=right><a onclick="OnShowPopup(1)" title="Click here to select P/L" href="#tips" style="text-decoration:none; color:#0000FF">PL</a></td>
											<td width="">
												<table cellpadding="0" cellspacing="0" width="100%">
													<tr>
														<td width="40%"><gw:textbox id="txtPL_ID" style="width:100%" text="" /></td>
														<td width="60%" ><gw:textbox id="txtPL_Nm" style="width:100%" text="" /></td>
														<td><gw:textbox id="txtPL_PK" style="display:none" text="" /></td>
														<td ><gw:imgbtn id="reyset" img="Reset" alt="Reset" onclick="txtPL_Nm.text='';txtPL_PK.text='';txtPL_ID.text=''" /></td>
													</tr>
												</table>   
											</td> 
											<td width="15%" align="right">Maintenance</td>
											<td width="15%"><gw:list id="lstMaintenance" style="width:100%" ></gw:list>
											<td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch()" /></td>  
	                                   </tr> 
	                            </table>
	                        </fieldset> 
	                </td>
	    </tr>
	    <tr style="height:2%">
	                 <td width="100%"  align="right"><gw:label id="idRecord1" text="" style="font-family:Tahoma;color:Red" /></td>            
	    </tr>
	    <tr style="height:94%">
	                <td width="100%">
                            <gw:grid id='grdAR' 
                                    header='No|Contrat No|Code|Name|Code|Name|Ccy|Amount|No|Date|Amount|Remark'
                                    format='0|0|0|0|0|0|0|1|0|0|1|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|3|0'
                                    defaults='|||||||||||'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='500|1500|1000|2000|1000|1500|500|1500|600|1000|1500|2000'
                                    sorting='T'
                                    acceptNullDate="T"                              
                                    styles='width:100%; height:100%'                    
                                  />
                    </td>
	    </tr>  
</table> 
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
