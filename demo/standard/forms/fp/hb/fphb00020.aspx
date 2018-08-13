<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>BOM HISTORY</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G0_BOM_M_PK	    = 0,	
	G0_PROD_CODE	= 1,
	G0_PROD_NAME 	= 2,
	G0_VALID_FROM	= 3,
	G0_VALID_TO     = 4,
	G0_CRT_DT		= 5;
    
	
var G1_PROCESS_PK           = 0,
	G1_SEQ                  = 1,
    G1_BOM_D_PK             = 2,
    G1_BOM_M_PK             = 3,
    G1_MAT_ITEM_PK          = 4,
    G1_ITEM_CODE            = 5,
    G1_ITEM_NAME            = 6,    
    G1_UOM                  = 7,
    G1_LOT_QTY        		= 8,
    G1_NEED_QTY             = 9,
    G1_LOSS_RATE            = 10,    
    G1_CONS_QTY             = 11,
    G1_REMARK               = 12;
	
//================================================================================
function BodyInit()
{ 
    System.Translate(document);
    OnFormatGrid();
}

//================================================================================

function OnFormatGrid()
{
    var data;
	
	data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd")%>||Select ALL";   
    lstGroup.SetDataText(data);
    lstGroup.value = '' ;   
	
	data = "<%=ESysLib.SetListDataSQL("SELECT pk, 	PROCESS_ID||' * ' || PROCESS_NAME  FROM TLG_PB_PROCESS  ORDER BY PROCESS_ID  " )%>||";    
    lstProcess.SetDataText(data);
	lstProcess.value = '';
	
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT pk, 	PROCESS_ID||' * ' || PROCESS_NAME  FROM TLG_PB_PROCESS  ORDER BY PROCESS_ID " ) %>|#; ";       
	grdMaterial.SetComboFormat(G1_PROCESS_PK,data); 
	
	var ctrl = grdMaterial.GetGridControl(); 
	
	ctrl.ColFormat(G1_LOT_QTY)     = "#,###,###,###,###,###.##";     
    ctrl.ColFormat(G1_NEED_QTY)    = "#,###,###,###,###,###.##########";
	ctrl.ColFormat(G1_LOSS_RATE)   = "#,###,###,###,###,###";
	ctrl.ColFormat(G1_CONS_QTY)    = "#,###,###,###,###,###.##########"; 

}
//================================================================================
function OnPopUp(pos)
{	
	switch(pos)
	{	    	   
		case 'REPORT':
			var path = System.RootURL + '/form/fp/hb/fphb00021.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break;	
	}
} 

//================================================================================
function OnSearch(pos)
{ 
    switch (pos)         
    {
        case 'grdSearch' :			
            data_fphb00020.Call("SELECT");
        break;
        
        case 'Detail' :          
            if ( grdSearch.row > 0 )
			{           					                     
                    txtBOM_M_PK.text = grdSearch.GetGridData( grdSearch.row, G0_BOM_M_PK);
    				
				    data_fphb00020_1.Call("SELECT");
				
			}	
            else
			{
				grdMaterial.ClearData();
			}			
        break;				    
    }        
}
//================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)         
    {   
        case 'data_fphb00020':         
            
             grdMaterial.ClearData();
        break;
		
		case 'data_fphb00020_1':
			
		break;   
	
    }    
}


//================================================================================
function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
 }
 //================================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'ST03':
			var url =System.RootURL + '/reports/fp/hb/rpt_fphb00020_ST03.aspx?p_parent_pk='+ txtBOM_M_PK.text ;
			window.open(url);   			
		break;
		case 'ST02':
			var url =System.RootURL + '/reports/fp/hb/rpt_fphb00020_ST02.aspx?p_parent_pk='+ txtBOM_M_PK.text ;
			window.open(url);   			
		break;
		
		case 'ST03':
			var url =System.RootURL + '/reports/fp/hb/rpt_fphb00020_ST01.aspx?p_parent_pk='+ txtBOM_M_PK.text+ '&p_itemgrp_pk='+lstGroup.value;

			window.open(url); 			
		break;
	}
 
}

//================================================================================

function OnSave()
{
	data_fphb00020.Call();
}

//================================================================================

function OnDelete(pos)
{
	grdSearch.DeleteRow();
}
//================================================================================

function OnUnDelete(pos)
{
	grdSearch.UnDeleteRow();
}

//================================================================================

</script>

<body>
    <!------------------------------------------------------------------------>
    <gw:data id="data_fphb00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fphb00020" procedure="<%=l_user%>lg_upd_fphb00020" > 
                <input>    
                    <input bind="lstGroup" />                                 
                    <input bind="txtItem" />					
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fphb00020_1" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fphb00020_1" > 
                <input bind="grdMaterial">                    
                    <input bind="txtBOM_M_PK" />
					<input bind="txtMat" />
					<input bind="lstProcess" />
                </input> 
                <output bind="grdMaterial" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table border="1" style="height: 100%; width: 100%">
        <tr>
            <td id="left" valign="top" style="width: 40%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <b>Group</b>
                        </td>
                        <td style="width: 94%" align="left"   >
                            <gw:list id="lstGroup" styles="width:100%" onchange="OnSearch('grdSearch')" />
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            <b>Item</b>
                        </td>
                        <td style="width: 60%" align="left"  >
                            <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>     
					<tr>
						<td colspan=10>
							<table style="height: 100%; width: 100%" >
								<tr>																		 
									<td style="width: 97%;">									 
									</td>
									<td style="width: 1%" align='right'>
										<gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('grdSearch')" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn img="delete" alt="Delete" onclick="OnDelete('grdSearch')" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn img="Udelete" alt="UnDelete" onclick="OnUnDelete('grdSearch')" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn img="Save" alt="Save" onclick="OnSave()" />
									</td>
									 
								</tr>
							</table>
						</td>
					</tr>					
                    <tr style="height: 97%">
                        <td colspan=10 >
                            <gw:grid id="grdSearch" header="_PK|Code|Name|From|To|Hist Date" format="0|0|0|4|4|0" aligns="0|0|0|0|0|1"
                                defaults="|||||" editcol="0|0|0|1|1|0" widths="0|1500|3000|1200|1200|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 60%">
                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1" border="0">
                    <tr align="left" style="height: 1%">
                        <td style="width: 10%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td style="width: 5%;white-space: nowrap" >
                            Process
                        </td>
						<td style="width: 25%"  >
							<gw:list id="lstProcess" styles='width:100%' csstype="mandatory" />
						</td>
						<td style="width: 5%" align="right">
                            Mat</td>
                        <td style="width: 35%">
                            <gw:textbox id="txtMat" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
						<td style="width:14%">                            
                        </td>
                        <td style="width: 1%">                            
                        </td>
						<td style="width: 1%">                            
                        </td>                        
                        <td style="width: 1%;">                           
                        </td>
                        <td style="width: 1%">                            
                        </td>
                        <td style="width: 1%">                            
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="excel" alt="Report" onclick="OnPopUp('REPORT')" />
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="13">
                            <gw:grid id='grdMaterial' 
								header='Process|Seq|_PK|_BOM_M_PK|_CHILD_PK|Item Code|Item Name|UOM|Lot Qty|Need Qty|Loss Rate|Cons Qty|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|0|1|3|3|3|3|0' 
								check='|||||||||||'
                                editcol='1|1|0|0|0|0|0|0|1|1|1|1|1' 
								widths='2000|800|0|0|0|1200|3000|800|1200|1200|1000|1200|1200'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->   
    <gw:textbox id="txtBOM_M_PK" style="display: none" />
    <!------------------------------------------->
</body>
</html>
