<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project - User</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var AdminYN;
AdminYN ="<%=Session("CODEADMIN_YN")%>";

var v_language = "<%=Session("SESSION_LANG")%>";
var lb_select = false;
var lb_delete = false;
function BodyInit()
{
        System.Translate(document); 
       
        BindingDataList();
       
}

function BindingDataList()
{ 
    
}
function OnSearch(index)
{
    switch(index)
    {
        case 0:
            getUser.Call('SELECT');
        break;
    }
}
//-------------------------------------------------------
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "data_gfnt00070_1":
          
        break;
     }
 }   
//-------------------------------------------------------
function OnNew()
{
    //GridDetail.AddRow();
    onRowDoubleclk(0);
} 
//-------------------------------------------------------
function onRowDoubleclk(index)
{
    switch(index)
    {
        case 0:
            if (GridDetail.rows < 1) 
            {
             return;
            }
            else
            {
                var fpath = System.RootURL + "/form/kp/bp/popupproject.aspx";
                aValue = System.OpenModal( fpath , 850 , 550 , 'resizable:yes;status:yes');
               
                if(aValue !=null)
                {
                 	GridDetail.AddRow();
					// <!----0_pk|1_Projectpk|2.Project code|3.Project name|4_user_id|5_tco_bsuser_pk-->
					GridDetail.SetGridText(GridDetail.rows - 1, 1, aValue[0]);    //User ID
					GridDetail.SetGridText(GridDetail.rows - 1, 2, aValue[1]);    //Emp ID
					GridDetail.SetGridText(GridDetail.rows - 1, 3, aValue[2]);    //mployee Name
					GridDetail.SetGridText(GridDetail.rows - 1, 4, GridSearch.GetGridData(GridSearch.row,2));  //userid
					GridDetail.SetGridText(GridDetail.rows - 1, 5, GridSearch.GetGridData(GridSearch.row,14));// tco_bsuser_pk 
                     
                }
            }
           break; 
           case 1:
            txtuserid.SetDataText(GridSearch.GetGridData(GridSearch.row,2));
            data_kpac1012_2.Call('SELECT')
           break;
     }   
    
}
//-------------------------------------------------------
function OnSave()
{
    data_kpac1012_2.Call();
}
//-------------------------------------------------------
function OnDelete()
{
    var ctrl 	= GridDetail.GetGridControl();
    var rownum 	= Number(ctrl.Row);
    var rownums = Number(ctrl.Rows);
    if ((rownums > 1) && (rownum > 0))
    {
        for(i=1; i<rownums; i++)
        {
	        if (ctrl.isSelected(i) == true)
            {
	            GridDetail.DeleteRow();
	        }
        }
		if(confirm('Do you want to delete selected item?'))
		{
		 OnSave(); 
        }
    }
    else
    {
        alert('Please select row for delete!!!'+'\n'+'Bạn hãy chọn 1 dòng để xóa');
    }
}
//-------------------------------------------------------
</script>
<body>
<!------------------------------------------------------------------------------->

  <gw:data id="getUser"> 
    <xml> 
        <dso type="grid" parameter="0" function="sp_get_user_ec111" > 
            <input> 
                <input bind="txtSearchUserID" />
             
             </input>
            <output  bind="GridSearch"/>
        </dso> 
    </xml> 
