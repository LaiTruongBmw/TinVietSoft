<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ORDER REVISION ENTRY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	
    var  flag ;         
    
	var	GS_PK 			= 0,
		GS_REF_NO 		= 3,
		GS_STATUS 		= 4,
		GS_STATUS_NM 	= 5;
	
    //----------------------------------
	var G_PK                     = 0,
	    G_RV_REVISION_M_PK       = 1,
	    G_SEQ                    = 2,
	    G_REVISION_TYPE          = 3,
	    G_REF_NO                 = 4,
		G_DESC_01                = 5,
		G_DESC_02                = 6,
		G_DESC_03                = 7,
		G_COLUMN_NAME            = 8,
	    G_OLD_ITEM               = 9,
	    G_NEW_ITEM               = 10,
	    G_DESCRIPTION            = 11,	    
	    G_RV_SO_D_REVISION_PK    = 12,
	    G_RV_SO_M_REVISION_PK    = 13;
//=========================================================================

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
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="60%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }

//=========================================================================
 
 function BodyInit()
 {
    System.Translate(document);
    txtSlipNo.SetReadOnly(true);
    txtChargerName.SetReadOnly(true);
    txtResponse.SetReadOnly(true);
	txtSupplier.SetReadOnly(true);
    //---------------------------
    BindingDataList();
    //---------------------------
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
    //---------------------------
    OnAddNew('Master');
 }
//=========================================================================
 
 function BindingDataList()
 {    
        var data="";
		//----------------------------------------------
		data = "DATA|1|SAVED|2|SUBMITTED|3|SALE APPROVED|4|SALE CANCEL|5|SALE RETURN|6|PROD APPROVED|7|PROD CANCEL|8|PROD RETURN||";
		lstStatus.SetDataText(data);
		lstStatus.value = '';
		
		data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGSA2010' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
        grdDetail.SetComboFormat(G_REVISION_TYPE,data);
 }
//=========================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 ,600 , 'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break; 
        
        case 'Revision_Type':
            var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGSA2010";
	        var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');       
        break;
		
		case 'RevEntry':
            var path = System.RootURL + "/standard/formsep/bp/epbp00230.aspx";
	        var object = System.OpenModal( path ,900 ,600 ,'resizable:yes;status:yes');       
        break;		
	}
}
	
//=========================================================================		 
 function OnSearch(id)
 {
    switch (id)
    {
        case 'search':
            data_epbp00240.Call('SELECT');
        break;                  
        
		case 'Master' :
			if ( grdSearch.row > 0 )
			{
				txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0);
			}		
			
			flag = '';
					
        	data_epbp00240_1.Call('SELECT');					
		break;        
    }
 }
 
//=========================================================================

 var p_update = 0 ;
//=========================================================================

 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case 'data_epbp00240_1':
            if(flag == 'save')
            {
                OnSave('Detail');
            }
            else
            {
                data_epbp00240_2.Call('SELECT');
            }                
        break;            
        
        case 'pro_epbp00240':
            alert(txtReturnValue.text);
            data_epbp00240_1.Call('SELECT');
        break;
		
		case 'data_epbp00240':
		      for(var i=1 ;i<grdSearch.rows ;i++)
              {
                   var l_status = grdSearch.GetGridData(i,GS_STATUS);
				   
				   if ( l_status == "2" )//Submit
                   {
                        grdSearch.SetCellBgColor( i, GS_PK , i, GS_STATUS_NM , 0xCCFFFF ); // vang
                   }  
                   else if ( l_status == "3" || l_status == "6" )//Sale Approve
                   {
                        grdSearch.SetCellBgColor( i, GS_PK , i, GS_STATUS_NM , 0xB8FECA ); // xanh
                   }    
                   else if(l_status == "4" || l_status == "7")// Cancel
                   {
                        grdSearch.SetCellBgColor( i, GS_PK , i, GS_STATUS_NM , 0xEEEEEE ); // xam
                   }  
                   else if(l_status == "5" || l_status == "8")// Return
                   {
                        grdSearch.SetCellBgColor( i, GS_PK , i, GS_STATUS_NM , 0xA4A4FF ); // do
                   }            
              }
			  
			  if (grdSearch.rows > 1)
			  {
				   grdSearch.SetCellBold( 1, GS_REF_NO, grdSearch.rows - 1, GS_REF_NO, true);  
			  }
		break;    
		
		case 'data_epbp00240_2':
			if (grdDetail.rows > 1)
			{
				grdDetail.SetCellBold( 1, G_REF_NO, grdDetail.rows - 1, G_REF_NO, true);
				
				grdDetail.SetCellBold( 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM, true);
				
				grdDetail.SetCellBgColor( 1, G_OLD_ITEM, grdDetail.rows - 1, G_NEW_ITEM, 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G_DESC_01,  grdDetail.rows - 1, G_DESC_03,  0xE2F5F5 ); 
			}
		break;                                          
    }
 }
 
