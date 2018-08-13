<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Property Mapping</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------
var G1_ASSET_PK   		= 0,
    G1_DEPT_PK    		= 1,
	G1_ASSET_TYPE 		= 2,
	G1_GROUP      		= 3,
    G1_ASSET_CODE 		= 4,
    G1_ASSET_NAME 		= 5,
	G1_F_NAME_01		= 6,
    G1_CCY        		= 7,
	G1_MA_QTY			= 8,
    G1_AMOUNT     		= 9,
	G1_DEPR_MONTHLY		= 10,
	G1_DEPR_PLAN		= 11,
	G1_DEPR_ACTUAL		= 12,
	G1_MT_CODE	  		= 13,
	G1_AC_CODE	  		= 14,
	G1_DOC_NO			= 15,
	G1_START_DATE 		= 16,
	G1_PMS_YN     		= 17,
	G2_DEPR_YN			= 18,
	G1_ASS_ACCOUNT 		= 19,
	G1_DEPR_ACCOUNT 	= 20,
	G1_EXP_ACCOUNT 		= 21,
	G1_OPEN_DATE		= 22,
	G1_OPEN_AMT			= 23,
	G1_OPEN_BAL			= 24,
    G1_REMARK     		= 25;

var arr_FormatNumber = new Array();
	
 //===============================================================================================
function BodyInit()
{ 	
    System.Translate(document);  // Translate to language session    
	
	FormFormat();
}
 //===============================================================================================
function FormFormat()
{  
     var data="";  
	 
	 data = "data|0|Not Mapped|1|Mapped|2|MT Only|3|AC Only||";   
	 lstStatus.SetDataText(data);    
     lstStatus.value="";
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";       
     lstDept.SetDataText(data+"||");
     lstDept.value="";
	 	  
     data = "<%=ESysLib.SetListDataSQL("select pk, ASSET_TYPE_CODE || ' * ' || ASSET_TYPE_NAME from TLG_ma_asset_type where del_if = 0  order by ASSET_TYPE_CODE  ") %>||";
     lstAssetType.SetDataText(data);   
     lstAssetType.value = "";
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>||";       
     lstAssetGroup.SetDataText(data);	
	 lstAssetGroup.value = "" ; 
      
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT   code, code FROM TLG_lg_code a, TLG_lg_code_group b WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGCM0100' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord" )%>";    
     grdAsset.SetComboFormat(G1_CCY,data); 
        
     data = "<%=ESysLib.SetGridColumnDataSQL(" select pk, ASSET_TYPE_CODE || ' * ' || ASSET_TYPE_NAME from TLG_ma_asset_type where del_if = 0  order by ASSET_TYPE_CODE " )%>|;" ; 
     grdAsset.SetComboFormat(G1_ASSET_TYPE,data);   
	 
     data = "<%=ESysLib.SetGridColumnDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code" )%>|;" ; 
     grdAsset.SetComboFormat(G1_GROUP,data);   	 
      
     data = "<%=ESysLib.SetGridColumnDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID" )%>|;" ; 
     grdAsset.SetComboFormat(G1_DEPT_PK,data);    
	 
	 var ctr = grdAsset.GetGridControl();  
	 
	 ctr.ColFormat(G1_MA_QTY)       = "###,###,###";
	 
     ctr.ColFormat(G1_AMOUNT)       = "###,###,###.##";
	 ctr.ColFormat(G1_DEPR_MONTHLY) = "###,###,###.##";
	 
     ctr.ColFormat(G1_OPEN_AMT)     = "###,###,###.##";
	 ctr.ColFormat(G1_OPEN_BAL)     = "###,###,###.##";	 
	 
	 arr_FormatNumber[G1_MA_QTY]       = 0;
	 arr_FormatNumber[G1_AMOUNT]       = 2;
	 arr_FormatNumber[G1_DEPR_MONTHLY] = 2;
	 
	 arr_FormatNumber[G1_OPEN_AMT] = 2;
	 arr_FormatNumber[G1_OPEN_BAL] = 2;	 
} 
 //===============================================================================================
