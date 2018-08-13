<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Plan Entry</title>
</head>

<script>

   var CellBuffVal = '';
   
   var  G1_Chk 			 = 0,
        G1_PP_ORDPLAN_PK = 1,
        G1_DOC_DT 		 = 2,
        G1_REF_PO_NO 	 = 3,
        G1_STYLE_CODE 	 = 4,
        G1_STYLE_NAME 	 = 5,
        G1_SPEC01_PK 	 = 6,
        G1_SPEC01_NM 	 = 7,
        G1_SPEC02_PK 	 = 8,
        G1_SPEC02_NM 	 = 9,
        G1_SPEC03_PK 	 = 10,
        G1_SPEC03_NM 	 = 11,
        G1_SPEC04_PK 	 = 12,
        G1_SPEC04_NM 	 = 13,
        G1_SPEC05_PK 	 = 14,
        G1_SPEC05_NM 	 = 15,
        G1_ORD_PLAN_QTY  = 16,
        G1_PLAN_QTY 	 = 17,
        G1_BAL_QTY 	     = 18;
        
   var  G0_LINE_PK       = 0,
        G0_LINE_ID       = 1,
        G0_SEQ 			 = 2,
        G0_ORD_PLAN_PK   = 3,
        G0_REF_PO_NO     = 4,
        G0_STYLE 		 = 5,
        G0_SPEC01_PK 	 = 6,
        G0_SPEC02_PK 	 = 7,
        G0_SPEC03_PK 	 = 8,
        G0_SPEC04_PK 	 = 9,
        G0_SPEC05_PK 	 = 10,
        G0_SPEC 		 = 11,
        G0_DAY01_QTY 	 = 12,
        G0_DAY02_QTY 	 = 13,
        G0_DAY03_QTY 	 = 14,
        G0_DAY04_QTY 	 = 15,
        G0_DAY05_QTY 	 = 16,
        G0_DAY06_QTY 	 = 17,
        G0_DAY07_QTY 	 = 18,
        G0_DAY08_QTY 	 = 19,
        G0_DAY09_QTY 	 = 20,
        G0_DAY10_QTY 	 = 21,
        G0_DAY11_QTY 	 = 22,
        G0_DAY12_QTY 	 = 23,
        G0_DAY13_QTY 	 = 24,
        G0_DAY14_QTY 	 = 25,
        G0_DAY15_QTY 	 = 26,
        G0_COL_DT 		 = 27,
        G0_COL_STATUS 	 = 28,
        G0_COL_REF 		 = 29;

    //----------------------Body Init --------------------------------------------
     function BodyInit()
     {  
        //grdProdPlan.GetGridControl().SelectionMode = 1;
        //grdProdPlan.GetGridControl().AllowSelection = false;
		System.Translate(document);
        grdRequest.GetGridControl().SelectionMode = 1;
        grdRequest.GetGridControl().AllowSelection = false;		      		 
		
		OnFormatGrid(); 
		   
        OnSearch('spec_header');
     } 

 //----------------------Function OnFormatGrid --------------------------------------------
    function OnFormatGrid()
    {   	
		var data="";
		
        data = "<%=ESysLib.SetListDataSQL("SELECT   pk, group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY group_name")%>";
        lstLineGroup.SetDataText( data);
		
		data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
        data = data + '||ALL FACTORY';
		
        lstFactory.SetDataText( data);
        lstFactory.value = '';	
		     		
		var strFormat = "###,###,###,###";
		var ctrl = grdProdPlan.GetGridControl();

		ctrl.MergeCells  = 2;
    	ctrl.MergeCol(0) = true;
    	ctrl.MergeCol(1) = true;
		ctrl.MergeCol(2) = true;
		ctrl.MergeCol(3) = true;
		ctrl.MergeCol(4) = true;
		ctrl.MergeCol(5) = true;
		ctrl.MergeCol(6) = true;
		ctrl.MergeCol(7) = true;
		ctrl.MergeCol(8) = true;
		ctrl.MergeCol(9) = true;
		ctrl.MergeCol(10) = true;
		ctrl.MergeCol(11) = true;
		        		        
        ctrl.ColFormat(G0_DAY01_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY02_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY03_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY04_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY05_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY06_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY07_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY08_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY09_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY10_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY11_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY12_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY13_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY14_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY15_QTY) = strFormat;
		
        ctrl = grdRequest.GetGridControl();
        ctrl.ColFormat(G1_ORD_PLAN_QTY ) = strFormat;
        ctrl.ColFormat(G1_PLAN_QTY )     = strFormat;
        ctrl.ColFormat(G1_BAL_QTY )      = strFormat;
    }
	    
    //----------------------Function Search --------------------------------------------
    function OnSearch(objV)
    {    
        switch(objV)
        {
            case 'grdRequest':                
                data_fpip00030_1.Call('SELECT');
                break;
            case 'date_header':
				fpip00030_date_header.Call('SELECT');
			    break;
			case 'spec_header':
				fpip00030_spec_header.Call('SELECT');
			    break;
				
			case 'grdProdPlan':
			    data_fpip00030.Call('SELECT');
			break;  
		    
			default:
                break;
        }
    }
    //----------------------Function OnMoveUp --------------------------------------------
    function OnMoveUp()
    {      
       if(txtRowSel.GetData() == -1)
       {
            alert('Pls, choose Routing group!');
            return;
       }
       if(txtColSel.GetData() == -1)
       {
            alert('Pls, choose date!');
            return;
       }
       if(txtColSel.GetData() < G0_DAY01_QTY || txtColSel.GetData() > G0_DAY15_QTY)
       {
            alert('Pls, choose date between ' + grdProdPlan.GetGridData(0,G0_DAY01_QTY) + ' and ' + grdProdPlan.GetGridData(0,G0_DAY15_QTY) + '!' );
            return;
       }
	   	   
       var rowSel = 0;
       var l_row = parseInt(txtRowSel.text);
       var l_Col = parseInt(txtColSel.text);
	   
       for(var i = 1; i < grdRequest.rows; i++)
       {
            if(grdRequest.GetGridData(i,G1_Chk)!= 0)//duoc chon
            {
                //tinh gia tri
                var CurSelValue = grdRequest.GetGridData(i,G1_BAL_QTY);                
                if(parseInt( CurSelValue)== 0)
                    continue;
                    
                var BalQtyValue = grdRequest.GetGridData(i,G1_BAL_QTY);
                rowSel = rowSel + 1;
                grdProdPlan.Rows = 1
                grdProdPlan.FormatString = "=_LINE_PK|LINE_ID|SEQ|_PP_ORDPLAN_PK|REF_PO_NO|STYLE|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK|SPEC|_DAY01_QTY|_DAY02_QTY|_DAY03_QTY|_DAY04_QTY|_DAY05_QTY|_DAY06_QTY|_DAY07_QTY|_DAY08_QTY|_DAY09_QTY|_DAY10_QTY|_DAY11_QTY|_DAY12_QTY|_DAY13_QTY|_DAY14_QTY|_DAY15_QTY|_COL_DT|_COL_STATUS|_COL_REF"
                //grdProdPlan.GetGridControl().AddItem( "1\tROUTING_GROUP\t1\t1\tREF_PO_NO\tSTYLE\t1\t1\t1\t1\t1\tSPEC\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1\t1" ,l_row + 1);
				
                var objSpec = '';
                objSpec = grdRequest.GetGridData(i,G1_SPEC01_NM) + '/' + grdRequest.GetGridData(i,G1_SPEC02_NM) + '/' + grdRequest.GetGridData(i,G1_SPEC03_NM ) + '/' + grdRequest.GetGridData(i,G1_SPEC04_NM ) + '/' + grdRequest.GetGridData(i,G1_SPEC05_NM);
				
                var objData = grdProdPlan.GetGridData(l_row,G0_LINE_PK) +"\t" + grdProdPlan.GetGridData(l_row,G0_LINE_ID) + "\t";//_LINE_PK|LINE_ID
                    objData = objData + "2\t" + grdRequest.GetGridData(i,G1_PP_ORDPLAN_PK) + "\t";//SEQ|_PP_ORDPLAN_PK
                    objData = objData + grdRequest.GetGridData(i,G1_REF_PO_NO) + "\t" + grdRequest.GetGridData(i,G1_STYLE_NAME) + "\t";//REF_PO_NO|STYLE
                    if (grdRequest.GetGridData(i,G1_SPEC01_NM) == '-')//_SPEC01_PK
                    {
                        objData = objData + '' + "\t" ;
                    }
                    else
                    {
                       objData = objData + grdRequest.GetGridData(i,G1_SPEC01_PK) + "\t" ;
                    }
                    if(grdRequest.GetGridData(i,G1_SPEC02_NM) == '-')//_SPEC02_PK
                    {
                        objData = objData + '' + "\t";
                    }
                    else
                    {
                        objData = objData + grdRequest.GetGridData(i,G1_SPEC02_PK) + "\t";
                    }
                    if(grdRequest.GetGridData(i,G1_SPEC03_NM) == '-')
                    {
                        objData = objData + '' + "\t";//_SPEC03_PK
                    }
                    else
                    {
                        objData = objData + grdRequest.GetGridData(i,G1_SPEC03_PK) + "\t";//_SPEC03_PK
                    }
                    if(grdRequest.GetGridData(i,G1_SPEC04_NM) == '-')
                    {
                        objData = objData + '' + "\t";//|_SPEC04_PK
                    }
                    else
                    {
                        objData = objData + grdRequest.GetGridData(i,G1_SPEC04_PK) + "\t";//|_SPEC04_PK
                    }
                    if(grdRequest.GetGridData(i,G1_SPEC05_NM) == '-')
                    {
                        objData = objData + '' + "\t";
                    }
                    else
                    {
                        objData = objData + grdRequest.GetGridData(i,G1_SPEC05_PK) + "\t";
                    }
                    objData = objData + objSpec + "\t";//_SPEC05_PK|SPEC                    
              
                    objData = objData + '' + "\t" + '' + "\t";//_DAY01_QTY|_DAY02_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY03_QTY|_DAY04_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY05_QTY|_DAY06_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY07_QTY|_DAY08_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY09_QTY|_DAY10_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY11_QTY|_DAY12_QTY
                    objData = objData + '' + "\t" + '' + "\t";//_DAY13_QTY|_DAY14_QTY
                    objData = objData + '' + "\t" + dtDate.GetData() + "\t";//_DAY15_QTY|_COL_DT
                    objData = objData + '' + "\t" + '' ;//_COL_STATUS|_COL_REF
                
                
                grdProdPlan.GetGridControl().AddItem( objData ,l_row + 1);
                grdProdPlan.GetGridControl().TextMatrix( l_row + 1 , grdProdPlan.GetGridControl().Cols - 1 ) = grdProdPlan.GetGridControl().TextMatrix( l_row + 1 , grdProdPlan.GetGridControl().Cols - 1 ) | 0x20;
	            grdProdPlan.GetGridControl().RowData(l_row + 1)=0; 
	            if(grdProdPlan.beditColColor)
	            {
	                grdProdPlan.SetColorNotEditCol();  
                }         
                //add dia chi mapping
                grdProdPlan.SetGridText(l_row + 1,G0_COL_REF,i);
                
                for(var h = l_Col; h < grdProdPlan.cols - 4; h ++)
                {				 
                    if(CurSelValue != 0)
                    {
                        var CurGroupRowVal = grdProdPlan.GetGridData(parseInt(txtRowGroup.text),h);
						
                        if(isNaN(CurGroupRowVal)==true)
                        {
                            grdProdPlan.SetGridText(l_row + 1,h, CurSelValue);
                            CurSelValue = 0;                            
                            break;							
                        }
						
                        if(parseInt(CurGroupRowVal)==0)
                        {
                            grdProdPlan.SetGridText(l_row + 1,h, CurSelValue);
                            CurSelValue = 0;							
                            break;														
                        }
						
                        if (CurGroupRowVal == '')
                        {
                            grdProdPlan.SetGridText(l_row + 1,h, CurSelValue);
                            CurSelValue = 0;							
                            break;
                        }
						 
                        if(parseInt( CurSelValue) <= parseInt( CurGroupRowVal))
                        {
                            grdProdPlan.SetGridText(l_row + 1,h, CurSelValue);
                            CurSelValue = 0;							
                        }
                        else
                        {
                            grdProdPlan.SetGridText(l_row + 1,h,CurGroupRowVal)
                            CurSelValue = CurSelValue - CurGroupRowVal;							 
                        }
                    }
                }
                   
                //cap nhat gia tri o dong chon
                grdRequest.SetGridText(i,G1_BAL_QTY,CurSelValue);
                if(CurSelValue==0)
                {
                    grdRequest.SetGridText(i,G1_Chk,0)
                } 
	            l_row  = l_row + 1;
				
            }
        }
		
        if(rowSel == 0)
        {
            alert('Pls, choose PO/Style!');
            return;
        }
    }
    //----------------------Function OnGridCellBeforeEdit --------------------------------------------
    function OnGridCellBeforeEdit()
    {
        var l_col = grdProdPlan.col;
        var l_row = grdProdPlan.row;
		
        CellBuffVal = grdProdPlan.GetGridData(l_row, l_col);
    }
     //----------------------Function OnGridCellAfterEdit --------------------------------------------
    function OnGridCellAfterEdit()
    {
        var l_col = grdProdPlan.col;
        var l_row = grdProdPlan.row;
		
        if ( grdProdPlan.GetGridData( l_row, G0_SEQ ) == '1' )
        {
            return;
            CellBuffVal = '';
        }
		
        var CellNewVal = grdProdPlan.GetGridData( l_row, l_col);
		
        if ( isNaN(CellNewVal) == true )//neu gia tri nhap vo la mot so khong hop le, thi tra tro ve gia tri truoc
        {
             grdProdPlan.SetGridText(l_row, l_col,CellBuffVal);
             CellBuffVal = '';
        }

        if(l_col == G0_DAY15_QTY)
        {
            CellBuffVal = '';
            return; 
        }     
       if(CellBuffVal == '')
       {
        return;
       }
       if(CellNewVal=='')
        return;
        var k = 0;
        for(var i = l_col + 1; i <= G0_DAY15_QTY; i ++)
        {
            if (k >0) return;
            if(grdProdPlan.GetGridData(l_row, i) == '')
            {
                grdProdPlan.SetGridText(l_row, i, parseInt(CellBuffVal) - parseInt(CellNewVal));
                k = k + 1;
            }
        }
        CellBuffVal='';        
    }
    //----------------------Function OnGridSelChange --------------------------------------------
    function OnGridSelChange(obj)
    {
        switch(obj)
        {
            case 1:
                var l_col =grdProdPlan.col;
                var l_row = grdProdPlan.row;
				
                txtRowSel.SetDataText(l_row);//lay dong duoc chon hien tai
                txtColSel.SetDataText(l_col);//cot duoc chon trong khoang 15 ngay duoc hien thi tren grid
				                       
                if(grdProdPlan.GetGridData(l_row,G0_SEQ)==1)//kiem tra de lay thong tin dong group
                {
                    txtRowGroup.SetDataText(l_row);
                }
                else
                {
                    for(var i = l_row; i > 0; i --)
                    {
                        if(grdProdPlan.GetGridData(i,G0_SEQ)==1)
                        {
                            txtRowGroup.SetDataText(i);
                            break;
                        }
                    }
                }
            break;
			
            case 2:                
                break;
				
            default:
                break;
        }
    }   
    
    //----------------------Function Receive --------------------------------------------
    function OnDataReceive(objV)
    {
        switch(objV.id)
        {
			 
            case 'data_fpip00030_1': 
			    if ( grdRequest.rows > 1 )
				{
            		grdRequest.SetCellBold( 1, G1_REF_PO_NO,    grdRequest.rows - 1, G1_REF_PO_NO,    true); 				 
					grdRequest.SetCellBold( 1, G1_STYLE_CODE,   grdRequest.rows - 1, G1_STYLE_CODE,   true);				 
					grdRequest.SetCellBold( 1, G1_ORD_PLAN_QTY, grdRequest.rows - 1, G1_ORD_PLAN_QTY, true);				 
					grdRequest.SetCellBold( 1, G1_BAL_QTY,      grdRequest.rows - 1, G1_BAL_QTY,      true);	
							 
					grdRequest.SetCellBgColor( 1, G1_STYLE_CODE, grdRequest.rows - 1, G1_STYLE_NAME, 0xCCFFFF ); 
				} 
            break;
			
            case 'data_fpip00030':
                if ( grdProdPlan.rows < 2 )
		        {
		            return;
		        }
			 
		        for(var i = 1; i < grdProdPlan.rows; i ++)
		        {
		            if(grdProdPlan.GetGridData(i,G0_SEQ)==1)
		            {
		                grdProdPlan.SetCellBold(i,G0_LINE_PK,i,G0_DAY15_QTY,true);
		                grdProdPlan.SetRowEditable(i,false);
						
		                grdProdPlan.SetCellBgColor( i, G0_DAY01_QTY, i, G0_DAY15_QTY, 0xFFFF99);//0xabcdef
						grdProdPlan.SetCellBgColor( i, G0_REF_PO_NO, i, G0_SPEC,      0xFFFFCC);			
		            }
					
		            grdProdPlan.SetGridText(i, G0_COL_REF,'');
					
		        }
				 
				OnSearch('grdRequest');
            break;
			
        	case 'pro_fpip00030_2':                
            	alert(txtReturnValue.text);            
            	copy = '' ;
				btnCopy.SetEnable(true);
				
            	OnSearch('grdProdPlan');                         
        	break; 
					
            case 'fpip00030_date_header':
				 
                if(grdHeader.rows > 1)
                {//SUNDAY  
                    var Day_SUNDAY = 'SUNDAY';
                    var col0_d = grdHeader.GetGridData(1,0);
                    var col0=grdHeader.GetGridData(2,0);    
                    var col1_d = grdHeader.GetGridData(1,1);                
                    var col1=grdHeader.GetGridData(2,1);
                    var col2_d = grdHeader.GetGridData(1,2);
                    var col2=grdHeader.GetGridData(2,2);                    
                    var col3_d = grdHeader.GetGridData(1,3);
                    var col3=grdHeader.GetGridData(2,3);                    
                    var col4_d = grdHeader.GetGridData(1,4);
                    var col4=grdHeader.GetGridData(2,4);                    
                    var col5_d = grdHeader.GetGridData(1,5);
                    var col5=grdHeader.GetGridData(2,5);
                    var col6_d = grdHeader.GetGridData(1,6);
                    var col6=grdHeader.GetGridData(2,6);
                    var col7_d = grdHeader.GetGridData(1,7);
                    var col7=grdHeader.GetGridData(2,7);
                    var col8_d = grdHeader.GetGridData(1,8);
                    var col8=grdHeader.GetGridData(2,8);
                    var col9_d = grdHeader.GetGridData(1,9);
                    var col9=grdHeader.GetGridData(2,9);
                    var col10_d = grdHeader.GetGridData(1,10);
                    var col10=grdHeader.GetGridData(2,10);
                    var col11_d = grdHeader.GetGridData(1,11);
                    var col11=grdHeader.GetGridData(2,11);
                    var col12_d = grdHeader.GetGridData(1,12);
                    var col12=grdHeader.GetGridData(2,12);
                    var col13_d = grdHeader.GetGridData(1,13);
                    var col13=grdHeader.GetGridData(2,13);
                    var col14_d = grdHeader.GetGridData(1,14);
                    var col14=grdHeader.GetGridData(2,14);
                    var col15_d = grdHeader.GetGridData(1,15);
                    var col15=grdHeader.GetGridData(2,15);
                    
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY01_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY02_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY03_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY04_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY05_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY06_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY07_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY08_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY09_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY10_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY11_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY12_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY13_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY14_QTY) = false ;
                    grdProdPlan.GetGridControl().ColHidden(G0_DAY15_QTY) = false ;
                    //Add text date
                    grdProdPlan.SetGridText(0,G0_DAY01_QTY,col0);
                    grdProdPlan.SetGridText(0,G0_DAY02_QTY,col1);
                    grdProdPlan.SetGridText(0,G0_DAY03_QTY,col2);
                    grdProdPlan.SetGridText(0,G0_DAY04_QTY,col3);
                    grdProdPlan.SetGridText(0,G0_DAY05_QTY,col4);
                    grdProdPlan.SetGridText(0,G0_DAY06_QTY,col5);
                    grdProdPlan.SetGridText(0,G0_DAY07_QTY,col6);
                    grdProdPlan.SetGridText(0,G0_DAY08_QTY,col7);
                    grdProdPlan.SetGridText(0,G0_DAY09_QTY,col8);
                    grdProdPlan.SetGridText(0,G0_DAY10_QTY,col9);
                    grdProdPlan.SetGridText(0,G0_DAY11_QTY,col10);
                    grdProdPlan.SetGridText(0,G0_DAY12_QTY,col11);
                    grdProdPlan.SetGridText(0,G0_DAY13_QTY,col12);
                    grdProdPlan.SetGridText(0,G0_DAY14_QTY,col13);
                    grdProdPlan.SetGridText(0,G0_DAY15_QTY,col14);
                    //mark font color
                    if(col0_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY01_QTY,0,G0_DAY01_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY01_QTY,0,G0_DAY01_QTY,0x000000);
                    }
                    if(col1_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY02_QTY,0,G0_DAY02_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY02_QTY,0,G0_DAY02_QTY,0x000000);
                    }
                    if(col2_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY03_QTY,0,G0_DAY03_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY03_QTY,0,G0_DAY03_QTY,0x000000);
                    }
                    if(col3_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY04_QTY,0,G0_DAY04_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY04_QTY,0,G0_DAY04_QTY,0x000000);
                    }
                    if(col4_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY05_QTY,0,G0_DAY05_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY05_QTY,0,G0_DAY05_QTY,0x000000);
                    }
                    if(col5_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY06_QTY,0,G0_DAY06_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY06_QTY,0,G0_DAY06_QTY,0x000000);
                    }
                    if(col6_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY07_QTY,0,G0_DAY07_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY07_QTY,0,G0_DAY07_QTY,0x000000);
                    }
                    if(col7_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY08_QTY,0,G0_DAY08_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY08_QTY,0,G0_DAY08_QTY,0x000000);
                    }
                    if(col8_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY09_QTY,0,G0_DAY09_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY09_QTY,0,G0_DAY09_QTY,0x000000);
                    }
                    if(col9_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY10_QTY,0,G0_DAY10_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY10_QTY,0,G0_DAY10_QTY,0x000000);
                    }
                    if(col10_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY11_QTY,0,G0_DAY11_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY11_QTY,0,G0_DAY11_QTY,0x000000);
                    }
                    if(col11_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY12_QTY,0,G0_DAY12_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY12_QTY,0,G0_DAY12_QTY,0x000000);
                    }
                    if(col12_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY13_QTY,0,G0_DAY13_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY13_QTY,0,G0_DAY13_QTY,0x000000);
                    }
                    if(col13_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY14_QTY,0,G0_DAY14_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY14_QTY,0,G0_DAY14_QTY,0x000000);
                    }
                    if(col14_d == Day_SUNDAY)
                    {                        
                        grdProdPlan.SetCellFontColor(0,G0_DAY15_QTY,0,G0_DAY15_QTY,0x3300cc);
                    }
                    else
                    {
                        grdProdPlan.SetCellFontColor(0,G0_DAY15_QTY,0,G0_DAY15_QTY,0x000000);
                    }
                }
                
				OnSearch('grdProdPlan');                
                break;
            case 'fpip00030_spec_header':
                if(grdHeader2.rows>1)
                {
                    var col1=grdHeader2.GetGridData(1,2);
                    var dis_col1=grdHeader2.GetGridData(1,3);
                    var col2=grdHeader2.GetGridData(1,4);
                    var dis_col2=grdHeader2.GetGridData(1,5);
                    var col3=grdHeader2.GetGridData(1,6);
                    var dis_col3=grdHeader2.GetGridData(1,7);
                    var col4=grdHeader2.GetGridData(1,8);
                    var dis_col4=grdHeader2.GetGridData(1,9);
                    var col5=grdHeader2.GetGridData(1,10);
                    var dis_col5=grdHeader2.GetGridData(1,11);
                    grdRequest.GetGridControl().ColHidden(G1_SPEC01_NM) = true ;
                    grdRequest.GetGridControl().ColHidden(G1_SPEC02_NM) = true ;
                    grdRequest.GetGridControl().ColHidden(G1_SPEC03_NM) = true ;
                    grdRequest.GetGridControl().ColHidden(G1_SPEC03_NM) = true ;
                    grdRequest.GetGridControl().ColHidden(G1_SPEC04_NM) = true ;
                    grdRequest.GetGridControl().ColHidden(G1_SPEC05_NM) = true ;
                    //chkSpec01.style.display = 'none';
                    chkSpec02.style.display = 'none';
                    chkSpec03.style.display = 'none';
                    chkSpec04.style.display = 'none';
                    chkSpec05.style.display = 'none';
                    lbSpec01.SetDataText('');
                    lbSpec02.SetDataText('');
                    lbSpec03.SetDataText('');
                    lbSpec04.SetDataText('');
                    lbSpec05.SetDataText('');
            
            
                    if(dis_col1!=0)
                    {
                        grdRequest.SetGridText(0,G1_SPEC01_NM,col1);
                        lbSpec01.SetDataText(col1);
                        chkSpec01.style.display = '';
                        grdRequest.GetGridControl().ColHidden(G1_SPEC01_NM) = false ;                        
                    }
                    else
                    {
                        chkSpec01.value="N";
                        chkSpec01.style.display = 'none';
                    }
                    if (dis_col2!=0)
                    {
                        grdRequest.SetGridText(0,G1_SPEC02_NM,col2);
                        lbSpec02.SetDataText(col2);
                        chkSpec02.style.display = '';
                        grdRequest.GetGridControl().ColHidden(G1_SPEC02_NM) = false ;                        
                    }
                    else
                    {
                        chkSpec02.value="N";
                        chkSpec02.style.display = 'none';
                    }
                    if (dis_col3!=0)
                    {
                        grdRequest.SetGridText(0,G1_SPEC03_NM,col3);
                        lbSpec03.SetDataText(col3);
                        chkSpec03.style.display = '';
                        grdRequest.GetGridControl().ColHidden(G1_SPEC03_NM) = false ;                        
                    }
                    else
                    {
                        chkSpec03.value="N";
                        chkSpec03.style.display = 'none';
                    }
                    if (dis_col4!=0)
                    {
                        grdRequest.SetGridText(0,G1_SPEC04_NM,col4);
                        lbSpec04.SetDataText(col4);
                        chkSpec04.style.display = '';
                        grdRequest.GetGridControl().ColHidden(G1_SPEC04_NM) = false ;                        
                    }
                    else
                    {
                        chkSpec04.value="N";
                        chkSpec04.style.display = 'none';
                    }
                    if (dis_col5!=0)
                    {
                        grdRequest.SetGridText(0,G1_SPEC05_NM,col5);
                        lbSpec05.SetDataText(col5);
                        chkSpec05.style.display = '';
                        grdRequest.GetGridControl().ColHidden(G1_SPEC05_NM) = false ;                        
                    }
                    else
                    {
                        chkSpec05.value="N";
                        chkSpec05.style.display = 'none';
                    }
                }
				
                OnSearch('date_header');
				
                break;                
            default:
            
                break;
        }
    }
    
    //----------------------Function PreviousDate --------------------------------------------
    function OnPreviousDate()
    {
        dtDate.SetDataText(System.AddDate(dtDate.GetData(),-1));
        OnSearch('date_header');
    }
    
    //----------------------Function NextDate --------------------------------------------
    function OnNextDate()
    {
        dtDate.SetDataText(System.AddDate(dtDate.GetData(),+1));
        OnSearch('date_header');
    }
    
    //----------------------OnReport --------------------------------------------
    function OnReport(obj)
    {
        var url = '';
        switch(obj.id)
        {
            case 'btnExcel1':
                url='/reports/fp/ip/rpt_fpip00030.aspx?p_factory_pk='+ lstLineGroup.value +'&p_from_date='+ dtDate.value;
                break;
            case 'btnExcel2':
                url='/reports/fp/ip/rpt_fpip00030_1.aspx?p_factory_pk='+ lstLineGroup.value +'&p_from_date='+ dtDate.value;  
                break;
            default:
                return;
        }
        if(url != '')
        {
            window.open(System.RootURL+url);
        }
    }
    
     //----------------------OnSave --------------------------------------------
    function OnSave()
    {
        data_fpip00030.Call();
    }
    //----------------------OnDelete --------------------------------------------
    function OnDelete()
    {    
        var curSelRow = grdProdPlan.row;
        var undoRow = grdProdPlan.GetGridData(curSelRow, G0_COL_REF);
        
        if(undoRow != '')
        {            
            if(grdProdPlan.GetGridData(curSelRow,G0_SEQ) == 1)
            {
                return;
            }
            var sumVal = 0;
            for(var i = G0_DAY01_QTY; i <= G0_DAY15_QTY; i++)
            {
                var l_Val = grdProdPlan.GetGridData(curSelRow,i);
                if(l_Val != '')
                {
                    sumVal = sumVal + parseInt(l_Val);
                }
            }
            grdRequest.SetGridText(undoRow,G1_BAL_QTY,parseInt( sumVal) + parseInt( grdRequest.GetGridData(undoRow,G1_BAL_QTY)));
                    grdProdPlan.RemoveRowAt(parseInt(curSelRow));            
        }
        else
        {
            grdProdPlan.DeleteRow();
        }
    }
	
