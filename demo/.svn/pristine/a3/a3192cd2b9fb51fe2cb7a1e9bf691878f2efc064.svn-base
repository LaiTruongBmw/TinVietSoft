<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manpower Plan</title>
</head>
<%  ESysLib.SetUser("acnt")%>

<script>
var G2_SITE_EXE_YN    =0,
    G2_JOB            =1,
    G2_POSITION       =2,
    G2_UNIT_PRICE     =3,
    G2_MM_SUM         =4,
    JAN            =5,
    FEB            =6,
    MAR            =7,
    APR            =8,
    MAY            =9,
    JUN            =10,
    JUL            =11,
    AUG            =12,
    SEP            =13,
    OCT            =14,
    NOV            =15,
    DEC            =16,
    JAN2            =17,
    FEB2            =18,
    MAR2            =19,
    APR2            =20,
    MAY2            =21,
    JUN2            =22,
    JUL2            =23,
    AUG2            =24,
    SEP2            =25,
    OCT2            =26,
    NOV2            =27,
    DEC2            =28;
function BodyInit()
{
      System.Translate(document);
      MergeHeader(); 
      MergeHeader_Planned();  
      MergeHeader_LaborCost();   
}
//==========================================================================
function MergeHeader()
{
        var fg=Grid_Detail.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Detail.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 0, 0, 1)  = "Planned MM"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 0, 1, 0) = "MM"
	    fg.Cell(0, 1, 1, 1, 1) = "Amount" 
	    
		fg.Cell(0, 0, 2, 0, 3)  = "Actual MM"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 2, 1, 2) = "MM"
	    fg.Cell(0, 1, 3, 1, 3) = "Amount" 
}
//===========================================================
function ResetGrid()
{
    Grid_Planned.GetGridControl().ColHidden(JAN)     = false ;
    Grid_Planned.GetGridControl().ColHidden(FEB)     = false ;
    Grid_Planned.GetGridControl().ColHidden(MAR)     = false ;
    Grid_Planned.GetGridControl().ColHidden(APR)     = false ;
    Grid_Planned.GetGridControl().ColHidden(MAY)     = false ;
    Grid_Planned.GetGridControl().ColHidden(JUN)     = false ;
    Grid_Planned.GetGridControl().ColHidden(JUL)     = false ;
    Grid_Planned.GetGridControl().ColHidden(AUG)     = false ;
    Grid_Planned.GetGridControl().ColHidden(SEP)     = false ;
    Grid_Planned.GetGridControl().ColHidden(OCT)     = false ;
    Grid_Planned.GetGridControl().ColHidden(NOV)     = false ;
    Grid_Planned.GetGridControl().ColHidden(DEC)     = false ;
    Grid_Planned.GetGridControl().ColHidden(JAN2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(FEB2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(MAR2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(APR2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(MAY2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(JUN2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(JUL2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(AUG2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(SEP2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(OCT2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(NOV2)     = false ;
    Grid_Planned.GetGridControl().ColHidden(DEC2)     = false ;
}
//==========================================================================
function MergeHeader_Planned()
{
        var fg=Grid_Planned.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_Planned.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
        fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Site Execution Y/N"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Job"	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Position"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Unit Price"	
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "MM Sum"
		
        var date1=dtWorking_Period_Fr.value;
        var date2=dtWorking_Period_To.value;
        
        var year1=date1.substring(0,4);
        var year2=date2.substring(0,4);
        
        var month1=Number(date1.substring(4,6));
        var month2=Number(date2.substring(4,6));
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 5, 0, 16)  = year1  //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 5, 1, 5) = "Jan"
	    fg.Cell(0, 1, 6, 1, 6) = "Feb" 
	    fg.Cell(0, 1, 7, 1, 7) = "Mar" 
	    fg.Cell(0, 1, 8, 1, 8) = "Apr"  
	    fg.Cell(0, 1, 9, 1, 9) = "May"
	    fg.Cell(0, 1, 10, 1, 10) = "Jun"
	    fg.Cell(0, 1, 11, 1, 11) = "Jul"
	    fg.Cell(0, 1, 12, 1, 12) = "Aug"
	    fg.Cell(0, 1, 13, 1, 13) = "Sep"
	    fg.Cell(0, 1, 14, 1, 14) = "Oct"
	    fg.Cell(0, 1, 15, 1, 15) = "Nov"
	    fg.Cell(0, 1, 16, 1, 16) = "Dec"      
	    
	    fg.Cell(0, 0, 17, 0, 28)  = year2   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 17, 1, 17) = "Jan"
	    fg.Cell(0, 1, 18, 1, 18) = "Feb" 
	    fg.Cell(0, 1, 19, 1, 19) = "Mar" 
	    fg.Cell(0, 1, 20, 1, 20) = "Apr"  
	    fg.Cell(0, 1, 21, 1, 21) = "May"
	    fg.Cell(0, 1, 22, 1, 22) = "Jun"
	    fg.Cell(0, 1, 23, 1, 23) = "Jul"
	    fg.Cell(0, 1, 24, 1, 24) = "Aug"
	    fg.Cell(0, 1, 25, 1, 25) = "Sep"
	    fg.Cell(0, 1, 26, 1, 26) = "Oct"
	    fg.Cell(0, 1, 27, 1, 27) = "Nov"
	    fg.Cell(0, 1, 28, 1, 28) = "Dec"    
	    
	    if(year2<=year1)
	    {
	        ResetGrid();
	        Grid_Planned.GetGridControl().ColHidden(JAN2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(FEB2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(MAR2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(APR2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(MAY2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        if(month2==11)
	        {

                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
                
	        }
	        if(month2==10)
	        {

                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==9)
	        {

                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==8)
	        {

                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==7)
	        {
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==6)
	        {

                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==5)
	        {

                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==4)
	        {

                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==3)
	        {

                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==2)
	        {

                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        if(month2==1)
	        {

                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
                Grid_Planned.GetGridControl().ColHidden(DEC)     = true ;
	        }
	        
	        //============================================================
	        if(month1==2)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                
	        }
	        if(month1==3)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
	        }
	        if(month1==4)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
	        }
	        if(month1==5)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
	        }
	        if(month1==6)
	        {
                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
	        }
	        if(month1==7)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
	        }
	        if(month1==8)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
	        }
	        if(month1==9)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
	        }
	        if(month1==10)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
	        }
	        if(month1==11)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
	        }
	        if(month1==12)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
	        }   
	    }
	    
	    //===============================================================================
	    else
	    {
	        ResetGrid();

	        if(month2==11)
	        {
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==10)
	        {
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	           
	        }
	        if(month2==9)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==8)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==7)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==6)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==5)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==4)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAY2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==3)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAY2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(APR2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==2)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAY2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(APR2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAR2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        if(month2==1)
	        {
	            Grid_Planned.GetGridControl().ColHidden(NOV2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(OCT2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(SEP2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(AUG2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUL2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(JUN2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAY2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(APR2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(MAR2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(FEB2)     = true ;
	            Grid_Planned.GetGridControl().ColHidden(DEC2)     = true ;
	        }
	        
	        //============================================================
	        
	        if(month1==2)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                
	        }
	        if(month1==3)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
	        }
	        if(month1==4)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
	        }
	        if(month1==5)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
	        }
	        if(month1==6)
	        {
                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
	        }
	        if(month1==7)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
	        }
	        if(month1==8)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
	        }
	        if(month1==9)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
	        }
	        if(month1==10)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
	        }
	        if(month1==11)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
	        }
	        if(month1==12)
	        {

                Grid_Planned.GetGridControl().ColHidden(JAN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(FEB)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(APR)     = true ;
                Grid_Planned.GetGridControl().ColHidden(MAY)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUN)     = true ;
                Grid_Planned.GetGridControl().ColHidden(JUL)     = true ;
                Grid_Planned.GetGridControl().ColHidden(AUG)     = true ;
                Grid_Planned.GetGridControl().ColHidden(SEP)     = true ;
                Grid_Planned.GetGridControl().ColHidden(OCT)     = true ;
                Grid_Planned.GetGridControl().ColHidden(NOV)     = true ;
	        }   
		}
}
//==========================================================================
function MergeHeader_LaborCost()
{
        var fg=Grid_LaborCost.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   Grid_LaborCost.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		
		fg.Cell(0, 0, 4, 0, 6)  = "2010"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 4, 1, 4) = "MM"
	    fg.Cell(0, 1, 5, 1, 5) = "Unit Price" 
	    fg.Cell(0, 1, 6, 1, 6) = "Amount"   
	    fg.Cell(0, 0, 7, 0, 9)  = "2011"   //fg.Cell(0,row, from_col, row, to_col)	
	    fg.Cell(0, 1, 7, 1, 7) = "MM"
	    fg.Cell(0, 1, 8, 1, 8) = "Amount" 
	    fg.Cell(0, 1, 9, 1, 9) = "MM"    
	    
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Postion"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "MM"	
	    fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Ccy"	
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Amount"	
}
//==========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Project':
            var fpath = System.RootURL + "/form/kp/bp/kpbp00060_1.aspx";
            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
            if(aValue != null)
            {
                    txtProject_Pk.text = aValue[0];
                    txtProject_Cd.text = aValue[1];
                    txtProject_Nm.text = aValue[2];  
            } 
        break;
    }
}
//==========================================================================
function OnSearch(){
	alert(System.Menu.GetMenuID());
}
</script>

