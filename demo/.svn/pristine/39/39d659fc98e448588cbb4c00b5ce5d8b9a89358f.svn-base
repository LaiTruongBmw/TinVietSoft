<!-- #include file="../../../../system/lib/form.inc"  -->
  <head>
    <title>Minus Profiles</title>
  </head>  
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>  
 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    grdDetailCode.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document); 
    txtInput.text="<%=Request.querystring("code")%>";
    txtRec_PK.text ="<%=Request.querystring("rec_pk")%>";
    OnSearch();    
}

//--------------------------------
function OnSearch()
{
    if (bAdd==false)
        grdDetailCode.ClearData();
    if (rdoKIND.value==1)
    {
        txtInput_CODEGRP.text=txtInput.text;
        txtInput_CODEGRP_NM.text="";
    }
    else
    {
        txtInput_CODEGRP.text="";
        txtInput_CODEGRP_NM.text=txtInput.text;
    }
    txtCodeGrp_PK.text="";
    txtFlag.text=rdoKIND.value;
    
	datCodeGrp.Call();
	
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
        if (irow!=1)
            inum=Number(grdDetailCode.GetGridData(irow-1,2))+1;
        else
            inum=1;
        grdDetailCode.SetGridText(irow,2,inum);
	}
	else
	    alert("Please search a code");
}
//---------------------------------------------------------------
function OnUpdateClick()
{
    if (confirm("Do you want to save?"))
    {
        if (checkNumber()== true && checkDupItems(grdDetailCode,3,2)== true )
        {
            flag=1;
            datDetailCode.Call();
        }
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
	
	var i;
	for(i=2; i<rownum; i++)
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
	for(i=2; i<rownum; i++)
	{
	 	var inum=grdDetailCode.GetGridData(i, 3);
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
		else if(inum.length !=2)
        {
            alert("Please enter two number character  at col 2 "+"and row " +(i) );
            return false;
        }
	}
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
            if (rdoKIND.value==1)
               txtInput.text=txtInput_CODEGRP.text;
            else
                txtInput.text=txtInput_CODEGRP_NM.text;
            datDetailCode.Call("SELECT");
            
       }
    }    
    else if (obj.id=="datDetailCode")
    {
        

        lblRecord.text=grdDetailCode.rows-1 + " record(s).";
        auto_resize_column(grdDetailCode,0,grdDetailCode.cols-1,0);
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
//function OnSelectClick()
//{
//   var obj=new Array();
//   // obj[0]=flag;
//    
//    if (grdDetailCode.row > 1)
//    {
//        for(var i=1; i<grdDetailCode.rows-1; i++)
//        {

//                var arrTemp=new Array();
//                for(var j=0;j<grdDetailCode.cols;j++)
//                 {
//                    arrTemp[arrTemp.length]= grdDetailCode.GetGridData(i,j);
//                 }
//                 obj[arrTemp.length] = arrTemp;
//            }
//        }
//        if ( obj !=null )
//	      {
//		    window.returnValue =  obj;
//		    window.close();
//	      }
//	      else
//	      {
//	        alert("You have not selected data yet.");
//	      }
//        
//    }

//}
//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      
          for(var i=1;i<oGrid.rows;i++)
          {
            if(oGrid.GetGridData(i,2)== "-1")
            {
                 var arrTemp=new Array();
         
                 for(var j=0;j<oGrid.cols;j++)
                 {
                    arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
                 }
         
                 arr_data[arr_data.length]= arrTemp;
            }
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
 </script>

<body>
<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="hr_CHPR10190001_SEL_PROFILE" procedure="hr_CHPR10190001_upd_profile"> 
                <input bind="grdDetailCode" >
                    <input bind="txtRec_PK" />
                    <input bind="txtCodeGrp_PK" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------->
    <gw:data id="datCodeGrp"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process"  procedure="hr_CHPR10190001_codegrppk" > 
                <input> 
                    <input bind="txtFlag" /> 
                    <input bind="txtInput_CODEGRP" /> 
                    <input bind="txtInput_CODEGRP_NM" /> 
                </input> 
                <output >
                    <output bind="txtInput_CODEGRP" />
                    <output bind="txtInput_CODEGRP_NM" />
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
                    <td style="width:30%;border:0" align="center">
                        <gw:radio id="rdoKIND" value="1" > 
                            <span value="1" > <font color="black" ><b>Code Group</b> </font></span>
                            <span value="2" > <font color="black" ><b>Code Group Name</b> </font> </span>
                        </gw:radio >
                    </td>						
		            <td width="20%" valign="middle" style="border:0"><gw:textbox id="txtInput"  csstype="mandatory" styles='width:95%' onenterkey ="OnSearch()" />&nbsp;</td>
		            <td width="22%" align="center" style="border:0"><gw:label img="new" id="lblRecord"  style="font-weight:bold;color:red;font-size:12 "  text="0 record(s)"/></td>
		            <td width="4%" style="border:0" align="right"><gw:imgBtn id="ibtnSearch" alt="Search" img="search" onclick="OnSearch()" />  <td>
                    <td width="4%" style="border:0" align="right"><gw:imgBtn img="new"     alt="New"      id="ibtnAdd" 	onclick="OnAddClick()" /></td>					
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="delete"  alt="Delete"   id="ibtnDelete" 	onclick="OnDeleteClick()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="udelete" alt="Undelete" id="ibtnDelete1" onclick="UnOnDeleteClick()" /></td>  
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="save"    alt="Save"     id="ibtnUpdate" 	onclick="OnUpdateClick()" /></td>
		            <td width="4%" style="border:0" align="right"><gw:imgBtn img="select"    alt="Select"     id="ibtnSelect" 	onclick="OnSelect(grdDetailCode)" /></td>
		            <td width="4%"style="border:0" align="right"><gw:imgBtn img="cancel"    alt="Close"     id="ibtnClose" 	onclick="OnCloseClick()" /></td>
	            </tr>
            	<tr style="width:100%;height:95%;border:1" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%" colspan=11 >
				             <gw:grid   
                                        id="grdDetailCode"  
                                        header="_PK|_MasterPK|Select|CODE|NAME|KNAME|FNAME|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|USE Y/N|REMARK"   
                                        format="0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0"  
                                        aligns="1|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="|||||||||||||||||-1|"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="1000|0|700|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
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
    <gw:textbox id="txtInput_CODEGRP"  styles="display:none" />
    <gw:textbox id="txtInput_CODEGRP_NM"  styles="display:none" />
    <gw:textbox id="txtInput_CODE" styles="display:none"/>
    <gw:textbox id="txtInput_CODE_NM" styles="display:none"/>
    <gw:textbox id="txtFlag" styles="display:none"/>	
    
    <gw:textbox id="txtRec_PK" styles="display:none"/>	
	

</body>
</html>
