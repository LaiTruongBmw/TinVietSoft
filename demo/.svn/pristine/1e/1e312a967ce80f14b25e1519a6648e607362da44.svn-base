<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>DEPR CLOSING ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_MASTER_PK    = 0,
    G1_CLOSE_DATE   = 1,
    G1_DEPR_SD_ID   = 2;
	
var G2_DETAIL_PK	= 0,
	G2_MASTER_PK	= 1,
	G2_SEQ			= 2,
	G2_ASS_TYPE_PK	= 3,
	G2_ASS_TYPE_NM	= 4,
	G2_ASS_GROUP_PK	= 5, 
	G2_ASS_GROUP_NM	= 6,
	G2_ASS_ACC_PK	= 7,
	G2_ASS_ACC_NM	= 8,
	G2_NULL_01		= 9,
	G2_NULL_02		= 10,
	G2_BEGIN_AMT	= 11,
	G2_IN_AMT		= 12,
	G2_OUT_AMT		= 13,
	G2_END_AMT		= 14,
	G2_CCY			= 15;
	
//===================================================================================
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

//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session  
	 
    txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtChargerName.text = "<%=Session("USER_NAME")%>"  ;
	
	txtChargerName.SetReadOnly(true);
	txtDeprSDID.SetReadOnly(true);
	//-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
	//-------------------------
	
	FormFormat();
}
//=================================================================================
function FormFormat()
{  
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G2_BEGIN_AMT) = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G2_IN_AMT)    = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G2_OUT_AMT)   = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G2_END_AMT)   = "#,###,###,###,###,###.##";                  
     
}
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'Close' :
			if ( txtDeprSDID.text == '' )
			{
				alert('PLS SELECT SCHEDULE FIRST !');
				return;
			}
			//------
            if ( confirm('Do you want to close data.') )
            {
                txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
                pro_fpma00230.Call();
            }    
        break;    
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_fpma00230_1.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;
        
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to submit data.') )
                {
                    pro_fpma00230_2.Call();
                }
            }
            else
            {
                alert('Pls select data');
            } 
        break;  
	}
}	
//=================================================================================
function OnSearch(pos)
{ 
    switch(pos)
    {
        case 'grdSearch':
            data_fpma00230.Call('SELECT');
        break;
		
        case 'Master':
			if ( grdSearch.row > 0 )
            {
                txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_MASTER_PK );
            }
			
            data_fpma00230_1.Call('SELECT');
        break;
		
		case 'Detail':             
            data_fpma00230_2.Call('SELECT');
        break;		
    }
} 	
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpma00230_1':  
            OnSearch('Detail');
        break;
		
        case 'data_fpma00230_2':  
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G2_BEGIN_AMT, grdDetail.rows - 1, G2_BEGIN_AMT, true);	
                grdDetail.SetCellBold( 1, G2_IN_AMT,    grdDetail.rows - 1, G2_IN_AMT,    true);
                grdDetail.SetCellBold( 1, G2_OUT_AMT,   grdDetail.rows - 1, G2_OUT_AMT,   true);
                grdDetail.SetCellBold( 1, G2_END_AMT,   grdDetail.rows - 1, G2_END_AMT,   true);
                
                grdDetail.SetCellBold( 1, G2_ASS_TYPE_NM, grdDetail.rows - 1, G2_ASS_TYPE_NM, true);	
                
                grdDetail.Subtotal( 0, 2, -1, '11!12!13!14');		
            }    
        break;
		
	 	case 'pro_fpma00230':
			OnSearch('Detail');
		break;

        case 'pro_fpma00230_1':
            alert(txtReturnValue.text);            
			OnSearch('Master');
		break;	
		
		case 'pro_fpma00230_2':
            alert(txtReturnValue.text);            
			OnSearch('Master');
		break;		
    }  
}

