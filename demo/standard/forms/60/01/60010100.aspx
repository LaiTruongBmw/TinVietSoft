<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Material Project Plan</title>
</head>

<script>
function BodyInit()
{   
       
}
function OnSearch()
{
   dsoMaterial.Call("SELECT");
}
function OnDelete()
{
    if(confirm('Are you sure to delete ?'))
            {
                grdMaterial.DeleteRow();
                dsoMaterial.Call();
            }
}
function OnNew()
{
    if(txtProjectPK.GetData()!= "")
    {
        var path = System.RootURL + '/standard/forms/60/01/60010100_popup_item.aspx?group_type=||Y|Y|Y|Y';
                 var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( object != null )
                 {
                        var arrTemp
                        
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                grdMaterial.AddRow();  
                                grdMaterial.SetGridText( grdMaterial.rows-1, 8 , txtProjectPK.text);//txtproject_pk                          
                                grdMaterial.SetGridText( grdMaterial.rows-1, 9, arrTemp[6]);//item_pk	    
                                grdMaterial.SetGridText( grdMaterial.rows-1, 1, arrTemp[0]);//item_code	    
                                grdMaterial.SetGridText( grdMaterial.rows-1, 2, arrTemp[1]);//item_name	    
                                grdMaterial.SetGridText( grdMaterial.rows-1, 3, arrTemp[3]);//item_uom
                                grdMaterial.SetGridText( grdMaterial.rows-1, 6 ,-1);//use yn
                        }		            
                 }
     } 
     else
     {
        alert("Please, choose project name.");
     }               
}
function OnSave()
{
   if(CheckSaveValid())
   {
        dsoMaterial.Call();
   }
}
function CheckSaveValid()
{
    for (var i = 1; i< grdMaterial.rows; i++)
    {
        if(grdMaterial.GetGridData(i,3) =="")
            {
                alert('Please, Input Unit.')
                 return false;
            }
        if(grdMaterial.GetGridData(i,4) =="")
            {
                alert('Please, Input Quantity.')
                 return false;
            }
    }
    return true;
}
function OnPopUp()
{
    fpath = System.RootURL + "/standard/forms/60/01/60010100_popup.aspx";
            oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtProjectPK.text   = oValue[2]; 
                txtProjectName.text = oValue[1];
            }   
}
function OnProjectReset()
{
     txtProjectPK.text   =""; 
     txtProjectName.text ="";
}
function OnDataReceive(po_oData)
{
     switch(po_oData.id)
     {
        case "dsoMaterial":
            
        break;
     }
}
</script>

<body bgcolor='#F5F8FF'>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dsoMaterial" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"   parameter="0,1,2,3,4,5,6,7,8,9" function="ac_sel_60010100" procedure="ac_upd_60010100"> 
                <input bind="grdMaterial">                    
                    <input bind="txtProjectPK" /> 
                </input> 
                <output bind="grdMaterial" />
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td width="8%">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp()"><b style="color: Red"></b>
                                Project</b>
                        </td>
                        <td width="32%">
                            <gw:textbox id="txtProjectName" readonly="T" />
                        </td>
                        <td width="5%">
                            <gw:imgbtn img="reset" id="idReset" alt="Reset" onclick="OnProjectReset()" />
                        </td>
                        <td width="43%">
                        </td>
                        <td style="width: 3%">
                           <gw:imgbtn id="btnSearch" img="search" onclick='OnSearch()' />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                    <!--header='0._PK|1._TAC_ABPLCENTER_PK|2.Project|3._TCO_ITEM_PK|4.Item Code|5.Item Name|6.Uom|7.Quantity|8.Description|9.Use YN'-->
                    <!--header='0.Project|1.Item Code|2.Item Name|3.Uom|4.Quantity|5.Description|6.Use YN|7._PK|8._TAC_ABPLCENTER_PK|9._TCO_ITEM_PK'-->
                        <td colspan="8">
                            <div style="width:100%; height:96%; overflow:auto;">
					<gw:datagrid    
                            id='grdMaterial' 
                            header='Project|Item Code|Item Name|Uom|Quantity|Description|Use YN|_PK|_TAC_ABPLCENTER_PK|_TCO_ITEM_PK'
                                format='0|0|0|0|0|0|3|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0|0|0' 
                                defaults='|||||||||'
                                editcol='0|0|0|1|1|1|10|0|0' 
                                widths='200|100|200|80|100|300|70|0|0|0'
                                sorting='T' 
                                paging="true" pageview="20"
                                styles='width:100%; height:100%' 
                                autosize="T" />
                                </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtProjectPK" style="display: none" />
</body>
