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
    //----------------------------------
	var G_PK                     = 0,
	    G_RV_REVISION_M_PK       = 1,
	    G_SEQ                    = 2,
	    G_REVISION_TYPE          = 3,
	    G_REF_NO                 = 4,
	    G_COLUMN_NAME            = 5,
	    G_OLD_ITEM               = 6,
	    G_NEW_ITEM               = 7,
	    G_DESCRIPTION            = 8,
	    G_RV_SO_D_REVISION_PK    = 9,
	    G_RV_SO_M_REVISION_PK    = 10;
//=========================================================================
 
 function BodyInit()
 {
    System.Translate(document);
    txtMasterPK.text =  "<%=Request.querystring("trans_pk")%>";
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    //---------------------------
    OnSearch('Master');
 }
//=========================================================================		 
 function OnSearch(id)
 {
    switch (id)
    {
		case 'Master' :			
        	data_dsre00021_1.Call('SELECT');					
		break;        
    }
 }
//=========================================================================
 function OnDataReceive(obj)
 {
    switch (obj.id)
    {
        case 'data_dsre00021_1':
            data_dsre00021_2.Call('SELECT');       
        break;            
        
        case 'pro_dsre00021':
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();             
        break;                                            
    }
 } 
//=========================================================================

function OnProcess()
{
    if(txtMasterPK.text != '')
    {
        if(confirm('Do you want to approve ?'))
        {
            pro_dsre00021.Call();
        }
    }
}

//=========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsre00021_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8" function="st_lg_sel_dsre00021_1" procedure="st_lg_upd_dsre00021_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtSlipNo" />  
                    <inout bind="dtReDate" />
                    <inout bind="lbStatus" />     
                    <inout bind="txtChargerPK" />
                    <inout bind="txtChargerName" />
                    <inout bind="txtTsa_saleorder_pk" />   
                    <inout bind="txtRefNo" />
                    <inout bind="txtDescription" />                                                           
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsre00021_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="st_lg_sel_dsre00021_2" parameter="0,1,2,3,4,5,6,7,8,9" procedure="st_lg_upd_dsre00021_2 " > 
                <input> 
                    <input bind="txtMasterPK" />   
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dsre00021" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsre00021" > 
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
    <table border="1" style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td id="right" style="width: 100%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 12%">
                        <td>
                            <table style="height: 100%; width: 100%" border="0">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Slip No
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtSlipNo" styles="width: 100%;color:red" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Date
                                    </td>
                                    <td style="width: 30%">
                                        <gw:datebox id="dtReDate" lang="1" styles="width:50%" />
                                    </td>
                                    <td style="width: 20%" align="center">
                                        <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                                    </td>
                                    <td style="width: 4%" align="center">
                                    </td>
                                    <td style="width: 1%" align="center">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    <gw:button id="idBtnApprove" img="Approve" text="Approve" onclick="OnProcess()" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap">
                                        Ref No
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtRefNo" styles="width: 100%;color:red" />
                                    </td>
                                    <td style="width: 5%">
                                        Charger
                                    </td>
                                    <td colspan="9">
                                        <gw:textbox id="txtChargerPK" styles="display:none" />
                                        <gw:textbox id="txtChargerName" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Desc
                                    </td>
                                    <td style="width: 100%" colspan="12">
                                        <gw:textarea id="txtDescription" styles="width:100%;height:80" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 50%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 95%">
                                    <td colspan="5">
                                        <gw:grid id='grdDetail'
                                            header='_pk|_rv_revision_m_pk|Seq|Revision Type|Ref No|Column Name|Old Item|New Item|Description|_rv_so_d_revision_pk|_rv_so_m_revision_pk'
                                            format='0|0|0|0|0|0|0|0|0|0|0'
                                            aligns='0|0|0|0|0|0|0|0|0|0|0'
                                            check='||||||||||'
                                            editcol='1|1|1|1|1|1|1|1|1|1|1'
                                            widths='0|0|800|1500|1500|1500|2000|2000|1200|0|0'
                                            sorting='T'
                                            styles='width:100%; height:100%'
                                            />

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
    <!------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtTsa_saleorder_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
