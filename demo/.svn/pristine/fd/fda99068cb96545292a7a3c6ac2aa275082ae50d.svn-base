<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>MA CUTTING RESULT</title>
</head>

<script>
    var user_pk    = "<%=Session("EMPLOYEE_PK")%>"  ;
    var user_name  = "<%=Session("USER_NAME")%>" ;
    
    var G1_PK           = 0,
        G1_WI_No        = 1,
        G1_Date         = 2,
        G1_TCO_STITEM_PK  = 3,
        G1_Item_Code    = 4,
        G1_Item_Name    = 5,
        G1_Spec         = 6,
        G1_WI_Qty       = 7,
        G1_Line         = 8,
        G1_Shift        = 9,
        G1_Product_Qty  = 10;
        G1_Service_M    = 11;
        G1_Total_Block  = 12,
        G1_width        = 13;
        
    var G2_PK                   = 0,
        G2_TPR_PRODRESULT_PK    = 1,
        G2_TPR_WORKINSD_PK      = 2,
        G2_Seq                  = 3,
        G2_TCO_ITEM_PK          = 4,
        G2_SPEC1                = 5,
        G2_SPEC2                = 6,
        G2_SPEC3                = 7,
        G2_SPEC4                = 8,
        G2_SPEC5                = 9,
        G2_SPEC6                = 10,
        G2_SPEC7                = 11,
        G2_SPEC8                = 12,
        G2_SPEC9                = 13,
        G2_SPEC10               = 14,
        G2_PROD_QTY             = 15,
        G2_Grade                = 16,
        G2_Tape                 = 17,
        G2_Defect               = 18,
        G2_Arm_No               = 19, 
        G2_Block_No             = 20,
        G2_tsa_saleorderd_pk    = 21,
        G2_master_item_pk       = 22; 
   //--------grdDefect---------
  var   G3_oqc_defect_pk    = 0,
        G3_defectype_pk     = 1,
        G3_defect_pk        = 2,
        G3_defect_id        = 3,
        G3_defect_nm        = 4,
        G3_from_time        = 5,
        G3_to_time          = 6,
        G3_duration         = 7,
        G3_mc_speed         = 8,
        G3_loss_m           = 9,
        G3_loss_kg          = 10,
        G3_oqcresult_pk     = 11,
        G3_product_result   = 12;
   
    var flagSave =0;            
    var flagCheckTime = 0; 
//-----------------------------------------------------

function BodyInit()
{
    dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-7));
    txtRollLength.SetEnable(false);
    //-------------------------  
    BindingDataList();
    
    FormatGrid();
}