function OnAddNew()
{
    var objGrid = grdAsset;
	
    objGrid.AddRow();
	//----------
	if ( lstDept.value != '' )
	{	
		objGrid.SetGridText( objGrid.rows-1, G1_DEPT_PK, lstDept.value );
	}
	//----------
	if ( lstAssetType.value != '' )	
	{
		objGrid.SetGridText( objGrid.rows-1, G1_ASSET_TYPE, lstAssetType.value );
	}	
	//----------
	if ( lstAssetGroup.value != '' )	
	{
		objGrid.SetGridText( objGrid.rows-1, G1_GROUP, lstAssetGroup.value );
	}	
	//----------
} 
 //===============================================================================================  
function OnSearch()
{
    data_fpma00130.Call("SELECT");
}
 //===============================================================================================
function  OnSave()
{
	 for ( var i = 1; i < grdAsset.rows; i++)
	 {
	 	if ( grdAsset.GetGridData( i, G1_DEPT_PK) == '' && lstDept.value != '' )
		{
			grdAsset.SetGridText( i, G1_DEPT_PK, lstDept.value );
		}
		//-------
		if ( grdAsset.GetGridData( i, G1_ASSET_TYPE) == '' && lstAssetType.value != '' )
		{
			grdAsset.SetGridText( i, G1_ASSET_TYPE, lstAssetType.value );
		}		
		//-------
		if ( grdAsset.GetGridData( i, G1_GROUP) == '' && lstAssetGroup.value != '' )	
		{
			grdAsset.SetGridText( i, G1_GROUP, lstAssetGroup.value );
		}	
	 }
     
	 data_fpma00130.Call();
}
 //===============================================================================================
function OnDelete()
{              
    if(grdAsset.row>0)
    {
        if ( grdAsset.GetGridData( grdAsset.row, G1_ASSET_PK ) == "" ) 
	    {						
		    grdAsset.RemoveRow();					
		}			
		else 
		{
		    grdAsset.DeleteRow();
	    }
    }
}
 //===============================================================================================
 function OnDataReceive(obj)
 {
    switch(obj.id)
    {
        case 'pro_fpma00130':
            alert(txtValueReturn.text);
        break;
        
        case 'data_fpma00130':
            lblCount.text = grdAsset.rows - 1 ;
    		
		    if ( grdAsset.rows>1 )
		    {
        	    grdAsset.SetCellBold( 1, G1_ASSET_CODE, grdAsset.rows - 1, G1_ASSET_CODE, true);
        	    grdAsset.SetCellBold( 1, G1_AMOUNT,     grdAsset.rows - 1, G1_AMOUNT,     true);
    		
        	    grdAsset.SetCellFontColor( 1, G1_ASSET_NAME, grdAsset.rows - 1, G1_ASSET_NAME, 0xFF0000);         
		    }	        
        break;        
    }    
 }
  //===============================================================================================
function OnReport()
{        
     var url =System.RootURL + "/reports/fp/ma/rpt_fpma00130_1.aspx?p_po_dept_pk="+lstDept.value+"&p_ma_asset_type_pk="+lstAssetType.value+"&p_asset="+txtAsset.text+"&p_mt_ac="+txtMTAC.text+"&p_status="+lstStatus.value; 
     System.OpenTargetPage(url); 
}

  //===============================================================================================
function OnProcess(pos)
{
	switch(pos)
	{
		case 'GetData':
			var path = System.RootURL + '/form/fp/ma/fpma00131.aspx';         		
			var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:65;dialogHeight:35');			
		break;
		
		case 'SCHEDULE':                 
				//---------
                var arr_pk = "";
                var comma  = "";
				
                for(var i = 1; i < grdAsset.rows; i++)
                {
                    if ( grdAsset.GetGridControl().isSelected(i) == true )
                    {
                        arr_pk +=  comma + grdAsset.GetGridData( i, G1_ASSET_PK);
                        comma = ",";
                    }
                }
                //-----------------------												
				if ( arr_pk != "" )
				{
					txtArrayAssetPK.text =  arr_pk ; 
					
					if (confirm("Do you want to make depreciation schedule & increase slip ?"))
					{
					    pro_fpma00130.Call();
					}    
				}			 
		break;
	}
}  
  //=============================================================================================== 
  