</gw:data>
 <!----------------------------------------------------------------------------->
   <gw:data id="data_kpac1012_2" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,4,5" function="sp_sel_kpac1012_2" procedure="sp_upd_kpac1012_1">
                <input bind="GridDetail">                    
                <input bind="txtuserid" /> 
				
            </input> 
            <output bind="GridDetail"></output>
            </dso>
        </xml>
    </gw:data>

        <table border="1" width="100%">
    <tr>
	    <td id="left" width="50%" valign="top">
		    
	            <table border="0" width="100%" cellpadding="0" cellspacing="0"  id="table5">
	                <tr>
	                    <td width="100%">
	                        <fieldset style="width: 100%; height: 100%; padding: 2">
	                             <table border="0" width="100%" cellpadding="0" cellspacing="2"  id="table1">
				                    <tr>
					                    <td  align="right" width="40%">User id&nbsp;</td>
                                        <td width="55%"> <gw:textbox id="txtSearchUserID" styles="width:95%" csstype="filter" onenterkey="OnSearch(0)" /></td>
					                    <td width="5%"  align="right"><gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch(0)" /></td>   
					                          
				                    </tr>
				                   
				                  </table>  
	                         </fieldset>
	                    </td>
	                </tr>
					<!--0.Emp ID|1.Emp Name|2.UserID|3_Charger|4.Tel No|5.Mobile|6.Address|7.Living Addr|8.Urg Cntct|9_Connected|10.Annouce|11.Active|12.Start Dt|13.End Dt|15_PK|_Pwd|_EmpPK|SysAdmin|CodeAdmin|SecrtyAdmin|_Acc_level|_Fu_level|_Sa_level|_Pr_Level|_In_level|__Pu_Level|_Hr_Level|_Ei_Level|_User_Type-->
				    <tr>
					    <td width="100%" >
					        <gw:grid   
	                            id="GridSearch"  
	                            header="Emp ID|Emp Name|UserID|_Charger|Tel No|Mobile|Address|Living Addr|Urg Cntct|_Connected|Annouce|Active|Start Dt|End Dt|_PK|_Pwd|_EmpPK|SysAdmin|CodeAdmin|SecrtyAdmin|_Acc_level|_Fu_level|_Sa_level|_Pr_Level|_In_level|__Pu_Level|_Hr_Level|_Ei_Level|_User_Type"
                                format="0|0|0|0|0|0|0|0|0|3|3|3|4|4|0|0|0|3|3|3|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"
                                defaults="||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="1000|2500|1500|1000|1500|1500|1500|1500|1000|1200|800|1200|1200|0|0|0|1000|1000|1000|0"
                                styles="width:100%; height:460" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28"
                                acceptnulldate="T" 
			                     oncellclick="onRowDoubleclk(1)"
    	                       /> 
					    </td>
                    </tr>
			    </table>			
		   
	    </td>
	    <td align="center" id="right" style="width:50%" valign="top">
	    <table  border="0" cellpadding="0" cellspacing="0" width="100%">
		    <tr >
			    <td >
				
				    <fieldset style="width: 100%; height: 100%; padding: 2">
					
				    <table  border="0" width="100%" cellpadding="0" cellspacing="2"  >
					    <!--tr >
						    <td align="right" style="width:30%">User ID/Emp ID&nbsp;</td>
							<td colspan="2" style="width:65%"><gw:textbox id="txtUserID"  styles="width:100%;" /></td>
							<td  style="width:5%"><gw:checkbox id="chkActive"   value="Y" defaultvalue="Y|N"  /></td>
							<td  >Active</td>
					    </tr-->
					    <tr>
					        <!--td align="right" style="width:30%">Employee Name&nbsp;</td>
							<td colspan="2" style="width:65%"><gw:textbox id="txtEmployeeName"  styles="width:100%;" /></td-->
							<td width="95%"></td>
							<td width="5%" align=right>
							    <table >
							        <tr>
							            <td ><gw:imgBtn id="ibtnReset" img="new" alt="new"	onclick="OnNew()"  	/></td>
						                <td ><gw:imgBtn id="ibtnUpdate" img="save" alt="save" 	onclick="OnSave()" 	 /></td>
						                <td ><gw:imgBtn id="ibtnDelete" img="delete" alt="delete" 	onclick="OnDelete()" 	 /></td>  
							        </tr>
							    </table>
							</td>
							
					    </tr>
						
				    </table>
				    </fieldset>
			    </td>
		    </tr>
			       
		    <tr>
		        <!--0_pk|1_Projectpk|2.Project code|3.Project name|4_user_id|5_tco_bsuser_pk-->
	             <td width="100%"  >
				        <gw:grid   
                            id="GridDetail"  
                            header="_pk|_projectpk|Project code|Project name|_user_id|_5_tco_bsuser_pk"   
                            format="0|0|0|0|0|0"  
                            aligns="0|0|0|0|0|0"  
                            defaults="|||||"  
                            editcol="1|1|1|1|1|1"  
                            widths="0|0|2000|3500|0|0"  
                            styles="width:100%; height:435"   
                            sorting="F"   
                          
		                   
	                             /> 
				    </td>
		    </tr>
	    </table>
	    </td>
	    </tr>
	    </table>
	     <gw:textbox  id="txtuserid" styles='display:none'/>
</body>    
</html>
