<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ALLOCATION RULE ENTRY</title>
</head>

<script type="text/javascript" language="javascript">
var flag;

var G_TLG_CO_PR_ALLO_RULE_M_PK	= 0,
	G_DOC_DATE		        = 1,
	G_TR_TYPE		        = 2,	 
	G_TAC_ABACCTCODE_PK	    = 3,
	G_AC_CD                 = 4,
	G_AC_NM		            = 5,
	G_CHARGER_PK            = 6,
	G_FULL_NAME             = 7,
	G_RULE_ID               = 8,
	G_RULE_NAME             = 9,
	G_DESCRIPTION           = 10;

var G1_TLG_CO_PR_ALLO_RULE_M_PK     = 0,
    G1_TLG_CO_PR_ALLO_RULE_D_PK     = 1,
    G1_SEQ                          = 2,
    G1_TLG_IT_STITEM_PK             = 3,
    G1_TLG_IT_ITEM_PK               = 4,
    G1_ITEM_CODE                    = 5,
    G1_ITEM_NAME                    = 6,
    G1_ALLO_VALUE                   = 7,
    G1_DESCRIPTION                  = 8;
	
var arr_FormatNumber = new Array();	
        
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
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
                right.style.width="70%";
                imgArrow.src = "../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}
 
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtChargerName.SetReadOnly(true);
	
	dtFrDate.SetDataText(System.AddDate(dtFrDate.GetData(), -30));
	
	FormFormat();   
	OnAddNew();      
}
//=================================================================================
function FormFormat()
{  
     var data="";  	
   
	 
	 data = "<%=ESysLib.SetListDataSQL("SELECT trans_code,trans_code || ' * ' || trans_name  FROM tlg_in_trans_code WHERE del_if = 0 and trans_type = 'C' ORDER BY trans_code")%>";       
     lstTransType.SetDataText(data);  
	 //---------------------
	 grdDetail.GetGridControl().ColFormat(G1_ALLO_VALUE) = "###,###,###.##";  
	 
	 arr_FormatNumber[G1_ALLO_VALUE] = 2;
}

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_ALLO_VALUE )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
        //------------------------
    }
}
 
//=================================================================================
function OnAddNew()
{
    if ( data_bico00090_1.GetStatus() != 20 )
    {
        data_bico00090_1.StatusInsert();
        grdDetail.ClearData();
       
        txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
     	txtChargerName.text = "<%=Session("USER_NAME")%>"  ;
        //----------------     
		
		txtRuleID.text = "<< Rule ID >>";
		txtRuleNM.text = "<< Rule Name >>";
		
        flag = "view";                          
    }
    else
    {
        alert("Already add new. Pls input data !!!");
    }	
}

function OnAdd()
{
     grdDetail.AddRow();  
}
//=================================================================================
function OnSave(obj)
{ 
    if(obj == 'Master')
    {
        flag='save';
        data_bico00090_1.Call();
    }    
    else if(obj == 'Detail')
    {
        data_bico00090_2.Call();
    }
}
//=================================================================================
function OnCopy()
{
}
//=================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_bico00090': //SEARCH  
        break;
		
        case 'data_bico00090_1': //MASTER
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_TLG_CO_PR_ALLO_RULE_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_TLG_CO_PR_ALLO_RULE_M_PK, txtMasterPK.text);
                    }    
                }                
                OnSave('Detail');  
            } 
            else
            {
                data_bico00090_2.Call('SELECT'); 
            }    
        break;
        
		case 'data_bico00090_2':
		break;
        case 'pro_bico00090': // SUBMIT
            alert(txtValueReturn.text);
        break;
    }  
}
//=================================================================================
function OnDelete(pos) 
{
    switch (pos)
    {
        case 'Master':// delete master
            if ( confirm('Do you want to delete this slip?'))
            {
                flag='delete';
                data_bico00090_1.StatusDelete();
                data_bico00090_1.Call();
            }   
        break;
 		
		case 'Detail':
			if ( grdDetail.GetGridData( grdDetail.row, G1_TLG_CO_PR_ALLO_RULE_D_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {   
                grdDetail.DeleteRow();
            }   		
		break;
    }      
}
//==============================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function OnReport(obj)
{
}
 
//=================================================================================
function OnSearch(pos)
{ 
    switch(pos)
    {
        case 'grdSearch':
            data_bico00090.Call('SELECT');
        break;
		
        case 'Master':
			if ( grdSearch.row > 0 )
			{
            	txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_TLG_CO_PR_ALLO_RULE_M_PK);
			
           	 	data_bico00090_1.Call('SELECT');
			}	
        break;
    }
}
 
//=================================================================================
function OnGridCellDblClick(objGrid)
{
}     
 
//========================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;            
        
		case 'AccCode' :
			var path = System.RootURL + '/form/fp/ab/fpab00490.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtAccCodePK.text = obj[0];
                txtAccCodeID.text = obj[1];
                txtAccCodeNM.text = obj[2];                 
            }
		break;
		
       case "FreeMat":
            var path = System.RootURL + '/form/fp/ab/fpab00350.aspx?group_type=||Y|Y|Y|Y';
            var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');

             if ( obj != null )
             {
                for ( var j=0 ; j<obj.length; j++)
                {
                    temp = obj[j];
                    /*--------------------*/                    
                    grdDetail.AddRow();
                    grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,             grdDetail.rows-1 );
                    grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_CO_PR_ALLO_RULE_M_PK, txtMasterPK.text );                      
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE,        temp[2]+"" ); //Mat Code
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,      temp[3]+"" ); //Mat Name          	                          

                    grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_IT_STITEM_PK, temp[0] ); //st_item_pk                    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_TLG_IT_ITEM_PK,    temp[1] ); //item_pk
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ALLO_VALUE, 1 );
                    
                    grdDetail.SetCellBgColor( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1, G1_SEQ, 0xCCFF99 );
                }
            }
        
        break;  		
    }	       
}
//=================================================================================
</script>

