<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Line Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script> 

var G1_PK          	 = 0,
    G1_CODE_TYPE_ID  = 1,
    G1_CODE_TYPE_NM  = 2,
    G1_USE_YN  		 = 3,
    G1_DESCRIPTION   = 4,
	G1_MONTH=5,
	G1_type_ratio  = 6;

var G2_PK          			= 0,
    G2_TAC_CODE_GROUP_PK    = 1,
	G2_TAC_ABACCTCODE_PK    = 2,
    G2_AC_CD            	= 3,
    G2_AC_NM         		= 4,
    G2_USE_YN      		    = 5,
    G2_DESCRIPTION          = 6; 
var t_open = true;
//====================================================================================
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
   // FormatGrid(); 
    //-----------     
    
}
//====================================================================================
function BindingDataList()
{
    var  data ;
	var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID ='ACT00002'AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>";
	lstTypeGroup.SetDataText(ls_data);
	lstTypeGroup.value ="WIP";
	
}
//====================================================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdMapping.GetGridControl();
      	
      trl.ColFormat(G2_Capa)          = "###,###,###,###,###";
      trl.ColFormat(G2_Machine_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G2_Day_Run_Qty)   = "###,###,###,###,###";
      trl.ColFormat(G2_Night_Run_Qty) = "###,###,###,###,###";
 }
 
//====================================================================================
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'grdMaster':
            data_60010170_master.Call("SELECT");
        break;
        
        case 'grdMapping':
            if ( grdMaster.row > 0 )
            {
               
				if(grdMaster.GetGridData( grdMaster.row,0 ) !=''){
					txtLineGroupPK.text = grdMaster.GetGridData( grdMaster.row,0 );
					 data_60010170_mapping.Call("SELECT");
					
				}
				
            }
            
           
        break;
    }        
 }

//====================================================================================
 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'grdMaster' :
            grdMaster.AddRow(); 
			
			
			//grdMaster.SetGridText(grdMaster.rows - 1, G1_MONTH, dtfrmonth.value);
			if(lstTypeGroup.GetData() !="ALL"){
				grdMaster.SetGridText(grdMaster.rows - 1, G1_type_ratio, lstTypeGroup.GetData());	
			}			
            grdMaster.SetCellBgColor( grdMaster.rows-1, 0, grdMaster.rows-1, grdMaster.cols-1, 0xCCFFFF );                       
            grdMaster.GetGridControl().TopRow = grdMaster.rows -1; 
						
				
        break;
        
        case 'grdMapping' :
            if ( txtLineGroupPK.text == '' )
            {                
                alert('Pls select data in left to add new mapping !');
                return;
            }
            //=======================
				var i = 0;
				var fpath = System.RootURL + "/standard/forms/60/01/60010170_ACCD_POPUP.aspx?comm_nm=" + '' + "&comm_code=" + '' + "&comm_nm2=" + '' + "&val1=" + '' + "&val2=" + '' + "&val3=" + '99' + "&dsqlid=AC_sel_60010170_accd_popup";
				aValue = System.OpenModal(fpath, 750, 550, 'resizable:yes;status:yes');
				if (aValue != null) 
				{
					if (aValue.length > 0) 
					{
						//alert(aValue.length);
						for (i = 0; i < aValue.length; i++) 
						{
							var tmp = aValue[i];
							if (tmp[1] != 0) 
							{
								grdMapping.AddRow();
								grdMapping.SetGridText(grdMapping.rows - 1, G2_TAC_CODE_GROUP_PK, txtLineGroupPK.text);
								grdMapping.SetGridText(grdMapping.rows - 1, G2_TAC_ABACCTCODE_PK, tmp[1]); //ACPK
								grdMapping.SetGridText(grdMapping.rows - 1, G2_AC_CD, tmp[4]); //Account Code
								grdMapping.SetGridText(grdMapping.rows - 1, G2_AC_NM, tmp[5]); //Account Name
							}
						}
					}
				}						
        break;
                        
    }    
 }
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'grdMaster' :
            data_60010170_master.Call();
        break;
        
        case 'grdMapping' :       
            data_60010170_mapping.Call();
        break;      		
    }
}

//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
       /* case 'data_60010170_master' :
			OnSearchRole();
           
        break;
        */
        case 'data_60010170_mapping' :  
		
			// OnSearch('grdMapping');
			OnSearchRole();
        break;  
       
    }    
}

//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' ) //pk
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}

//====================================================================================
 function OnSearchRole(){
	data_60010170_no_mapping.Call('select');
 }


 //=========================add account==============================================
 function addAcount()
 {
	for ( var j = idACCGrid.rows -1 ; j >0; j--)
	{
		if ( idACCGrid.GetGridControl().isSelected(j) == true )
		{
				grdMapping.AddRow(); 
			grdMapping.SetGridText(grdMapping.rows - 1, G2_TAC_CODE_GROUP_PK, txtLineGroupPK.text);
			grdMapping.SetGridText(grdMapping.rows - 1, G2_TAC_ABACCTCODE_PK, idACCGrid.GetGridData(j,0)); //ACPK
			grdMapping.SetGridText(grdMapping.rows - 1, G2_AC_CD, idACCGrid.GetGridData(j,1)); //Account Code
			grdMapping.SetGridText(grdMapping.rows - 1, G2_AC_NM, idACCGrid.GetGridData(j,2)); //Account Name		
			idACCGrid.RemoveRowAt(j);
		}
		
		//var row = idACCGrid.GetGridControl().SelectedRow(i);	
	}
	
}	