//-----------------------------------------------------
 function BindingDataList()
 {    
    var data="";    
            
    //-------------------------- 
    data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT a.CODE, a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";        
    grdSearch.SetComboFormat(G1_Shift,data);
   
    data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT PK,LINE_ID from prod.tpr_line WHERE DEL_IF = 0 " ) %> ";        
    grdSearch.SetComboFormat(G1_Line,data);
   
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGPC0020') FROM DUAL " ) %> "; 
    txtShift_pk.SetDataText(data); 
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGPC0010') FROM DUAL" )%> "; 
    lstGroup.SetDataText(data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('PRBP0090','','') FROM DUAL" )%> "; 
    lstWIStatus.SetDataText(data+'|ALL|Select ALL');
    lstWIStatus.value = 'ALL' ;
    //--------------------------
     data ='|#A;A|#C;C|#D;D'
     grdDetail.SetComboFormat(G2_Grade,data);   
     
   var data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT a.CODE, a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";        
   grdShift.SetComboFormat(7,data);
 }

//---------------------------------------------------------
function FormatGrid()
{
    var ctrl ;
    ctrl = grdSearch.GetGridControl(); 
    ctrl.FrozenCols = G1_Item_Name ;
    
   grdDefect.GetGridControl().ColEditMask(G3_from_time)="99:99";
   grdDefect.GetGridControl().ColEditMask(G3_to_time)="99:99";
}

//-----------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 'Search':
            fpep00043.Call("SELECT") ;            
        break;
        
        case 'Master':
            if ( grdSearch.row > 0 )
            {
                //-------------------------------
                grdDefect.ClearData();
                grdDetail.ClearData();
                //-------------------------------
                txtWI_PK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);
                fpep00043_3.Call() ;
            }    
        break;
        case 'Defect':
            if ( txtMasterPK.text != "" )
            {
                fpep00041_4.Call() ;
            }    
        break;
        case 'Shift':
            if ( txtMasterPK.text != "")
            {
                fpep00043_4.Call() ;
            }    
        break;
    }
}
var p_update = 0 ;
//-----------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "fpep00043_1" :      
                // master save -- > call save details
              if (flagSave ==1)  
              {
                    if (p_update == 1 )
                     {
                        //Insert detail
                        SetParentPKtoGrid(grdDetail,G2_TPR_PRODRESULT_PK); 
                        for(var i =1 ; i<grdDetail.rows; i++)
                        {
                            grdDetail.SetRowStatus(i,48);
                        }
                        p_update = 0;                  
                        OnSave('Detail'); 
              
                   }
                   else
                   {
                           //update detail
                            for(var i =1 ; i<grdDetail.rows; i++)
                            {
                                grdDetail.SetRowStatus(i,16);
                            }
                            p_update = 0
                            OnSave('Detail'); 
                       
                   }
                
              }else
              {
                flagSave =0
                //select detail
                fpep00043_2.Call("SELECT");
              }
               
        break;
        
        case "fpep00043_2" :
              // SumOfWidth
              
              var value=0;
              for(i=1; i< grdDetail.rows; i++)
              {
                  value = Number(value) + Number(grdDetail.GetGridData(i, G2_SPEC5 ));
              }
              txtSumOfWidth.text = '' + value;  
             
              txtTrimWidth.text = '' + parseFloat(Number(txtWidth.text)) - parseFloat(txtSumOfWidth.text);
              
              //---------------------- Set Length of each time cutting --------------------
              if ( grdDetail.rows > 1 )
              {
                    txtItemLength.text = grdDetail.GetGridData(1, G2_SPEC6 ) ; // Item length 
              } 
              //---------------------------------------------------------------------------
              //defect
              if ( flagSave ==0) 
                fpep00041_4.Call('SELECT')
              else
                OnSave('Defect');
        break; 
            
        case "fpep00041_4" :
                //Shift
               fpep00043_4.Call('SELECT')
        break; 
        
        case "fpep00043_3": 
                  if(txtMasterPK.text !="")
                  {
                    p_update = 2
                    lblStatus.text = ""
                    fpep00043_1.Call('SELECT');
                  }
                  else
                    {
                        fpep00043_1.StatusInsert();
                         txtMasterPK.text =""
                         txtWI_PK.text = grdSearch.GetGridData(grdSearch.row,G1_PK) 
                         txtSTItemPK.text = grdSearch.GetGridData(grdSearch.row,G1_TCO_STITEM_PK )  
                         txtItemCode.text = grdSearch.GetGridData(grdSearch.row,G1_Item_Code)                  
                         txtItemName.text = grdSearch.GetGridData(grdSearch.row,G1_Item_Name)                  
                         txtServiceM.text = grdSearch.GetGridData(grdSearch.row,G1_Service_M)
                         txtShift_pk.value   = grdSearch.GetGridData( grdSearch.row, G1_Shift  )
                         
                         txtWidth.text =  grdSearch.GetGridData( grdSearch.row, G1_width  ) 
                         
                         txtLine.text        = grdSearch.GetData( grdSearch.row, G1_Line   )
                         txtLine_pk.text     = grdSearch.GetGridData( grdSearch.row, G1_Line   )
                         txtWINo.text =  grdSearch.GetGridData( grdSearch.row, G1_WI_No  )
                           
                         txtCurrentBlock.text = '1'
                         txtTotalBlock.text = grdSearch.GetGridData(grdSearch.row,G1_Total_Block)
                         lblStatus.text = "New Main Cutting!!"
                         p_update = 1
                         fpep00043_2.Call('SELECT')
                    }
        break;
        case 'fpep00041_6':
            var time = txtTimeServer.text.substr(8,2)+":"+txtTimeServer.text.substr(10,2)
                grdDefect.SetGridText(grdDefect.rows-1,G3_from_time,time);
                grdDefect.SetGridText(grdDefect.rows-1,G3_to_time,time);
        break;
        case 'pro_fpep00043':
       
//            if( Number(txtWidth.text)==  Number(grdSearch.GetGridData( grdSearch.row, G1_width ))) 
//            {
                txtTrimWidth.text = '' + parseFloat(Number(txtWidth.text)) - parseFloat(txtSumOfWidth.text);
                
                var cuting_need =0
                cuting_need = Number(txtItemLength.text) + Number(txtServiceM.text);
                 //------------------
                if(Number(txtRollLength.text)< cuting_need ) 
                {
                    if(Number(txtEndBal.text)<=0)
                    {
                        alert("The legth of this roll  ," + txtRollLength.text + ", is not suitable! Please select another Roll!")
                    }else
                    {
                        if(confirm("The legth of this roll  ," + txtRollLength.text + ", is not suitable!!\n Would you like to Combine it!"))
                        {
                            OnCombine()
                        }
                    }
                }else
                {
                    if(flagCheckTime ==0) //chi kiem tra lan dau
                      {
                        pro_fpep00043_4.Call();
                      }
                }
                
//            }
//            else
//            {
//                alert("Roll of scaned Item  must be the same spec as Item in WI!");
//                txtRollPK.text = ""; //tpr_lotno_pk
//                txtRollId.text = ""; //LOT NO
//            }
            
        break;
        case 'pro_fpep00043_4': 
            if(Number(txtHours.text) <1)
                if(!confirm("This Mill Roll produred within 48 hours!\n Do you want to cut?"))
                {
                    txtRollPK.text = ""; //tpr_lotno_pk
                    txtRollId.text = ""; //LOT NO
                    txtRollLength.text =""; //roll lenght
                }else
                {
                     flagCheckTime = 1;
                }
        break;
     }
}
//-----------------------------------------------------
 
 function SetParentPKtoGrid(pGrid,parent_col)
 {
        for ( i = 1; i < pGrid.rows ; i++ )
        {
                pGrid.SetGridText( i ,parent_col , txtMasterPK.text ) ;
        }
 }
 
//-----------------------------------------------------

