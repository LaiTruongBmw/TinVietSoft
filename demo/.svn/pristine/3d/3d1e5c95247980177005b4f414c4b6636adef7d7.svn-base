<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>SO/PO Level</title>
</head>
<script>
var _bLoad = false;
function BodyInit()
{
    System.Translate(document); 
}
//----------------------------------------Object's Function------------------------------------------------------
    function FunctionSearch(obj)
    {
        switch(obj)
        {
            case 1:// Search List of Objects
                 if(CheckGridUpDateSatatus(grdFunc))
                 {
                    if(confirm("Do you want to save first !"))
                    {
                        FunctionSave();
                    }
                 }
                    grdFunc.ClearData();
                    txtObjectPK.text = "";
                    dsoObjectList.Call("SELECT")
            break;
            case 2:// Search Object's Function
                  if(CheckGridUpDateSatatus(grdFunc))
                 {
                    if(confirm("Do you want to save first !"))
                    {
                        FunctionSave();
                    }
                 }
                txtObjectPK.text = grdObjList.GetGridData(grdObjList.row,0);
                dsoFunction.Call("SELECT")
              break;
        }
       
    }
    function FunctionAdd()
    {
        if(txtObjectPK.text == "")
        {
            alert("Please,Select an Object!!!")
        }else
        {
            grdFunc.AddRow();
            grdFunc.GetGridControl().TopRow = grdFunc.rows-1   
            grdFunc.SetGridText(grdFunc.rows-1,1,txtObjectPK.text)// Grant Object Pk to Function
           
        }
    }
    function FunctionDelete()
    {
        if ( grdFunc.GetGridData( grdFunc.row, 0 ) == "" ) 
		    {						
				grdFunc.RemoveRow();					
			}			
			else 
			{
				if ( confirm( "Do you want to mark this row to delete?" ) ) 
				{
					grdFunc.DeleteRow();
				}				
			}
    }
    function FunctionUnDelete()
    {
        if(grdFunc.row>0 && grdFunc.rows>1)
         {
            if ( confirm ( "Do you want to undelete?" ) ) 
                {				
					grdFunc.UnDeleteRow()
				}
         }
    }
    function FunctionSave()
    {
        for (var i=1; i<= grdFunc.rows -1 ; i++)
        {
            if(grdFunc.GetGridData(i,4)=="" || grdFunc.GetGridData(i,2)=="")
            {
                alert("Please,Input Control Id and Function Name!!")
                return;
            }
        }
        dsoFunction.Call();
    }
//----------------------------------------End Object's Function--------------------------------------------------

function OnDataReceive(obj)
{

}
function CheckGridUpDateSatatus(obj)
{
    for(var i =1 ; i< obj.rows; i++ )
    {
        if(obj.GetRowStatus(i) >0)
        {
            return true;
        }
    }
    return false;
}
//----------------------------------------Role Function Mapping--------------------------------------------------
    function OnSearchRole(id)
    {
        switch (id)
        {
            case 1://search Role list
                dsoRole.Call("SELECT");
            break;
            case 2://search Objects of Role
                txtRolePK.text = grdRoleList.GetGridData(grdRoleList.row,0) //Role pk
                lblRoleName.text = grdRoleList.GetGridData(grdRoleList.row,1) //Role Name
                dsoRoleOject.Call("SELECT")
            break;
            case 3://search Function of Role
                txtRoleObjectPK.text = grdRoleObjList.GetGridData(grdRoleObjList.row,1) //Object pk
                dsoRoleFunction.Call("SELECT")
            break;
        }
    }
    function OnRoleFunctionSave()
    {
               dsoRoleFunction.Call()
    }
//----------------------------------------End Role Function Mapping-----------------------------------------------

</script>