</script>
<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_60010170_master" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="<%=l_user%>ac_sel_60010170" parameter="0,1,2,3,4,5,6" procedure="<%=l_user%>ac_upd_60010170"> 
                <input bind="grdMaster" >
                    <input bind="txtWH_ID_Name" /> 
					<input bind="lstTypeGroup" /> 
					
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_60010170_mapping" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6" function="<%=l_user%>ac_sel_60010170_mapping"  procedure="<%=l_user%>ac_upd_60010170_mapping"> 
                <input bind="grdMapping" >
                    <input bind="txtLineGroupPK" /> 
                </input> 
                <output bind="grdMapping" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
	
    <gw:data id="data_60010170_no_mapping" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  function="<%=l_user%>ac_sel_60010170_no_mapping"  > 
                <input bind="idACCGrid" >
					<input bind="txtLineGroupPK" /> 
					<input bind="lstTypeGroup" /> 
                    <input bind="txtRoleName" /> 
					
                </input> 
                <output bind="idACCGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
	
	<!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
            <td style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
						 <td style="width: 4%">
							
                        </td>
                        <td style="width: 1%" align="right">
							
						</td>
                        <td style="width: 10%">
                            ID/Name
                        </td>
                        <td style="width: 55%">
                            <gw:textbox id="txtWH_ID_Name" styles="width:100%" onenterkey="OnSearch()"/>
                        </td>
						 <td width="12%" align="right">Type Group</td>
                            <td width="20%"><gw:list id="lstTypeGroup" styles="width:100%;" value="" onchange="Search()"></gw:list></td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('grdMaster')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete2" img="delete" alt="Delete" onclick="OnDelete(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete2" img="udelete" alt="Undelete" onclick="OnUndelete(grdMaster)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdMaster')" />
                        </td>
                    </tr>
					
                    <tr >
                        <td colspan="11">
                            <gw:grid id='grdMaster' header='_PK|CODE TYPE ID|CODE TYPE NAME|USE Y/N|DESCRIPTION|_Month|_type_group'
                                format='0|0|0|3|0|0' aligns='0|0|0|0|0|0' defaults='|||||' editcol='0|1|1|1|1|0'
                                widths='1000|1500|800|1500|2000|0' sorting='T' autosize='T' styles='width:100%; height:150'
                                oncellclick="OnSearch('grdMapping')" oncelldblclick="" />
                        </td>
                    </tr>
					<tr style="height: 99%">		
						<td width="40%"  colspan="11" >
						   <table width="100%;height: 100%">
							   <tr  style="height: 5%">
									<td width="30%" >
										ACC code
									</td>
									<td width="50%"><gw:textbox id="txtRoleName" styles="width:100%" onenterkey="OnSearchRole()" /></td>
									<td style="width: 1%"><gw:icon id="idBtnAdd" img="2" text="Add" styles='width:100%' onclick="addAcount()" /></td>
								</tr>
								<tr style="height: 100%">
									<td colspan=3>
										<gw:grid   
										id="idACCGrid"  
										header  ="_Pk|Account Code|Account Name| Local name| Korean name"
										format  ="0|0|0|0|0"
										aligns  ="0|0|0|0|0"
										defaults="||||"
										editcol ="0|1|1|0|0"
										widths  ="0|0|1500|3500|1000"
										styles  ="width:100%; height:100%"   
										sorting ="F"   
										oncelldblclick="" />
									</td>
								</tr>
						   </table>
							
       
						</td>
						
						
					</tr>

                </table>
            </td>
            <td style="width: 50%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            
                        </td>
                        <td style="width: 90%" align="center">
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            
                        </td>
                        <td style="width: 1%">
                           
                        </td>
                        <td style="width: 1%">
                           
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('grdMapping')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUndelete(grdMapping)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('grdMapping')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="10" id="t_Line">
                            <gw:grid id='grdMapping' header="_PK|_tac_code_group_pk|_tac_abacctcode_pk|AC CODE|AC NAME|USE YN|DESCRIPTION"
                                format='0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0'
                                defaults='||||||' editcol='0|0|0|0|0|1|1'
                                widths='0|0|800|1500|2500|2000|800'
                                sorting='T' styles='width:100%; height:100%' autosize='T' onafteredit="" oncelldblclick=""
                                onclick="" />
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtArraySOPK" styles='width:100%;display:none;' />
    <!----------------------------------------------------------->
    <gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
    <gw:textbox id="txtLinePK" text="" styles="display:none" />
    <!----------------------------------------------------------->
	
</body>
</html>
