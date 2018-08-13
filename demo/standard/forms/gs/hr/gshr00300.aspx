<!-- #include file="../../../../system/lib/form.inc" -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Untitled Page</title>
</head>

<script>
/*idGridT3*/
var i_Order =0,
    i_ColumnName = 1,
    i_DataType  = 2,
    i_Length =3,
    i_Desc =4;
/*idGridT3_1,idGridT2*/
var i_pkT3 =0,
    i_ColumnT3 = 1,
    i_NameT3  = 2,
    i_DescT3 =3;
    i_DataTypeT3 =4;

/*idGridT2_1*/
var i1_pk =0,
    i1_ColName =1,
    i1_Desc =2;
    i1_ViewName =3,
    i1_Data_Type=4

function BodyInit()
{
    idGridT2.GetGridControl().ScrollTrack=true;	
    
    <%=CtlLib.SetGridColumnComboFormat( "idGridT2_1" , 3 , "select code,code||'-'||CODE_NM from vhr_hr_code where id='HR0173' order by seq " ) %>; 
 	dsoViewSalary.Call("Select");
}

function OnProcess()
{
    
    process.Call();
	
}

function OnDataReceive(obj)
{
    switch (obj.id)
    {
		case "process":
            if(txtResult.text=="0")//success
		    {
			    txtResult.text="";
			    alert("Create or Replace view successful. \r\n Đã tạo (thay thế) thành công. ");
			    dsoShowColumNameView.Call("Select");
		    }
		    break; 
		case "dsoViewSalary":
            if(txtCountView.text=="1")//view da ton tai.
		    {
			    txtCountView.text="";
			    dsoShowColumNameView.Call("Select");
		    }
		    else
		    {
		        OnSearchTable(2);
		    }
	    break; 
		case "dsoShowColumNameView":
			   // OnSearchTable(2)
	    break; 
		    
	}
}

function FilterName(viewColumnName, viewColumnSelect)
{

    alert(viewColumnName)
    alert(viewColumnSelect)
    var tempName = "";
    var strName = "";
    var tempSelect = "";
    var strSelect = "";
    var flag=0;
    var strSql	= "CREATE OR REPLACE VIEW VHR_SAL_CUSTOM " + 
                "(THR_EMP_PK, EMP_ID, WORK_MON,TCO_DEPT_PK,THR_GROUP_PK,COST_GROUP,COST_KIND,TAC_ABPL_PK, viewColumnName) " +
                "AS  " +
                "SELECT S.THR_EMP_PK, S.EMP_ID, S.WORK_MON,S.TCO_DEPT_PK,S.THR_GROUP_PK,S.COST_GROUP,S.COST_KIND,S.TAC_ABPL_PK, viewColumnSelect " +
                "FROM THR_MONTH_SALARY S " +
                "WHERE S.DEL_IF=0 " ;
    
    var arrayName = viewColumnName.split(" , "); //tao mang view name
    var arraySelect = viewColumnSelect.split(" , "); // tao bang column select tu bang thr_month_salary
    
    for (i=0;i<arrayName.length;i++)
    {
        flag = 0;
        //alert("i " + i + " value " + arrayName[i]);
        tempName = arrayName[i];
        tempSelect = arraySelect[i];
        
        if (tempName != "OK")
        {

            if (strName == "")
            {
                strName = tempName;
            }
            else
            {
                strName = strName + "," + tempName;
            }
            
            if (strSelect == "")
            {
                strSelect = tempSelect;
            }
            else
            {
                strSelect = strSelect + "," + tempSelect;
            }
            
            for (j=i+1; j<arrayName.length;j++)
            {
                //alert("j " + j + " value " + arrayName[j]);
                if (arrayName[j] == tempName) // so sanh trung ten view name 
                {
                    strSelect = strSelect + "+" + arraySelect[j]; // cong don column can select

                    arrayName.splice(j, 1, "OK"); //ham nay giong replace sau khi cong, thay doi ten viewname da cong don
                }
            }
            
        }
        
    }
    
    strSql = strSql.replace("viewColumnName",strName);
    strSql = strSql.replace("viewColumnSelect",strSelect);
    
    //return strName + " || " + strSelect ;
    return strSql ;
}