//==================================================================
 function OnToggleTop()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrowTop = document.all("imgArrowTop");   
     
    if(imgArrowTop.status == "expand")
    { 
        tab_top.style.height = "100%" ;    
        imgArrowTop.status = "collapse";  
        tab_bottom.style.display = "none"; 
        imgArrowTop.src = "../../../system/images/up.gif"; 
    }
    else
    { 
        tab_top.style.height = "50%"; 
        imgArrowTop.status = "expand"; 
        tab_bottom.style.display=""; 
        imgArrowTop.src = "../../../system/images/down.gif"; 
    }
 } 
 
 //=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
                                               
    }        
}
 
//==================================================================
 function OnToggleBottom()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");   
    var imgArrowBottom = document.all("imgArrowBottom");   
     
    if(imgArrowBottom.status == "expand")
    { 
        tab_bottom.style.height = "100%" ;    
        imgArrowBottom.status = "collapse";  
        tab_top.style.display = "none"; 
        imgArrowBottom.src = "../../../system/images/down.gif"; 
    }
    else
    { 
        tab_bottom.style.height = "50%"; 
        imgArrowBottom.status = "expand"; 
        tab_top.style.display=""; 
        imgArrowBottom.src = "../../../system/images/up.gif"; 
    }
 }   	
//============================================================================================

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'WS':
             var path = System.RootURL + "/form/fp/ib/fpib00040.aspx";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');               
        break;  
        
		case 'Detail':
			var path = System.RootURL + '/form/fp/ip/fpip00031.aspx?line_group_pk=' + lstLineGroup.value;
	    	var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this); 
		break;     
    }             
} 
//======================================================================
var copy="";
//======================================================================
function OnCopy()
{
    if ( lstLineGroup.value != '' )
    {
        copy = 'yes' ;
        txtOldLineGroupPK.text = lstLineGroup.value ;
        
        btnCopy.SetEnable(false);
    }
    else
    {
        alert('Pls select Line Group first !');
    }    
    
}
//============================================================================================ 

