<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Pop Up Get Partner</title>
</head>


<script>

var G_PARTNER_PK   = 0,
    G_PARTNER_ID   = 1,
    G_PARTNER_NM   = 2,
    G_LOCAL_NM     = 3,
    G_FOREIGN_NM   = 4,
    G_PARTNER_TYPE = 5,
    G_TAX_CODE     = 6,
    G_ADDRESS      = 7,
    G_ADD_2        = 8,
    G_ADD_3        = 9,
    G_PHONE_NO     = 10,    
    G_FAX          = 11,      
    G_REMARK       = 12;
//-----------------------------------------------------------

function BodyInit()
{
	//--------------------	
	System.Translate(document);
	//--------------------		
	var data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGGS0106') FROM DUAL" )%>||";    
    lstPartnerType.SetDataText(data);
	lstPartnerType.value = "" ;
	//--------------------	
	var  company_pk = "<%=Session("COMPANY_PK")%>" ;
	
	data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>||";
    lstCompany.SetDataText(data);
    lstCompany.value = company_pk ;
	//--------------------	
    
	var  partner    = "<%=request.QueryString("partner_type")%>" ;
    var  partner_id = "<%=request.QueryString("partner_id")%>" ;

    if ( partner == 'AR' )
    {
        chkAR_YN.value = 'Y'; 
    }
    else if ( partner == 'AP' )    
    {
        chkAP_YN.value = 'Y';
    }
    else
    {
        chkAR_YN.value = 'Y'; 
        chkAP_YN.value = 'Y';
    }
    
    txtCustomer.text = partner_id;
    
   // data_colg00200.Call("SELECT");
}

//-----------------------------------------------------------

function OnSearch()
{
    data_colg00200.Call("SELECT");
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
    <gw:data id="data_colg00200" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_colg00200_0" > 
                  <input bind="idGrid" > 
				  	<input bind="lstCompany" />
				  	<input bind="lstPartnerType" />
                    <input bind="txtCustomer" /> 
                    <input bind="chkAR_YN" />
                    <input bind="chkAP_YN" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
			<td style="width: 20%">
                <gw:list id="lstCompany" styles='width:100%' onchange="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                Partner
            </td>
			<td style="width: 20%">
                <gw:list id="lstPartnerType" styles='width:100%' onchange="OnSearch()" />
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtCustomer" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%" align="right">
                Customer
            </td>
            <td style="width: 5%" align="left">
                <gw:checkbox id="chkAR_YN" defaultvalue="Y|N" value="N" />
            </td>
            <td style="width: 10%" align="right">
                Supplier
            </td>
            <td style="width: 5%" align="left">
                <gw:checkbox id="chkAP_YN" defaultvalue="Y|N" value="N" />
            </td>
            <td style="width: 3%" align="right">
                <gw:imgbtn id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="idSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <!------------------------------------------------------------------------>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id="idGrid" header="_PK|Cust ID|Cust Name|F Name 01|F Name 02|_PARTNER_TYPE|_TAX_CODE|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_FAX|_REMARK"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0"
                    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1000|3000|2500|2500|0|0|4000|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="T" 
                    oncelldblclick="OnSelect()" />               
            </td>
        </tr>
        <!------------------------------------------------------------------------>
    </table>
</body>
</html>
