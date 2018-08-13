<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>PROJECT PLANE</title>
</head>

<script type="text/javascript" language="javascript">

var flag;
//Slip No|_PK|_TAC_ABPL_PK|Project Name|_DESCRIPTION|Plan Date
var G_SLIP_NO                           = 0,
    G_PK     = 1,
    G_TAC_ABPL_PK               = 2,
    G_PROJECT_NAME                    = 3,
    G_PROJECT_CODE                 = 4,
    G_DESCRIPTION                          = 5,
    G_PLAN_DATE                   = 6;
    
var G2_ZONE                 = 0,
    G2_TEAM                 = 1,
    G2_MEMBER_NM            = 2,
    G2_MEMBER_NO            = 3,
    G2_QTY                  = 4,
    G2_WT                   = 5,
    G2_SHOP_DWG             = 6,
    G2_WELD                 = 7,
    G2_AC_WELD              = 8,      
    G2_INSP                 = 9,
    G2_AC_INSP              = 10,
    G2_PAINT                = 11,
    G2_AC_PAINT             = 12,
    G2_PACK                 = 13,
    G2_AC_PACK              = 14,
    G2_DELI                 = 15,
    G2_AC_DELI              = 16,
    G2_REMAR                = 17   ;
  //------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    grdDetail.GetGridControl().FrozenCols =G2_QTY ;
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFromSearch.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFromSearch.value=ldate ;    
   //---------------------------- 
    //BindingDataList(); 
    
   
}
 

 //==================================================================================
 function OnPopUp(obj)
 {
    switch(obj)
        {
            case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0];
                    txtProjectCode.text =  oValue[1];
                    txtProjectName.text   = oValue[2];
                }
            break;      
            
       }
 }


//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_fpfa00420_search.Call("SELECT");
        break;
    
        case 'grdMaster':
            if ( data_fpfa00420_master.GetStatus() == 20 && grdDetail.rows > 1 )
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
                    data_fpfa00420_master.Call("SELECT");
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
                data_fpfa00420_master.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fpfa00420_detail.Call("SELECT");
        break;
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
      
      case "data_fpfa00420_master": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_TLG_KB_SUB_SHIPMENT_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i,G2_TLG_KB_SUB_SHIPMENT_M_PK, txtMasterPK.text);
                    } 
                }
                OnSave('Detail');                
            }
            else
            {
                OnSearch('grdDetail');   
            }

        break;

        case "data_fpfa00420_detail":
            if ( grdDetail.rows > 1 )
            {
                 grdDetail.SetCellBgColor( 1, G2_AC_WELD,grdDetail.rows - 1, G2_AC_WELD, 0x99FFFF);  
                 grdDetail.SetCellBgColor( 1, G2_AC_INSP,grdDetail.rows - 1, G2_AC_INSP, 0x99FFFF);  
                 grdDetail.SetCellBgColor( 1, G2_AC_PAINT,grdDetail.rows - 1, G2_AC_PAINT, 0x99FFFF);  
                 grdDetail.SetCellBgColor( 1, G2_AC_PACK,grdDetail.rows - 1, G2_AC_PACK, 0x99FFFF);  
                 grdDetail.SetCellBgColor( 1, G2_AC_DELI,grdDetail.rows - 1, G2_AC_DELI, 0x99FFFF);  
                lblRecord.text = grdDetail.rows - 1 + ' row(s)';
                /*grdDetail.SetCellBold( 1, G2_ITEM_NAME, grdDetail.rows - 1, G2_ITEM_NAME,  true);
                
	            grdDetail.SetCellBold( 1, G2_DOC_AMT, grdDetail.rows - 1, G2_DOC_AMT,  true);
	            grdDetail.SetCellBold( 1, G2_SHIPMENT_AMT, grdDetail.rows - 1, G2_SHIPMENT_AMT,  true);
	           
                grdDetail.SetCellBgColor( 1, G2_SHIPMENT_AMT, grdDetail.rows - 1, G2_SHIPMENT_AMT, 0x99FFFF ); 
                 
                grdDetail.SetCellBold( 1, G2_GROSS_WT, grdDetail.rows - 1, G2_GROSS_WT,  true);
	            grdDetail.SetCellBgColor( 1, G2_GROSS_WT,grdDetail.rows - 1, G2_GROSS_WT, 0x99FFFF);            */
            }
             else
	        lblRecord.text =  '0 row(s)';          
        break;
        
    }
}
//======================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}
//====================================================================================
    
</script>

