<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var acc_pk = 3;
function BodyInit()
{
    var lst_Search = "<%=CtlLib.SetListDataFUNC("SELECT ac_a_get_commoncode('EACBK034') FROM DUAL")%>";
    
    lstSearch.SetDataText(lst_Search);
    var ls_company =  "<%=Request.querystring("company_pk")%>"; 
   var kafinanceform_mst_pk =  "<%=Request.querystring("p_tac_kafinanceform_mst_pk")%>"; 
    txt_company.text = ls_company;
    txtTac_kafinanceform_mst_pk.text = kafinanceform_mst_pk;
    
    var l_acc = "<%=Request.querystring("accd_arr")%>";
    txt_acc.SetDataText(l_acc);
    
    var l_Master_pk = "<%=Request.querystring("Master_pk")%>"; 
    txt_Master.text = l_Master_pk;
    
    var l_type = "<%=Request.querystring("l_type")%>";
    txt_type.SetDataText(l_type);
	OnSearch();
}
function OnSearch()
{
    dsoAccountT.Call("SELECT");
}

function OnCancel()
{
	var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
}

function SelectCheck()
{
	
	var aValue = new Array();
	for(i=1;i<idGrid.rows;i++)
    {
    
		if(idGrid.GetGridData(i,0)== "-1")
		{
			tmp= new Array();
			
			
			for(j=0;j<idGrid.cols;j++)
            {
				tmp[tmp.length] = idGrid.GetGridData(i,j);
				
			}
			aValue[aValue.length]=tmp; 
		}
    }
	window.returnValue = aValue; 
	window.close(); 
}
function OnSelectAll()
{	
    var ctrl=idGrid.GetGridControl();
    if( chkSelectAll.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
        idGrid.SetGridText(i,0,"-1");
    }
	else
	{
            for(var i=0;i<ctrl.rows;i++)
            idGrid.SetGridText(i,0,"0");
    }        

}

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
function OnRemove()
{
  if(idGrid2.row > 0)
  {
    var col_val = idGrid2.GetGridData( idGrid2.row, acc_pk);
    
    idGrid2.RemoveRowAt(idGrid2.row);
    
    SetRowBackGroundColor(idGrid,col_val,0x000000); 
    
    countItem()
  }
}

function countItem()
{
    lblCount.text=idGrid2.rows-1 + " item(s)."
}
function OnGridCellDoubleClick(oGrid)
{
      if(oGrid.id == "idGrid" && event.row > 0 )
      {
            var col_val = oGrid.GetGridData(event.row, acc_pk );
            if(event.row > 0)
            {
                //SetRowBackGroundColor(oGrid,col_val,0x0000FF);
                oGrid.SetCellFontColor(event.row,0,event.row,oGrid.cols-1,0x0000FF);
		        idGrid2.AddRow();
		        for(var i=0;i<oGrid.cols;i++)
		        {
		          idGrid2.SetGridText(idGrid2.rows-1,i,oGrid.GetGridData(event.row,i));
		        }
            }
      }
      countItem()
}
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, acc_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}
function CheckDataExist(p_oGrid,p_value)
{
   
       for(var i=1;i<p_oGrid.rows;i++)
       {
              if(p_oGrid.GetGridData(i, acc_pk) == p_value)
              {
                 return true;
              }
       }
       return false;
}
function CheckAll()
{

var ctrl=idGrid.GetGridControl();

        if(chkSelectAll.GetData()=="T")
        {
         
            var col_val ;
            for (i = 1; i< idGrid.rows; i++)
            {
              idGrid.SetGridText(i,0,"-1");
                col_val = idGrid.GetGridData(i,1);
               
                if( !CheckDataExist(idGrid,col_val))
                {
                    SetRowBackGroundColor(idGrid,col_val,0x0000FF);
		            idGrid2.AddRow();
		         
		            for(var j=0;j<idGrid.cols;j++)
		            {
		              idGrid2.SetGridText(idGrid2.rows-1,j,idGrid.GetGridData(i,j));
		            }
                }
              
            }
         }
         else
         {
            
             for(var i=0;i<ctrl.rows;i++)
            idGrid.SetGridText(i,0,"0");
            OnRemoveAll();
         }
            countItem();
}
function OnRemoveAll()
{
   var col_val;
    for(var i=1;i<idGrid2.rows;i++)
    {
        col_val = idGrid2.GetGridData(i,1);
        
        SetRowBackGroundColor(idGrid,col_val,0x000000); 
    }
    idGrid2.SetData("");
    countItem();
}
</script>