function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_MA_QTY || col == G1_AMOUNT || col == G1_DEPR_MONTHLY || col == G1_OPEN_AMT || col == G1_OPEN_BAL )
    {
        var dQuantiy ;
        
        dQuantiy =  grdAsset.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdAsset.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdAsset.SetGridText( row, col, "");
            }
        }
        else
        {
            grdAsset.SetGridText(row,col,"") ;
        }         
        //------------------------ 
			
		if ( col == G1_AMOUNT || G1_OPEN_AMT ) 
		{
			dQuantiy = Number(grdAsset.GetGridData(row,G1_AMOUNT)) - Number(grdAsset.GetGridData(row,G1_OPEN_AMT));
			
			grdAsset.SetGridText( row, G1_OPEN_BAL, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
		}
    }
}

  //=============================================================================================== 

</script>

<body>
    <!--============================================= Submit =====================================-->
    <gw:data id="pro_fpma00130" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_pro_fpma00130"> 
                <input> 
			        <input bind="txtArrayAssetPK" /> 				 		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>	
    <!--------------------------------------------------------------------------------------------->
    <gw:data id="data_fpma00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" function="<%=l_user%>lg_sel_fpma00130" procedure="<%=l_user%>lg_upd_fpma00130"  > 
                <input>
                    <input bind="lstDept" />
                    <input bind="lstAssetType" />
                    <input bind="txtAsset" />
					<input bind="txtMTAC" />
					<input bind="lstStatus" />
					<input bind="lstAssetGroup" />
                </input>
                <output bind="grdAsset" /> 
            </dso> 
        </xml> 
     </gw:data>
    <!-------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 5%" align="right">
                Dept
            </td>
            <td style="width: 40%" colspan=3 >
                <gw:list id="lstDept" styles="width:100%;"   />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Asset Type
            </td>
            <td style="width: 30%">
                <gw:list id="lstAssetType" styles="width:100%;"  />
            </td>
            <td style="width: 16%" align="center" colspan=2 >
                <gw:list id="lstStatus" styles="width:100%" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="new" alt="New" id="btnNew2" onclick="OnAddNew()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
            </td>
        </tr>
        <tr>
            <td style="width: 5%" align="right">
                Asset
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtAsset" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                MT/AC
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtMTAC" styles='width:100%' onenterkey="OnSearch()" />
            </td>
			<td style="width: 5%; white-space: nowrap" align="right">
                Asset Group
            </td>
            <td style="width: 30%">
                <gw:list id="lstAssetGroup" styles="width:100%;" onchange="" />
            </td>
            <td style="width: 8%" align="center">
				<gw:icon id="idBtnGetAuto" img="2" text="Get Auto" styles='width:50' onclick="OnProcess('GetData')" /> 
            </td>
            <td style="width: 8%" align="center">
				<gw:icon id="idBtnGetProcess" img="2" text="Process" styles='width:50' onclick="OnProcess('SCHEDULE')" />
            </td>
            <td style="width: 4%" colspan="5" align="center">				
				<gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
            </td>
        </tr>
        <tr style="height: 100%; width: 100%">
            <td style="height: 100%; width: 100%" colspan="14">
				 <gw:grid id='grdAsset' 
					header='_PK|Department|Asset Type|Asset Group|Asset Code|Asset Name|Name 01|CCY|Qty|Asset Amount|Depr Monthly|Month Plan|Month Run|M/T Code|AC Code|Doc No|Start Date|PMS Y/N|DEPR Y/N|Asset ACC|Depr Acc|Expense ACC|Open Date|Open Amount|Open Bal|Remark'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|3|3|0|0|0|4|0|0|0' 
					aligns='0|0|0|0|0|0|0|1|3|3|3|1|1|0|0|1|1|0|0|1|1|1|1|3|3|0' 			
                    editcol='0|1|1|1|1|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1' 
					widths='0|2000|2000|2000|1500|3500|2000|800|1200|1500|1500|1200|1200|1500|1500|1500|1200|1000|1000|1500|1500|1500|1200|1500|1500|1000'
                    sorting='T' acceptnulldate="T" styles='width:100%; height:100%' 
					onafteredit="CheckInput()" />					                
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
<gw:textbox id="txtArrayAssetPK" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
</html>
