<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Many Item</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//"V|_EMP_PK|Organization|Employee ID|Employee Name|Join Date|Position|Job"
var G_SELECT	            = 0,
    G_EMP_PK        = 1,
    G_ORGANIZATION  = 2,
    G_EMPLOYEE_ID   = 3,
    G_EMPLOYEE_NAME = 4,
    G_JOIN_DATE     = 5,
    G_POSITION      = 6,
    G_JOB           = 7,   
	G_PROD_PRICE	= 8,
    G_REMARK        = 9;
//"No|_EMP_PK|Organization|Employee ID|Employee Name|Name|Relation|Birth Date|Birth Place|Address|Telephone|Start Date| End Date|_SEQ"
var stt = 0;
var G1_NO 			= 	stt;
var	G1_EMP_PK 		=	++stt;
var	G1_ORGANIZATION	=	++stt;
var	G1_EMP_ID		=	++stt;
var	G1_EMP_NAME		=	++stt;
var G1_NAME			= 	++stt;
var	G1_RELATION		=	++stt;
var	G1_BIRTH_DATE	=	++stt;
var	G1_BIRTH_PLACE	=	++stt;
var	G1_ADDRESS		=	++stt;
var	G1_TELEPHONE	=	++stt;
var G1_DEPEND_FLAG	=	++stt;
var	G1_START_DATE	=	++stt;
var	G1_END_DATE		=	++stt;
var G1_SEQ			=	++stt;
	
var v_language = "<%=Session("SESSION_LANG")%>";
//------------------------------------------------------------------------------------------------
function BodyInit()
{
	
    System.Translate(document);
	iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	ChangeColorItem(lstOrg.GetControl());
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0024', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstRelation.SetDataText(data);
	lstRelation.value ="";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0021', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPlaceBirth.SetDataText(data);
	lstPlaceBirth.value ="";
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0024' order by code_nm")%>";
    grdInsert.SetComboFormat(G1_RELATION,t1);
	
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0021' union all select null,null from dual order by 1")%>";
    grdInsert.SetComboFormat(G1_BIRTH_PLACE,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0008' union all select null,null from dual order by 1")%>";
	grdSearch.SetComboFormat(G_POSITION,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0010' union all select null,null from dual order by 1")%>";
	grdSearch.SetComboFormat(G_JOB,t1);
	
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
		{
			datUser_info.Call();     	    
		}  
}
//----------------------------------
 function ChangeColorItem(lstctl) 
 {
	var slevel1, slevel2, slevel3,slevel4;
	for (var i = 0; i < lstctl.options.length; i++)
	{
		slevel1 = lstctl.options.item(i).text.substr(0, 1);
		slevel2 = lstctl.options.item(i).text.substr(0, 3);
		slevel3 = lstctl.options.item(i).text.substr(0, 5);
		slevel4 = lstctl.options.item(i).text.substr(0, 7);
		if (slevel4 != ".......")
		{
			if(slevel3==".....")
			{
				lstctl.options.item(i).style.color = "0066CC";
			}
			else  
			{
				if (slevel2 == "...")
				{
					lstctl.options.item(i).style.color = "FF4500";
				}
				else
				{
					if (slevel1 == ".")
						lstctl.options.item(i).style.color = "FF00FF";  //FF3333
				}
			}                
		}
	}
}
function OnDataReceive(obj)
{
    switch (obj.id)
    {
		case "datUser_info":
		{
			lstOrg.SetDataText(txtdept_temp.text + "|ALL|Select All");
			lstOrg.value = "ALL";
			ChangeColorItem(lstOrg.GetControl());
			
		}
		break;
	}
}
//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_hrem01101_1.Call("SELECT");
        break;
    }
   
}
function OnSave()
{
	if(OnValidate())
	{
		if ( confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?"))
			data_hrem01101_0.Call();
	}
}
function OnValidate()
{
	var ctrl = grdInsert.GetGridControl();
	for ( var i =  1 ; i < ctrl.rows ; i++ )
	{
		if(grdInsert.GetGridData(i, G1_RELATION) =="")
		{
			alert((v_language =="ENG")?"You have input regulation type at row " + i :"Bạn phải nhập loại chế độ tại dòng " + i);
			return false;
		} 
		if(grdInsert.GetGridData(i, G1_START_DATE) =="")
		{
			alert((v_language =="ENG")?"You have input from date at row " + i :"Bạn phải nhập cho từ ngày tại dòng " + i);
			return false;
		}   
	}
	return true;
}
//-----------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdInsert.row > 0)
  {
    var col_val = grdInsert.GetGridData( grdInsert.row, G_EMP_PK);
    
    grdInsert.RemoveRowAt(grdInsert.row);
    
    SetRowBackGroundColor(grdSearch,col_val,0x000000); 
    
  }
}
//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, G_EMP_PK) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, G_EMP_PK) == p_value)
              {
                 return true;
              }
       }
       return false;
}
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick()
{
      if(event.row > 0 )
      {
            grdSearch.SetGridText(event.row, G_SELECT, "-1");
            OnSelect(grdSearch);
            
      }
}