function OnPopUp(pos)
 {
      switch (pos)         
      {	 
            case 'Roll':
                 if(txtItemPk.text!='')
                 {
                    if (txtCombineMPK.text !='')
                    {
                        alert("You are using combine roll for this cutting!\n You must uncombine first if you want to select another roll!")
                    }else
                      {
                        var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?type=1' ;
                             path = path + '&item_pk='  + txtItemPk.text ;
                             path = path + '&item_code='+ txtItemCode.text ;
                             path = path + '&item_name='+ txtItemName.text ;
                              ;  
                         var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                         if ( obj != null )
                         {
                             txtRollPK.text = obj[0]; //tpr_lotno_pk
                             txtRollId.text = obj[1]; //LOT NO
                             OnEnterRoll()
                         }	 
                      }
                  }
                  else
                  {
                      alert('SAVE WORKINS WITH ROLL ID FIRST');
                  }
              break;
              
              case 'GetEmployee' :
                  var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	              var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	              if ( object != null )
	              {
	                  txtEmpPK.text = object[0];
                      txtEmpName.text = object[2];
                  }
              break;
         } 
 }
 //-----------------------------------------------------
 function OnGridCellDblClick(obj)
{
    var col, row
    col = event.col
    row = event.row
    
    if(obj.id=='grdDefect')
    {
        
        if(col==G3_defect_id || col==G3_defect_nm)
        {
            var path = System.RootURL + '/form/fp/ab/PopUpGetDefect.aspx' ;
            var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes');
            if (obj!=null)
            {
                grdDefect.SetGridText(row,G3_defectype_pk,obj[5])
                grdDefect.SetGridText(row,G3_defect_pk,obj[0])
                grdDefect.SetGridText(row,G3_defect_id,obj[1])
                grdDefect.SetGridText(row,G3_defect_nm,obj[2])
            }
        }
    }else
    {
        txtProdShiftPk.text = grdShift.GetGridData(row,0)
         var path = System.RootURL + '/form/fp/ep/fpep00041_1.aspx' ;
         var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes;dialogWidth:450px; dialogHeight:450px;center:yes');
    }
        
}
 //-----------------------------------------------------
 function On_AfterEdit()
{
	var tmpIN,ws,temp;
    var	cIdx=event.col;
	var row = event.row
	
	if (cIdx==G3_from_time||cIdx==G3_to_time)
	{
		tmpIN=grdDefect.GetGridData(row,cIdx)
		if(tmpIN.length==0)
		{
			grdDefect.SetGridText(row,cIdx,"")
			return;
		}
		if((tmpIN.length!=4)&&(tmpIN.length!=""))
		{
			alert("Incorrect time type.(type: hh:mm)!")
			grdDefect.SetGridText(row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>23)||(Number(tmpIN.substr(0,2))<0))
		{
			alert("Hour is out of range.(00<= hh <= 23)")
			grdDefect.SetGridText(row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>59)||(Number(tmpIN.substr(2,2))<0))
		{
			alert("Minute is out of range.(00<= hh < 59)")
			grdDefect.SetGridText(row,cIdx,'')
			return;
		}
		tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		grdDefect.SetGridText(row,cIdx,tmpIN)
		//call duration
		var grd_from = grdDefect.GetGridData(row,G3_from_time)
		var grd_to = grdDefect.GetGridData(row,G3_to_time)
		if(grd_from!='' && grd_to !='')
		{
		    /*lam tam thoi vi se khong dung neu start time va end time khong cung mot ngay*/
		    var hour,minute
		    hour = Number(grd_to.substr(0,2)) -Number(grd_from.substr(0,2))
		    minute = Number(grd_to.substr(3,2)) -Number(grd_from.substr(3,2))
		    grdDefect.SetGridText(row,G3_duration,hour*60+minute)
		    
		    if(Number(grdDefect.GetGridData(row,G3_mc_speed)))
		    {
		        grdDefect.SetGridText(row,G3_loss_m,(hour*60+minute)*Number(grdDefect.GetGridData(row,G3_mc_speed)))
		    }
		}
	}
	if (cIdx==G3_duration||cIdx==G3_mc_speed)
	{
	    var duration,speed
	    duration = grdDefect.GetGridData(row,G3_duration)
	    speed = grdDefect.GetGridData(row,G3_mc_speed)
	    if(Number(duration)&& Number(speed) && Number(duration)>0 && Number(speed)>0)
	    {
	         grdDefect.SetGridText(row,G3_loss_m,Number(duration)* Number(speed))
	    }
	}
	
}
//-----------------------------------------------------------------

