<!-- #include file="../../../system/lib/form.inc"  -->
  <head>
    <title>Change Common Code</title>
  </head>
  
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
 
 <script>
var flag = 0; //not yet modify information
var bAdd=false;
//the columns of Grid
var iDPK                    = 0,
    iDtco_abcodegrp_pk      = 1,
    iDORD                   = 2,
    iDDEF_YN                = 3,
    iDCODE                  = 4,
    iDCode_Name             = 5,
    iDCode_Local_Name       = 6,
    iDCode_Foreign_Name     = 7,
    iDGroup_Code            = 8,
    iDSYS_Y_N               = 9,
    iDUse                   = 10;
    
//PK|_tco_abcodegrp_pk|ORD|DEF YN|CODE|Code Name|Code Local Name|Code Foreign Name|Group Code|SYS Y/N|Use
function BodyInit()
{
    txtGrpCode.text="<%=Request.querystring("code")%>";            
    txtGrpCode.enabled = false;
    txtGrpName.enabled = false;
    OnSearch();    
}

//--------------------------------
function OnSearch()
{
    if (bAdd==false)
        grdDetailCode.ClearData();
    txtCodeGrp_PK.text="";
	datCodeGrp.Call();	
}

//------------------------------------------------------
function OnAddClick()
{
    if (txtCodeGrp_PK.text!="")
    {
        flag =1;
        grdDetailCode.AddRow();
        var irow=grdDetailCode.rows-1;
        grdDetailCode.GetGridControl().TopRow=irow;
        grdDetailCode.SetGridText(irow,1,txtCodeGrp_PK.text);
        if (irow!=1)
            inum=Number(grdDetailCode.GetGridData(irow-1,2)) + 10 ;
        else
            inum = 10;
        grdDetailCode.SetGridText(irow, 2, inum);
        grdDetailCode.SetGridText(irow, iDtco_abcodegrp_pk, txtCodeGrp_PK.text);
        grdDetailCode.SetGridText(irow, iDGroup_Code, txtGrpCode.text);
	}
	else
	    alert("Please search a code");
}
//---------------------------------------------------------------
function OnUpdateClick()
{
        if (checkDupItems(grdDetailCode,4,3) )
        {
            flag = 1;
            datDetailCode.Call();
        }
}
//---------------------------------------------------------------
function checkDupItems(obj_grid,obj_col,obj_col_dis)
{
    var ctrl 	= obj_grid.GetGridControl();
    var rownum 	= ctrl.Rows;
    if(rownum == 1)
    {
	    return false;
    }    
    var i;
    for(i=1; i<rownum; i++)
    {
        if(obj_grid.GetGridData(i, iDCODE) == '')
        {
            alert('Enter code for row ' + i);
            return false;
        }  
        if(obj_grid.GetGridData(i, iDCode_Name) == '')
        {
            alert('Enter code name for row ' + i);
            return false;
        }          
    }    
    for(i=1; i<rownum; i++)
    {
        
      for(j=i+1; j<rownum; j++)
      {
  	    var i_code 	= obj_grid.GetGridData(i, obj_col);
	    i_code		= i_code.toUpperCase();
	    var j_code 	= obj_grid.GetGridData(j, obj_col);
	    j_code		= j_code.toUpperCase();
    	
	    if(j_code == i_code)
	    {
		    if(j_code !="" )
		    {
			    alert("Code already in use, please re-enter at row " + i + " and column " + obj_col_dis );
			    return false;
		    }
	    }
      }	
    }
    return true;
}
//---------------------------------------------------
function OnDeleteClick()
{
    if(confirm("Do you want to delete?"))
    {   flag =1;
        grdDetailCode.DeleteRow();
        ibtnDelete.SetEnable(false);
		ibtnDelete1.SetEnable(true);
    }        
}
//--------------------------------------------------------
function UnOnDeleteClick()
{
    if(confirm("Do you want to undelete?"))
    {
        flag =0;
        grdDetailCode.UnDeleteRow();
        ibtnDelete.SetEnable(true);
		ibtnDelete1.SetEnable(false);
    }    
}
//--------------------------------
function OnDataReceive(obj)
{    
    if (obj.id=="datCodeGrp")
    {       
       if (txtCodeGrp_PK.text=="")
            alert("Can't find code group like this!Please input another.");
       else
       {
            datDetailCode.Call("SELECT");            
       }
    }    
    else if (obj.id=="datDetailCode")
    {
        lblRecord.text=grdDetailCode.rows-1 + " record(s).";
       // auto_resize_column(grdDetailCode,0,grdDetailCode.cols-1,0);
    }   
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
        obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------
function CheckButton(obj)
{
    var ctrl 	= grdDetailCode.GetGridControl();
    var rownum 	= ctrl.Row;
    var rownums 	= ctrl.Rows;
    if(rownum > 0 && rownums>1)
    {
    
        if(grdDetailCode.GetRowStatus(ctrl.Row) >= 64)
        {
                ibtnDelete.SetEnable(false);
                ibtnDelete1.SetEnable(true);
        }
        else
        {
                ibtnDelete.SetEnable(true);
                ibtnDelete1.SetEnable(false);
        }
    }
}
//--------------------------
function OnSelectClick()
{
   var obj=new Array();
    obj[0]=flag;
    
    if (grdDetailCode.row >0)
    {
        obj[1]=grdDetailCode.GetGridData(grdDetailCode.row, iDCODE);
		obj[2]=grdDetailCode.GetGridData(grdDetailCode.row, iDCode_Name);
    }
    else
        obj[1]=0;
    
	window.returnValue = obj; 
	window.close();
}
//-------------------------
function CloseOnClick()
{

    var obj=new Array();
    obj[0]=flag;
    
    if (grdDetailCode.rows > 1)
    {
        obj[1]=grdDetailCode.GetGridData(grdDetailCode.row, iDCODE);
		obj[2]=grdDetailCode.GetGridData(grdDetailCode.row, iDCode_Name);
    }
    else
        obj[1]=0;
    
	window.returnValue = obj; 
	window.close();
}
//-------------------------
function EXITOnClick()
{

	CloseOnClick()
}
//-------------------------
 </script>

<body>

<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8" function="pm_sel_61010010_popup"> 
                <input bind="grdDetailCode" >
                    <input bind="txtCodeGrp_PK" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------->
    <gw:data id="datCodeGrp"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process"  procedure="pm_sel_61010010_popup_1" > 
                <input>                     
                    <input bind="txtGrpCode" />                      
                </input> 
                <output >
                    <output bind="txtGrpCode" />
                    <output bind="txtGrpName" />
                    <output bind="txtCodeGrp_PK" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
<!-- MainTable -->
<table    style='margin-left:10px' cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%">
	<tr style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top">
	    <td>
	        <table border=1 cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
                <tr style="width:100%;height:5%;border:0" valign="middle" cellpadding="0" cellspacing="0">
                    <td style="width:10%;border:0" align="center">Group</td>						
                    <td style="width:20%;border:0" align="left"><gw:textbox id="txtGrpCode" csstype="mandatory" styles='width:95%;' /></td>                    
		            <td width="22%" valign="middle" style="border:0"><gw:textbox id="txtGrpName"  csstype="mandatory" styles='width:95%;' onenterkey ="OnSearch()" />&nbsp;</td>
		            <td width="20%" align="center" style="border:0"><gw:label img="new" id="lblRecord"  style="font-weight:bold;color:red;font-size:12 "  text="0 record(s)"/></td>
		            <td width="4%" style="border:0" align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />  <td>
                    <td width="4%" style="border:0" align="right"><gw:imgBtn img="new"     alt="New"      id="ibtnAdd" 	onclick="OnAddClick()" /></td>					
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="delete"  alt="Delete"   id="ibtnDelete" 	onclick="OnDeleteClick()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="udelete" alt="Undelete" id="ibtnDelete1" onclick="UnOnDeleteClick()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="save"    alt="Save"     id="ibtnUpdate" 	onclick="OnUpdateClick()" /></td>
		            <td width="8%" style="border:0" align="center"><gw:imgBtn img="select"    alt="Select"     id="ibtnSelect" 	onclick="OnSelectClick()" /></td>
		            <td></td>
	            </tr>
            	<tr style="width:100%;height:95%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%" colspan="11" >
				             <gw:grid   
                                        id="grdDetailCode"  
                                        header="_PK|_tco_abcodegrp_pk|ORD|Default|CODE|Code Name|Code Local Name|Code Foreign Name|Use"   
                                        format="0|0|0|3|0|0|0|0|3"  
                                        aligns="0|0|1|1|0|0|0|0|0"  
                                        defaults="||||||||-1"  
                                        editcol="0|0|1|1|1|1|1|1|1"  
                                        widths="0|0|700|1500|1500|2500|2500|2500|500"  
                                        styles="width:100%; height:100%"   
                                        sorting="F"  oncellclick="CheckButton(this)"
                                        /> 

		            </td>
	            </tr>
            </table>
        </td>
	</tr>
</table>
	   
    <gw:textbox id="txtCodeGrp_PK"  styles="display:none" />
    <gw:textbox id="txtGrpName_CODEGRP"  styles="display:none" />
    <gw:textbox id="txtGrpName_CODEGRP_NM"  styles="display:none" />
    <gw:textbox id="txtGrpName_CODE" styles="display:none"/>
    <gw:textbox id="txtGrpName_CODE_NM" styles="display:none"/>
    <gw:textbox id="txtFlag" styles="display:none"/>	
	

</body>
</html>
