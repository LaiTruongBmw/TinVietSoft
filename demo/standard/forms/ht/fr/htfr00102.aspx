<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Partner</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

var G_PK                = 0,
    G_Cust_ID           = 1,
    G_Cust_Name         = 2,
    G_Local_Name        = 3,
    G_FOREIGN_NM        = 4,
    G_PARTNER_TYPE      = 5,
    G_TAX_CODE          = 6,
    G_ADDRESS           = 7,
    G_ADD_2             = 8,
    G_ADD_3             = 9,
    G_PHONE_NO          = 10,
    G_EMAIL             = 11,
    G_FAX               = 12,
    G_WEBSITE           = 13,
    G_SALE_PRESENT      = 14,
    G_COM_YN            = 15,
    G_CUS_YN            = 16,
    G_CUS_ACTIVE_YN     = 17,
    G_VEN_YN            = 18,
    G_VEN_ACT_YN        = 19,
    G_ACT_YN            = 20,
    G_VALID_F           = 21,
    G_VALID_T           = 22,
    G_DESCRIPT          = 23,
    G_cus_swift_no      = 24,
    G_ven_swift_no      = 25,
    G_represented_by    = 26,
    G_cust_bank_account = 27,
    G_ven_bank_account  = 28,
    G_Cust_YN           = 29,
    G_cust_payment_form = 30,
    G_cust_payment_temrs= 31,
    G_Cust_Trade_Type   = 32,
    G_ven_yn            = 33,
    G_ven_payment_form  = 34,
    G_ven_payment_terms = 35,
    G_Ven_Trade_Type    = 36;
//-----------------------------------------------------------

function BodyInit()
{    
    //data_htfr00102_0.Call("SELECT");
	//txtcompany_pk.text="<%=request.QueryString("p_company_pk")%>";
	//alert(txtcompany_pk.text);
}

//-----------------------------------------------------------

function OnSearch()
{
    data_htfr00102_0.Call("SELECT");
}

//-----------------------------------------------------------

function OnSelect()
{
    var code_data=new Array()
	var ctrl = idGrid.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if ( ctrl.SelectedRows == 0 )
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        for(j=0; j < idGrid.cols -1; j++)
	        	{
            		code_data[index] = idGrid.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}
//-----------------------------------------------------------
function OnNew()
{
	//var path = System.RootURL + "/form/ag/ic/agic00010.aspx?";
	//var object = System.OpenModal( path ,1024 , 768 ,  'resizable:yes;status:yes');
	
	//OnSearch();
}
//-----------------------------------------------------------
function OnCancel()
{
    var code_data=new Array()
    
    for( j=0 ; j < idGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//-----------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------------>
<gw:data id="data_htfr00102_0" onreceive=""> 
	<xml> 
		<dso id="1" type="grid" function="st_ht_sel_htfr00102_0" > 
			<input bind="idGrid" > 
				<input bind="txtCustomer" />
				<input bind="txtcompany_pk" />	
			</input> 
			<output bind="idGrid" /> 
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 5%" align="right">
                Customer
            </td>
            <td style="width: 60%">
                <gw:textbox id="txtCustomer" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%" align="right">
            </td>
            <td style="width: 5%" align="left">
            </td>
            <td style="width: 10%" align="right">
            </td>
            <td style="width: 5%" align="left">
            </td>
            <td style="width: 3%" align="right">
                <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
			<td style="width: 3%" align="right">
                <gw:imgbtn id="idNew" img="new" alt="New Customer" onclick="OnNew()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Close" onclick="OnCancel()" />
            </td>
        </tr>
        <!------------------------------------------------------------------------>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id="idGrid" header="_PK|Cust ID|Cust Name|_Local_Name|Foreign Name|_PARTNER_TYPE|TAX_CODE|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_EMAIL|_FAX|_WEBSITE|_SALE_PRESENT|_COM_YN|_CUS_YN|_CUS_ACTIVE_YN|_VEN_YN|_VEN_ACT_YN|_ACT_YN|_VALID_F|_VALID_T|_DESCRIPT|_cus_swift_no|_ven_swift_no|_represented_by|_cust_bank_account|_ven_bank_account|_Cust_YN|_cust_payment_form|_cust_payment_temrs|_Cust_Trade_Type|_ven_yn|_ven_payment_form|_ven_payment_terms|_Ven_trade_type"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1000|3000|4000|0|0|0|4000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    styles="width:100%; height:100%" autosize="T" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36"
                    oncelldblclick="OnSelect()" />
            </td>
        </tr>
        <!------------------------------------------------------------------------>
    </table>
</body>
<gw:textbox id="txtcompany_pk" styles="display: none" />
</html>