//=========================================================================

 function OnAddNew(pos)
 {  
    switch (pos)
    {
        case 'Master':
            data_epbp00240_1.StatusInsert();
            
            txtSlipNo.text   = '***New Slip No***';     
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;       
    }
 }
 
//=========================================================================

 function OnSave(pos)
 {
    switch (pos)
    {
       case 'Master':
	   		flag = 'save';            
            data_epbp00240_1.Call();            
       break;
       
       case 'Detail':
            data_epbp00240_2.Call();
       break;  
    }
 }

//=========================================================================

 function OnDelete(pos)
 {
    switch (pos)
    {
        case 'Master':
            if(confirm('Do you want to delete ?'))
            {
                data_epbp00240_1.StatusDelete();
                data_epbp00240_1.Call();
            }
        break;
    }
 }

//=========================================================================
 
function OnReport()
{   
    if(txtMasterPK.text != '')
    {
         var url =System.RootURL + "/standard/reports/ds/re/rpt_epbp00240.aspx?p_tsa_revision_m_pk="+txtMasterPK.text; 
         System.OpenTargetPage(url);         
    }
}

//=========================================================================

function OnProcess(obj)
{
    if(txtMasterPK.text != '')
    {
       switch(obj)
       {
        case 'SUBMIT':
            if(confirm('Do you want to submit?'))
            {
                pro_epbp00240.Call();
            }
        break;
       }
    } 
}

//=========================================================================

</script>

