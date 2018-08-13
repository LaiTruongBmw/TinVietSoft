<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
}

function OnNew()
{
    grid.AddRow();
    for(i=1;i<grid.rows;i++)
    {
        grid.SetGridText(i,3,i);
    }
}

function OnSave()
{
    for(i=1;i<grid.rows;i++)
    {
        if(grid.GetGridData(i,1)=='')
        {
            grid.SetGridText(i,1,lstCompany.value);
        }
    }
    dso_update.Call();
}

function OnDelete()
{
    if(confirm('Are you sure you want to delete?'))
    {
        grid.DeleteRow();
        dso_update.Call();
    }
}

function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Item':
            var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItem_Cd.text + "&item_name=" + txtItem_Nm.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItem_Pk.text = object[0] ;
                txtItem_Cd.text = object[1];
                txtItem_Nm.text = object[2];
            } 
        break;
        case 'Item_Grid':
            if(grid.col==4 || grid.col==5)
            {
                var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItem_Cd.text + "&item_name=" + txtItem_Nm.text ;
                var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
                if(object != null)
                {
                    grid.SetGridText(grid.row,2,object[0]) ;
                    grid.SetGridText(grid.row,4,object[1]);
                    grid.SetGridText(grid.row,5,object[2]);
                } 
            }
        break;
    }           
}

function OnSearch()
{
    dso_update.Call('SELECT');
}

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_update':
            for(i=1;i<grid.rows;i++)
            {
                    grid.SetGridText(i,3,i);
					grid.SetRowStatus(i , Number("0x00"));
            }
			
        break;
		
		case "dso_pro_load":
			if(Number(txtReturn.text) == 0)
			{
				alert("No have new data to load");
			}
			dso_update.Call("SELECT");
		break ;
    }
}
//----------------------------------------------------------------------------
function OnLoad()
{
	if(confirm("Are you sure you want to load new data?"))
	{
		dso_pro_load.Call();
	}
}
//----------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

<gw:data id="dso_pro_load" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ac_pro_fmgf00520_load" > 
                <input>
                   <input bind="lstCompany" />                            				
                 </input>
                <output>
                    <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
</gw:data>
	
<gw:data id="dso_update" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="ac_sel_fmgf00520"  procedure="ac_upd_fmgf00520"> 
                <input bind="grid" > 
                    <input bind="lstCompany" />
                    <input bind="txtItem_Cd" />
                </input>
                <output bind="grid" /> 
            </dso> 
        </xml> 
    </gw:data>
	
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
    <tr>
                    <td>
                        <fieldset style='width'>
                            <table style='width:100%' cellpadding='1' cellspacing='1'>
                                <tr>
                                    <td align="right" width="10%">Company</td>
                                    <td colspan="" width="35%"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                                    <td align="right" width="10%"><a title="Click here to select Item" onclick="OnPopUp('Item')" href="#tips">Item</td>
                                    <td colspan="" width="40%">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="35%"><gw:textbox id="txtItem_Cd" styles='width:100%'/></td>
                                                <td width="65%"><gw:textbox id="txtItem_Nm" styles='width:100%'/></td>
                                                <td width=""><gw:textbox  id="txtItem_Pk" styles='display:none'/></td>
                                                <td width=""><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="txtItem_Cd.text='';txtItem_Nm.text='';txtItem_Pk.text='';"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width='5%'><gw:icon id="btnLoad" img="in" alt="Load" text="Load" style='width:100%; display:none;' onclick="OnLoad()" /></td>
                                    <td width=""><gw:imgbtn id="btnSearch"    img="search" alt="Search"  styles='width:100%' onclick="OnSearch()"/></td>
                                    <td width=""><gw:imgbtn id="btnSearch"    img="new" alt="New"  styles='width:100%' onclick="OnNew()"/></td>
                                    <td width=""><gw:imgbtn id="btnPrint"     img="save" alt="Save"      style='width:100%; display:;' onclick="OnSave()"/></td>
                                    <td width=""><gw:imgbtn id="btnPrint"     img="delete" alt="Delete"      style='width:100%; display:;' onclick="OnDelete()"/></td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr height='96%'>
                    <!--header  ='0._pk|1.company_pk|2.Item_pk|3.No|4.Item Code|5.Item Name|6.Grade|7.Size|8.Total Weight|9.Standard Weight|10.Loss Weight'-->
                    <td>
                        <gw:grid   
		                id="grid"		    
		                header  ='_pk|_company_pk|_Item_pk|No|Item Code|Item Name|_Acc_pk|Acc. Code|Acc. Name|_WH_Pk|Warehouse Code|Warehouse Name|Grade|Size|Total Weight|Standard Weight|Loss Weight'
		                format  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1'
		                aligns  ='0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
		                defaults='||||||||||||||||'
		                editcol ='0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1'  
		                widths  ='0|0|0|600|1500|2500|0|1500|2500|0|1500|2500|2000|2000|2000|2000|0'  
		                styles  ='width:100%; height:100%'
		                acceptNullDate="T"
		                sorting ='T' 
		                oncelldblclick=""
		                />
                    </td>
                </tr>

</table>
<gw:textbox id="txtReturn" styles="display:none; " />

</body>
</html>