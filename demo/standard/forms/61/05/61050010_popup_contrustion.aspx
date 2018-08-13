<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Inquiry Dimension</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	System.Translate(document);
	MerGrid();
}

function MerGrid()
{
        if (Grid_Detail.rows < 2)
		{
			
			Grid_Detail.AddRow();
		}
	var fg=Grid_Detail.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "pk"
		
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Working Item No"
		
        fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Name"
	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Std"
		
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Unit"
		
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Wgt"
		
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 6, 1, 6) = "Descrip"
			
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 7, 0, 14) = "Outsrc.Cont.Dtals"  
		fg.Cell(0, 1, 7, 1) 	= "Raw Mtrl.Cost U/P"
		fg.Cell(0, 1, 8, 1 ) 	= "Raw Mtrl.Cost Amt"
		fg.Cell(0, 1, 9, 1) 	= "Labor U/P"
		fg.Cell(0, 1, 10, 1) 	= "Labor Amt"
		fg.Cell(0, 1, 11, 1 ) 	= "Exp.U/P"
		fg.Cell(0, 1, 12, 1) 	= "Exp.Amt"
		fg.Cell(0, 1, 13, 1) 	= "U/P"
		fg.Cell(0, 1, 14, 1 ) 	= "Amt"
		

}
</script>
<body>

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr style="height:10%">
    <td>
        <fieldset> 
            <table cellpadding="1" cellspacing="1" width="100%" border='0'>
                <tr>
            
                        <td colspan='7' align='left'>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
								<td width ="98%"colspan='7' align='left'></td>
                                <td width='2%'><gw:imgbtn id="btjv2" img="reset" alt="Reset"  onclick="txFa_Class_Cd.text='';txFa_Class_Nm.text='';txFa_Class_Pk.text='';" /></td>
                                <td align='left' style='padding-left:5px'><gw:imgbtn id="btve" img="search" alt="Search"  onclick="OnSearch()" /></td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td align="right" width="15%">Order.W.Div.&nbsp;</td>
                    <td width="30%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>
                    <td width="10%"align="right">Cont Co</td>
                    <td width="45%" colspan='3' >
					
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="100%"><gw:textbox id="txtItem1_L" styles='width:100%' /></td>
                                
                                
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="10%"><gw:list id="lstCond_1" styles='width:100%' /></td>
                </tr>
                <tr>
                    <td align="right" width="15%">Reg.W.Div&nbsp;</td>
                    <td width="30%"><gw:list id="lstDimension_item_2" styles='width:100%' /></td>
                    <td width="10%"align="right">Search DesCrip</td>
                    <td width="45%" colspan='3' >
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="40%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>
								<td width="20%"align="right">Descrip</td>
                                <td width="40%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>                                                                             
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="15%"><gw:list id="lstCond_2" styles='width:100%' /></td>
                </tr>
                <tr>
                    <td align="right" width="15%">Cont Type&nbsp;</td>
                    <td width="30%"><gw:list id="lstDimension_item_3" styles='width:100%' /></td>
                    <td width="10%"align="right">Current S/No</td>
                    <td width="45%"  colspan='3'>
                        <table cellpadding="1" cellspacing="1" width="100%">
                            <tr>
                                <td width="40%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>
								<td width="20%"align="right">Prev S/No</td>
                                <td width="40%"><gw:list id="lstDimension_item_1" styles='width:100%' /></td>   
                            </tr>
                        </table>
                    </td>
                    <td width="2%"></td>
                    <td width="15%"></td>
                </tr>
                
            </table> 
        </fieldset>
    </td>  
</tr>
<tr style="height:90%">
    <td style='padding-top:5px'>
        <gw:grid   
            id      ="Grid_Detail"  
            header  ="_pk|Working Item No|Name|Std|Unit|Wgt|Descrip|Qty|U/P|Amt|||||" 
            format  ="0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
            aligns  ="1|0|1|0|0|0|0|0|0|0|0|0|0|0|0" 
            defaults="|||||||||||||"
            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
            widths  ="1500|3000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
            styles  ="width:100%; height:100%"   
            sorting ="T"  
            /> 
    </td>
</tr> 
</table>  
</body>
</html>

