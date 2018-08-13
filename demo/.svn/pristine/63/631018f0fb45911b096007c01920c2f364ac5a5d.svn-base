<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cutting Item</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

var G_BOM_PK        = 0,
    G_SLIP_NO       = 1,
	G_ITEM			= 2,
	G_PROJECT		= 3,
    G_BOM_DATE      = 4; 

 var G2_CUTTING_ITEM_PK	= 0,
	 G2_SEQ				= 1, 
	 G2_ITEM_NAME		= 2,
	 G2_IDMK			= 3, 
	 G2_MARK			= 4,
	 G2_SPEC_01			= 5,
	 G2_SPEC_02			= 6,
	 G2_SPEC_03			= 7,
	 G2_SPEC_04			= 8,
	 G2_SPEC_05			= 9,
	 G2_LENGTH			= 10,
	 G2_UNIT_WT			= 11,
	 G2_TOTAL_WT		= 12,
	 G2_SQUARE_QTY		= 13,
	 G2_MATERIAL		= 14,
	 G2_BOM_QTY			= 15,
	 G2_ITEM_TYPE		= 16;
 
	
//-----------------------------------------------------

var flag;

    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session      
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFromSearch.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFromSearch.value=ldate ;
    //---------------------------- 
    SetGridFormat(); 
 
 }
 
 //==================================================================================
 
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G2_BOM_QTY) = "###,###,###,###.##";
 }
 
//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fpfa00380_search.Call("SELECT");
        break;            
        
        case 'grdDetail':   
			if ( grdSearch.row > 0 )
			{
				txtBOMPK.text = grdSearch.GetGridData( grdSearch.row, G_BOM_PK );
			}
			         
            data_fpfa00380_detail.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        
        case "data_fpfa00380_detail":
            /*if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_ITEM_NAME, grdDetail.rows - 1, G2_ITEM_NAME,  true);
	            grdDetail.SetCellBold( 1, G2_WI_QTY, grdDetail.rows - 1, G2_WI_QTY,  true);       
            }*/         
        break;
   }            
}
 
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        
        case 'grdDetail':        
            data_fpfa00380_detail.Call();
        break;
    }
}
  
//==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00380.aspx?master_pk=' + txtBOMPK.text ;
	window.open(url, "_blank"); 
}
//================================================================================================
</script>
<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_fpfa00380_search" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="<%=l_user%>lg_sel_fpfa00380"	>	
				<input>
					<input	bind="dtFromSearch"	/>	
					<input	bind="dtToSearch"	/>	
					<input	bind="txtProjectSearch"	/>	
					<input	bind="txtSlipSearch"	/>	
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>    
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpfa00380_detail" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="<%=l_user%>LG_SEL_fpfa00380_1" procedure="<%=l_user%>LG_UPD_fpfa00380_1">	
				<input	bind="grdDetail">					
					<input	bind="txtBOMPK"	/>
					<input  bind="txtNamePL" />	
					<input  bind="txtText" />
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
	<!--============================================= Detail =====================================-->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="t-left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 94%">
                            <gw:datebox id="dtFromSearch" lang="1" />
                            ~
                            <gw:datebox id="dtToSearch" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            Project
                        </td>
                        <td style="white-space: nowrap">
                            <gw:textbox id="txtProjectSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Slip
                        </td>
                        <td style="width: 95%" colspan="1">
                            <gw:textbox id="txtSlipSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_pk|Slip No|Item|Project|BOM Date' 
								format='0|0|0|0|4'
                                aligns='0|0|0|0|1' 
								check='||||' 
								editcol='0|0|0|0|0' 
								widths='0|1000|1500|1500|1200'
                                sorting='T' styles='width:100%; height:100%' 
								oncellclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%"> 
                    <tr style="height: 1%">
                        <td colspan="16">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>                                    
                                    <td style="width: 5%" align="right">
										Name/PL
                                    </td>
                                    <td style="width: 25%; white-space: nowrap" align="center">
										<gw:textbox id="txtNamePL" styles="width: 100%" onenterkey="OnSearch('grdDetail')" />
                                    </td>
                                    <td align="right" style="width: 5%">
										Text
                                    </td>                                    
                                    <td align="right" style="width: 25%">
										<gw:textbox id="txtText" styles="width: 100%" onenterkey="OnSearch('grdDetail')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                    </td>
                                    <td style="width: 29%" align="right">                                        
                                    </td>                                    
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('grdDetail')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>				                                                            
                    <tr style="height: 97%">
                        <td colspan="16">                            
							<gw:grid id='grdDetail'
								header='_CUTTING_ITEM_PK|Seq|Item Name|IDMK|Mark|Spec 1|Spec 2|Spec 3|Spec 4|Spec 5|Length|U/Weight|Total Weight|Square Qty|Material|BOM Qty|Item Type|Remark'
								format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0'
								check='|||||||||||||||||'
								editcol='0|1|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0'
								widths='0|600|1500|1500|1500|1000|1000|1000|1000|1000|1200|1200|1200|1200|1200|1200|1000|1000'
								sorting='T'							 
								styles='width:100%; height:100%'
								/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtBOMPK" styles="display:none;" />
<!---------------------------------------------------------------------------------> 
</html>