<body>
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="12%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                    Project</a></td>
                            <td width="30%">
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
                            <td align="right" width="12%">
                                Actual Result Receipt Date</td>
                            <td width="46%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="10%">
                                            <gw:datebox type="month" id="dtActual" lang="1" />
                                        </td>
                                        <td align="right" width="47%">
                                            <a href="#" style="text-decoration: none" onclick="OnPopUp()">Contract Ccy&nbsp;</a>
                                            <td width="43%">
                                                <gw:list id="lstContract_Ccy" onchange="" styles='width:100%'></gw:list>
                                            </td>
                                            <td>
                                                <gw:imgbtn id="ibtnopdte" img="search" alt="Search" onclick="OnSearch()" />
                                            </td>
                                            <td>
                                                <gw:imgbtn id="ibtndte" img="new" alt="New" onclick="OnNew()" />
                                            </td>
                                            <td>
                                                <gw:imgbtn id="ibtnpdate" img="save" alt="Save" onclick="OnSave()" />
                                            </td>
                                            <td>
                                                <gw:imgbtn id="ibtUdate" img="delete" alt="Delete" onclick="OnDelete()" />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Working Period</td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="45%">
                                            <gw:datebox id="dtWorking_Period_Fr" lang="1" type='month' onchange="MergeHeader_Planned()" />
                                        </td>
                                        <td width="10%" align="center">
                                            ~</td>
                                        <td width="45%">
                                            <gw:datebox id="dtWorking_Period_To" lang="1" type='month' onchange="MergeHeader_Planned()"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp()">Budget No.&nbsp;</a>
                            </td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:list id="lstBudget_No" onchange="" styles='width:100%'></gw:list>
                                        </td>
                                        <td align="right" width="20%">
                                            Contract Amount&nbsp;</td>
                                        <td width="40%">
                                            <gw:textbox id="txtContract_Amt" styles='width:100%' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 30%">
            <td width="100%">
                <gw:grid id="Grid_Detail" header="MM|Amount|MM|Amount" format="0|0|0|0" aligns="1|3|1|3"
                    defaults="|||" editcol="1|1|1|1" widths="1000|5000|1000|2500" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
        <tr style="height: 68%">
            <td width="100%">
                <gw:tab id="idTab">
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="Planned MM">
                    <tr>
                        <td width="100%">
                            <!--header="0.Description | 1.Amount (Contract Ccy) | 2.Amount (USD) | 3.Ratio to Contract Amount | 4.Amount (Contract Ccy) | 5.Amount (USD) | 6.Ration to Total Amount | 7.(Main Contract - Budget) | 8.Budget Amt / Main Contract Amt"   -->
                            <gw:grid id="Grid_Planned" header="Site Execution Y/N|Job|Position|Unit Price|MM Sum|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|Jan2|Feb2|Mar2|Apr2|May2|Jun2|Jul2|Aug2|Sep2|Oct2|Nov2|Dec2"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="1|1|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0"
                                defaults="||||||||||||||||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="2000|2500|2500|2500|2500|2500|2500|2500|2000|2000|2000|2500|2500|2500|2500|2500|2000|2500|2500|2500|2000|2000|2000|2500|2500|2500|2500|2500|2000"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="Inquiry Labor Cost">
                    <tr style="height: 10%; width: 100%">
                        <td>
                            <fieldset style="width: 100%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right" width="12%">
                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onclick="OnPopUp('Project')">
                                                Project</a></td>
                                        <td width="30%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtProjectL_Cd" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="60%">
                                                        <gw:textbox id="txtProjectL_Nm" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="">
                                                        <gw:textbox id="txtProjectL_Pk" styles='width:100%;display:none' />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btvre2" img="reset" alt="Reset" onclick="txtProjectL_Cd.text='';txtProjectL_Nm.text='';txtProjectL_Pk.text='';" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" width="15%">
                                            Budget No.</td>
                                        <td width="47%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="30%">
                                                        <gw:textbox id="txtBudget_No" styles='width:100%' />
                                                    </td>
                                                    <td align="right" width="30%">
                                                        Turnover/Person</td>
                                                    <td width="30%">
                                                        <gw:textbox id="txtTurnover" styles='width:100%' />
                                                    </td>
                                                    <td width="10%">
                                                        USD/Year</td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnpdte" img="new" alt="New" onclick="OnNew()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Working Period</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_Fr1" lang="1" />
                                                    </td>
                                                    <td width="10%" align="center">
                                                        ~</td>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_To1" lang="1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            Contract Amount</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td width="100%">
                            <!--header=" 0.Description | 1.Amount (Contract Ccy) | 2.Amount (USD) | 3.Ratio to Contract Amount | 4.Amount (Contract Ccy) | 5.Amount (USD) | 6.Ration to Total Amount | 7.Amount (Contract Ccy) | 8.Amount (USD) | 9.Ration to Total Amount | 10.Current - Orignial | 11.Current-Last"   -->
                            <gw:grid id="Grid_LaborCost" header="Postion|MM|Ccy|Amount|MM|Unit Price|Amount|MM|Amount|MM"
                                format="0|0|0|0|0|0|0|0|0|0" aligns="1|1|0|0|1|1|1|1|1|1" defaults="|||||||||"
                                editcol="1|1|1|1|1|1|1|1|1|1" widths="3000|2500|2500|2500|2500|2500|2500|2500|2500|2500"
                                styles="width:100%; height:100%" sorting="T" />
                        </td>
                    </tr>
                </table>
                </gw:tab>
            </td>
        </tr>
    </table>
</body>
</html>
