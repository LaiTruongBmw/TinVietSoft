<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cutting Detail</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var G_PK            = 0,
    G_SLIP_NO       = 1,
    G_PL            = 2,
    G_WI_FR_DATE    = 3,
    G_WI_TO_DATE    = 4;

var G1_PK               = 0,
    G1_SLIP_NO          = 1,
    G1_DOC_DATE         = 2,
    G1_CHARGER_PK       = 3,
    G1_FULL_NAME        = 4,
    G1_WI_FR_DATE       = 5,
    G1_WI_TO_DATE       = 6,
    G1_TAC_ABPL_PK      = 7,
    G1_PL               = 8,
    G1_TLG_PB_LINE_PK   = 9,
    G1_DESCRIPTION      = 10;

var G2_TLG_FA_CUT_WI_D_PK   = 0,
    G2_TLG_FA_CUT_WI_M_PK   = 1,
    G2_SEQ                  = 2,
    G2_ITEM_NAME            = 3,
    G2_DWG_NO               = 4,
    G2_IDMK                 = 5,
    G2_MARK                 = 6,
    G2_SPEC_01              = 7,
    G2_SPEC_02              = 8,
    G2_SPEC_03              = 9,
    G2_SPEC_04              = 10,
    G2_SPEC_05              = 11,
    G2_WI_QTY               = 12,
    G2_ITEM_PK              = 13,
    G2_DESCRIPTION          = 14;
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
		
    txtStaffName.SetEnable(false);
    txtProjectName.SetEnable(false);
    txtSlipNo.SetEnable(false);    
   
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFromSearch.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFromSearch.value=ldate ;
    //---------------------------- 
 
    OnAddNew('Master');
 }
  
 //==================================================================================
 
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G2_WI_QTY) = "###,###,###,###.##";
 }
 //---------------------------------------------------------------------------------------------------
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fpfa00290_master.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;  
        case 'BOM':
            if(txtMasterPK.text != '')
            {
                var path = System.RootURL + "/form/fp/fa/fpfa00291.aspx";
			    var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes',this);
			    if ( object != null )
			    {
 	                if ( object != null )
                    {
                        var arrTemp
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                //SEQ|ITEM_NAME|DWG_NO|IDMK|MARK|SPEC_01|SPEC_02|SPEC_03|SPEC_04|SPEC_05|BOM_QTY|MATERIAL                                
                                grdDetail.AddRow();                            
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1); 	
                                grdDetail.SetGridText( grdDetail.rows-1, G2_TLG_FA_CUT_WI_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                                grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME   ,   arrTemp[1]);                    
                                grdDetail.SetGridText( grdDetail.rows-1, G2_DWG_NO      ,   arrTemp[2]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_IDMK        ,   arrTemp[3]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_MARK        ,   arrTemp[4]);

                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_01     ,   arrTemp[5]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_02     ,   arrTemp[6]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_03     ,   arrTemp[7]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_04     ,   arrTemp[8]);
                                grdDetail.SetGridText( grdDetail.rows-1, G2_SPEC_05     ,   arrTemp[9]);

                                grdDetail.SetGridText( grdDetail.rows-1, G2_WI_QTY      ,   arrTemp[10]);
								
								grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK     ,   arrTemp[0]);
                        }		            
                    }                     
			    }
            }
            else
            {
                alert("Pls select one slip.");
            }
        break;
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fpfa00290_search.Call("SELECT");
        break;
    
        case 'grdMaster':
            if ( data_fpfa00290_master.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    data_fpfa00290_master.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_fpfa00290_master.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fpfa00290_detail.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
     switch(obj.id)
    {
        case "data_fpfa00290_master": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_TLG_FA_CUT_WI_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_TLG_FA_CUT_WI_M_PK, txtMasterPK.text);
                    } 
                }
                OnSave('Detail');                
            }
            else
            {
                OnSearch('grdDetail');   
            }
        break;

        case "data_fpfa00290_detail":
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_ITEM_NAME, grdDetail.rows - 1, G2_ITEM_NAME,  true);
	            grdDetail.SetCellBold( 1, G2_WI_QTY, grdDetail.rows - 1, G2_WI_QTY,  true);       
            }         
        break;
   }            
}
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;            
        case 'Project':
                if(txtMasterPK.text=="")
                {
                var fpath  = System.RootURL + "/form/fp/fa/fpfa00293.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                     txtProjectPK.text = oValue[0]; 
                     txtProjectName.text   = oValue[1];
                     txtItem.text = oValue[2]; 
                }
                }else
                {
                    alert("Cannot update Project!")
                }
              
               /* var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0]; 
                    txtProjectName.text   = oValue[2];
                } */
        break;     
        
    }	       
}
 
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_fpfa00290_master.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fpfa00290_detail.Call();
        break;
    }
}

 
//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_fpfa00290_master.StatusDelete();
                data_fpfa00290_master.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_TLG_FA_CUT_WI_D_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{   
   
    return true;
}
  
