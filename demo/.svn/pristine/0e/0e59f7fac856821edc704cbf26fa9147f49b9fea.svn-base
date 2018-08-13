<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <html>
 <head>
    <title>TINVIET</title>

 <script>
var flag=0; //chua co modify thong tin
var bAdd=false;
var v_language = "<%=Session("SESSION_LANG")%>";
var init_from;
function BodyInit()
{
    System.Menu.LoadDictionaryForPopup(System.Menu.OnGetID(window.location.toString()));
	init_from = setInterval(function(){ if(System.Menu.init_lang == "Y")BodyProcess(); }, 1000);
}
function BodyProcess(){
    clearInterval(init_from);
	System.Translate_V2(document, System.Menu.GetMenuPS());
    grdDetailCode.GetGridControl().ScrollTrack=true;
    txtInput_CODEGRP.text="<%=Request.querystring("code")%>";
    txtFind.text="<%=Request.querystring("kind")%>";
    OnSearch();
}
//--------------------------------
function OnSearch()
{
    if (bAdd==false)
        grdDetailCode.ClearData();
    txtCodeGrp_PK.text="";
    txtFlag.text= "1";
    txtInput_CODEGRP_NM.text="";
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
	    alert((v_language =="ENG")?"Please search a code":"Bạn hãy nhập mã");
}
//---------------------------------------------------------------
function OnUpdateClick()
{
    if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn chắc chắn lưu dữ liệu?"))
    {
        if (checkNumber() && checkDupItems(grdDetailCode,3,2) )
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
			    alert((v_language =="ENG")?"Code already in use, please re-enter at row " + (i+1) + " and column " + obj_col_dis:"Mã đã được sử dụng, hãy nhập lại ở dòng " + (i+1) + ", cột " + obj_col_dis );
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
	for(i=1; i<rownum; i++)
	{
	 	for(j=7; j <= 11; j++)
		{
			var ij_num 	= grdDetailCode.GetGridData(i, j);
			ij_num		= ij_num.toUpperCase();
			if (isNaN(ij_num))
			{
				alert((v_language =="ENG")?"Please enter is number at col " + (i) + " and row " + (j-1) : "Hãy nhập kiểu dữ liệu số ở cột " + (i) + " , dòng " + (j-1) );
				return false;
			}
			
		}	
	}
	for(i=1; i<rownum; i++)
	{
	 	var inum=grdDetailCode.GetGridData(i, 2);
	 	if (isNaN(inum) || Trim(inum)=="")
		{
			alert((v_language =="ENG")?"Please enter is number at col 1 " + " and row " + (i) : "Hãy nhập kiểu dữ liệu số ở cột 1 , dòng " + (i) );
			return false;
		}
		if (Number(inum)<0)
		{
		    alert((v_language =="ENG")?"Please enter is number at col 1 " + " and row " + (i) : "Hãy nhập kiểu dữ liệu số ở cột 1 , dòng " + (i));
			return false;
		}
		
	}
	return true;
}

//--------------------------------

function OnDataReceive(obj)
{
    
    if (obj.id=="datCodeGrp")
    {
       
       if (txtCodeGrp_PK.text=="")
            alert((v_language =="ENG")?"Can't find code group like this!Please input another.":"Không tìm thấy nhóm mã trên!Hãy nhập mã khác.");
       else
       {
            datDetailCode.Call("SELECT");           
       }
    }    
    else if (obj.id=="datDetailCode")
    {
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
   
	var obj=new Array();
    obj[0]=flag;
    obj[1]=0;
	window.returnValue = obj; 
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
   // alert("1");
	OnCloseClick()
}
//--------------------------
function OnSelectClick()
{
   var obj=new Array();
    obj[0]=flag;
    
    if (grdDetailCode.row >= 1)
    {
        obj[1]=grdDetailCode.GetGridData(grdDetailCode.row,3);
		obj[2]=grdDetailCode.GetGridData(grdDetailCode.row,4);
    }
    else
        obj[1]=0;
    
	window.returnValue = obj; 
	window.close();
}

 </script>
</head>
<body bgcolor='#FFFFFF' style="overflow:hidden;">
<!---------------------------------------------------------->
<gw:data id="datDetailCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRCO00500_0" procedure="ST_HR_UPD_HRCO00500_0"> 
                <input bind="grdDetailCode" >
                    <input bind="txtCodeGrp_PK" />
					<input bind="txtFind" />
                </input>
                <output  bind="grdDetailCode" />
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------->
    <gw:data id="datCodeGrp"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process"  procedure="ST_HR_PRO_HRCO00500_0" > 
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
<table cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%">
	<tr style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top">
	    <td>
	        <table border="0" cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
                <tr style="width:100%;height:5%;border:0" valign="middle" cellpadding="0" cellspacing="0">
					<td align ="center">
						<table border="0" cellpadding="0" cellspacing="0"  style="height:100%" width="100%">
							<tr>
								<td colspan="4">
									<table border="0" cellpadding="3" cellspacing="2"  style="height:100%" width="100%">
										<tr>		
											<td colspan=45 width="45%" style="border:0" align="center" ></td>
											<td colspan=5 width="5%" style="border:0" align="center" ><gw:button img="select" text="Select"     id="ibtnSelect" 	onclick="OnSelectClick()" /></td>
											<td colspan=5 width="5%" style="border:0" align="center" ><gw:button img="close" text="Close"     id="ibtnClose" 	onclick="OnCloseClick()" /></td>
											<td colspan=45 width="45%" style="border:0" align="center" ></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
	            </tr>
            	<tr style="width:100%;height:95%;border:0" valign=top cellpadding="0" cellspacing="0">
		            <td width="100%">
				             <gw:grid   
                                        id="grdDetailCode"  
                                        header="_PK|_MasterPK|NO|CODE|NAME|KNAME|FNAME|NUM 1|NUM 2|NUM 3|NUM 4|NUM 5|CHA 1|CHA 2|CHA 3|CHA 4|CHA 5|USE Y/N|REMARK|_company"   
                                        format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0"  
                                        aligns="1|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        defaults="|||||||||||||||||-1||"  
                                        editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                                        widths="1000|0|700|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0"  
                                        styles="width:100%; height:100%"   
                                        sorting="F"  oncelldblclick="OnSelectClick()"
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
	<gw:textbox id="txtFind" text="" styles"display:none"/>

</body>
</html>
