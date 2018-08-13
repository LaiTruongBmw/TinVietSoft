<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
        System.Translate(document);
		Grid_Mst.GetGridControl().WordWrap = true;
	    Grid_Mst.GetGridControl().RowHeight(0) = 400 ;

		BindingDataList();
	    MergeHeader();
		Grid_Mst.GetGridControl().FrozenCols = 3;
} 
//============================================================================================
 function BindingDataList()
{
	///cmc chua co

}
//============================================================================================
function MergeHeader()
{
        var fg=Grid_Mst.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Mst.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 7)  = "Working[Original](A)"   
		fg.Cell(0, 1, 4, 1, 4) = "Unit"
	    fg.Cell(0, 1, 5, 1, 5) = "Q'ty"
	    fg.Cell(0, 1, 6, 1, 6) = "Unit Price" 
		fg.Cell(0, 1, 7, 1, 7) = "Amount" 
		
		fg.Cell(0, 0, 10, 0, 13)  = "Working[Changed](D)"   
		fg.Cell(0, 1, 10, 1, 10) = "Unit"
	    fg.Cell(0, 1, 11, 1, 11) = "Q'ty"
	    fg.Cell(0, 1, 12, 1, 12) = "Unit Price" 
		fg.Cell(0, 1, 13, 1, 13) = "Amount" 
	    
	
	   
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Budget Item Code"	
		
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Budget Item Name"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Name"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Currency"
		
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Actual Result Amount(B)"
		
		fg.MergeCol(9) = true
		fg.Cell(0, 0, 9, 1, 9) = "Wkng Bal. (C=A-B)"
		
		fg.MergeCol(14) = true
		fg.Cell(0, 0, 14, 1, 14) = "Incr./Decr. (E=D-A)"
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Exec. (Y/N)"
		
		fg.MergeCol(16) = true
		fg.Cell(0, 0, 16, 1, 16) = "Calc. Basis"
		
		fg.MergeCol(17) = true
		fg.Cell(0, 0, 17, 1, 17) = "_Project_pk"
		fg.MergeCol(18) = true
		fg.Cell(0, 0, 18, 1, 18) = "_Budget_pk"
		fg.MergeCol(19) = true
		fg.Cell(0, 0, 19, 1, 19) = "_Budget_Item_pk"
		fg.MergeCol(20) = true
		fg.Cell(0, 0, 20, 1, 20) = "_parent_pk"
		fg.MergeCol(21) = true
		fg.Cell(0, 0, 21, 1, 21) = "_pk"
		
} 
//============================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
				case 'Project':
                            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2];  
									dso_budget_no.Call();
                            } 
                break;
				case 'Budget':
						if(event.col == 0 || event.col == 1)
						{
								var fpath = System.RootURL + "/form/kp/bm/kpbm00080_Budget_1.aspx?Budget_pk=" + lstBudgetNo.value;
								var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
								if(object != null)
								{
                                    txtBudgetItem_Pk.text = object[2]; 
		                            if(!CheckDuplicate())
		                            {                                       
		                                return;
		                            } 
		                            else
		                            {
										Grid_Mst.SetGridText(Grid_Mst.row, 19,   object[2]);//pk
										Grid_Mst.SetGridText(Grid_Mst.row, 0, object[0]);//code
										Grid_Mst.SetGridText(Grid_Mst.row, 1, object[1]);//name
                                    }
								}
						}
				break;
		}
}
//============================================================================================
function OnSave()
{
		Grid_Mst.SetRowStatus(1, 'Search');
		dso_update.Call();	
}
//============================================================================================
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
			dso_update.Call("SELECT");	
		}
		else
		{
				alert('Please select Project !!');	
		}
}
//============================================================================================
function OnDataReceive(obj)
{
         switch(obj.id)
         {
                case "dso_budget_no":
						dso_update.Call("SELECT");	
				break;
				case "dso_update":
						  var i;
							var ctl = Grid_Mst.GetGridControl();
							ctl.OutlineBar = 5;
							var j;
							for(i=2;i<Grid_Mst.rows;i++)
							{   
								j = Find_Heigher_Level(Grid_Mst.GetGridData(i,20),i);
							   ctl.IsSubtotal(i)=true;
							   
								ctl.RowOutlineLevel(i)=j;   
								//Grid_Mst.SetCellBgColor(i, 7, i, 7, 0xabcdef);
							}
						
						MergeHeader();
						//Grid_Mst.SetGridText(1,0, '');	
						dso_total.Call();
				break;
		 }
}
//============================================================================================
function Find_Heigher_Level(value,row)
{
    var i=row;
    if ( Grid_Mst.GetGridData(row,20) == "1" )
    { 
        return 0;
    }    
    else
    {
        while (i>=1)
        {
            if ( Grid_Mst.GetGridData(i,20) == value-1)
            {
                return i;
            }    
            i=i-1
        }
    }    
} 
//============================================================================================
function OnCopy()
{
			dso_copy.Call();
}
//============================================================================================
function OnCalc()
{
		var A_Qty = Number(Grid_Mst.GetGridData(Grid_Mst.row, 5));
		var A_UP = Number(Grid_Mst.GetGridData(Grid_Mst.row, 6));
		var A_Amt = 0;
		var B_Amt = Number(Grid_Mst.GetGridData(Grid_Mst.row, 8));
		var D_Qty = Number(Grid_Mst.GetGridData(Grid_Mst.row, 11));
		var D_UP = Number(Grid_Mst.GetGridData(Grid_Mst.row, 12));
		var D_Amt = 0;
		var C_Amt = 0;
		var E_Amt = 0;
		A_Amt = Math.round(A_Qty * A_UP);
		C_Amt = Math.round(A_Amt - B_Amt);
		D_Amt = Math.round(D_Qty * D_UP);
		E_Amt = Math.round(D_Amt - A_Amt);
		Grid_Mst.SetGridText(Grid_Mst.row, 7, A_Amt);
		Grid_Mst.SetGridText(Grid_Mst.row, 9, C_Amt);
		Grid_Mst.SetGridText(Grid_Mst.row, 13, D_Amt);
		Grid_Mst.SetGridText(Grid_Mst.row, 14, E_Amt);
}
//============================================================================================
function OnNew()
{
		if(txtProject_Pk.text != '')
		{
            var path = System.RootURL + '/form/kp/bm/kpbm00080_Budget.aspx?Budget_pk=' + lstBudgetNo.value;
			var aValue = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');
			if(aValue != null)
			{
				var tmp = new Array();
				tmp = aValue[0]; 
		        txtBudgetItem_Pk.text = tmp[2]; 
		        if(!CheckDuplicate())
		        {                                       
		            return;
		        } 
		        else
		        {
					for(var i=0; i<aValue.length; i++)
					{ 				
						tmp = aValue[i];
						Grid_Mst.AddRow();
			            Grid_Mst.SetGridText(Grid_Mst.rows- 1, 18, lstBudgetNo.value);
			            Grid_Mst.SetGridText(Grid_Mst.rows- 1, 17, txtProject_Pk.text);
                        Grid_Mst.SetGridText(Grid_Mst.rows-1, 19, tmp[2]);//pk
						Grid_Mst.SetGridText(Grid_Mst.rows-1, 0, tmp[0]);//code
						Grid_Mst.SetGridText(Grid_Mst.rows-1, 1, tmp[1]);//name
                    }
                }
            }
		}
		else
		{
				alert('Please select Project !!');	
		}
}

