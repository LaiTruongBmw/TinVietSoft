<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BOM OF MATERIAL APPROVE</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""%>

<script>
var 
G_COLUMN = 3,
G_NEW_ITEM = 5;
function BodyInit()
{
	//-----------------------------------------
    var now = new Date(); 
    var  ldate;
    txtUserId.text = "<%=Session("USER_ID")%>"  ;  
    ldate = dtCLFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;          
    dtCLFrom.value=ldate ; 
}
function OnGetPopup(obj)
{
  switch(obj)
    {
        case 'Project':
                var fpath  = System.RootURL + "/form/bd/dp/bddp00012.aspx";
                var oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
                if ( oValue != null )
                {
                    txtProjectPK.text = oValue[0]; 
                    txtProjectCD.text   = oValue[1];
                    txtProjectNM.text   = oValue[2];
                }
        break;    
       case 'Item':
            alert('Will Get Item already create BOM of current project!')
          /*  var fpath = System.RootURL + "/form/bd/dp/bddp00012.aspx";
            oValue = System.OpenModal( fpath , 700 , 500, 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtItem.text   = oValue[0];
            }*/
        break;
        case 'Import':
			var url =System.RootURL + '/form/fp/fa/fpfa00200_import.xls';
        	window.open(url);
		break;       
        
     }		  
}
//-----------------------------------------
function SearchOnClick(p_obj)
{	
    if(p_obj==1)
    {
        if(txtProjectPK.text !="" )
        {
	        idData_fpfa00230_1.Call("SELECT");	
	    }else
	    {
	        alert("Please select project first!");
	    }
	}
}

//====================================================================

function OnReport()
{
      var url =System.RootURL + '/reports/fp/fa/rpt_fpfa00200.aspx?Project='+txtProjectPK.text+'&date_from='+dtCLFrom.value+'&date_to='+dtCLTo.value+'&slip_no='+txtCLNo.text+'&item='+txtItem.text+'&chk_bal='+chkBal.value;
    System.OpenTargetPage(url); 

 }
 //

function OnDataReceive(obj)
{
    lblRecored.text = (grdModify.rows -1 ) + " record(s)."
    if(grdModify.rows>1)
    {        
         grdModify.SetCellBold( 1, G_COLUMN, grdModify.rows - 1, G_COLUMN,   true);   
         grdModify.SetCellBold( 1, G_NEW_ITEM, grdModify.rows - 1, G_NEW_ITEM,   true);
         grdModify.SetCellBgColor( 1, G_NEW_ITEM, grdModify.rows - 1,G_NEW_ITEM, 0x99FFFF );  
    }
	
}

function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

</script>

<html>
<body>	
 	<gw:data id="idData_fpfa00230_1"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpfa00230_1" > 
                <input bind="grdModify">                 
                     <input bind="txtProjectPK" />  
                     <input bind="txtItem" /> 
                     <input bind="dtCLFrom" /> 
                     <input bind="dtCLTo" /> 
                     <input bind="txtSeachText" /> 
                </input> 
                <output bind="grdModify" /> 
            </dso> 
        </xml> 
 	</gw:data> 
<table width="100%" style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
  <tr style="height:2%">    
    <td width="10%" align="right"><b>Date</b></td>
    <td width="8%"><gw:datebox id="dtCLFrom" lang="<%=Session("Lang")%>"  /></td> 
    <td width="2%" align="center"><b>~</b></td>
    <td width="10%"><gw:datebox id="dtCLTo" lang="<%=Session("Lang")%>"  /></td>
    <td width="15%" align="right">
    <b title="Click to get project" style="color:Blue; cursor:hand" onclick="OnGetPopup('Project')">Project</b></td>
    <td width="35%" >
     <gw:textbox id="txtProjectCD" styles="width:30%; display:none" readonly='yes' />   
     <gw:textbox id="txtProjectNM" styles="width:100%" readonly='yes'/></td> 
     <td width="8%"></td> 
     <td width="10%"></td>    
     <td width="2%"><gw:imgBtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="SearchOnClick(1)" /> </td>	
  </tr>
  
 <tr style="height:2%">   
    <td style="width: 10%" align="right">
    <b title="Click to get item" style="color:Blue; cursor:hand" onclick="OnGetPopup('Item')">Item Name</b>
    </td>
    <td style="width: 20%" colspan="3">        
        <gw:textbox id="txtItem" styles="width:100%" onenterkey ="SearchOnClick(1)"/>
    </td>
    <td width="15%" align="right"><b>Search Text</b></td>
    <td width="35%" ><gw:textbox id="txtSeachText" styles="width:100%"  onenterkey ="SearchOnClick(1)"/></td>         			
     
	<td style="width:12%" colspan="2" align="right">
	     <gw:label id="lblRecored" styles='width:100%;color:cc0000;font:9pt;align:right' />       
    </td>
    </tr>  
  <tr style="height:1%">
    <td>
    </td>
    <td>
    </td>
  </tr>
  <tr style="height:95%">
    <td colspan="12" >       
		  <gw:grid id='grdModify' header='Item Name|Mark|IDMark|Column Name|Old Item|New Item|Crt by'
            format='0|0|0|0|0|0|0' 
            aligns='0|0|0|0|1|1|0' 
            check='||||||' 
            editcol='0|0|0|0|0|0|0'
            widths='1500|1500|1500|1500|2000|2000|2000' sorting='T' styles='width:100%; height:100%' />
	</td>
  </tr>
</table>
	
 <gw:textbox id="txtProjectPK" styles="display:none"/>
 
  <gw:textbox id="txtUserId" styles="width: 100%;display: none" />
</body>
</html>