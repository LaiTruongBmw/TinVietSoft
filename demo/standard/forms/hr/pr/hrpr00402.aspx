<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>
</head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//----------grdItem-----
//'_PK|Item Group|Item Code|Item Name|UOM|_Process_PK|Process Name|Unit Price|Remark'
var G1_PK          = 0,
	G1_ITEM_PROCESS_CODE = 1,
    G1_ITEM_GRP    = 2,
	G1_ITEM_PK	   = 3,
    G1_ITEM_CODE   = 4,
    G1_ITEM_NAME   = 5,
    G1_UOM         = 6, 
    G1_PROCESS_NAME = 7,
	G1_UNIT_PRICE	= 8,	
	G1_USE_YN		= 9,
    G1_REMARK       = 10;
//---------------
 
var v_language = "<%=Session("SESSION_LANG")%>";
//=======================================================================
function BodyInit()
{

    System.Translate(document);
    //------------------
    BindingDataList();
}

//=======================================================================

function BindingDataList()
{
    var data=""; 
       
    data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 ORDER BY grp_cd")%>||";   
    lstItemGrp.SetDataText(data);
	lstItemGrp.value="";
    //----------------------
    
	
    data = "<%=CtlLib.SetListDataSQL("select a.pk, a.process_id || ' - ' || a.process_name from tlg_pb_process a where a.del_if=0 order by a.process_name" )%>||" ; 
    lstProcess.SetDataText(data);	
    lstProcess.value = "";
	
    var ctrl = grdItem.GetGridControl();
    ctrl.ColFormat(G1_UNIT_PRICE) = "###,###,###" ;                          
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
		case 'grdItem' :
			data_hrpr00402.Call('SELECT');
		break;
		
	}
}



//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_hrpr00402' :
	        
	    break;
	    
		
    }
}
function OnDataError(obj) 
{
	
	if(obj.id == "data_hrpr00402")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
		grdItem.UnDeleteRow();
    }
	
}
function OnSelect()
{
    OnExit();
}
function OnExit()
{
    var obj= Array();
    var irow;
    irow=grdItem.row;
    if (irow>0) 
    {
        obj[0]=grdItem.GetGridData(irow,0); //pk
        obj[1]=grdItem.GetGridData(irow,2); //item_process_code
        obj[2]=grdItem.GetGridData(irow,3); //item_pk
		obj[3]=grdItem.GetGridData(irow,4); //item_code
		obj[4]=grdItem.GetGridData(irow,5); //item_name
		obj[5]=grdItem.GetGridData(irow,7); //process_name
		obj[6]=grdItem.GetGridData(irow,8); //unit price
    }    
    else 
    {
        obj=null;
    }
	window.returnValue = obj; 
	window.close();
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------>
    <gw:data id="data_hrpr00402" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	    <xml> 
		    <dso type="grid" parameter="0,3,4,7,8,9,10" function="st_lg_sel_hrpr00402" > 
			    <input bind="grdItem" > 
			        <input bind="lstItemGrp" />	
					<input bind="txtItem" />	
					<input bind="lstProcess" />						
			    </input> 
			    <output bind="grdItem" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    
   
    <table name="Process" class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 15%" align="right">
                            Item Group
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstItemGrp" styles="width:100%" onchange="OnSearch('grdItem')" />
                        </td>
						<td style="width: 15%" align="right">
                            Item Name
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItem" text="" styles="width:100%" onenterkey="OnSearch('grdItem')" />
                        </td>
                         <td style="width: 15%" align="right">
                            Process
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstProcess"  styles="width:100%" onchange="OnSearch('grdItem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch('grdItem')" />
                        </td>
                        <td style="width: 1%" >	
							<gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" />
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td>
                <gw:grid id='grdItem' 
					header='_PK|Item Process Code(Auto)|Item Group|_Item_PK|Item Code|Item Name|UOM|Process Name|Unit Price|_Use Y/N|_Remark'
                    format='0|0|0|0|0|0|0|2|-0|3|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0' 
					defaults='|||||||||-1|' 
					editcol='0|0|0|0|0|0|0|1|1|1|1'
                    widths='1000|1500|2500|0|2500|3000|800|2000|1500|700|1000' 
					check='||||||||-||' 
					autosize = true
					sorting='T' styles='width:100%; height:100%'
					oncelldblclick ="OnSelect()"
					/>
            </td>
        </tr>
        
    </table>
    
   
    <!-- </gw:tab> -->
    <!----------------------------------------------------------->
    <gw:textbox id="txtProcessPK" text="" styles="display:none" />
    <gw:textbox id="txtSTItemPK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
