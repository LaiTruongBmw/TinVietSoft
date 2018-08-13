<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>Genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
function BodyInit()
{
	System.Translate(document); 
    txtCompany_PK.text = "<%= Request.querystring("company_pk")%>";
	txtCodeGrp_CD.text="<%= Request.querystring("code")%>";
	txtCodeGrp_CD.SetEnable(false);
	ibtnDelete1.SetEnable(false);
    datCodeGrp.Call();
}

//--------------------------------
function OnSearch()
{
    grdDetailCode.ClearData();
	datDetailCode.Call("SELECT");
}

//------------------------------------------------------
function OnAddClick()
{
    if (txtCodeGrp_PK.text!="")
    {
        grdDetailCode.AddRow();
        var irow=grdDetailCode.rows-1;
        grdDetailCode.GetGridControl().TopRow=irow;
        grdDetailCode.SetGridText(irow,1,txtCodeGrp_PK.text);
		grdDetailCode.SetGridText(irow,9,'-1');
		grdDetailCode.SetGridText(irow,10,'0');
		/*
        if (irow!=1)
            inum=Number(grdDetailCode.GetGridData(irow-1,2))+1;
        else
            inum=1;
        grdDetailCode.SetGridText(irow,2,inum);
		*/
	}
	else
	    alert("Please search a code");
}
//---------------------------------------------------------------
function OnUpdateClick()
{
    if (confirm("Do you want to save?"))
    {
        if (checkNumber() && checkDupItems(grdDetailCode,4,4) )
            flag=1;
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
			    alert("Code already in use, please re-enter at row " + (i+1) + " and column " + obj_col_dis );
			    return false;
		    }
	    }
      }	
    }
    return true;
}
//---------------------------------------------------
function checkNumber()
{
	var ctrl 	= grdDetailCode.GetGridControl();
	var rownum 	= ctrl.Rows;
	
	if(rownum == 1)return false;
	/*
	var i;
	for(i=1; i<rownum; i++)
	{
	 	for(j=7; j <= 11; j++)
		{
			var ij_num 	= grdDetailCode.GetGridData(i, j);
			ij_num		= ij_num.toUpperCase();
			if (isNaN(ij_num))
			{
				alert("Please enter is number at col " + (i) + " and row " + (j-1) );
				return false;
			}
			
		}	
	}
	for(i=1; i<rownum; i++)
	{
	 	var inum=grdDetailCode.GetGridData(i, 2);
	 	if (isNaN(inum) || Trim(inum)=="")
		{
			alert("Please enter is number at col 1 " + " and row " + (i) );
			return false;
		}
		if (Number(inum)<0)
		{
		    alert("Please enter is number at col 1 " + " and row " + (i) );
			return false;
		}
		
	}
	*/
	return true;
}
//--------------------------------
function OnDeleteClick()
{
	if(confirm("Do you want to delete?"))
    {    
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
        //auto_resize_column(grdDetailCode,0,grdDetailCode.cols-1,0);
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
function OnCloseClick()
{
	window.returnValue = null; 
	window.close();
}
//-----------------------------------------------------
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
//-------------------------
function ExitOnClick()
{
	OnCloseClick()
}
//--------------------------
function OnSelectClick()
{
   var obj=new Array();
   if (grdDetailCode.row > 0)
	{
		for(i=0;i<grdDetailCode.cols;i++)
		{
			obj[i] = grdDetailCode.GetGridData(grdDetailCode.row,i);
		}
		window.returnValue = obj; 
		window.close();
	}
	else
	{
		alert("No Row Selected!");
	}
	
}
 </script>

<body>
<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="ac_sel_60010050_commcode_popup" procedure="ac_upd_60010050_commcode_popup"> 
                <input bind="grdDetailCode" >
                    <input bind="txtCodeGrp_PK" />
					<input bind="txtCode_CD" />
					<input bind="txtCode_NM" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------->
    <gw:data id="datCodeGrp"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process"  procedure="acnt.ac_pro_60010050_codegrp_pk" > 
                <input> 
					<input bind="txtCompany_PK" /> 
                    <input bind="txtCodeGrp_CD" /> 
                </input> 
                <output >
                    <output bind="txtCodeGrp_PK" />
                    <output bind="txtCodeGrp_NM" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
<!-- MainTable -->

<table cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%">
	<tr valign="top">
	    <td>
	        <table border=0 cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
                <tr style="height:5%;border:0" valign="middle">
                    <td width="9%" align="center"><b>Code Group</b></td>						
		            <td width="10%" valign="middle" ><gw:textbox id="txtCodeGrp_CD"  csstype="mandatory" styles='width:100%' /></td>
					<td width="5%" align="center" valign="middle"><b>Code</b></td>
					<td width="15%" valign="middle" ><gw:textbox id="txtCode_CD"  styles='width:100%' onenterkey ="OnSearch()" /></td>
					<td width="9%" align="center" ><b>Code Name</b></td>
		            <td align="center" width="22%"><gw:textbox id="txtCode_NM"  styles='width:100%' onenterkey ="OnSearch()" /></td>
					<td align="center" width="13%" ><gw:label img="new" id="lblRecord"  style="font-weight:bold;color:red;font-size:12 "  text="0 record(s)"/></td>
		            <td width="3%" align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" /></td>
                    <td width="3%" align="right"><gw:imgBtn img="new"     alt="New"      id="ibtnAdd" 	onclick="OnAddClick()" /></td>					
		            <td width="3%" align="right"><gw:imgBtn img="delete"  alt="Delete"   id="ibtnDelete" 	onclick="OnDeleteClick()" /></td>  
		            <td width="3%" align="right"><gw:imgBtn img="udelete" alt="Undelete" id="ibtnDelete1" onclick="UnOnDeleteClick()" /></td>  
		            <td width="3%" align="right"><gw:imgBtn img="save"    alt="Save"     id="ibtnUpdate" 	onclick="OnUpdateClick()" /></td>
		            <td width="3%" align="right"><gw:imgBtn img="select"    alt="Select"     id="ibtnSelect" 	onclick="OnSelectClick()" /></td>
		            <td width="3%" align="right"><gw:imgBtn img="cancel"    alt="Close"     id="ibtnClose" 	onclick="OnCloseClick()" /></td>
	            </tr>
            	<tr valign="top" >
		            <td colspan="14">
	<gw:grid id='grdDetailCode'
header='_PK|_TAC_CODE_MASTER_PK|ORD|DEF|Code|Code Name|Code LName|Code FName|GRP Code|Use|_Sys|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHAR 1|CHAR 2|CHAR 3|CHAR 4|CHAR 5|Remark|_ST_DATE|_END_DATE'
format='0|0|0|3|0|0|0|0|0|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||||||||||||'
editcol='0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
widths='0|0|700|700|1000|1500|1500|1500|1000|500|500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0'
sorting='T'
styles='width:100%; height:100%'
oncellclick="CheckButton(this)"
/>
	            </tr>
            </table>
        </td>
	</tr>
</table>
	<gw:textbox id="txtCompany_PK"  styles="display:none" />
	<gw:textbox id="txtCodeGrp_NM"  styles="display:none" />
    <gw:textbox id="txtCodeGrp_PK"  styles="display:none" />
    <gw:textbox id="txtFlag" styles="display:none"/>	
</body>
</html>
