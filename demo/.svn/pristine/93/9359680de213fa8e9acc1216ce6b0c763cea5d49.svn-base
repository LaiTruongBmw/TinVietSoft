<!-- #include file="../../../system/lib/form.inc" -->
<% ESysLib.SetUser("mafg")%>
<script>
function BodyInit()
{
        System.Translate(document);
        OnFormatGrid();
        OnSearch();
}
function OnSearch()
{
    dsoPrinting.Call("SELECT");
}
function OnSave(){
    if(chkCloseYN.GetData() == "N"){
        if(confirm("Do you want to close  instruction ?")){
            dsoPrinting.Call();
        }
    }
    else{
        if(confirm("Do you want to unclose  instruction ?")){
            dsoPrinting.Call();
        }
    }
}
function OnSelect()
{
    var arr_data = new Array();
   
   if(grdPrinting1.rows > 1)
   {   
      for(var i=1;i<grdPrinting1.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<grdPrinting1.cols;j++)
         {
            arrTemp[arrTemp.length]= grdPrinting1.GetGridData(i,j);
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
function OnGridCellDoubleClick(obj)
{
  if(obj.id == "grdPrinting" && event.row > 0 )
  {
    var col_val = obj.GetGridData(event.row,0);
    
    if(event.row > 0 )
    {
		grdPrinting1.AddRow();
		for(var i=0;i < obj.cols;i++)
		{
		  grdPrinting1.SetGridText(grdPrinting1.rows-1,i,obj.GetGridData(event.row,i));
		}
     }
  } 
}
function OnFormatGrid()
{
    var trl;
    
    trl = grdPrinting1.GetGridControl();	
    trl1 = grdPrinting.GetGridControl();	
    
    trl.ColFormat(8)           = "###,###"; 
    trl.ColFormat(9)           = "###,###";        
    
    trl1.ColFormat(8)           = "###,###"; 
    trl1.ColFormat(9)           = "###,###";    
}
function OnRemove()
{
  if(grdPrinting1.row > 0)
  {
    
    grdPrinting1.RemoveRowAt(grdPrinting1.row);
    
  }
}
</script>
<body>
    <gw:data id="dsoPrinting" > 
        <xml> 
            <dso type="grid" parameter="2,10" function="MAFG.sp_sel_instruction_data" procedure="MAFG.sp_upd_instruction_data">  
                <input bind="grdPrinting"   > 
                    <input bind="txtLotNo" /> 
                    <input bind="txtVendorNo" /> 	 															
                    <input bind="chkCloseYN" />
                </input> 
                <output bind="grdPrinting" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
            <td>
            <fieldset>
                <table width="100%" style="height: 100%">
                    <tr style="height: 100%">
                        <td width="5%">
                            <b>Lot No</b></td>
                        <td width="20%">
                            <gw:textbox id="txtLotNo" onenterkey="OnSearch()"/>
                        </td>
                        <td width="18%">
                            Vendor No/Vendor Name</td>
                        <td width="20%">
                            <gw:textbox id="txtVendorNo" onenterkey="OnSearch()"/>
                        </td>
                        <td width="10%" align="right">Close Y/N</td>
                        <td width="3%">
                            <gw:checkbox id="chkCloseYN" defaultvalue="Y|N" onchange="OnSearch()"/>
                        </td>
                        <td width="15%">
                        </td>
                        <td with="3%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td with="3%">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
                        </td>
                        <td with="3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id="grdPrinting" 
                    header="Inst date|_iss_no|Lot No|Prod Machine|Vend No|Vendor Name|Mat No|Material Name|Instructed Qty|Remain Qty|Close YN"
                    format="4|0|0|0|0|0|0|0|0|0|3" 
                    aligns="0|0|0|0|0|0|0|0|3|3|0"
                    defaults="||||||||||" 
                    autosize="true"
                    editcol="0|0|0|0|0|0|0|0|00|0" 
                    widths="1400|1500|1800|1800|1800|1800|1800|1800|1800|1800|1200"
                    sorting='T' styles="width:100%; height:100%" oncelldblclick="OnGridCellDoubleClick(this)"/>
            </td>
        </tr>
        <tr style="height: 2%" align="right">
        <td><gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" /></td>
        </tr>
        <tr style="height: 48%">
            <td colspan="7">
                <gw:grid id="grdPrinting1" 
                    header="Inst date|_iss_no|Lot No|Prod Machine|Vend No|Vendor Name|Mat No|Material Name|Instructed Qty|Remain Qty|_Close YN"
                    format="4|0|0|0|0|0|0|0|0|0|3" 
                    aligns="0|0|0|0|0|0|0|0|3|3|0"
                    defaults="||||||||||" 
                     autosize="true"
                    editcol="0|0|0|0|0|0|0|0|00|0"  
                    widths="1400|1500|1800|1800|1800|1800|1800|1800|1800|1800|1200"
                    sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
    <gw:list id="lstPrintType" styles='display:none;'></gw:list>
    <gw:list id="lstMachineType" styles='display:none;'></gw:list>
    <gw:list id="lstMachNo" styles='display:none;'></gw:list>
</body>
</html>