<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_bico00090" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2"	function="<%=l_user%>lg_sel_bico00090"	>	
				<input>
					<input	bind="dtFrDate"	/>	
					<input	bind="dtToDate"	/>	
					<input  bind="txtRuleSearch" />					 			
				</input>	
				<output	bind="grdSearch"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Master =====================================-->
    <gw:data id="data_bico00090_1" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	type="control"	parameter="0,1,2,3,4,5,6,7,8,9,10"	function="<%=l_user%>lg_sel_bico00090_1"	procedure="<%=l_user%>LG_UPD_bico00090_1">	
				<input>	
						<inout	bind="txtMasterPK"	/>
						<inout	bind="dtDocDate"	/>	
						<inout	bind="lstTransType"	/>
						<inout	bind="txtAccCodePK"	/>	
						<inout	bind="txtAccCodeID"	/>											
						<inout	bind="txtAccCodeNM"	/>
						<inout	bind="txtChargerPK"	/>												 						 
						<inout	bind="txtChargerName"	/>				 											 
						<inout	bind="txtRuleID"	/>					
						<inout	bind="txtRuleNM"	/>					
						<inout	bind="txtRemark"	/>
				</input>
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Detail =====================================-->
    <gw:data id="data_bico00090_2" onreceive="OnDataReceive(this)">	
		<xml>									
			<dso id="3"	type="grid"	parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_bico00090_2" procedure="<%=l_user%>LG_UPD_bico00090_2">	
				<input	bind="grdDetail">					
					<input	bind="txtMasterPK"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!--============================================= Submit =====================================
    <gw:data id="pro_bico00090" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="<%=l_user%>LG_PRO_bico00090"> 
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtValueReturn" />
                </output>           
            </dso> 
        </xml> 
    </gw:data>-->
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 35%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 95%">
                            <gw:datebox id="dtFrDate" lang="1" width="100%" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" width="100%" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Rule
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:textbox id="txtRuleSearch" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id='grdSearch' header='_PK|Doc Date|Rule' format='0|4|0' aligns='0|0|0'
                                check='||' editcol='1|1|1' widths='0|1200|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 5%; white-space: nowrap">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle('1')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Rule
                        </td>
                        <td style="width: 60%; white-space: nowrap">
                            <gw:textbox id="txtRulePK" styles='width:100%;display:none' />
                            <gw:textbox id="txtRuleID" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtRuleNM" styles='width:70%' csstype="mandatory" />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 15%" align="left">
                            <gw:datebox id="dtDocDate" lang="1" width="10%" />
                        </td>
                        <td align="right" style="width: 6%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="new" alt="New" id="btnNew1" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">
                        <td colspan="11">
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF" border="0">
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a onclick="OnPopUp('AccCode')" href="#tips" style="color=#0000ff"><b>Acc Code</b></a>
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtAccCodePK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtAccCodeID" styles='width:30%' />
                                        <gw:textbox id="txtAccCodeNM" styles='width:70%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                            Charger</b></a>
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtChargerPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtChargerName" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Trans Type
                                    </td>
                                    <td style="width: 45%">
                                        <gw:list id="lstTransType" styles="width:100%;" />
                                    </td>
                                    <td style="white-space: nowrap">
                                        Remark
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtRemark" styles='width:100%'"' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 100%; white-space: nowrap" align="center">
                                    </td>
                                    <td style="width: 15%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="new" alt="Get Asset" id="btnNew2" onclick="OnPopUp('FreeMat')" />
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
                    <tr style="width: 100%; height: 94%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' header='_tlg_co_pr_allo_rule_m_pk|_pk|Seq|_tlg_it_stitem_pk|_tlg_it_item_pk|Item Code|Item Name|Allo Value|Description'
                                format='0|0|0|0|0|0|0|1|0' aligns='0|0|1|0|0|0|0|0|0' check='||||||||' editcol='1|1|1|1|1|1|1|1|1'
                                widths='0|0|500|0|0|1200|2500|1200|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