function CheckNullViewName()
{
    var viewCtrl  = idGridT2_1.GetGridControl();
    var flag = 0
    for (i=1; i<= viewCtrl.Rows-1;i++) 
	{
	    if (viewCtrl.TextMatrix(i,i1_ViewName) == "" )
	    {
	        flag = 1;
	        break;
	    }
	}
	return flag;
}

function OnSearchTable(obj)
{
    switch(obj)
        {
            case 1:
                 dsoColumNameSalaryT2.Call("Select");
            break;
            case 2:
                 dsoViewInfor.Call("Select");
            break;
            case 3:
                dsoSalaryCol.Call("SELECT");
            break;
            case 4:
                  dsoColumNameSalaryT4.Call("SELECT");
            break;
            
        }
   
}
function OnSave(obj)
{
    if(obj==1)
    {
    
    if (CheckNullViewName()==1) // KIEM TRA VIEW NAME CO NULL HAY KHONG
		{
                alert("Please select View name for All selected salary Columns!");
        }else
        {
             dsoViewInfor.Call()
        }
     }else
     {
        
        dsoColumNameSalaryT4.Call()
           
     }
}
 //---------------------------------------------------------
 function OnDelete(obj)
 {
    if(obj==1)
    {
        var ctrl = idGridT2_1.GetGridControl();

	    if (ctrl.SelectedRows >0) 
	    {	
	        for (i=ctrl.Rows-1;i>0;i--) 
		    {
		        if (ctrl.IsSelected(i)) 
			    {
			        if(ctrl.TextMatrix( i, i1_pk) == "")
				    {
				        idGridT2.AddRow();
    				    
				        idGridT2.SetGridText(idGridT2.rows-1 , i_ColumnT3, ctrl.TextMatrix( i, i1_ColName)); //Column Name		
				        idGridT2.SetGridText(idGridT2.rows-1 , i_NameT3, ctrl.TextMatrix( i, i1_Desc)); //Column Name	
				        idGridT2.SetGridText(idGridT2.rows-1 , i_DataTypeT3, ctrl.TextMatrix( i, i_DataType)); //Column Name	
    					idGridT2_1.RemoveRowAt(i);
				    }
				    else
				    {
				        idGridT2_1.DeleteRowAt(i);
				    }
			    }
    		    
		    }
	    }
	}else
	{
	    var ctrl = idGridT3_1.GetGridControl();

	    if (ctrl.SelectedRows >0) 
	    {	
	        for (i=ctrl.Rows-1;i>0;i--) 
		    {
		        if (ctrl.IsSelected(i)) 
			    {
			        
			        if(ctrl.TextMatrix( i, i_pkT3) == "")
				    {
				        idGridT3.AddRow();    				    
				        idGridT3.SetGridText(idGridT3.rows-1 , i_ColumnName, ctrl.TextMatrix( i, i_ColumnT3)); //Column NamE
				        idGridT3.SetGridText(idGridT3.rows-1 , i_DataType, ctrl.TextMatrix( i, i_DataTypeT3)); //Column NamE
				        idGridT3_1.RemoveRowAt(i);
				        
				    }else
				    {
				        idGridT3_1.DeleteRowAt(i);
				    }
			    }
    		    
		    }
	    }
	}
}
function OnAddTo(obj) 
{
    if(obj==1)
    {
	    var tableCtrl = idGridT2.GetGridControl();
	    var viewCtrl  = idGridT2_1.GetGridControl();
	    var i = 0;
    	
	    //get selected row
	    if (tableCtrl.SelectedRows >0) 
	    {
	        //alert("aa");
		    for (i=tableCtrl.Rows-1;i>0;i--) 
		    {
			    //Add row to mapping grid
			    if (tableCtrl.IsSelected(i)) 
			    {
			        //alert(tableCtrl.TextMatrix(i,1));
				    idGridT2_1.AddRow();
    				
				    idGridT2_1.SetGridText(viewCtrl.Rows-1 , i1_ColName, idGridT2.GetGridData(i,i_ColumnT3)); //Column Name		
				    idGridT2_1.SetGridText(viewCtrl.Rows-1 , i1_Desc, idGridT2.GetGridData(i,i_NameT3)); //Name
				    idGridT2_1.SetGridText(viewCtrl.Rows-1 , i1_Data_Type, idGridT2.GetGridData(i,i_DataTypeT3)); //Name
				    tableCtrl.RemoveItem(i);
			    }
		    }
    		
	    } 
	    else 
	    {
		    alert ("Please select Column for mapping.");
	    }
	}else
	{
	    var tableCtrl = idGridT3.GetGridControl();
	    var viewCtrl  = idGridT3_1.GetGridControl();
	    var i = 0;
    	
	    //get selected row
	    if (tableCtrl.SelectedRows >0) 
	    {
	        //alert("aa");
		    for (i=tableCtrl.Rows-1;i>0;i--) 
		    {
			    //Add row to mapping grid
			    if (tableCtrl.IsSelected(i)) 
			    {
			        //alert(tableCtrl.TextMatrix(i,1));
				    idGridT3_1.AddRow();
    				
				    idGridT3_1.SetGridText(viewCtrl.Rows-1 , i_ColumnT3, idGridT3.GetGridData(i,i1_ColName)); //Column Name
				    idGridT3_1.SetGridText(viewCtrl.Rows-1 , i_DataTypeT3, idGridT3.GetGridData(i,i_DataType)); //Column Name
			        tableCtrl.RemoveItem(i);
			    }
		    }
    		
	    } 
	    else 
	    {
		    alert ("Please select Column for mapping.");
	    }
	}
}
function onPage_active()
{
    
}

