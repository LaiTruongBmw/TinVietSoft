<!-- Popup dung de get customer tuong tu popupgetpartnet.aspx -->
<!-- #include file="../../../../system/lib/form.inc"  -->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _selected = false;
var _cust_pk = 0;

function BodyInit()
{  
    System.Translate(document);
    var l_company_pk  = "<%=Request.QueryString("com_pk")%>";
    var l_AR  = "<%=Request.QueryString("AR")%>";
    var l_AP  = "<%=Request.QueryString("AP")%>";
    var l_company  = "<%=Request.QueryString("company")%>";
    if(l_AR =="")
    {
        l_AR = "N";
    }
    if(l_AP =="")
    {
        l_AP = "N";
    }
    if(l_company =="")
    {
        l_company = "N";
    }
    
    chkAR_YN.value = l_AR
    
	chkAP_YN.value = l_AP
	chkCO_YN.value = l_company
    
	txtCompanyPk.text = l_company_pk;
}
function OnSearch1()
{
    datGetCustomer.Call("SELECT");
}

function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, _cust_pk);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
        }		
	}
    
    countItem();    
}
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, _cust_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
function CheckDataExist(p_oGrid,p_value)
{
    
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, _cust_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}

function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, _cust_pk);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
   }	  
	  
}
function DblClick()
{
     if(event.row > 0 )
      {
            var col_val = idGrid.GetGridData(event.row, _cust_pk );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
                SetRowBackGroundColor(idGrid,col_val,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<idGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,idGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}    
function OnResetCust()
{
    txtCustomerName.text = "";
    txtCustomerID.text = "";
}

</script>
<body style="margin:0; padding:0;">

    
    <gw:data id="datGetCustomer" >
	<xml>
		<dso type="grid" function="ac_sel_60090010_vendor_popup" >
			<input bind="idGrid">
				 <input bind="txtCustomerID"/>
				 <input bind="txtCustomerName"/>
				 <input bind="chkAR_YN" />
				<input bind="chkAP_YN" />
				<input bind="chkCO_YN" />
				<input bind="txtTaxCode" />
				<input bind="txtCompanyPk" />
			</input>
			<output bind="idGrid"/>
		</dso>
	</xml>
  </gw:data>

    <table  width=100%>
	<tr style="width:100%; height:5%">
	    <td width=5%><b>Partner</b>
		<td width=50%>
		    <table width=100% border = 0 cellpadding= 0 cellspacing= 0 >
		    <tr>
		        <td width=25%><gw:textbox id="txtCustomerID"    	csstype="mandatory"   styles="width:100%" onenterkey="OnSearch1()"  /></td>
				  <td width=40%><gw:textbox id="txtCustomerName"    	csstype="mandatory"  styles="width:100%" onenterkey="OnSearch1()"  /></td>
				  <td width=25%><gw:textbox id="txtTaxCode"    	styles="width:100%" onenterkey="OnSearch1()" /></td>
        		<td align="left" width=10%><gw:imgBtn id="btnResetCust" img="reset" alt="Reset"         onclick="OnResetCust()"/></td>
		    </tr>
		    </table>
		</td>
		<td width=5%></td>
		
		<td width=10%><b>Vendor<b></td>
		<td width=5%><gw:checkbox id="chkAP_YN" defaultvalue="Y|N" value="Y" /></td>
		<td width=10%><b>Customer<b></td>
		<td width=5%><gw:checkbox id="chkAR_YN" defaultvalue="Y|N" value="N" /></td>
		<td width=10%><b>Company<b></td>
		<td width=5%><gw:checkbox id="chkCO_YN" defaultvalue="Y|N" value="N" /></td>		
		<td width=5%><gw:imgBtn id="idSearch" img="search" alt="Search" onclick="OnSearch1()" /></td>					
	</tr>
	<tr style="width:100%; height:45%">
	    <!--0_c.PK|1.Cust ID|2.Cust Name|3.Local Name|4_FOREIGN_NM|5_PARTNER_TYPE|6.TAX CODE|7.SERIAL NO|8.FORM NO|9.ADDRESS|10_ADD_2|11_ADD_3|12_PHONE_NO|13_EMAIL|14_FAX|15_WEBSITE|16_SALE_PRESENT|17_COM_YN|18_CUS_YN|19_CUS_ACTIVE_YN|20_VEN_YN|21_VEN_ACT_YN|22_ACT_YN|23_VALID_F|24_VALID_T|25_DESCRIPT--->
	    <td colspan=12>
			
			<gw:grid   
			id="idGrid"  
			header="_c.PK|Cust ID|Cust Name|Local Name|_FOREIGN_NM|_PARTNER_TYPE|TAX CODE|SERIAL NO|FORM NO|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_EMAIL|_FAX|_WEBSITE|_SALE_PRESENT|_COM_YN|_CUS_YN|_CUS_ACTIVE_YN|_VEN_YN|_VEN_ACT_YN|_ACT_YN|_VALID_F|_VALID_T|_DESCRIPT|Due day AP|Due day AR"   
			format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			defaults="||||||||||||||||||||||||||||"  
			editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
			widths="0|1000|3000|4000|0|0|1550|1000|1000|1000|4000|0|0|0|0|0|0|0|0|0|0|0|0|0|2000|1500"  
			styles="width:100%; height:100%"   
			sorting="T"   
			acceptNullDate
			onkeyupedit="DblClick()"
			oncelldblclick= "DblClick()" /> 
	    </td>
	</tr>
	  <tr style="height: 5%">
            <td colspan="8">
                <table>
                    <tr>
                        <td style="width: 50%" align="center">
                            <gw:label id="lblRecord2" styles="color: blue; white-space:nowrap"></gw:label>
                        </td>
                        <td style="width: 46%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
	<tr style="width:100%; height:45%">
	    <!--0_c.PK|1.Cust ID|2.Cust Name|3.Local Name|4_FOREIGN_NM|5_PARTNER_TYPE|6.TAX CODE|7.SERIAL NO|8.FORM NO|9.ADDRESS|10_ADD_2|11_ADD_3|12_PHONE_NO|13_EMAIL|14_FAX|15_WEBSITE|16_SALE_PRESENT|17_COM_YN|18_CUS_YN|19_CUS_ACTIVE_YN|20_VEN_YN|21_VEN_ACT_YN|22_ACT_YN|23_VALID_F|24_VALID_T|25_DESCRIPT--->
	    <td colspan=12>
			
			<gw:grid   
			id="idGrid2"  
			header="_c.PK|Cust ID|Cust Name|Local Name|_FOREIGN_NM|_PARTNER_TYPE|TAX CODE|SERIAL NO|FORM NO|ADDRESS|_ADD_2|_ADD_3|_PHONE_NO|_EMAIL|_FAX|_WEBSITE|_SALE_PRESENT|_COM_YN|_CUS_YN|_CUS_ACTIVE_YN|_VEN_YN|_VEN_ACT_YN|_ACT_YN|_VALID_F|_VALID_T|_DESCRIPT|Due day AP|Due day AR"   
			format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			defaults="||||||||||||||||||||||||||||"  
			editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
			widths="0|1000|3000|4000|0|0|1550|1000|1000|1000|4000|0|0|0|0|0|0|0|0|0|0|0|0|0|2000|1500"  
			styles="width:100%; height:100%"   
			sorting="T"   
			acceptNullDate
			 /> 
	    </td>
	</tr>
</table >
<gw:textbox id="txtCompanyPk" styles="display:none" />
</body>
</html>