function OnGroupChange()
{
	if ( copy == 'yes')
    {
		if ( confirm ('Are you sure to copy?') )
        {
            txtNewLineGroupPK.text = lstLineGroup.value ;
            pro_fpip00030_2.Call();
            btCopy.disabled=false;
        }
        else
        {
			copy = '' ;
            OnSearch('grdProdPlan');                        
        }    
	}
	else
	{
		OnSearch('grdProdPlan');
	}
}

//============================================================================================ 
</script>

<body>
	<!---------------------------------------------------------------------->
    <gw:data id="pro_fpip00030_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="process" user="prod" parameter="0" procedure="<%=l_user%>lg_pro_fpip00030_2"  > 
                <input> 
                    <input bind="txtOldLineGroupPK" />  
                    <input bind="txtNewLineGroupPK" />
					<input bind="dtDate" />
                 </input>
                 <output>
                    <output bind="txtReturnValue"/>
                 </output>
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function = "<%=l_user%>lg_sel_fpip00030" procedure="<%=l_user%>lg_upd_fpip00030" > 
                <input >
                    <input bind="lstLineGroup" /> 
					<input bind="txtPOStyle01" />
                    <input bind="dtDate" />                      
                </input> 
                 <output bind="grdProdPlan" />                      
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" function = "<%=l_user%>lg_sel_fpip00030_1" > 
                <input >
                    <input bind="lstFactory" /> 
                    <input bind="dtDateFrom" /> 
                    <input bind="dtDateTo" /> 
                    <input bind="txtPOStyle02" /> 
                    <input bind="chkSpec01" /> 
                    <input bind="chkSpec02" /> 
                    <input bind="chkSpec03" /> 
                    <input bind="chkSpec04" /> 
                    <input bind="chkSpec05" /> 
					<input bind="lstLineGroup" />
                </input> 
                 <output bind="grdRequest" />                      
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpip00030_date_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00030_date_header"> 
                <input> 
                    <input bind="dtDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpip00030_spec_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" function="<%=l_user%>lg_SEL_fpip00030_HEADER"> 
            <input> 
                </input>
                <output bind="grdHeader2" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="height: 100%; width: 100%; text-align: left; vertical-align: top;"
                    border="0">					  
                    <tr style="height: 1%">
						<td style="width: 3%" align="left">
                            <img id="imgArrowTop" status="expand" src="../../../system/images/down.gif" style="cursor: hand"
                                onclick="OnToggleTop()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            L/G
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:list id="lstLineGroup" styles='width:100%' onchange="OnGroupChange()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            PO/Style
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:textbox id="txtPOStyle01" styles='width:100%;' onenterkey="OnSearch('grdProdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="back" id="imgArrowTop1" style="cursor: hand" alt="back" onclick="OnPreviousDate()" />
                        </td>						
                        <td style="width: 8%" align="center">
                            <gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="next" id="imgArrowTop2" style="cursor: hand" alt="back" onclick="OnNextDate()" />
                        </td> 
						<td style="width: 1%; white-space: nowrap" align="right"> 
							                      
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">   
							                 
                        </td>   
						<td style="width: 1%" align='right'>
                            <gw:icon id="btnCopy" img="2" text="Copy" onclick="OnCopy()" /> 
                        </td>                    
                        <td style="width: 14%; white-space: nowrap" align="center">
							
                        </td>  						   						
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnExcel1" img="excel" alt="excel" onclick="OnReport(this)" /> 
                        </td>                       
                        <td style="width: 1%" align='right'>
                             <gw:imgbtn id="btnExcel2" img="excel" alt="excel" onclick="OnReport(this)" />
                        </td>
						                                  
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdProdPlan')" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>                       
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="18">
                            <gw:grid id='grdProdPlan' header='_LINE_PK|Line ID|_SEQ|_PP_ORDPLAN_PK|P/O No|Style|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK|Spec|_DAY01_QTY|_DAY02_QTY|_DAY03_QTY|_DAY04_QTY|_DAY05_QTY|_DAY06_QTY|_DAY07_QTY|_DAY08_QTY|_DAY09_QTY|_DAY10_QTY|_DAY11_QTY|_DAY12_QTY|_DAY13_QTY|_DAY14_QTY|_DAY15_QTY|_COL_DT|_COL_STATUS|_COL_REF'
                                format='0|0|0|0|0|0|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0' aligns='0|1|0|0|0|0|3|3|3|3|3|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0'
                                check='|||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0'
                                widths='0|800|0|0|1500|2000|0|0|0|0|0|2000|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' oncellclick='OnGridSelChange(1)'
                                onafteredit='OnGridCellAfterEdit()' onbeforeedit='OnGridCellBeforeEdit()' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%" id="tab_bottom">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 3%" align="left">
                            <img id="imgArrowBottom" status="expand" src="../../../system/images/up.gif" style="cursor: hand"
                                onclick="OnToggleBottom()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Fac
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right">
                            <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            PO/Style
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:textbox id="txtPOStyle02" styles='width:100%;' onenterkey="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtDateFrom" lang="1" styles='width:100%;' onchange="OnSearch('grdRequest')" />
                            ~
                            <gw:datebox id="dtDateTo" lang="1" styles='width:100%;' onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecPK01" styles="display:none" />
                            <gw:label id="lbSpec01" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkSpec01" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecPK02" styles="display:none" />
                            <gw:label id="lbSpec02" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkSpec02" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecPK03" styles="display:none" />
                            <gw:label id="lbSpec03" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkSpec03" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecPK04" styles="display:none" />
                            <gw:label id="lbSpec04" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkSpec04" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="right">
                            <gw:textbox id="txtSpecPK05" styles="display:none" />
                            <gw:label id="lbSpec05" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                        </td>
                        <td style="width: 1%" align="left">
                            <gw:checkbox id="chkSpec05" style="display: none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnDetail" img="2" text="View Detail" styles='width:100%' onclick="OnPopUp('Detail')" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch2" img="search" onclick="OnSearch('grdRequest')" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnMoveUp" img="up1" onclick="OnMoveUp()" />
                        </td>
                    </tr>
                    <tr style="height: 49%;">
                        <td colspan="20">
                            <gw:grid id='grdRequest' header='Chk|_PP_ORDPLAN_PK|Date|P/O No|Style Code|Style Name|_SPEC01_PK|Spec 01|_SPEC02_PK|Spec 02|_SPEC03_PK|Spec 03|_SPEC04_PK|Spec 04|_SPEC05_PK|Spec 05|Ord Qty|Plan Qty|Bal Qty'
                                format='3|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1' 
								widths='600|0|1200|2000|2000|3500|0|1500|0|1500|0|1500|0|1500|0|1500|1200|1200|1200'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------------------->
    <gw:grid id='grdHeader' header='COL0|COL1|COL2|COL3|COL4|COL5|COL6|COL7|COL8|COL9|COL10|COL11|COL12|COL13|COL14|COL15'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        check='|||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtRowSel" styles="display:none" text='-1' />
    <gw:textbox id="txtRowGroup" styles="display:none" text='1' />
    <gw:textbox id="txtColSel" styles="display:none" text='-1' />
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader2' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%; display:none' />
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------------------>
	<gw:textbox id="txtOldLineGroupPK" styles='width:100%;display:none' />
	<gw:textbox id="txtNewLineGroupPK" styles='width:100%;display:none' />
</body>
</html>