function CheckDuplicate()
{
    for(var i = 1; i < Grid_Mst.rows; i++)
    {
        if(Grid_Mst.GetGridData(i, 19) == txtBudgetItem_Pk.text)
        {
             alert("Duplicated Budget Code!! ");
             return false ;
        }
    }
    return true;
}

function OnPrint()
{
	if(Grid_Mst.rows > 1)                                                 
	 {
		 var url = '/reports/kp/bm/rpt_kpbm00080.aspx?p_tecps_projectsumm_pk='+ txtProject_Pk.text + '&p_tecps_performbudgetbasc_pk='+lstBudgetNo.value;
			 System.OpenTargetPage( System.RootURL+url , "newform" );  
	}
}
//============================================================================================
function OnDelete()
{
		if(confirm('Are you sure you want to delete?'))
		Grid_Mst.DeleteRow();	
		dso_update.Call();
}
</script>
<body>
 <gw:data id="dso_budget_no" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="SP_PRO_SEL_kpbp00070" > 
            <input> 
                <input bind="txtProject_Pk" />
            </input>
	       <output>
	            <output bind="lstBudgetNo" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>   

<gw:data id="dso_update" onreceive="OnDataReceive(this)">
    <xml>
        <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="sp_sel_kpbm00080_2"    procedure="sp_upd_kpbm00080">
            <input bind="Grid_Mst">
                <input bind="txtProject_Pk"/>
                <input bind="lstBudgetNo"/>
            </input>
            <output bind="Grid_Mst"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_total" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="SP_PRO_SEL_kpbm00080" > 
            <input> 
                <input bind="txtProject_Pk" />
                <input bind="lstBudgetNo"/>
            </input>
	       <output>
	            <output bind="lstTotal" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>   