<body>
    <!---------------------------Object's Function ----------------------------->
    <gw:data id="dsoObjectList"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" function="sale.sp_sel_agds00040_01"  > 
            <input bind="grdObjList"  > 
			    <input bind="txtObjectFilter" /> 
                <input bind="chkActive" /> 			
            </input> 
            <output bind="grdObjList" /> 
        </dso> 
    </xml> 
    </gw:data> 
     <gw:data id="dsoFunction"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="grid" function="sale.sp_sel_agds00040_02" parameter="0,1,2,3,4" procedure="sale.sp_upd_agds00040_02"> 
                <input bind="grdFunc"  > 
		            <input bind="txtObjectPK" /> 
                </input> 
                <output bind="grdFunc" /> 
            </dso> 
        </xml> 
    </gw:data> 
    <!---------------------------End Object's Function ----------------------------->
    <!---------------------------Role Function Mapping ----------------------------->
        <gw:data id="dsoRole"  onreceive="OnDataReceive(this)" > 
	        <xml> 
		        <dso type="grid"  function="sale.sp_sel_agds00040_11"  > 
			        <input bind="grdRoleList" > 
			            <input bind="txtRoleName" />
			        </input> 
			        <output bind="grdRoleList" /> 
		        </dso> 
	        </xml> 
        </gw:data> 
         <gw:data id="dsoRoleOject"  onreceive="OnDataReceive(this)" > 
	        <xml> 
		        <dso type="grid"  function="sale.sp_sel_agds00040_12"  > 
			        <input bind="grdRoleObjList" > 
			            <input bind="txtRolePK" />
			            <input bind="txtObjNM" />
			        </input> 
			        <output bind="grdRoleObjList" /> 
		        </dso> 
	        </xml> 
        </gw:data> 
         <gw:data id="dsoRoleFunction"  onreceive="OnDataReceive(this)" > 
	        <xml> 
		        <dso type="grid"  function="sale.sp_sel_agds00040_13" parameter="0,1,2,3,9" procedure="sale.sp_upd_agds00040_13" > 
			        <input bind="grdMapping" > 
			           <input bind="txtRoleObjectPK" /> 
			           <input bind="txtRolePK" />
			         </input> 
			        <output bind="grdMapping" /> 
		        </dso> 
	        </xml> 
        </gw:data> 
    <!---------------------------End Role Function Mapping ------------------------->