//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_hrem01101_1':
           
        break;
    }
}

//================================================================================================
function OnSelect(idGrid)
{
	for (i = 1; i< idGrid.rows  ; i++)
	{
		var col_val = idGrid.GetGridData( i, G_EMP_PK);
		if (idGrid.GetGridData(i, 0) == "-1" && (!CheckDataExist( grdInsert, col_val)))
		{
			SetRowBackGroundColor(idGrid,col_val,0x0000FF);
			grdInsert.AddRow();
			var rowcount = grdInsert.rows-1 ;
    		grdInsert.SetGridText(grdInsert.rows-1, G_SELECT, rowcount );
	        for(var j= G_EMP_PK; j< G_JOIN_DATE ; j++)
	        {
	            grdInsert.SetGridText( grdInsert.rows-1, j, idGrid.GetGridData(i, j) );
	        }
			if(lstRelation.value !="")
				grdInsert.SetGridText(grdInsert.rows-1, G1_RELATION, lstRelation.value);
			
			if(lstPlaceBirth.value != "")
				grdInsert.SetGridText(grdInsert.rows-1, G1_BIRTH_PLACE, lstPlaceBirth.value);
				
			if(dtFromDate.value != "")	
				grdInsert.SetGridText(grdInsert.rows-1, G1_START_DATE, dtFromDate.value);
			
			if(dtToDate.value != "")	
				grdInsert.SetGridText(grdInsert.rows-1, G1_END_DATE, dtToDate.value);
		}
	}
	OnSetSeq();
}
//------------------------------------------------------------------------------------
function OnSetGrid()
{	
    
    var ctrl = grdInsert.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
					if(lstRelation.value !="")
						grdInsert.SetGridText(row, G1_RELATION, lstRelation.value);
					
					if(lstPlaceBirth.value != "")
						grdInsert.SetGridText(row, G1_BIRTH_PLACE, lstPlaceBirth.value);
						
					if(dtFromDate.value != "")	
						grdInsert.SetGridText(row, G1_START_DATE, dtFromDate.value);
					
					if(dtToDate.value != "")	
						grdInsert.SetGridText(row, G1_END_DATE, dtToDate.value);
						
					if(txtAddress.text != "")
						grdInsert.SetGridText(row, G1_ADDRESS, txtAddress.text);
						
					if(txtTelephone.text != "")
						grdInsert.SetGridText(row, G1_TELEPHONE, txtTelephone.text);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
		{
			if(lstRelation.value !="")
				grdInsert.SetGridText(i, G1_RELATION, lstRelation.value);
			
			if(lstPlaceBirth.value != "")
				grdInsert.SetGridText(i, G1_BIRTH_PLACE, lstPlaceBirth.value);
				
			if(dtFromDate.value != "")	
				grdInsert.SetGridText(i, G1_START_DATE, dtFromDate.value);
			
			if(dtToDate.value != "")	
				grdInsert.SetGridText(i, G1_END_DATE, dtToDate.value);
				
			if(txtAddress.text != "")
				grdInsert.SetGridText(i, G1_ADDRESS, txtAddress.text);
						
			if(txtTelephone.text != "")
				grdInsert.SetGridText(i, G1_TELEPHONE, txtTelephone.text);
		}
				   
	}
	
}
function OnSetSeq()
{
	txtSeq.text = new Date().getTime();
	for ( var i =  1 ; i < grdInsert.rows ; i++ )
	{
		grdInsert.SetGridText(i, G1_SEQ, txtSeq.text);
	}
}
function OnSelectAll(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}
</script>

<body>
 
    <!---------------------------------------------------------------->
