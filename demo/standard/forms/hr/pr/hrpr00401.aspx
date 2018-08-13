<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop Up Get Employees</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//"_PK|Employee Code|Employee Name|_Organization|_Position Name|_Job Name|_VAL01|_VAL02|_VAL03|_VAL04
//|_TLG_ITEM_PROCESS_PK|Item Code|Item Name|Process Name"
var G_EMP_PK           = 0,
    G_EMP_ID         	= 1,
    G_EMP_NAME         	= 2,
    G_ORG_PK            = 3,
    G_POSITION          = 4,
    G_JOB               = 5,
    G_VAL01         	= 6,
    G_VAL02             = 7,   
	G_VAL03	    		= 8,
    G_VAL04            	= 9,
	G_ITEM_PROCESS_CODE = 10;

//------------------------------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select v.code, v.code_nm from vhr_hr_code v where v.id='HR0008' " )%>" ; 
    idGrid.SetComboFormat(G_POSITION,data); 
	idGrid2.SetComboFormat(G_POSITION,data); 
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select v.code, v.code_nm from vhr_hr_code v where v.id='HR0010' " )%>" ; 
    idGrid.SetComboFormat(G_JOB,data); 
	idGrid2.SetComboFormat(G_JOB,data); 
	
	data = "<%=CtlLib.SetGridColumnDataSQL("select a.pk, a.item_process_code from tlg_item_process_price a where a.del_if=0 and nvl(a.use_yn, 'N')= 'Y' order by a.item_process_code" )%>" ; 
    idGrid2.SetComboFormat(G_ITEM_PROCESS_CODE,data); 
	
	var data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	
	data = "<%=CtlLib.SetListDataSQL("select a.pk, a.item_process_code from tlg_item_process_price a where a.del_if=0 and nvl(a.use_yn, 'N')= 'Y' order by a.item_process_code" )%>||";    
    lstItemProcess.SetDataText(data);
	lstItemProcess.value="";
	
}

//-----------------------------------------------------------------------------------------------
function OnSearch(obj)
{ 
    switch(obj)
    {
        case 1:
                 data_hrpr00401_1.Call("SELECT");
        break;
    }
   
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
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, G_EMP_PK);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
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
    if ( chkDuplicate.value == 'Y' )
    {
        return false ;
    }
    
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
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, G_EMP_PK );
            
            if(event.row > 0 && ( !CheckDataExist(idGrid2,col_val)) )
            {
                SetRowBackGroundColor(oGrid,col_val,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}
//------------------------------------------------------------------------------------------------
function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
//======================================================================
function OnReceiveData(obj)
{
    switch(obj.id)
    {
        case 'data_hrpr00401_1':
            lblRecord2.text = idGrid.rows-1 ;
        break;
    }
}
//================================================================================================
function OnAdd(oGrid)
{
	for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
        var col_val = oGrid.GetGridData( row, G_EMP_PK);		
		
        if ( row > 0 && ( !CheckDataExist( idGrid2, col_val)) )
        {
            SetRowBackGroundColor( oGrid, col_val, 0x0000FF);
            
	        idGrid2.AddRow();
    		
	        for(var j=0; j<oGrid.cols; j++)
	        {
	            idGrid2.SetGridText( idGrid2.rows-1, j, oGrid.GetGridData( row, j) );
	        }
			
        }		
	}
	
	for(i= 1; i< idGrid2.rows; i++)
	{
		idGrid2.SetGridText(i, G_ITEM_PROCESS_CODE, lstItemProcess.value);
	}
    
    countItem();    
}
function OnChangeListItemProcess()
{
	for(i= 1; i< idGrid2.rows; i++)
	{
		idGrid2.SetGridText(i, G_ITEM_PROCESS_CODE, lstItemProcess.value);
	}
}
//================================================================================================
//---------------------------------------------------
function OnShowPopup()
{
    var fpath = System.RootURL + "/standard/forms/hr/pr/hrpr00402.aspx?";
    //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
	var obj = System.OpenModal( fpath ,800 , 600 ,  'resizable:yes;status:yes');
        if (obj!=null)
        {
             lstItemProcess.value= obj[0];
			for(i= 1; i< idGrid2.rows; i++)
			{
				idGrid2.SetGridText(i, G_ITEM_PROCESS_CODE, lstItemProcess.value);
			}
        }
}
</script>

<body>
 
    <!---------------------------------------------------------------->
    <gw:data id="data_hrpr00401_1" onreceive="OnReceiveData(this)"> 
    <xml> 
           <dso id="1" type="grid" function="ST_LG_sel_hrpr00401_1" > 
                  <input bind="idGrid" >
					<input bind="lstOrg" />
                    <input bind="txtEmployee" />
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        
        <tr style="height: 1%">
		    <td style="width: 10%" align="right">
			Organization
			</td>
			<td style="width: 30%">
                 <gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%' />
            </td>
            <td style="width: 10%" align="right">
			Employee
            </td>
            <td style="width: 30%">
                 <gw:textbox id="txtEmployee" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 5%" align="right">
                
            </td>
            <td style="width: 10%" align="center">
                <gw:label id="lblRecord2" styles="color: blue"></gw:label>
            </td>
            <td style="width: 1%" >
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch(1)" />
            </td>
			<td style="width: 1%" >	
				<gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" />
			</td>
        </tr>
        <tr style="height: 48%">
            <td colspan="8">
				 <gw:grid id="idGrid" 
				    header="_PK|Employee Code|Employee Name|Organization|Position Name|Job Name|_VAL01|_VAL02|_VAL03|_VAL04"
                    format="0|0|0|0|0|0|0|0|0|2" 
					aligns="0|0|0|0|0|1|3|3|3|0"
                    editcol="0|0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|2000|2000|2000|1500|1500|1500|0"  
					autosize = true
                    styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="8">
                <table>
                    <tr>
						<td style="width: 20%" align="left">
							<a class="eco_link" title="Click để chọn" onclick="OnShowPopup()" href="#tips" style="text-decoration: none;" class="eco_link" >Item Process Code</a>
                        </td>
						<td style="width: 30%" align="right">
                            <gw:list  id="lstItemProcess" maxlen = "100" onchange="OnChangeListItemProcess()" styles='width:100%' />
                        </td>
                        <td style="width: 20%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%" style="white-space: nowrap">
                            <gw:checkbox id="chkDuplicate" defaultvalue="Y|N" value="N" /> Duplicate
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnAdd" img="new" alt="Add" onclick="OnAdd(idGrid)" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnRemove" img="delete" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="ibtnSelect" img="select"  onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="8">
                <gw:grid id="idGrid2" header="_PK|Employee Code|Employee Name|_Organization|_Position Name|_Job Name|_VAL01|_VAL02|_VAL03|_VAL04|Item Process Code"
                    format="0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|1|3|3|3|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0" 
					widths="0|2000|4000|0|2000|2000|1500|1500|1500|1500|1500"
					autosize = true
                    styles="width:100%; height:100%" sorting="T" />
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------->
</body>
</html>