<gw:tab id="idTab"  > 
        <table name="Function Entry" class="table" width="100%" border=1 style="height:100%">
            <tr style="height:100%">
                <td width="30%">
                    <table width="100%" style="height:100%">
                        <tr style="height:5%">
                            <td width="12%"><b>Object Name</b></td>
                            <td width="20%"><gw:textbox id="txtObjectFilter" csstype="filter" /></td>
                            <td width="5%"><b>Active</b></td>
                            <td width="5%"><gw:checkbox id="chkActive" mode="01" value="-1"/></td>
                            <td width="3%"><gw:imgBtn id="btnSearch1" img="search" alt="Search" onclick="FunctionSearch(1)" /></td>
                        </tr>
                        <tr style="height:95%">
                            <td colspan="5">
                                 <gw:grid  id="grdObjList"  
					            header="_PK|Object ID|Object Name"
					            format="0|0|0"  
					            aligns="0|0|0"  
					            defaults="|||"  
					            editcol="0|0|0"  
					            widths="0|1500|3000"  
					            styles="width:100%; height:100%"   
					            sorting="T"  
					            onSelChange="FunctionSearch(2)" 
					            /> 
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="70%">
                     <table width="100%" style="height:100%">
                         <tr style="height:5%">
				            <td width="88%"></td>
				            <td width="3%"><gw:imgBtn id="idBtnAdd" img="new" alt="Add" text="New" onclick="FunctionAdd()"/> </td>
				            <td width="3%"><gw:imgBtn id="idDelete" img="delete" alt="Remove" text="Delete" onclick="FunctionDelete()"/> </td>				
				            <td width="3%"><gw:imgBtn id="idUDelete" img="udelete" alt="UnRemove" text="UnDelete" onclick="FunctionUnDelete()"/> </td>								
				            <td width="3%"><gw:imgBtn id="idBtnUpdate" img="save" alt="Save" text="Save" onclick="FunctionSave()"/></td>
			            </tr>
                        <tr>
                            <td style="height:95%" colspan="5">
                                <gw:grid id='grdFunc'
                                header='_PK|_obj_pk|Function Name|Description|Control Id'
                                format='0|0|0|0|0'
                                aligns='0|0|0|0|0'
                                defaults='||||'
                                editcol='1|1|1|1|1'
                                widths='0|0|3000|5000|2000'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table name="Role Function Mapping" class="table" width="100%" border="1" style="height:100%">
        <tr style="height:100%" >
        <td width="40%" >
                <table  width="100%" style="height:100%">
                    <tr style="height:5%">
                        <td>
                            <table width="100%">
                                <tr>
                                    <td width="15%"><b>Role Name</b></td>
                                    <td width="60%" ><gw:textbox id="txtRoleName" csstype="filter"  styles="100%"/></td>
                                    <td width="3%"><gw:imgBtn id="btnSearchRole" img="search" alt="Search" onclick="OnSearchRole(1)" /></td>
                                </tr>
                            </table>
                        </td>   
                    </tr>
                    <tr style="height:45%" style="width:100%">
                        <td>
                              <gw:grid   
                                id="grdRoleList"  
                                header="_PK|Role Name|_Use|_Create By|_Create Date"   
                                format="0|0|1|0|0"  
                                aligns="0|0|0|0|0"  
                                defaults="||0||"  
                                editcol="0|0|0|0|0"  
                                widths="0|0|0|0|0"  
                                styles="width:100%; height:100%"   
                                sorting="T"   
                                param="0,1,2,3,4" onSelChange="OnSearchRole(2)" /> 
                        </td>
                    </tr>
                    <tr style="height:5%">
                            <td>
                                <table>
                                    <tr>
                                       <td width="5%"><b>Role</b></td>
                                       <td width="40%" align="left">
                                       <gw:label id="lblRoleName" styles="color:red" /></td>
                                       <td width="12%"><b>Obj Nm</b></td>
                                       <td width="40%" ><gw:textbox id="txtObjNM" csstype="filter" /></td>
                                       <td width="3%"><gw:imgBtn id="btnSearObj" img="search" alt="Search" onclick="OnSearchRole(2)" /></td>
                                    </tr>
                                </table>
                            </td>
                    </tr>
                    <tr style="height:45%" >
                        <td>
				        <gw:grid   
					    id="grdRoleObjList"  
					    header="_PK|_obj_pk|Object ID|Object Name"
					    format="0|0|0|0"  
					    aligns="0|0|0|0"  
					    defaults="||||"  
					    editcol="0|0|0|0"  
					    widths="0|0|1500|2000"  
					    styles="width:100%; height:100%"   
					    sorting="T"   
					    param="0,1,2,3" acceptNullDate="true"  onclick="OnSearchRole(3)" /> 
				        </td>
                    </tr>
                </table>
	    </td>
	   <td rowspan=2 width="60%" valign="top" style="height:100%" >
		<table width="100%" style="height:100%" >
			<tr style="height:5%">
				<td width="88%"></td>
				<td width="3%"><gw:imgBtn id="idBtnUpdate1" img="save" alt="Save" text="Save" onclick="OnRoleFunctionSave()"/></td>
			</tr>
			<tr style="height:95%">
				<td colspan="5">
                       <gw:grid id='grdMapping'
                        header='_PK|_ROLEOBJECT_PK|_FUNCTION_PK|Not Allow|Oject ID|Object NM|Function Name|Function Desc|_control_id|_role_pk'
                        format='0|0|0|3|0|0|0|0|0|0'
                        aligns='0|0|0|0|0|0|0|0|0|0'
                        defaults='||||||||||'
                        editcol='0|0|0|1|0|0|0|0|0|0'
                        widths='0|0|0|1000|1500|2000|2500|2500|0|0'
                        sorting='T'
                        styles='width:100%; height:100%'
                        />
                 </td>
			</tr>
		</table>
	</td>
  </tr>
</table> 
</gw:tab>	  
</body>
<gw:textbox id="txtObjectPK"  text="" styles="display:none" /> 
<gw:textbox id="txtRolePK"  text="" styles="display:none" /> 
<gw:textbox id="txtRoleObjectPK"  text="" styles="display:none" /> 
</html>