<gw:data id="data_hrem01101_1" onreceive="OnReceiveData(this)"> 
<xml> 
	   <dso id="5" type="grid" function="ST_HR_SEL_HREM01101_1" > 
			  <input bind="grdSearch" >
				<input bind="lstOrg" />
				<input bind="lstStatus" />
				<input bind="txtEmployee" />
			  </input> 
			<output bind="grdSearch" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="data_hrem01101_0" onreceive="OnReceiveData(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,5,6,7,8,9,10,11,12,13,14" function="ST_HR_SEL_HREM01101_0" procedure="ST_HR_UPD_HREM01101_0"> 
                <input bind="grdInsert" >
                    <input bind="txtSeq" /> 
                </input>
                <output  bind="grdInsert" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        
        <tr style="height: 5%">
            <td colspan=5 style="width: 5%" align="right">
				<gw:checkbox id="chkCheckReport" value="F" onclick="OnSelectAll(chkCheckReport,grdSearch,0)" ></gw:checkbox >
			</td>
            <td colspan=10 style="width: 10%" align="right">
                Organization
            </td>
            <td colspan=15 style="width: 15%">
                <gw:list id="lstOrg" styles="width:100%" onchange="OnSearch()" />
            </td>
			<td colspan=10 style="width: 10%" align="right">
                Status
            </td>
            <td colspan=15 style="width: 15%">
                <gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td colspan=10 style="width: 10%" align="right">
                Employee
            </td>
            <td colspan=15 style="width: 15%">
                <gw:textbox id="txtEmployee" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td colspan=10 style="width: 10%" align="center">
               
            </td>
            <td colspan=5 style="width: 5%" >
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
			<td colspan=5 style="width: 5%" >
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdSearch)" />
            </td>
        </tr>
        <tr style="height: 35%">
            <td colspan="100">
				 <gw:grid id="grdSearch" 
				    header="V|_EMP_PK|Organization|Employee ID|Employee Name|Join Date|Position|Job"
                    format="3|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|3|3"
                    editcol="0|0|0|0|0|0|0|0" 
					widths="500|1500|1500|0|1500|1500|1500|1500"                
                    styles="width:100%; height:100%" autosize="T" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 5%">
            <td colspan="85">
				<fieldset style="padding: 5;">
					<legend ><font class="eco_blue" ><b>Update Data</b></font></legend>	
						<table style="background:#D6EAF8;width: 100%; height: 100%" >
							<tr>
								<td colspan=15 style="width: 15%">
									Relation
								</td>
								<td colspan=20 style="width: 20%">
									<gw:list id="lstRelation" styles="width:100%" onchange="OnSearch()" />
								</td>
								<td colspan=15 style="width: 15%">
									From Date
								</td>
								<td colspan=20 style="width: 20%">
									<gw:datebox id="dtFromDate" nullaccept  styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=15 style="width: 15%">
									Address
								</td>
								<td colspan=15 style="width: 15%">
									<gw:textbox id="txtAddress" styles="width:100%" onenterkey="" />
								</td>
							</tr>
							<tr>
								<td colspan=15 style="width: 15%">
									Birth Place
								</td>
								<td colspan=20 style="width: 20%">
									<gw:list id="lstPlaceBirth" styles="width:100%" onchange="OnSearch()" />
								</td>
								<td colspan=15 style="width: 15%">
									To Date
								</td>
								<td colspan=20 style="width: 20%">
									<gw:datebox id="dtToDate" nullaccept  styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=15 style="width: 15%">
									Telephone
								</td>
								<td colspan=15 style="width: 15%">
									<gw:textbox id="txtTelephone" styles="width:100%" " />
								</td>
							</tr>
						</table>
				</fieldset>
            </td>
			<td colspan="15">
				<table style="background:#D6EAF8">
					<tr>
						<td style="width: 1%">
							<gw:button id="ibtnUpdate" img="set" alt="Update" onclick="OnSetGrid()" />
						</td>
						<td style="width: 1%">
							<gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave()" />
						</td>
						<td style="width: 1%">
							<gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
						</td>
					</tr>
				</table>
				
			</td>
        </tr>
        <tr style="height: 55%">
            <td colspan="100">
                <gw:grid id="grdInsert" 
				    header="No|_EMP_PK|Organization|Employee ID|Employee Name|Relation Name|Relation|Birth Date|Birth Place|Address|Telephone|Depend Fag|Start Date| End Date|_SEQ"
                    format="0|0|0|0|0|0|0|0|0|0|0|3|4|4|0" 
					aligns="0|0|0|0|0|0|1|3|3|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|1|1|1|1|1|1|1|1|1|0" 
					widths="500|1500|1500|1500|1500|2500|1500|1500|1500|1500|1500|1500|1500|1500|0"                
                    styles="width:100%; height:100%" 
					autosize="T" 
					sorting="T"  />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
<gw:textbox id="txtSeq" styles="display:none"/>
<gw:textbox id = "txtlanguage" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
</body>
</html>
