<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>genuwin</title>
  </head>  
<%  CtlLib.SetUser(Session("APP_DBUSER"))%> 
 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    grdExp.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
    txtRec_PK.text = "<%=Request.querystring("rec_pk")%>";
    OnSearch();
    
}

//--------------------------------
function OnSearch()
{
    datExperience.Call("SELECT");
}

//------------------------------------------------------
function OnAddClick()
{
        grdExp.AddRow();
        grdExp.SetGridText(grdExp.rows-1, 1, txtRec_PK.text);
}
//---------------------------------------------------------------
function OnUpdateClick()
{
    if (confirm("Do you want to save?"))
    {
        datExperience.Call();
    }
}

//--------------------------------
function OnDeleteClick()
{
    if(confirm("Do you want to delete?"))
    {    
        grdExp.DeleteRow();
        ibtnDelete.SetEnable(false);
		ibtnDelete1.SetEnable(true);
    }
        
}

//--------------------------------

function OnDataReceive(obj)
{
    
    if (obj.id=="datDetailCode")
    {
        lblRecord.text=grdExp.rows-1 + " record(s).";
        auto_resize_column(grdExp,0,grdExp.cols-1,0);
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
   
	var obj=new Array();
    obj[0]=flag;
    obj[1]=0;
	window.returnValue = obj; 
	window.close();
}

//-------------------------
function ExitOnClick()
{
    alert("1");
	OnCloseClick()
}
//--------------------------
function OnSelectClick()
{
   var obj=new Array();
    obj[0]=flag;
    
    if (grdExp.row > 1)
    {
        obj[1]=grdExp.GetGridData(grdExp.row,3);
    }
    else
        obj[1]=0;
    
	window.returnValue = obj; 
	window.close();
}
 </script>

<body>
<!---------------------------------------------------------->
<gw:data id="datExperience" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8" function="hr_CHPR10190001_sel_rec_exp" procedure="hr_CHPR10190001_upd_rec_exp"> 
                <input bind="grdExp" >
                    <input bind="txtRec_PK" />
                </input>
                <output  bind="grdExp" />
            </dso> 
        </xml> 
</gw:data> 

<!-- MainTable -->
<table    style='margin-left:10px' cellpadding="0" cellspacing="0" border="1" style="width:100%;height:100%">
	<tr style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top">
	    <td>
	        <table border=1 cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
                <tr style="width:100%;height:5%;border:0" valign="middle" cellpadding="0" cellspacing="0">
                    <td style="width:30%;border:0" align="center">
                        <font style="font-size:14; color:red"> Experience List</font>
                    </td>						
		            <td width="20%" valign="middle" style="border:0"></td>
		            <td width="22%" align="right" style="border:0"><gw:label img="new" id="lblRecord"  style="font-weight:bold;color:red;font-size:12 "  text="0 record(s)"/></td>
		            <td width="4%" style="border:0" align="right">  <td>
                    <td width="4%" style="border:0" align="right"></td>					
		            <td width="4%" style="border:0" align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="new"     alt="New"      id="ibtnAdd" 	onclick="OnAddClick()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="delete"  alt="Delete"   id="ibtnDelete" 	onclick="OnDeleteClick()" /></td>
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="save"    alt="Save"     id="ibtnUpdate" 	onclick="OnUpdateClick()" /></td>
		            <td width="4%"style="border:0" align="right"><gw:imgBtn img="cancel"    alt="Close"     id="ibtnClose" 	onclick="OnCloseClick()" /></td>
	            </tr>
            	<tr style="width:100%;height:95%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%" colspan=11 >
				             <gw:grid   
                                        id="grdExp"  
                                        header="_PK|_THR_EMP_PK|No|Old Company|Old Position|Salary|Senior(From - To)|Reason Left|Remark"   
                                        format="0|0|0|0|0|-0|0|0|0"  
                                        aligns="1|0|1|1|1|0|0|0|0"  
                                        defaults="||||||||"  
                                        editcol="0|0|0|1|1|1|1|1|1"  
                                        widths="0|0|500|2000|1500|1500|2000|2000|1000"  
                                        styles="width:100%; height:100%"   
                                        sorting="F" 
                                        /> 

		            </td>
	            </tr>
            </table>
        </td>
	</tr>
</table>
	   
    <gw:textbox id="txtCodeGrp_PK"  styles="display:none" />
    <gw:textbox id="txtInput_CODEGRP"  styles="display:none" />
    <gw:textbox id="txtInput_CODEGRP_NM"  styles="display:none" />
    <gw:textbox id="txtInput_CODE" styles="display:none"/>
    <gw:textbox id="txtInput_CODE_NM" styles="display:none"/>
    <gw:textbox id="txtFlag" styles="display:none"/>	

	<gw:textbox id="txtRec_PK" styles="display:none"/>

</body>
</html>