<body>

    <gw:data id="dsoAccountT"  > 
        <xml> 
           <dso type="grid" function="ac_sel_60080160_formular_1" > 
                  <input bind="idGrid" > 
                    <input bind="txtCode"/> 
                    <input bind="txt_company"/>
                    <input bind="lstSearch"/>
                    <input bind="txt_type"/>
                    <input bind="txt_Master"/>
					<input bind="txtTac_kafinanceform_mst_pk"/>
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
<table style="margin-left:5;height:100%" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr style="height:5%">
    <td width="100%" colspan="7">
     <fieldset style="width: 100%; height: 100%; padding: 2">
        <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
			<tr>
                <td width="1%"><gw:checkbox id="chkSelectAll" value="F" onclick="CheckAll()" /> </td>
                <td width="10%" align="left"> Select All</td>
                 <td width="10%" align="right">Search by</td>
	            <td width="14%"><gw:list id="lstSearch"  styles='width:98%'></gw:list></td>
                <td width="10%" align="right">Account:</td>
	            <td width="40%"><gw:textbox id="txtCode" styles="width:98%;height:20" onenterkey="OnSearch()"/></td>
	            <td width="5%"></td>
	           
	            
                <td align="right" width="5%"><gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="OnSearch();" /></td>
                
                <td align="right" width="5%"><gw:imgBtn id="idCancel" img="cancel" alt="Exit" text="Exit" onclick="OnCancel();" /></td>
             </tr>
		 </table>  
     </fieldset>
    </td>
  </tr>
  
  <tr style="height:47%">
      <!--0.Chk|1.User ID|2.Emp ID|3.Employee Name|4.Department|5.tco_bsuser_pk|TAC_ABTRTYPE_pk-->
	  <td colspan = "9">
		<gw:grid   
							    id="idGrid"  
							    header="Chk|Account Code|Account Name|Local Account Name|Korean Account Name|_PK"
							    format="3|0|0|0|0|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="|||||"  
							    editcol="0|0|0|0|0|0"  
							    widths="500|1300|2500|2500|2500|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3,4,5"
							    oncelldblclick="OnGridCellDoubleClick(this)" />
	</td>
  </tr>
  <tr style="height:3%">
        <td colspan="7">
        <fieldset>
                <table>
                    <tr>
                        <td style="width: 98%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        
                        
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid2)" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
  </tr>
  <tr style="height:45%">
        <td colspan = "9">
		<gw:grid   
							    id="idGrid2"  
							    header="_Chk|Account Code|Account Name|Local Name|Korean Account Name|_PK"
							    format="3|0|0|0|0|0"
							    aligns="1|0|0|0|0|0"  
							    defaults="|||||"  
							    editcol="0|0|0|0|0|0"  
							    widths="500|1300|2500|2500|2500|0"  
							    styles="width:100%; height:100%"   
							    sorting="T"   
							    param="0,1,2,3,4,5"
							     />
	</td>
  </tr>
</table>
<gw:textbox id="txt_company"   text="" style="display: none" />
<gw:textbox  id="_TAC_LOCALCODE_PK" styles='display:none'/>
<gw:textbox  id="txt_acc" styles='display:none'/>
<gw:textbox  id="txt_type" styles='display:none'/>
<gw:textbox  id="txt_Master" styles='display:none'/>
<gw:textbox  id="txtTac_kafinanceform_mst_pk" styles='display:none'/>


</body>
</html>