//========================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {        
		case 'DeprType' :
			var path = System.RootURL + '/form/fp/ab/fpab00600.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtDeprSDID.text = obj[2];           
            }
		break;
		
		case 'DETAIL':	
			if ( txtMasterPK.text == '' )
			{
				alert('PLS SELECT CLOSING MASTER !');
				return;
			}
			//-----		
			if ( grdDetail.row > 0 )
			{				
				var path = System.RootURL + '/form/fp/ma/fpma00231.aspx?master_pk=' + txtMasterPK.text + '&asset_type_pk=' + grdDetail.GetGridData( grdDetail.row, G2_ASS_TYPE_PK);
            	var obj = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes');
			}
			else
			{
				var path = System.RootURL + '/form/fp/ma/fpma00231.aspx?master_pk=' + txtMasterPK.text ;
            	var obj = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes');
			}	
		break; 
    }	       
}
//========================================================================================
</script>

<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_fpma00230" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>lg_sel_fpma00230"	>	
				<input>
					<input	bind="dtFrom"	/>	
					<input	bind="dtTo"	/>	
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= CLOSE =====================================-->
    <gw:data id="pro_fpma00230" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_FPMA00230"> 
                <input> 
			        <input bind="txtDeprSDID" />  		
			        <input bind="txtChargerPK" />
			        <input bind="dtClose" />
			        <input bind="txtDesc" />
			    </input> 
                <output>
                    <output bind="txtMasterPK" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!--============================================= RELEASE =====================================-->
    <gw:data id="pro_fpma00230_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_FPMA00230_1"> 
                <input> 
			        <input bind="txtMasterPK" />  					         
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>
    <!--============================================= SUBMIT =====================================-->
    <gw:data id="pro_fpma00230_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>lg_PRO_FPMA00230_2"> 
                <input> 
			        <input bind="txtMasterPK" />
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>       
    <!--============================================= DETAIL =====================================-->
    <gw:data id="data_fpma00230_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6" function="<%=l_user%>lg_sel_fpma00230_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="dtClose" />   
                     <inout  bind="txtDeprSDID" />                                            
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="txtDesc" />
                     <inout  bind="lblStatus" />                                                        
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--============================================= DETAIL =====================================-->
    <gw:data id="data_fpma00230_2" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>lg_SEL_FPMA00230_2"	>	
				<input>
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!============================================= ====== =====================================-->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 30%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Close Date
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:datebox id="dtFrom" lang="1" width="10%" />
                            ~
                            <gw:datebox id="dtTo" lang="1" width="10%" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="6">
                            <gw:grid id='grdSearch' header='_PK|Status|Close Date|Depr SD' format='0|0|4|0' aligns='0|1|0|0'
                                check='||||' editcol='0|0|0|0' widths='0|1200|1200|1300' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%" colspan="6">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 20%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:icon id="idBtnClose" img="1" text="Closing" styles='width:100%' onclick="OnProcess('Close')" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:icon id="idBtnRelease" img="1" text="Release" styles='width:100%' onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 55%">
                                    </td>
                                    <td style="width: 5%">
                                        <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:icon id="idBtnSubmit" img="2" text="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:imgbtn id="idBtnViewDetail" img="popup" alt="Search" onclick="OnPopUp('DETAIL')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            Close Date
                        </td>
                        <td style="width: 25%">
                            <gw:datebox id="dtClose" lang="1" width="10%" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <a title="Depr Type" onclick="OnPopUp('DeprType')" href="#tips" style="color=#0000ff">
                                <b>Depr SD</b></a>
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtDeprSDID" styles='width:100% ' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Charger
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                            <gw:textbox id="txtChargerName" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            Remark
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtDesc" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 97%">
                        <td colspan="6">
                            <gw:grid id='grdDetail' 
								header='_PK|_CLOSE_M_PK|Seq|_ASSET_TYPE_PK|Asset Type|_ASSET_GROUP_PK|Asset Group|_ASSET_ACC_PK|Asset Acc|_null_01|_null_02|Begin Amount|In Amount|Out Amount|End Amount|CCY'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|0|3|3|3|3|1'
                                editcol='1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|0|800|0|2500|0|2500|0|2500|0|0|1500|1500|1500|1500|800'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!-------------------CLOSE, RELEASE------------------------>
</body>
</html>