function AddOnClick(obj)
{
      switch (obj)         
      {	  
            case 1  :    
            // add new master
                if (txtWI_PK.text !="" && fpep00043_1.GetStatus() != 20 )
                {
                    // pre data
                     var 
                     v_current_block   = 0,
                     v_tape            = "",
                     v_trim_width      = 0,
                     v_roll_pk         = "",
                     v_roll_id         = "",
                     v_width           = "",
                     v_item_pk_of_roll = "";
                     
                    if (txtMasterPK.text !=null)
                    {
                         v_current_block   = txtCurrentBlock.text;
                         v_tape            = txtTape.text        ;
                         v_trim_width      = txtTrimWidth.text   ;
                         v_roll_pk         = txtRollPK.text      ;
                         v_roll_id         = txtRollId.text      ;
                         v_width           = txtWidth.text       ;
                         v_item_pk_of_roll = txtItemPk.text      ;
                    }
                   // get pre data
                     fpep00043_1.StatusInsert();
                     txtMasterPK.text     = "";
                     txtWI_PK.text        = grdSearch.GetGridData(grdSearch.row,G1_PK) 
                     txtSTItemPK.text     = grdSearch.GetGridData(grdSearch.row,G1_TCO_STITEM_PK )  
                     txtItemCode.text     = grdSearch.GetGridData(grdSearch.row,G1_Item_Code)                  
                     txtItemName.text     = grdSearch.GetGridData(grdSearch.row,G1_Item_Name)                  
                     txtServiceM.text     = grdSearch.GetGridData(grdSearch.row,G1_Service_M)
                     txtTotalBlock.text   = grdSearch.GetGridData(grdSearch.row,G1_Total_Block)
                     txtRollPK.text       = v_roll_pk
                     txtRollId.text       = v_roll_id
                     txtItemPk.text       = v_item_pk_of_roll
                     txtWidth.text        = v_width
                     txtTrimWidth.text    = v_trim_width
//                     txtTape.text         = v_tape
                     txtEmpPK.text        = user_pk   
                     txtEmpName.text      = user_name
                     txtCurrentBlock.text = (Number(v_current_block)+1)+""
                     
                      //---------------------- Set Length of each time cutting --------------------
                      if ( grdDetail.rows > 1 )
                      {
                            txtItemLength.text = grdDetail.GetGridData(1, G2_SPEC6 ) ; // Item length 
                      } 
                      //---------------------------------------------------------------------------
                      
                     lblStatus.text = "New Main Cutting!!"
                     p_update =1;  
                     txtEmpPK.text   = user_pk   
                     txtEmpName.text = user_name  
                     if (txtRollId.text !='')
                        pro_fpep00043.Call('SELECT');                     
                }
            break;
            case 2:                                     //add defect
//                if(txtMasterPK.text!="")
//                {
                    grdDefect.AddRow();
                    fpep00041_6.Call('SELECT')
                    grdDefect.SetGridText(grdDefect.rows-1,G3_mc_speed,txtMCSpeed.text); 
                    grdDefect.SetGridText(grdDefect.rows-1,G3_product_result,txtMasterPK.text);
//                }else
//                {   
//                     alert('Please save result first!')
//                }
            break;
            case 3:                                     //add shift
                //if(txtMasterPK.text!="")
                //{
                     var path = System.RootURL + '/form/fp/ep/fpep00041_1.aspx' ;
                    var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes;dialogWidth:450px; dialogHeight:450px;center:yes');
                    fpep00043_4.Call('SELECT')
                //}else
                //{   
                //     alert('Please save result first!')
                //}
            break;
     }
     
}
//-----------------------------------------------------

function OnSave(pos)  
{
      switch (pos)         
      {	  
            case 'Master'  :                
                if ( CheckSave(1) )
                {
                   fpep00043_1.Call();
                   flagSave = 1 ;
                }
            break ;
            
            case 'Detail'  :  
                lblStatus.text =""  
                for(i =1; i<grdDetail.rows; i++)
                    grdDetail.SetGridText(i, G2_master_item_pk, txtItemPk.text);
                fpep00043_2.Call();
            break ;
            
            case 'Defect'  :
                //save defect
                if(CheckSave(2))
                {
                    for ( i = 1; i < grdDefect.rows ; i++ )
                    {
                            grdDefect.SetGridText( i ,G3_product_result , txtMasterPK.text ) ;
                    }
                    fpep00041_4.Call();
                }
            break;
            case 'Shift'  :
                //save defect
                    fpep00043_4.Call();
            break;
            
                  

            
       }            
}
//-----------------------------------------------------
function CheckSave(id)
{   
    switch(id) 
    {
    case 1:
       if(txtItemPk.text=='')
       {
            alert("Enter a Roll ID, please!")
            return false;
       }
       //------------------------
       if ( txtItemLength.text == '' )
       {
            alert("Select Item that length > 0 , please!")
            return false;
       }
       //------------------------
       if ( txtTape.text != '' )
       {
            if (( Number(txtTape.text)<=0) || (Number(txtTape.text) >= Number(txtItemLength.text)))
            {
                alert("The tape number must be grater than 0 and less than Item length!");
                return false;
            }
       }   
       //------------------
        if(fpep00043_1.GetStatus() == 20 )
        {
            var cuting_need =0
            cuting_need = Number(txtItemLength.text) + Number(txtServiceM.text);

            if(Number(txtRollLength.text)< cuting_need ) 
            {
                if(Number(txtEndBal.text)<=0)
                {
                    alert("The legth of this roll  ," + txtRollLength.text + ", is not suitable! Please select another Roll!")
                    return false;
                }else
                {
                    if(confirm("The legth of this roll  ," + txtRollLength.text + ", is not suitable!!\n Would you like to Combine it!"))
                    {
                        OnCombine()
                    }
                    return false;
                }
            }
        }
       //----------------------- 
       for(i=1; i<grdDetail.rows; i++)
       {
            if (grdDetail.GetGridData(i, G2_Arm_No)=="")
            {
                alert("Please input Arm no.!");
                return false;
            } 
       }
       //------------------------     
       for(i=1; i< grdDetail.rows-1; i++)
       {
            if(grdDetail.GetGridData(i, G2_Arm_No)!='')
            {
                for(j =i+1; j<grdDetail.rows; j++)
                {
                    if (grdDetail.GetGridData(i, G2_Arm_No)==grdDetail.GetGridData(j, G2_Arm_No) )   
                    {
                        alert("The Arm No at row " + i + " duplicate with Arm No at row " + j );
                        return false;
                    }
                }       
            }
       }  
       //------------------------ 
    break;
     case 2:
        for(var i =1 ; i<grdDefect.rows; i++)
        {
            if(grdDefect.GetGridData(i,G3_defectype_pk)=="")
            {
                alert('Defect cannot be null!')
                return false;
            }
            if(grdDefect.GetGridData(i,G3_loss_m)==""||grdDefect.GetGridData(i,G3_loss_m)<=0)
            {
                alert('Defect quantity cannot be null!')
                return false;
            }
        }
    break;
    default :
        return true;
    }
    return true;
}

