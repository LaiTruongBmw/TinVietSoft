<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Plan Inquiry</title>
</head>

<script>

 //---------------------------------------------------------
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------
    BindingDataList();
    FormatGrid();
    
 }
  //---------------------------------------------------------

 function FormatGrid()
 {
        grdPlan.GetGridControl().FrozenCols  = 5 ;
        //------------
        var ctrl = grdPlan.GetGridControl();
        ctrl.ColFormat(3)   = "###,###,###.##" ;
        ctrl.ColFormat(4)   = "###,###,###.##" ;
        ctrl.ColFormat(5)   = "###,###,###.##" ;
        ctrl.ColFormat(6)   = "###,###,###.##" ;
        ctrl.ColFormat(7)   = "###,###,###.##" ;
        ctrl.ColFormat(8)   = "###,###,###.##" ;
        ctrl.ColFormat(9)   = "###,###,###.##" ;
        ctrl.ColFormat(10)  = "###,###,###.##" ;
        ctrl.ColFormat(11)  = "###,###,###.##" ;
        ctrl.ColFormat(12)  = "###,###,###.##" ;
        ctrl.ColFormat(13)  = "###,###,###.##" ;
        ctrl.ColFormat(14)  = "###,###,###.##" ;
        ctrl.ColFormat(15)  = "###,###,###.##" ;
        ctrl.ColFormat(16)  = "###,###,###.##" ;
        ctrl.ColFormat(17)  = "###,###,###.##" ;
        ctrl.ColFormat(18)  = "###,###,###.##" ;
        ctrl.ColFormat(19)  = "###,###,###.##" ;
        //-----------------
        
        ctrl.MergeCells = 2 ; 
        
        ctrl.MergeCol(0) = true ; 
        ctrl.MergeCol(1) = true ; 
        ctrl.MergeCol(2) = true ; 
        ctrl.MergeCol(3) = true ;
        ctrl.MergeCol(4) = true ;        
 }
 
 //---------------------------------------------------------
 
 function BindingDataList()
 {   
       var data ;
       
       data = "<%=ESysLib.SetListDataSQL("select  a.PK,a.PROCESS_NAME  from TLG_pb_PROCESS a where a.DEL_IF =0 ")%>|ALL|Select ALL" ;
       lstProcess.SetDataText(data);
       lstProcess.value = 'ALL' ;

       //-------------
        
       data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('PRBP0010') FROM DUAL" )%>|ALL|Select ALL";    
       lstStatus.SetDataText(data);
       lstStatus.value = 'ALL' ;
       //-------------
       
       OnGetLine();       
 }
 
 //----------------------------------------------
 
 function OnGetLine()
 {
        data_GetLine.Call();
 }
 
 //----------------------------------------------
 
 function OnSearch(pos)
 {
    if ( pos == ''  )
    {
       
	}
	else if ( pos == 'grdPlan' )
	{
	    fpip00030_1.Call('SELECT');
	}    
 }

//------------------------------------------------------------------
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {	
            case 'fpip00030_1':                       
                fpip00030_2.Call("SELECT");   
            break; 
            
            case 'data_GetLine':
                lstLine.value = 'ALL' ;
            break;
            
            case 'fpip00030_2': 
                 if ( grdPlan.rows > 1 )
                 {
                    grdPlan.SetCellBold( 1, 5, grdPlan.rows - 1, 19, true);
                 }   
                 //------------------------------------------                 
                 for( var j = 5; j < grdPlan.cols; j++ )
                 {
                      if ( grdTmp.GetGridData( 1, j ) == "SUNDAY   " ) // Bat buoc phai co khoang trong phia sau cua chu SUNDAY
                      {       
                            grdPlan.GetGridControl().Cell( 7, 0, j, 0, j ) = 0x3300cc;                        
                      }
                      else
                      {
                            grdPlan.GetGridControl().Cell( 7, 0, j, 0, j ) = 0x000000;    
                      }
                      //------------------------      
                      grdPlan.GetGridControl().Cell( 0, 0, j, 0, j ) = grdTmp.GetGridData( 2, j );
                      
                      //------------------------
                      for( var i = 1; i < grdPlan.rows ; i++ )
                      {      
                            if (  !Number(grdPlan.GetGridData(i, j)) > 0 )
                            {                        
                                grdPlan.SetGridText( i, j, '') ;                             
                            }                                                                           
                      } 
                                      
                      //------------------------                                       
                 }
            break;                   
      }	 
 }
//------------------------------------------------------------------  
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="fpip00030_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00030_2" > 
                <input bind="grdPlan" >                  
				    <input bind="dtFrom" />
				    <input bind="lstProcess" />
                    <input bind="lstLine" />
				    <input bind="lstStatus" />
                </input>
                <output bind="grdPlan" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="fpip00030_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="2" type="grid" function="<%=l_user%>lg_sel_fpip00030_1"  > 
                    <input bind="grdTmp" > 
                        <input bind="dtFrom" />
                     </input> 
                    <output bind="grdTmp" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="data_GetLine" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_sel_get_line_from_process" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
                            From</td>
                        <td style="width: 10%">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%" align="right">
                            Process</td>
                        <td style="width: 15%">
                            <gw:list id="lstProcess" styles="width:100%;" onchange="OnGetLine()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:list id="lstLine" styles="width:100%;" onchange="OnSearch('grdPlan')" />
                        </td>
                        <td style="width: 10%" align="right">
                            Status
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('grdPlan')" />
                        </td>
                        <td style="width: 3%" align="right">
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdPlan')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdPlan' header='Process|Line|Item Code|Item Name|UOM|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    defaults='|||||||||||||||||||' 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    widths='2000|2000|1500|2500|800|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='F' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
    <gw:grid id='grdTmp' header='NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0' 
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' styles='width:100%; height:460; display:none' />
    <!-------------------------------------------------------------------------->
</body>
</html>
