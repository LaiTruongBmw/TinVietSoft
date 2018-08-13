<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Project</title>
</head>
<%  ESysLib.SetUser("EC111")%>
<script>
function BodyInit()
{
        System.Translate(document);
        MergeHeader();
        
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
		
		fg.Cell(0, 0, 3, 0, 6)  = "Budget (Orginal) (A)"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 3, 1, 3) = "UOM"
	    fg.Cell(0, 1, 4, 1, 4) = "Quantity" 
	    fg.Cell(0, 1, 5, 1, 5) = "Unit Price"   
	    fg.Cell(0, 1, 6, 1, 6)  = "Amount"   //fg.Cell(0,row, from_col, row, to_col)
		
		fg.Cell(0, 0, 9, 0, 12)  = "Budget (Adjusted) (A)"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 9, 1, 9) = "UOM"
	    fg.Cell(0, 1, 10, 1, 10) = "Quantity" 
	    fg.Cell(0, 1, 11, 1, 11) = "Unit Price"   
	    fg.Cell(0, 1, 12, 1, 12)  = "Amount" 	
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Budget Item Code"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Budget Item Name"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Name"	
		fg.MergeCol(7) = true
		fg.Cell(0, 0, 7, 1, 7) = "Actual Result Amount"	
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Actual Result Amount"	
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Increase/Decrease"	
		fg.MergeCol(14) = true
		fg.Cell(0, 0, 14, 1, 14) = "Head office/Site"	
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Formula"	
}
//============================================================================================

</script>
<body>
 
    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height:1%;width:100%">
                        <td>
                            <fieldset style="width:100%;padding:0">
                                <table  style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                        <td width="100%"></td>
                                                        
                                                        <td ><gw:imgbtn id="btSve2" img="copy" alt="Copy Standard Expenses"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="new" alt="New"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="search" alt="Search"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="save" alt="Save"  onclick="" /></td>
                                                        <td ><gw:imgbtn id="btSve2" img="delete" alt="Delete"  onclick="" /></td>
                                            </tr>           
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 99%;width:100%">
                       <td width="100%">
                       		<!--header="0.Budget Item Code|1.Budget Item Name|2.Name|3.UOM|4.Quantity|5.Unit Price|6.Amount|7.Actual Result Amount|8.Budget Balance|9.UOM|10.Quantity|11.Unit Price|12.Amount|13.Increase/Decrease|14.Head office/Site|15.Formula"-->			
                            <gw:grid 
                            id="Grid_Mst"  
                            header="Budget Item Code|Budget Item Name|Name|UOM|Quantity|Unit Price|Amount|Actual Result Amount|Budget Balance|UOM|Quantity|Unit Price|Amount|Increase/Decrease|Head office/Site|Formula"   
                            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                            aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                            defaults="|||||||||||||||"  
                            editcol ="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
                            widths  ="2000|2500|2500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"  
                            styles="width:100%; height:100%"   
                            sorting="T"   
                            oncelldblclick= "DblClick()" /> 
                        </td>
                    </tr>
                </table>
</body>
</html>