</script>

<body>

<gw:data id="dsoViewSalary"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_0"  > 
			<input bind="txtCountView" >								
			</input> 
			<output bind="txtCountView" /> 
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dsoShowColumNameView"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_1"  > 
			<input bind="idGridView" >								
			</input> 
			<output bind="idGridView" /> 
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dsoViewInfor"  onreceive="" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_2" parameter="0,1,2,3,4"  procedure = "ST_HR_UPD_GSHR00300_2" > 
			<input bind="idGridT2_1" >	
			    <input bind="lstViewCols"/>
			</input> 
			<output bind="idGridT2_1" /> 
		</dso> 
	</xml> 
</gw:data> 
<!--------------------------------------------------->
<gw:data id="dsoColumNameSalaryT2"  onreceive="" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_3"  > 
			<input bind="idGridT2" >	
			    <input bind="txtColum"/>
			</input> 
			<output bind="idGridT2" /> 
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dsoColumNameSalaryT4"  onreceive="" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_3" parameter="0,1,2,3,4" procedure="ST_HR_UPD_GSHR00300_3" > 
			<input bind="idGridT3_1" >	
			    <input bind="txtColumT4"/>
			</input> 
			<output bind="idGridT3_1" /> 
		</dso> 
	</xml> 
</gw:data> 
<!--------------------------------------------------->

<gw:data id="dsoSalaryCol"  onreceive="" > 
	<xml> 
		<dso type="grid" function="ST_HR_SEL_GSHR00300_4"  > 
			<input bind="idGridT3" >	
			    <input bind="txtColumT3"/>
			</input> 
			<output bind="idGridT3" /> 
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="process" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_GSHR00300_5" > 
                <input>
                    <input bind="txtQuery" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:tab id="tabMain" >