//----------------------Detail--------------------------------------
function OnDelete(obj)
 {
      switch (obj)         
      {	  
            case 1  :  
                          
                if ( confirm ( "Do you want to delete this WI ?" ) )
                {
                    if (txtMasterPK.text != "")
                    {
                        flagSave =0; 
                        p_update = 0;
                        fpep00043_1.StatusDelete();
                        for(var i =1 ; i<grdDetail.rows -1; i++ )
                        {
                            grdDetail.SetRowStatus(i,64);
                        }
	                    fpep00043_1.Call();
	                }    
	                else
	                {
	                    alert("Please,Select a Work Instruction !");
	                }    
 	             }

	        break;  
	        case 2  :                
                var ctrl = grdDefect.GetGridControl();
	            var row  = ctrl.row;
	            
	            if ( row < 0 ) 
	            {			
			            alert("Please select a Record to delete .");
	            }			
	            else 
	            {
		            if ( grdDefect.GetGridData( ctrl.row, G3_oqc_defect_pk ) == "" ) 
		            {						
					        grdDefect.RemoveRow();					
			        }
        			
		            else 
		            {
			            if ( confirm( "Do you want to mark this row to delete?" ) ) 
			            {
				            grdDefect.DeleteRow();
			            }
		            }
	            }
	        break ;
	        case 3  :                
                var ctrl = grdShift.GetGridControl();
	            var row  = ctrl.row;
	            
	            if ( row < 0 ) 
	            {			
			            alert("Please select a Record to delete .");
	            }			
	            else 
	            {
		            if ( grdShift.GetGridData( ctrl.row, 0 ) == "" ) 
		            {						
					        grdShift.RemoveRow();					
			        }
        			
		            else 
		            {
			            if ( confirm( "Do you want to mark this row to delete?" ) ) 
			            {
				            grdShift.DeleteRow();
			            }
		            }
	            }
	        break ;

	    }
 }
//----------------------------------------------------------
function OnEnterRoll()
{

    if(fpep00043_1.GetStatus()==20)
    {
        if(txtRollPK.text != "")
        {
            var cuting_need =0
            cuting_need = Number(txtItemLength.text) + Number(txtServiceM.text);
            if(Number(txtRollLength.text)< cuting_need ) 
            {
                if(Number(txtEndBal.text)>0)
                {
                    if(confirm("This roll is not enough length to make cutting. \n Would you like to send it to Recycle Warehouse?"))  
                    {
                        fpep00043_7.Call();
                    }
                }
             }
        }
        flagCheckTime = 0
        pro_fpep00043.Call('SELECT')
    }
    else
    {
        alert("Please click New button first!!!");
    }
}
//---------------------------------------------------------

 function OnUnDelete(iObj) 
 {
    
   
	var ctrl = iObj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			iObj.UnDeleteRow();
		}
	}
}