<!--<gw:data id="dso_copy" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process"   procedure="sp_Pro_kpbp00050_copy"  > 
                <input> 
                    <input bind="lstVersion" /> 
                    <input bind="txtProject_Pk" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>
-->

    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:2%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="1" cellspacing="1">
                                            <tr>
                                                        <td align="right" width="10%">
                                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                                Project&nbsp;</a></td>
                                                        <td width="45%">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="40%">
                                                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                                                    </td>
                                                                    <td width="60%">
                                                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                                                    </td>
                                                                    <td width="">
                                                                        <gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
                                                                    </td>
                                                                    <td>
                                                                        <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="22%" align="right">Budget Statement No&nbsp;</td>
                                                                <td width="18%"><gw:list id="lstBudgetNo" styles='width:100%' /></td>
                                                        <td  style="display:none"><gw:button id="btSve2" img="copy" alt="Copy Standard Expenses"  onclick="OnCopy()" /></td>
                                                        <td ><gw:button id="btSve2" img="search" alt="Search"  onclick="OnSearch()" /></td>
                                                        <td ><gw:button id="btSve2" img="new" alt="New"  onclick="OnNew()" /></td>
                                                        <td ><gw:button id="btSve2" img="save" alt="Save"  onclick="OnSave()" /></td>
                                                        <td ><gw:button id="btSve2" img="delete" alt="Delete"  onclick="OnDelete()" /></td>
														<td style="width: 5%" align="right">
															<gw:button img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()" />
														</td>	
                                            </tr>    
                                            <tr >
                                            			
                                                        <td width="" align="right">Total&nbsp;</td>
                                                        <td width="" colspan="8"><gw:list id="lstTotal" styles='width:100%' /></td>
											</tr>       
                                </table>
                            </fieldset>
                        </td>
                    </tr>
					
                    <tr style="height: 96%">
                       <td width="100%">
                       					<!--header="0.Item Code|1.Item Name|2.Name|3.Ccy|4.Unit|5.Qty|6.Unit Price|7.Amt|8.Actual Result Amt|9.Working Balance|10.Unit|11.Qty|12.Unit Price|13.Amt|14.Increase/Decrease|15.Execute YN|16.Caculator|17.Project_pk|18.Budget_pk|19._Budget_Item_pk|20.pk|21.parent_pk"   -->  
								                    <gw:grid 
													            id="Grid_Mst"  
													            header="Item Code|Item Name|Name|Ccy|Unit|Qty|Unit Price|Amt|Actual Result Amt|Working Balance|Unit|Qty|Unit Price|Amt|Increase/Decrease|Execute YN|Caculator|_Project_pk|_Budget_pk|_Budget_Item_pk|_parent_pk|_pk"   
													            format="0|0|0|0|0|1|1|1|1|1|0|1|1|1|1|0|0|0|0|0|0|0"  
													            aligns ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
													            defaults="|||||||||||||||||||||"  
													            editcol="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
													            widths  ="2000|2500|2500|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1000|2000|0|0|0|0|0"  
													            styles="width:100%; height:100%"   
													            sorting="T"   
													            oncelldblclick= "OnPopUp('Budget')"
                                                                onafteredit="OnCalc()"
                                                                 /> 
										        </td>
                    </tr>
                </table>
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
   <gw:textbox id="txtBudgetItem_Pk" styles='width:100%;display:none' />             
</body>
</html>