<table style="height:100%"  width=100% border="1" name="Salary View" onpageactivate="onPage_active()">
    <tr style="height:100%">
        <td style="width:100%">
             <table style="height:100%" width="100%" border="1" cellspacing="0" cellpadding="0">
                <tr style="height:5%">
                    <td width="100%" colspan="3" >
                    <font color=red>VHR_SAL_CUSTOM</font>
                   </td>
                </tr>
                <tr style="height:95%">
                    <td width="100%" style="height:100%" id="autoGrid"> 
                         <gw:grid 
					    id="idGridView"
					    header="View Col|View Desc|Cols in Salary Table"
					    format="0|0|0"
					    aligns="0|0|0"
					    defaults="||"
					    editcol="0|0|0"
					    widths="1500|2000|3000"
					    styles="width:100%;height:100%"
					    sorting="T"
					    onafteredit=""
					    oncellclick = ""
					    oncelldblclick = ""/>
                        <!-- gan grid tu dong o day
                        <gw:grid styles="display:none"
					    id="idGridView"
					    header="Column Name|Data Type|View Name|_DataType|_Length"
					    format="0|0|0|0|0"
					    aligns="0|1|0|0|0"
					    defaults="||||"
					    editcol="0|0|1|0|0"
					    widths="2500|2000|1500|1500|1500"
					    styles="width:100%;height:100%"
					    sorting="T"
					    onafteredit=""
					    oncellclick = ""
					    oncelldblclick = ""/>-->
                </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
 <table style="height:100%" name="Create View" width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr style="height:85%">
    <td style="width:45%">
		<table width="100%" style="height:100%" border="0" cellspacing="1" cellpadding="1">
		  <tr style="height:5%">
		    <td width="35%">Salary Column</td>
		    <td width="50%">
		         <gw:textbox id="txtColum" text="" 	maxlen = "10" styles='width:100%;'  onenterkey="OnSearchTable(1)" />
		    </td>
		        <td width="5%">
                    <gw:button id="idBtnRefresh" alt="Search" img="search" text="Search" onclick="OnSearchTable(1)" />
                </td>
            <td width="5%">
                    <gw:button id="idBtnAdd" alt="Add" img="end" text="Add" onclick="OnAddTo(1)" />
            </td>
		  </tr>
		  <tr style="height:95%" >
		   <td width="100%" colspan=4 >
				<gw:grid
					id="idGridT2"
					 header="_PK|_Column|Salary Name|_Description|Data Type"
			        format="0|0|0|0|0"
			        aligns="0|0|0|0|0"
			        defaults="|||||"
			        editcol="0|0|1|1|0"
			        widths="0|0|2500|2500|2500"
			        styles="width:100%;height:100%"
			        sorting="T"
			        onafteredit=""
			        oncellclick = ""
			        oncelldblclick = "OnAddTo(1);"/>
			</td>
		  </tr>
		</table>	
	</td>
    <td style="width:53%">
		<table width="100%" style="height:100%" border="0" cellspacing="1" cellpadding="1">
		  <tr>
                <td width="30%"><b> Views Columns </b> </td>
                <td width="40%">
                <gw:list  id="lstViewCols"  maxlen = "100" value='ALL' styles='width:100%'onchange="OnSearchTable(2)" >
                    <data>
                                <%=CtlLib.SetListDataSQL("select code,code||'-'||CODE_NM from vhr_hr_code where id='HR0173' order by code ")%>|ALL|Select All
                            </data>
                     </gw:list>
                </td>
                <td width="5%" align="right">
                    <gw:button id="idBtnSearch" alt="Search" img="search" text="Search" onclick="OnSearchTable(2)" />
                </td>
                <td width="5%" align="right">
                    <gw:button id="idBtnSave" alt="Save" img="save" text="Save" onclick="OnSave(1)" />
                </td>
                <td width="5%" align="right">
                    <gw:button id="idBtnDel" alt="Delete" img="delete" text="Delete" onclick="OnDelete(1)" />
                </td>
                <td width="5%" align="right">
                    <gw:button id="idBtnProcess" alt="Process" img="process" text="Process" onclick="OnProcess()" />
                </td>
           </tr>
		  <tr  style="height:100%">
			<td style="height:100%" colspan=6>
				<gw:grid
					id="idGridT2_1"
					header="_PK|Column Name|Salary Cols|View Name|Data Type"
					format="0|0|0|0|0"
					aligns="0|0|0|0|0"
					defaults="|||||"
					editcol="0|0|0|1|0"
					widths="0|2000|2000|2000|1500"
					styles="width:100%;height:100%"
					sorting="T"
					onafteredit=""
					oncellclick = ""
					oncelldblclick = ""/>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
   <table name="Salary Column"  style="height:100%; width:100%" border="1" cellspacing="0" cellpadding="0">
        <tr style="height:100%">
            <td width="30%"  border="1">
                <table width="100%"   style="height:100%" border="0" cellspacing="1" cellpadding="1">
		          <tr style="height:5%">
		            <td width="35%">Original Column</td>
		            <td width="50%">
		                 <gw:textbox id="txtColumT3" text="" 	maxlen = "10" styles='width:100%;'  onenterkey="OnSearchTable(3)" />
		            </td>
		                <td width="5%">
                            <gw:button id="idBtnRefreshT3" alt="Search" img="search" text="Search"  onclick="OnSearchTable(3)" />
                        </td>
                    <td width="5%">
                            <gw:button id="idBtnAddT3" alt="Add" img="end" text="Add" onclick="OnAddTo()" />
                    </td>
		          </tr>
		          <tr style="height:95%" >
		           <td width="100%" colspan=4 >
				        <gw:grid
					        id="idGridT3"
					        header="_Order|Column Name|Data Type|_Length|_Description"
					        format="0|0|0|0|0"
					        aligns="1|0|1|1|0"
					        defaults="||||"
					        editcol="0|0|0|0|0"
					        widths="800|2000|0|0|1200"
					        styles="width:100%;height:100%"
					        sorting="T"
					        onafteredit=""
					        oncellclick = ""
					        oncelldblclick = "OnAddTo(2);"/>
			        </td>
		          </tr>
		        </table>
            </td>
            <td width="70%" border="1">
                <table width="100%" style="height:100%" border="0" cellspacing="1" cellpadding="1">
		          <tr>
                        <td width="30%"><b>Selected Columns </b> </td>
                        <td width="40%">
                            <gw:textbox id="txtColumT4" text="" 	maxlen = "10" styles='width:100%;'  onenterkey="OnSearchTable(4)" />
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="idBtnSearch3" alt="Search" img="search" text="Search" onclick="OnSearchTable(4)" />
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="idBtnSave3" alt="Save" img="save" text="Save" onclick="OnSave(2)" />
                        </td>
                        <td width="5%" align="right">
                            <gw:button id="idBtnDel3" alt="Delete" img="delete" text="Delete" onclick="OnDelete(2)" />
                        </td>
                    </tr>
		          <tr  style="height:100%">
			        <td style="height:100%" colspan=5>
				        <gw:grid
					        id="idGridT3_1"
					        header="_PK|Column|Name|Description|Data Type"
					        format="0|0|0|0|0"
					        aligns="0|0|0|0|0"
					        defaults="|||||"
					        editcol="0|0|1|1|0"
					        widths="0|2000|1500|2500|2500"
					        styles="width:100%;height:100%"
					        sorting="T"
					        onafteredit=""
					        oncellclick = ""
					        oncelldblclick = ""/>
			        </td>
		          </tr>
		        </table>
            </td>
        </tr>
   </table>
    
</gw:tab>

</body>

<gw:textbox id="txtQuery" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtCountView" styles="display:none"/>
<gw:textbox id="txtGridView" styles="display:none"/>

</html>