//==================================================================================
function OnReport()
{
    var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00290.aspx?master_pk=' + txtMasterPK.text ;
	window.open(url, "_blank"); 
}
//================================================================================================
</script>
<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_fpfa00290_search" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="<%=l_user%>lg_sel_fpfa00290"	>	
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
    <!--============================================= Master =====================================-->
    <gw:data id="data_fpfa00290_master" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8"	function="<%=l_user%>lg_sel_fpfa00290_1"	procedure="<%=l_user%>lg_upd_fpfa00290_1">	
				<inout>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="txtSlipNo"	/>
						<inout	bind="dtDoc"	/>
						<inout	bind="txtStaffPK"	/>
						<inout	bind="txtStaffName"	/>
						<inout	bind="txtProjectPK"	/>
                        <inout	bind="txtProjectName"	/>
						<inout	bind="txtItem"	/>
						<inout	bind="txtRemark"	/>					
				</inout>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_fpfa00290_detail" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>LG_SEL_fpfa00290_2" procedure="<%=l_user%>LG_UPD_fpfa00290_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
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
                            <gw:grid id='grdSearch' header='_pk|Slip No|Pl|Item Name|Doc Date' format='0|0|0|0|4'
                                aligns='0|0|0|1|1' check='||||' editcol='0|0|0|0|0' widths='0|800|1000|1200|1200'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="t-right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                             Slip No
                        </td>
                        <td style="width: 20%" align="left" >   
                           <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />                         
                        </td>
                        <td align="right" style="width: 10%">
                        </td>                   
                        <td style="width: 20%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">                       
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Doc Date
                        </td>
                        <td  style="width: 10%">
                            <gw:datebox id="dtDoc" lang="1" width="10%" />
                        </td>
                        <td align="right" style="width: 5%">
                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">
                                <b>Charger</b></a>
                        </td>
                        <td  colspan="5">
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <a title="Project" onclick="OnPopUp('Project')" href="#tips" style="color:#0000ff"><b>
                                Project</b></a>
                        </td>
                        <td style="width: 20%">
                           <gw:textbox id="txtProjectPK" styles="display:none" />
                            <gw:textbox id="txtProjectName" styles="width:100%" />
                        </td>
                        <td align="right" style=" white-space: nowrap">
                          Item
                        </td>
                        <td style="white-space: nowrap" style="width: 20%" colspan="5">
                             <gw:textbox id="txtItem" styles="width:100%"  readonly="true"/>
                        </td>
                    </tr>    
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                             Remark
                        </td>
                        <td style="width: 20%" colspan ="7">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                            
                        </td>
                    </tr>                    
                    <tr style="height: 1%">
                        <td colspan="8">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    
                                    <td align="right" style="width: 95%">
                                    </td>
                                    
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew('BOM')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="8">
                            <gw:grid id='grdDetail'
                            header='_PK|_TLG_FA_CUTTING_MASTER_PK|DWG No|CP NO|SEQ|_TCO_ITEM_PK|Item Code|Item Name|LENG|UOM|Plan Qty|Unit Wt|Total Wt'
                            format='0|0|0|0|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0|0|0|0|0'
                            check='||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|1|1'
                            widths='0|0|1500|1500|1000|0|1500|2000|1500|800|1500|1500|1500'
                            sorting='T'
                            autosize='T' 
                            oncelldblclick='OnGridCellDblClick(this)'
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
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtEmpPK" styles="display:none;" />
<!---------------------------------------------------------------------------------> 
</html>