<body>
    
    <!--============================================= Search =====================================-->
    <gw:data id="data_fpfa00420_search" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="<%=l_user%>lg_sel_fpfa00420"	>	
				<input>
					<input	bind="dtFromSearch"	/>	
					<input	bind="dtToSearch"	/>
					<input	bind="txtSlipNoSearch"	/>
					<input	bind="txtProjectPK"	/>
											
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
	<!--============================================= Master =====================================-->
    <gw:data id="data_fpfa00420_master" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5"	function="<%=l_user%>lg_sel_fpfa00420_1"	procedure="<%=l_user%>lg_upd_fpfa00420_1">	
				<inout>
					<inout bind="txtMasterPK"/>	
                    <inout bind="txtProjectpk1"/>
                    <inout bind="txtProjectNM"/>
                    <inout bind="dtPlane"/>
                    <inout bind="txtSlipNo"/>
                    <inout bind="txtRemark"/>
																						
				</inout>
			</dso>	
		</xml>	
	</gw:data>
	  <!--============================================= Detail =====================================-->
    <gw:data id="data_fpfa00420_detail" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,6,7,8,9,10,11,12,13,14" function="<%=l_user%>lg_sel_fpfa00420_2" procedure="<%=l_user%>lg_upd_fpfa00420_2">
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
					<input	bind="txtSearch"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="white-space: nowrap; width: 89%">
                            <gw:datebox id="dtFromSearch" lang="1" />
                            ~
                            <gw:datebox id="dtToSearch" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap;width: 10%" align="right">
                           Slip No
                        </td>
                        <td style="white-space: nowrap; width: 90%" colspan="2">
                            <gw:textbox id="txtSlipNoSearch"  styles="width:100%;"/>
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap;width: 10%" align="right">
                        <a title="Project" onclick="OnPopUp('Project')" href="#tips" style="color=#0000ff"><b>
                           Project</a>
                        </td>
                        <td style="white-space: nowrap; width: 90%" colspan="2">
                            <gw:textbox id="txtProjectPK" styles="display:none" />
                            <gw:textbox id="txtProjectCode" styles="display:none" />
                            <gw:textbox id="txtProjectName" styles="width:100%" />
                        </td>
                        
                    </tr>
                   
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='Slip No|_PK|_TAC_ABPL_PK|Project Name|_DESCRIPTION|Plan Date'
                                format='0|1|1|0|0|4'
                                aligns='1|0|0|0|1|1'
                                check='|||||'
                                editcol='0|0|0|0|0|0'
                                widths='1200|0|0|2000|1500|1300'
                                sorting='T'
                                styles='width:100%; height:100%' oncellclick="OnSearch('grdMaster')" />                                                  

                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%">                 
                    <tr style="height: 1%">
                        
						<td align="right" style="width: 10%;" colspan ="2">
                           Slip No
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" readonly="true"/>
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">                   
                            Project
                        </td>
				 <td  style="width: 48%" align="left">
						<gw:textbox id="txtProjectpk1" styles="width:100%;display:none"/>
						    <gw:textbox id="txtProjectNM" csstype="mandatory" styles="width:100%;display:"/>
                            
                        </td>          
                    </tr>
                   
                    <tr style="height: 1%">
                        
						<td align="right" style="width: 10%p" colspan ="2" >
                           Plan Date
                        </td>
                        <td style="width: 30%">
                            <gw:datebox id="dtPlane" lang="1" width="20%" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">                   
                            Remark
                        </td>
						 <td  style="width: 48%" align="left">
						    <gw:textbox id="txtRemark"  styles="width:100%;"/>
                            
                        </td>          
                    </tr> 
                    <tr style="height: 1%">
                         <td style="width: 10%" align="left">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">                   
                            Member No
                        </td>
						 <td  style="width: 30%" align="left">
						    <gw:textbox id="txtSearch"  styles="width:100%;" onenterkey="OnSearch('grdDetail')"/>
                            
                        </td>    
                        <td colspan ="2" align="right">
                            <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt'>row(s)</gw:label>
                        </td>
                    </tr>               
       
                    <tr style="height: 97%">
                        <td colspan="6">
                            <gw:grid id='grdDetail' acceptNullDate='T'
                                header='Zone|Fab. Team|Member Name|Member No.|Qty|Weight(Kg)|Shop dwg.|Fit Up|Actual Fit Up|Plan Welding|Actual Welding|Inspection|Actual Insp.|Painting| Actual Paint|Packing|Actual Packing|Delivery|Actual Deli.|Remarks'
                                format='0|0|0|0|1|1|4|4|4|4|4|4|4|4|4|4|4|4|4|0'
                                aligns='1|1|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0'
                                check='|||||||||||||||||||'
                                editcol='|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|1500|1500|1500|1300|1300|1300|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200'   
                                sorting='T' 
                                styles='width:100%; height:100%'/>                                              
                                                
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<!--------------------------------------------------------->

</html>