<!------------------------------------------------------------------>
<body>
    <gw:data id="data_epbp00240" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="st_lg_sel_epbp00240"   > 
                <input> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                    <input bind="lstStatus" /> 
                    <input bind="txtSearch" /> 
					<input bind="txtChargerPK" />
					<input bind="chkUser" />					
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00240_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_epbp00240_1" procedure="st_lg_upd_epbp00240_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtSlipNo" />  
                    <inout bind="dtReDate" />
                    <inout bind="lbStatus" />     
                    <inout bind="txtChargerPK" />
                    <inout bind="txtChargerName" />
                    <inout bind="txtSOMasterPK" />   
                    <inout bind="txtRefNo" />
                    <inout bind="txtDescription" />   
                    <inout bind="txtResponse" />   
					<inout bind="txtSupplier" />                                                        
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00240_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="st_lg_sel_epbp00240_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" procedure="st_lg_upd_epbp00240_2 " > 
                <input> 
                    <input bind="txtMasterPK" />   
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00240" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00240" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------>
    <form>
    <table border="1" style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td id="left" style="width: 25%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Ord Date
                        </td>
                        <td style="width: 94%">
                            <gw:datebox id="dtFromDate" lang="1" styles="width:50%" />
                            ~<gw:datebox id="dtToDate" lang="1" styles="width:50%" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('search')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Ref No
						</td>
                        <td colspan="2">
                            <gw:textbox id="txtSearch" styles='width:100%' onenterkey="OnSearch('search')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 94%">
                            <gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('search')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('search')">User
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 46%">
                        <td colspan="5">
                            <gw:grid id='grdSearch' header='_pk|Slip No|Date|Ref No|_Status|Status' format='0|0|4|0|0|0' aligns='0|0|0|0|0|0'
                                check='|||||' editcol='0|0|0|0|0|0' widths='0|1200|1200|1500|0|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 60%">
             
                            <table style="height: 100%; width: 100%"  >
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Slip No
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtSlipNo" styles="width: 100%" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Date
                                    </td>
                                    <td style="width: 30%">
                                        <gw:datebox id="dtReDate" lang="1" styles="width:50%" />
                                    </td>
                                    <td style="width: 20%; white-space: nowrap" align="center">
                                        <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    <td style="width: 4%" align="center">
                                    </td>
                                    <td style="width: 1%" align="center">
                                        <gw:button id="ibBtnLevel1" img="Submit" text="Submit" onclick="OnProcess('SUBMIT')" />
                                    </td>                                   
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%; display:none" align="right">
                                        <gw:button img="new" alt="New" id="btnNew1" onclick="OnAddNew('Master')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('Master')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="save" alt="Save" id="btnSave1" onclick="OnSave('Master')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ref No
                                    </td>
                                    <td style="width: 30%">
										<gw:textbox id="txtSOMasterPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtRefNo" styles="width: 100%;color:blue" />
                                    </td>
                                    <td style="width: 5%">
                                        <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="color=#0000ff"><b>
                                            Charger</b></a>
                                    </td>
                                    <td colspan="9">
                                        <gw:textbox id="txtChargerPK" styles="display:none" />
                                        <gw:textbox id="txtChargerName" styles="width:100%" />
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Supplier
                                    </td>                                 
                                    <td colspan="11">                                        
                                        <gw:textbox id="txtSupplier" styles="width:100%" csstype="mandatory" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right">
                                        Desc
                                    </td>
                                    <td style="width: 100%" colspan="12" >
                                        <gw:textarea id="txtDescription" styles="width:100%;height:80" />
                                    </td>
                                </tr>
                                 <tr style="height: 1%">
                                    <td align="right">
                                        Response
                                    </td>
                                    <td style="width: 100%" colspan="12">
                                        <gw:textarea id="txtResponse" styles="width:100%;height:50"  />
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td align="left">    
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
        									style="cursor: hand" onclick="OnToggle()" />                                    
                                    </td>
                                    <td style="width: 100%" colspan="5">
                                        <b style="color: #1b2ff2; cursor: hand;" onclick="OnPopUp('Revision_Type')">Revision Type</b>
                                    </td>
									<td colspan="7" align="right"><gw:button id="btnRevEntry" img="Revision Registration" text="Revision Registration" onclick="OnPopUp('RevEntry')" /></td>
                                </tr>	
								<tr style="height: 96%">
                                    <td style="width: 100%" colspan="13">
 										<gw:grid id='grdDetail'
                                            header='_pk|_rv_revision_m_pk|Seq|Revision Type|Ref No|_Desc 01|_Desc 02|_Desc 03|Column Name|Old Item|New Item|Remark|_rv_so_d_revision_pk|_rv_so_m_revision_pk'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            aligns='0|0|1|0|0|1|1|1|1|1|1|0|0|0'
                                            check='|||||||||||||'
                                            editcol='0|0|1|1|0|0|0|0|0|0|0|1|0|0'
                                            widths='0|0|800|1500|1500|1200|1200|1200|1500|2000|2000|1000|0|0'
                                            sorting='T'
                                            styles='width:100%; height:100%'
                                            />
                                    </td>
                                </tr>																	
                            </table>                         
            </td>
        </tr>
    </table>
    </form>
    <!------------------------------------------->    
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
	<!------------------------------------------->
</body>
</html>