//--------------------------------------------------------
function OnReport()
{
        if (txtMasterPK.text!="")
        { 
              var url =System.RootURL + '/reports/fp/ep/YC_Barcode.aspx?tpr_prodresult_pk=' + txtMasterPK.text + "&weight_yn=" + chWeightYN.value  ;
              //var url = System.RootURL + "/system/ReportEngine.aspx?file=fp/cw/fpcw00040_Item_card.rpt&procedure=PROD.sp_sel_fpcw00040_item_card&parameter=" + txtMasterPK.text + "," + chWeightYN.value ;
	          System.OpenTargetPage(url); 	
        }
        else
        {     
             alert("Please,Select a Production Result first !");
        }     
}
//------------------------------------------------------------
function OnOpenNoneOperation()
{
      var path = System.RootURL + '/form/fp/ep/fpep00045.aspx?type=2';
      var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
}
//------------------------------------------------------------
function OnCombine()
{
      if(txtRollPK.text !='')
      {
        if(fpep00043_1.GetStatus() == 20 )
        {
            var path = System.RootURL + '/form/fp/ep/fpep00043_1.aspx?type=1';
            var obj = System.OpenModal( path ,500 , 280 ,  'resizable:yes;status:yes',this);
            if(txtCombineMPK.text !="")
            {
               pro_fpep00043.Call('SELECT') 
            }
        }else
        {
            if(txtCombineMPK.text !="")
            {
                var path = System.RootURL + '/form/fp/ep/fpep00043_1.aspx?type=1';
                var obj = System.OpenModal( path ,500 , 280 ,  'resizable:yes;status:yes',this);
                if(txtCombineMPK.text !="")
                {
                   pro_fpep00043.Call('SELECT') 
                }
            }else
            {
                alert("This result didn't use Combine roll!")
            }
        }
      }else
      {
        if(txtRollPK.text =="")
        {
            alert("Combine roll must be not null!!")
        }
         
      }
}
//------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00043" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="prod.sp_sel_fpep00043" > 
                <input bind="grdSearch" > 
                     <input bind="txtSearchWINo" /> 
                     <input bind="dtFromDate" /> 
                     <input bind="dtToDate" /> 
                     <input bind="lstWIStatus" /> 
                     <input bind="txtItem" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------find result----------------------------------->
    <gw:data id="fpep00043_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_sel_fpep00043_3"  > 
                <input>
                    <input bind="txtWI_PK" /> 
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00043_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="prod.sp_sel_fpep00043_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" procedure="prod.sp_upd_fpep00043_1" > 
                <inout > 
                     <inout bind="txtMasterPK" /> 
                     <inout bind="txtWI_PK" /> 
                     <inout bind="txtRollPK" /> 
                     <inout bind="txtRollId" /> 
                     <inout bind="txtRollLength" /> 
                     <inout bind="txtItemPk" /> 
                     <inout bind="txtItemCode"/>
                     <inout bind="txtItemName"/>                      
                     <inout bind="txtWidth"/>
                     <inout bind="txtTrimWidth"/>  
                     <inout bind="txtTape"/>
                     <inout bind="txtBalance"/>
                     <inout bind="txtServiceM"/>
                     <inout bind="txtCurrentBlock"/>
                     <inout bind="txtTotalBlock"/>
                     <inout bind="txtMCSpeed"/>
                     <inout bind="txtShift_pk"/>
                     <inout bind="txtLine_pk"/>   
                     <inout bind="txtLine"/>
                     <inout bind="txtWINo"/>
                     <inout bind="txtSTItemPk"/>
                     <inout bind="lstGroup"/>
                     <inout bind="txtEmpPK"/> 
                     <inout bind="txtEmpName"/>
                     <inout bind="txtItemLength"/>
                     <inout bind="txtCombineMPK"/>
                     <inout bind="dtProdDate"/>
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!------------------------------find result----------------------------------->
    <gw:data id="pro_fpep00043" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="PROD.sp_pro_fpep00043"  > 
                 <inout > 
                     <inout bind="txtRollId" /> 
                     <inout bind="txtRollPK" />
                     <inout bind="txtWidth" /> 
                     <inout bind="txtItemPk" /> 
                     <inout bind="txtItemCode" />
                     <inout bind="txtItemName" />
                     <inout bind="txtEndBal" />
                     <inout bind="txtRollLength" />
                 </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00043_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="prod.sp_sel_fpep00043_2" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" procedure="prod.sp_upd_fpep00043_2"> 
                <input bind="grdDetail" > 
                     <input bind="txtMasterPK" /> 
                     <input bind="txtWI_PK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <!--------------------------------Get Time From Server------------------------------>
    <gw:data id="fpep00041_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="PROD.sp_pro_fpep00041_1" > 
                <inout>             
                     <inout  bind="txtTimeServer" />  
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00041_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="prod.sp_sel_fpep00041_4" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12"  procedure='prod.sp_upd_fpep00041_4'> 
                <input> 
                    <inout  bind="txtMasterPK" />                            
                </input> 
                <output bind="grdDefect" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------List of Shift----------------------------------->
    <gw:data id="fpep00043_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="PROD.sp_sel_fpep00043_4" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" procedure="PROD.sp_upd_fpep00041_5" > 
                <input> 
                    <inout  bind="txtWI_PK" />  
                </input> 
                <output bind="grdShift" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------find result----------------------------------->
    <gw:data id="pro_fpep00043_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="PROD.sp_pro_fpep00043_5"  > 
                 <input >  
                     <input bind="txtRollPK" />
                 </input> 
                 <output>
                    <ouput bind="txtHours" />
                 </output>
             </dso> 
        </xml> 
    </gw:data>
    <!------------------------------find result----------------------------------->
    <gw:data id="fpep00043_7" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_pro_fpep00043_6"  > 
                 <input >  
                     <input bind="txtRollPK" />
                     <input bind="txtEmpPK" />
                 </input> 
                 <output>
                    <ouput bind="txtStatus" />
                 </output>
             </dso> 
        </xml> 
    </gw:data>
  
    <!-------------------------------List of Shift----------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 40%">
            <td id="left" style="width: 25%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 5%">
                            WI No
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtSearchWINo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('Search')" />
                        </td>
                        <td align="right" style="width: 5%">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFromDate" lang="1" />
                            ~
                            <gw:datebox id="dtToDate" lang="1" />
                        </td>
                        <td align="right" style="width: 5%">
                            Status
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstWIStatus" styles='width:100%' onchange="OnSearch('Search')" />
                        </td>
                        <td align="right" style="width: 5%">
                            Item
                        </td>
                        <td align="right" style="width: 24%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Search')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch1" img="search" onclick="OnSearch('Search')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdSearch' header='_PK|WI No|Date|_TCO_ITEM_PK|Item Code|Item Name|Spec|WI Qty|Line|Shift|Product Qty|_Service_M|_TotalBlock|_width'
                                format='0|0|4|0|0|0|0|1|0|0|1|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|1200|0|1500|2500|1500|1500|0|1500|1500|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 20%">
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width:100%" colspan="12">
                                <table style=" width:100%; height:100%" border="0">
                                    <tr>
                                        <td align="right" style="width: 12%">Prod Date</td>
                                        <td style="width: 10%"><gw:datebox id="dtProdDate" lang="1" />
                                        </td>
                                        <td align="right" style=" width:10%">
                                            <a style="text-decoration: none; color:#0000ff;" href='#tips' title="Select Roll"
                                                onclick="OnPopUp('Roll')">Roll ID </a>
                                        </td>
                                        <td style=" width:18%">
                                            <gw:textbox id="txtRollPK" styles="width:100%;display:none" />
                                            <gw:textbox id="txtRollId" styles="width:100%" onenterkey="OnEnterRoll()" />
                                        </td>
                                        <td style=" width:10%">
                                              <gw:textbox id="txtRollLength" styles='width:95%'  type="number" format="#,###,###,###,###.##"/>
                                        </td>
                                        <td style=" width:2%">(M)</td>
                                        <td style=" width:5%">
                                            <gw:icon id="btnNoneOperation" text='None Operation' onclick="OnOpenNoneOperation()" />
                                        </td>
                                         <td style=" width:5%">
                                            <gw:icon id="btnCombine" text='Combine Roll' onclick="OnCombine()" />
                                        </td>
                                        <td align="right" style=" width:10%">
                                            <gw:label id='lblStatus' text='' styles="color:red" />
                                        </td>
                                        <td align="right"  style="width:10%">
                                            Weight Y/N
                                            <gw:checkbox id="chWeightYN" defaultvalue="Y|N" value="N" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                                        </td>
                                        <td style="width: 1%" align="right">
                                            <gw:imgbtn id="btnNew" img="new" alt="New" text="Add" onclick="AddOnClick(1)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnDelete1" img="delete" alt="Delete" text="Delete" onclick="OnDelete(1)" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                                        </td>
                                        <td style="width: 1%">
                                            <gw:imgbtn id="btnExcel" img="excel" alt="Excel" text="Excel" onclick="OnReport()" />
                                        </td>
                                    </tr>
                                </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Item</td>
                        <td style="width: 25%; white-space: nowrap" colspan="3">
                            <gw:textbox id="txtSTItemPK" styles="width:100%;display:none" onenterkey="" />
                            <gw:textbox id="txtItemPk" styles='display:none' />
                            <gw:textbox id="txtItemCode" styles='width:30%' />
                            <gw:textbox id="txtItemName" styles='width:70%' />
                        </td>
                        <td align="right" style="width: 10%">
                            Group
                        </td>
                        <td align="right" colspan="7" style="white-space: nowrap">
                            <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 40%">
                                        <gw:list id="lstGroup" styles='width:100%' />
                                    </td>
                                    <td style="width: 60%">
                                        <gw:list id="txtShift_pk" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Width
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtWidth" styles='width:100%' onchange="OnSearch(1)" type="number"
                                format="#,###,###,###,###.##" />
                        </td>
                        <td align="right" style="width: 10%">
                            Trim width
                        </td>
                        <td style="width: 25%">
                            <!-- type="number" format="#,###,###,###,###.##" -->
                            <gw:textbox id="txtTrimWidth" styles='width:100%' />
                        </td>
                        <td style="width: 10%" align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('GetEmployee')">Charger </b>
                        </td>
                        <td style="width: 20%" colspan="7">
                            <gw:textbox id="txtEmpPK" styles='width:100%;display:none' />
                            <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%">
                            Tape</td>
                        <td style="width: 25%">
                            <gw:textbox id="txtTape" styles='width:100%' />
                        </td>
                        <td align="right" style="width: 10%">
                            Balance(%)</td>
                        <td style="white-space: nowrap; width: 25%">
                            <gw:textbox id="txtBalance" styles='width:100%' type="number" format="#,###,###,###,###.##R" />
                        </td>
                        <td align="right" style="width: 10%">
                            MC Speed</td>
                        <td colspan="7">
                            <gw:textbox id="txtMCSpeed" styles='width:100%' type="number" format="#,###,###,###,###.##R" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Service M</td>
                        <td>
                            <gw:textbox id="txtServiceM" styles='width:100%' type="number" format="#,###,###,###,###.##" />
                        </td>
                        <td align="right">
                            Current Block</td>
                        <td>
                            <gw:textbox id="txtCurrentBlock" styles='width:100%' type="number" format="#,###,###,###,###.##" />
                        </td>
                        <td align="right">
                            Total Block
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtTotalBlock" styles='width:100%' type="number" format="#,###,###,###,###.##" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40%">
            <td>
                <gw:tab>
                        <table name="Cutting Detail" style="width:100%; height:100%">
                            <tr style="height:100%">
                                <td>
                                    <gw:grid id='grdDetail' header='_PK|_TPR_PRODRESULT_PK|_TPR_WORKINSD_PK|Seq|_TCO_ITEM_PK|_SPEC1|_SPEC2|_SPEC3|_SPEC4|WIDTH|LENGTH|_SPEC7|_SPEC8|_SPEC9|_SPEC10|_PROD_QTY|Grade|_Tape|_Defect|Arm No|_Block_No|_tsa_saleorderd_pk|_master_item_pk'
                                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|1|0|0|0|0' 
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0'
                                    widths='0|0|0|1000|0|1500|1500|1000|1000|1000|1000|1000|1000|1000|1000|1500|1500|1500|1500|1500|0|0|0'
                                    sorting='T' styles='width:100%; height:100%'  />
                                </td>
                            </tr>
                        </table>
                        <table name="List of Defect" style="width:100%; height:100%">
                            <tr style="height:5%">
                                <td style="width:95%">
                                </td>
                                 <td style="width: 6%" align="right">
                                    <gw:imgbtn id="btnSearchDf" img="search" alt="Search" text="Search" onclick="OnSearch('Defect')" />
                                </td>
                                <td style="width: 1%" align="right">
                                    <gw:imgbtn id="btnNewDf" img="new" alt="New" text="Add" onclick="AddOnClick(2)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnDeleteDf" img="delete" alt="Delete" text="Delete" onclick="OnDelete(2)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnUnDeleteDf" img="Udelete" alt="Un Delete" text="Delete" onclick="OnUnDelete(grdDefect)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnSaveDf" img="save" alt="Save" text="Save" onclick="OnSave('Defect')" />
                                </td>
                            </tr>
                            <tr style="height:95%">
                                <td colspan="6">
                                    <gw:grid id='grdDefect'
                                        header='_OQC_DEFECT_PK|_TPR_DEFECTTYPE_PK|_TPR_DEFECT_PK|Defect Id|Defect Name|From Time|To Time|Duration|MC Speed|Loss(M)|Loss(Kg)|_TPR_OQCRESULT_PK|_tpr_product_result'
                                        format='0|0|0|0|0|0|0|1|1|1|1|0|0'
                                        aligns='0|0|0|0|0|1|1|0|0|0|0|0|0'
                                        defaults='||||||||||||'
                                        editcol='1|1|1|1|1|1|1|1|1|1|1|1|0'
                                        widths='0|0|0|1500|2000|1200|1200|1500|1500|1500|1500|0|0'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        onafteredit='On_AfterEdit()'
                                        oncelldblclick='OnGridCellDblClick(this)'
                                       />
                                </td>
                            </tr>
                        </table>
                        <table name="List of Shift" style="width:100%; height:100%">
                            <tr style="height:5%">
                                <td style="width:95%">
                                </td>
                                 <td style="width: 6%" align="right">
                                    <gw:imgbtn id="btnSearchSh" img="search" alt="Search" text="Search" onclick="OnSearch('Shift')" />
                                </td>
                                <td style="width: 1%" align="right">
                                    <gw:imgbtn id="btnNewSh" img="new" alt="New" text="Add" onclick="AddOnClick(3)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnDeleteSh" img="delete" alt="Delete" text="Delete" onclick="OnDelete(3)" />
                                </td>
                                 <td style="width: 1%">
                                    <gw:imgbtn id="btnUnDeleteSh" img="Udelete" alt="Un Delete" text="Delete" onclick="OnUnDelete(grdShift)" />
                                </td>
                                <td style="width: 1%">
                                    <gw:imgbtn id="btnSaveSh" img="save" alt="Save" text="Save" onclick="OnSave('Shift')" />
                                </td>
                            </tr>
                            <tr style="height:95%">
                                <td colspan="6">
                                     <gw:grid id='grdShift'
                                        header='_PK|_TPR_WORKINS_PK|_WI_NO|Process ID|_TCO_ITEM_PK|Item Code|Item Name|Shift|Num Of Worker(s)|_CHARGER|Charger|Change DT|Change Time|Hang Over'
                                        format='0|0|0|0|0|0|0|2|1|0|0|4|0|1'
                                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        defaults='|||||||||||||'
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        widths='0|0|1500|1500|0|1500|2000|2000|1500|0|1500|1200|1200|1500'
                                        sorting='T'
                                        styles='width:100%; height:100%'
                                        oncelldblclick='OnGridCellDblClick(this)'
                                        />
                                </td>
                            </tr>
                        </table>
                    </gw:tab>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtLoc_pk" styles='width:100%;display:none' />
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtWI_PK" styles='width:100%;display:none' />
    <gw:textbox id="txtTimeServer" styles='width:100%;display:none' />
    <gw:textbox id="txtProdShiftPk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtRollItem_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------------->
    <gw:textbox id="txtLine_pk" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtLine" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtWINo" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtSumOfWidth" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtEndBal" styles="width:100%;display:none" onenterkey="" />
    <!------------------------------------------------------------------------------->
    <gw:textbox id="txtItemLength" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtHours" styles="width:100%;display:none" onenterkey="" />
    <gw:textbox id="txtCombineMPK" styles="width:100%;display:none" onenterkey="" />
    
    <gw:textbox id="txtStatus" styles="width:100%;display:none" onenterkey="" />
</body>
</html>
