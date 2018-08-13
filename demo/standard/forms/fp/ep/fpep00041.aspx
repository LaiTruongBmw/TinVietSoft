<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head id="Head1" runat="server">
    <title>MR Result</title>
</head>

<script>
 
  var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
  var  user_name  = "<%=Session("USER_NAME")%>" ;
  
  var   G1_pk           = 0,
        G1_wi_no        = 1,
        G1_wi_date      = 2,
        G1_line_pk      = 3,
        G1_line_id      = 4,
        G1_line_nm      = 5,
        G1_item_pk      = 6,
        G1_stitem_pk    = 7,
        G1_stitem_cd    = 8,
        G1_stitem_nm    = 9,
        G1_spec         = 10,
        G1_uom          = 11,
        G1_wi_qty       = 12,
        G1_wi_qty_kg    = 13,

        G1_prod_qty     = 14, 
        G1_prod_qty_kg  = 15,
        G1_shift_pk     = 16,
        G1_charger      = 17,
        G1_from_date    = 18,
        G1_desc         = 19,
        G1_prod_qty1    = 20,
        G1_item_width     = 21,
        G1_close     = 22;
  //------------------
  var sttime , entime
  //--------grdDefect---------
  var   G2_oqc_defect_pk    = 0,
        G2_defectype_pk     = 1,
        G2_defect_pk        = 2,
        G2_defect_id        = 3,
        G2_defect_nm        = 4,
        G2_from_time        = 5,
        G2_to_time          = 6,
        G2_duration         = 7,
        G2_mc_speed         = 8,
        G2_loss_m           = 9,
        G2_loss_kg          = 10,
        G2_oqcresult_pk     = 11,
        G2_product_result   = 12;
        
  //----------grdShift----------------
  var
  G3_Shif =7
  //---------------------------------------------------------
  var saveflag = 0, starFlag=0
  //---------------------------------------------------------
 function BodyInit()
 {
    dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-7));
    SetEnalbe()
    OnFormatGrid()
 } 
//-------------------------------------------------------------------------------------------
 function SetEnalbe()
  { 
    btnFnTime.SetEnable(false);
    btnStTime.SetEnable(false);
    //txtStHH.SetEnable(false);
    //txtStMM.SetEnable(false);
    //txtFnHH.SetEnable(false);
    //txtFnMM.SetEnable(false);
    txtLoss1.SetEnable(false);
    txtLoss2.SetEnable(false);
    txtWINo.SetEnable(false);
    dtProdDate.SetEnable(false);
    txtLine.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtQty.SetEnable(false);
    txtCharger.SetEnable(false);
    txtRollId.SetEnable(false);
    
    var data ='DATA|A|A|C|C|D|D'
    lstGrade.SetDataText(data);
    
  }
  //------------------------------------------------------------------------------------------------
 function OnFormatGrid()
 {
    var trl ;   
    trl = grdWI.GetGridControl();
    trl.ColFormat(G1_wi_qty)              = "###,###,###,###,###.##";
    trl.ColFormat(G1_wi_qty_kg)            = "###,###,###,###,###.##";  
    trl.ColFormat(G1_prod_qty)              = "###,###,###,###,###.##";
    trl.ColFormat(G1_prod_qty_kg)            = "###,###,###,###,###.##";  
    trl.FrozenCols =G1_line_pk;
    
    trl = grdDefect.GetGridControl();
    trl.ColFormat(G2_duration)              = "###,###,###,###,###.##";
    trl.ColFormat(G2_mc_speed)            = "###,###,###,###,###.##";
    trl.ColFormat(G2_loss_m)                = "###,###,###,###,###.##";   
    trl.ColFormat(G2_loss_kg)                = "###,###,###,###,###.##";   
    
   var data ;   
   data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE||' '||a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )  %> " ; 
   grdWI.SetComboFormat(G1_shift_pk,data);
   grdShift.SetComboFormat(G3_Shif,data);
   lstWinder.SetDataText('DATA|A|A|B|B');
   data ="<%=ESysLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGPC0010') FROM DUAL" )%>";    
   lstGroup.SetDataText(data)
   data = "<%=ESysLib.SetListDataSQL("SELECT a.CODE, a.CODE||' '||a.CODE_NM FROM sale.LG_CODE a, sale.LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC0020' AND a.LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM  ") %>";
   txtShift_pk.SetDataText(data)
   //grddefect 
   grdDefect.GetGridControl().ColEditMask(G2_from_time)="99:99";
   grdDefect.GetGridControl().ColEditMask(G2_to_time)="99:99";
   
 }
 //---------------------------------------------------------
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 1:
           fpep00041_1.Call('SELECT')
        break;
    }
     
 }
//----------------------------------------------------------
function OnClose()
{
    if(txtWI_PK.text=="")
    {
        alert("Select a Work Instruction you want to close,please !")
    }else
    {
        if(confirm("If you close WI, you cannot register MR result any more.\nDo you want to close WI?"))
        {
            grdWI.SetGridText( grdWI.row, G1_close ,"Y");
            fpep00041_9.Call();
        }
    }
}
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
    switch(po_oData.id)
    {
        case 'fpep00041_1':
            lblRecord1.text =  (grdWI.rows -1) + "  record(s)"
            for(var i =1; i<grdWI.rows; i++)
            {
                var pro_qty,wi_qty
                pro_qty = grdWI.GetGridData(i,G1_prod_qty)
                wi_qty = grdWI.GetGridData(i,G1_wi_qty)
                if(Number(pro_qty)&&Number(wi_qty))
                {   
                    if(Number(pro_qty)>=Number(wi_qty))
                        grdWI.SetCellBgColor( i, 0, i, grdWI.cols-1, 0xccffff );
                }
            } 
        break;
        case 'fpep00041_3':
            //after find result pk => search product result
            if(txtResult_pk.text=='')
            {
                if(grdWI.GetGridData(grdWI.row,G1_close)=='N')
                OnAddNew(1)
                fpep00041_8.Call('SELECT')
            }else
            {
                 lblStatus.text =''
                 fpep00041_2.Call('SELECT');
            }
        break;
        case 'fpep00041_2':
            txtStHH.text = txtStTime.text.substr(8,2)
            txtStMM.text = txtStTime.text.substr(10,2)
            txtFnHH.text = txtFnTime.text.substr(8,2)
            txtFnMM.text = txtFnTime.text.substr(10,2)
            
            dtStTime.value =txtStTime.text.substr(0,8);
            dtFnTime.value = txtFnTime.text.substr(0,8);
            
            btnFnTime.SetEnable(false);
            btnStTime.SetEnable(false);
            chkLossYN.SetEnable(false);
            if(saveflag==1)
            {
                saveflag = 0 ;
                SetParentPKtoGrid();
                OnSave(2)
            }else
            {
                fpep00041_4.Call('SELECT')
            }
        break;
        case 'fpep00041_4':
            //after receive defect
            TotalDefect()
        break;
        case 'fpep00041_5':
            //after create barcode
            alert(txt_result.text)
        break;
        case 'fpep00041_6':
            //after set time
            if(starFlag==1)
            {
                txtStTime.text = txtTimeServer.text;
                txtStHH.text = txtTimeServer.text.substr(8,2);
                txtStMM.text = txtTimeServer.text.substr(10,2);
                dtStTime.value = txtTimeServer.text.substr(0,8);
            }else
            {
                if(starFlag==2)
                {
                    txtFnTime.text = txtTimeServer.text;
                    txtFnHH.text = txtTimeServer.text.substr(8,2);
                    txtFnMM.text = txtTimeServer.text.substr(10,2);
                    dtFnTime.value = txtTimeServer.text.substr(0,8);
                    if (txtStTime.text.length ==12 && txtFnTime.text.length==12)
                     {
                         fpep00041_7.Call()
                     }
                }else
                if(starFlag==3)
                {
                    var time = txtTimeServer.text.substr(8,2)+":"+txtTimeServer.text.substr(10,2)
                    grdDefect.SetGridText(grdDefect.rows-1,G2_from_time,time);
                    grdDefect.SetGridText(grdDefect.rows-1,G2_to_time,time);
                }
            }
        break;
        case 'fpep00041_7':
            //affter calculate duration
           // ProductResult()
        break;
        case 'fpep00041_10':
        {
                 lblStatus.text =''
                 fpep00041_2.Call('SELECT');
        }
    }
   
 }
 //---------------------------------------------------------
 function OnPopup(id)
 {
    if(id==1)
    { //Show Roll No
        if(txtItemPk.text!='')
        {
         var path = System.RootURL + '/form/fp/ep/fpep00041_3.aspx?' ;
                     path = path + 'item_pk='  + txtItemPk.text ;
                     path = path + '&item_code='+ txtItemCode.text ;
                     path = path + '&item_name='+ txtItemName.text ;
                     path = path + '&item_uom=' + grdWI.GetGridData(grdWI.row,G1_uom) ;
                     
                 var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                 if ( obj != null )
                 {
                     txtRollId_pk.text = obj[0]; //tpr_lotno_pk
                     txtRollId.text = obj[1]; //LOT NO
                     fpep00041_10.Call()
                 }	 
          }
      } 
      if(id==2)
      {
          if (txtResult_pk.text !="")
          {
            var path = System.RootURL + '/form/fp/ep/fpep00041_1.aspx' ;
            var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes;dialogWidth:450px; dialogHeight:450px;center:yes');
          }else
          {
            alert("Please, select one work !")
          }
      }     
      if(id==3)
      {
      
            var path = System.RootURL + '/form/fp/ep/fpep00041_2.aspx';
             var object = window.showModalDialog(path ,this ,'resizable:yes;toolbar=no;dialogWidth:60;dialogHeight:40');	
	         var arrTemp ;
	         
             if ( object != null )
             {  
                arrTemp = object[0];
           
                    txtItemPk.text = arrTemp[12]; //item_pk
                    txtItemCode.text = arrTemp[4]; //Item Code
                    txtItemName.text = arrTemp[5]; //Item Name
                    txtWidth.text = arrTemp[9]; //width           
             }
      }     
 }
 //--------------------------------------------------------
 function OnSetTime(id)
 {
    starFlag = id;
    if(id==1)
    {
        lblStatus.text ='Click Finish Time button to finish producing!'
        btnFnTime.SetEnable(true);
        btnStTime.SetEnable(false);
        fpep00041_6.Call('SELECT')
       /* sttime = new Date()
        txtStHH.text = sttime.getHours()<10?'0'+sttime.getHours():sttime.getHours()
        txtStMM.text = sttime.getMinutes()<10?'0'+sttime.getMinutes():sttime.getMinutes()
        txtStTime.text = txtStHH.text +':'+txtStMM.text
        */
        
       
    }
    else
    {
        lblStatus.text ='Click Save Result button to save product result!'
        btnFnTime.SetEnable(false);
        fpep00041_6.Call('SELECT')
        /*entime = new Date()
        txtFnHH.text = entime.getHours()<10?'0'+entime.getHours():entime.getHours()
        txtFnMM.text = entime.getMinutes()<10?'0'+entime.getMinutes():entime.getMinutes()
        txtFnTime.text = txtFnHH.text +':'+txtFnMM.text
        //tinh tg
        txtDuration.text = Math.ceil((entime - sttime)/1000/60)+""
        */
    }
 }
 //---------------------------------------------------------
 function ProductResult()
 {
    var duration ,mcspeed
    duration = txtDuration.text;
    mcspeed = txtSpeed.text;
    if(Number(mcspeed)&&Number(mcspeed))
        txtProdQty.text = (mcspeed*duration)+"";
    else
        txtProdQty.text = '';
 }
 //------------------Total defect-------------------------
 function TotalDefect()
 {
    var sum_m =0,sum_kg=0
            for(var i =1; i<grdDefect.rows; i++)
            {
                var value=grdDefect.GetGridData(i,G2_loss_m)
                if(Number(value))
                    sum_m = sum_m + Number(value)
                value = grdDefect.GetGridData(i,G2_loss_kg)
                if(Number(value))
                    sum_kg = sum_kg + Number(value)
            }
            txtLoss1.text = sum_m+''
            txtLoss2.text = sum_kg+''
 }
 //------------------------------------------------------------------------------------------------

function OnGridCellClick(oGrid)
{
   if(oGrid.id=='grdWI')
    {        
            txtWI_PK.text    = grdWI.GetGridData( grdWI.row, G1_pk       );
            txtLine_pk.text  = grdWI.GetGridData( grdWI.row, G1_line_pk  );
            txtItemPk.text   = grdWI.GetGridData( grdWI.row, G1_item_pk  );
            
            txtSTItemPK.text = grdWI.GetGridData( grdWI.row, G1_stitem_pk);
            
            fpep00041_3.Call()
    }
}
//---------------------------------------------------------
function OnGridCellDblClick(obj)
{

    var col, row
    col = event.col
    row = event.row
    
    if(obj.id=='grdDefect')
    {
        
        if(col==G2_defect_id || col==G2_defect_nm)
        {
            var path = System.RootURL + '/form/fp/ab/PopUpGetDefect.aspx' ;
            var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes');
            if (obj!=null)
            {
                grdDefect.SetGridText(row,G2_defectype_pk,obj[5])
                grdDefect.SetGridText(row,G2_defect_pk,obj[0])
                grdDefect.SetGridText(row,G2_defect_id,obj[1])
                grdDefect.SetGridText(row,G2_defect_nm,obj[2])
            }
        }
    }else
    {
        txtProdShiftPk.text = grdShift.GetGridData(row,0)
         var path = System.RootURL + '/form/fp/ep/fpep00041_1.aspx' ;
         var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes;dialogWidth:450px; dialogHeight:450px;center:yes');
    }
        
}
 //---------------------------------------------------------

function OnDelete(id)
 {
    if(id==1)
    {
        fpep00041_2.StatusDelete()
        fpep00041_2.Call();
    }else
    {
        if(idTab.GetCurrentPageNo()==0)
        {
            obj = grdDefect;
        }else
        {
            obj = grdShift;
        }
        var ctrl = obj.GetGridControl();
	    var row  = ctrl.row;
	      if ( row > 0 ) 
	    {
		    if ( obj.GetGridData( ctrl.row, 0 ) == "" ) 
		    {						
			    obj.RemoveRow();					
		    }		
		    else 
		    {
			    if ( confirm( " Do you want to mark this row to delete ? " ) ) 
			    {
				    obj.DeleteRow();
			        if(idTab.GetCurrentPageNo()==1)
			        {
				        fpep00041_8.Call()
				    }
			    }
		    }
	    }
	 }
 }

//---------------------------------------------------------

 function OnUnDelete() 
 {
    
    if(idTab.GetCurrentPageNo()==0)
    {
        obj = grdDefect;
    }else
    {
        obj = grdShift;
    }
	var ctrl = obj.GetGridControl();

	if ( ctrl.row > 0 ) 
	{
		if ( confirm ( "Do you want to undelete?" ) ) 
		{				
			obj.UnDeleteRow();
		}
	}
}
//------------------------------------------------------------------
 
 function SetParentPKtoGrid()
 {
        for ( i = 1; i < grdDefect.rows ; i++ )
        {
            if ( grdDefect.GetGridData(i,G2_product_result) == "" )
            {
                grdDefect.SetGridText(i,G2_product_result,txtResult_pk.text);
            }
        }
 }
  
//-------------------------------------------------------------------
 function CheckNumber(obj)
 {   
   if(Number(obj.text))
	{
	    if(Number(obj.text)<0)
	    {
	        obj.text='00'
	        return false
	    }
	}else
	{
	   obj.text='00'
	   return false;
	}
    return true;
 } 
 //------------------------------------------------------------------
 function ValidTime(FlagHH,obj)
 {
    if(FlagHH=='Y')  
    {
        if(CheckNumber(obj))
        {
            if(obj.text>23) 
            {
                alert("Invalid hours(0->23)!")
                obj.text='00'
                return false;
            }
        }
    }else
    {
        if(CheckNumber(obj))
        {
            if(obj.text>59) 
            {
                alert("Invalid minute(0->59)!")
                obj.text='00'
                return false;
            }
        }
    }
     if(obj.text.length==1)
     {
        obj.text = '0'+obj.text
     }
     txtStTime.text = dtStTime.value + txtStHH.text + txtStMM.text
     txtFnTime.text = dtFnTime.value + txtFnHH.text + txtFnMM.text         
     if (txtStTime.text.length ==12 && txtFnTime.text.length==12)
     {
        fpep00041_7.Call()
     }
    return true;
 }
 //------------------------------------------------------------------
 function OnSave(id)
 {
    if(id==1) //save product result
    {
       if(CheckSave(1))
        {
            
           // txtStTime.text = dtStTime.value + txtStHH.text + txtStMM.text
           // txtFnTime.text = dtFnTime.value + txtFnHH.text + txtFnMM.text         
            saveflag=1
           // if(fpep00041_2.GetStatus()==20)
             //   fpep00041_2.StatusInsert();

        //============================================================================
                        if( Number(txtStHH.text) > 24 )  
                        {
                            alert('Pls check Start Hour')
                            return;
                        }
                        else if( Number(txtStMM.text) > 60 )
                        {
                            alert('Pls check Start Minute') 
                            return;                       
                        }
                        else if( Number(txtFnHH.text) > 24 )
                        {
                            alert('Pls check End Hour') 
                            return;                       
                        }
                        else if( Number(txtFnMM.text) > 60 )
                        {
                            alert('Pls check End Minute')
                            return;                        
                        }                        
                        
                        txtStTime.text = dtStTime.value + txtStHH.text + txtStMM.text
                        txtFnTime.text = dtFnTime.value + txtFnHH.text + txtFnMM.text  
        //============================================================================  
              fpep00041_2.Call();
        }
    }else
    {
        //save defect
        if(CheckSave(2))
        {
            fpep00041_4.Call();
        }
    }
 }
 //------------------------------------------------------------------
 function OnAddNew(id)
 {
    if(id==1)
    {     if( grdWI.GetGridControl().row>0)
            {
                  if(grdWI.GetGridData(grdWI.row,G1_close)=='N')            //If work instruction is still live
                  {
                    lblStatus.text ='Click Start Time button to start producing!'
                    
                    btnStTime.SetEnable(true);
                    fpep00041_2.StatusInsert();
                    
                    txtResult_pk.text = ''
                    
                    txtWI_PK.text       = grdWI.GetGridData(grdWI.row, G1_pk    )
                    txtWINo.text        = grdWI.GetGridData(grdWI.row, G1_wi_no )
                    //dtProdDate.value = grdWI.GetGridData(grdWI.row,G1_wi_date)
                    //txtRollId.text = grdWI.GetGridData(grdWI.row,G1_wi_no)
                    
                    txtSTItemPK.text    = grdWI.GetGridData( grdWI.row, G1_stitem_pk )
                    txtItemPk.text      = grdWI.GetGridData( grdWI.row, G1_item_pk   )
                    txtItemCode.text    = grdWI.GetGridData( grdWI.row, G1_stitem_cd )
                    txtItemName.text     = grdWI.GetGridData( grdWI.row, G1_stitem_nm )
                    dtItemUOM.text      = grdWI.GetGridData( grdWI.row, G1_uom       )
                    txtQty.text         = grdWI.GetGridData( grdWI.row, G1_wi_qty    )
                    
                    txtWidth.text = grdWI.GetGridData(grdWI.row,G1_item_width )
                     
                    txtLine.text        = grdWI.GetGridData( grdWI.row, G1_line_nm   )
                    txtLine_Id.text     = grdWI.GetGridData( grdWI.row, G1_line_id   )
                    txtLine_pk.text     = grdWI.GetGridData( grdWI.row, G1_line_pk   )
                    
                    //txtShift_pk.value    = grdWI.GetGridData( grdWI.row, G1_shift_pk  )
                    txtCharger.text     = user_name
                    txtChargerPK.text   = user_pk
                    
                    dtStTime.value  = ''
                    txtStHH.text    = ''
                    txtStMM.text    = ''
                    
                    dtFnTime.value  = ''
                    txtFnHH.text    = ''
                    txtFnMM.text    = ''
                    
                    txtLoss1.text   = ''
                    txtLoss2.text   = ''
                    
                    grdDefect.ClearData();
               }else
               {
                    alert('This work instruction have been closed!Cannot add new result!')
               }
           
           }
        chkLossYN.SetEnable(true);      
    }else
    {
     
        if(txtStTime.text !="")
        {
            if(idTab.GetCurrentPageNo()==0)
            {
                grdDefect.AddRow();
                starFlag = 3;
                fpep00041_6.Call('SELECT')
                grdDefect.SetGridText(grdDefect.rows-1,G2_mc_speed,txtSpeed.text); 
                grdDefect.SetGridText(grdDefect.rows-1,G2_product_result,txtResult_pk.text);
            }else
            {
                var path = System.RootURL + '/form/fp/ep/fpep00041_1.aspx' ;
                var obj = window.showModalDialog( path ,this ,  'resizable:yes;status:yes;dialogWidth:450px; dialogHeight:450px;center:yes');
                alert(txtHandOver.text)
                fpep00041_8.Call('SELECT')
            }
         }else
         {
            alert("Work Instruction must be started first!")
         }
     }
}
 //-----------------------------------------------------------------
 function CheckSave(id)
 {
    switch(id)
    {
        case 1:
            if(txtShift_pk.value=='')
            {
                alert("Please select a shift!");      
                return false;
            }
            
            if (lstGroup.value=='')
            {
                alert("Please select a group!");
                return false;
            }
            
            if(txtFnHH.text==""||txtStHH.text=="")
            {
                alert('Please set Start time and Finish time!')
                return false;
            }
            if((txtBobbin.text =="") &&(chkLossYN.value=='N'))
            {
                alert('Please input Bobbin No!!')
                return false;
            }
            if(lstWinder.value=="")
            {
                alert('Please input Winder!!')
                return false;
            }
            if(txtSpeed.text =="" )
            {
                alert('Please input speed!!')
                return false;
            }
            if((txtProdQty.text <=0) &&(chkLossYN.value=='N'))
            {
                alert('Please input production qty!')
                return false;
            }
        break;
        case 2:
            for(var i =1 ; i<grdDefect.rows; i++)
            {
                if(grdDefect.GetGridData(i,G2_defectype_pk)=="")
                {
                    alert('Defect cannot be null!')
                    return false;
                }
                if(grdDefect.GetGridData(i,G2_loss_m)==""||grdDefect.GetGridData(i,G2_loss_m)<=0)
                {
                    alert('Defect quantity cannot be null!')
                    return false;
                }
            }
            
            if(chkLossYN.value =="Y")
            {
                var from_time = getMinFromTime() ;
                var to_time = getMaxToTime();
                 
                if(from_time != (txtStHH.text + ":" + txtStMM.text))
                {
                    alert("First defect from time must be Start time!!!");
                    return false;
                }
                if(to_time != (txtFnHH.text + ":" + txtFnMM.text))
                {
                    alert("Last defect from time must be End time!!!");
                    return false;
                }
            }
        break;
    }
    return true;
 }
 //-----------------------------------------------------------------
 function getMinFromTime()
{   
    var value = "";
    var items = grdDefect.rows;
    if (items>1)
    {
         value = grdDefect.GetGridData(1,G2_from_time);
    }
   
    for(var i =2 ; i<items ; i ++)
    {
        if (  grdDefect.GetGridData(i,G2_from_time) < value )
        {
            value = grdDefect.GetGridData(i,G2_from_time)
        }
    }       
    
    return value
}
//-----------------------------------------------------------------
function getMaxToTime()
{   
    var value = "";
    var items = grdDefect.rows;
    if (items>1)
    {
         value = grdDefect.GetGridData(1,G2_to_time);
    }
             
    for(var i =2 ; i<items ; i ++)
    {
        if (  grdDefect.GetGridData(i,G2_to_time) > value )
        {
            value = grdDefect.GetGridData(i,G2_to_time)
        }
    }       
    
    return value
}
//-----------------------------------------------------------------
 function On_AfterEdit()
{
	var tmpIN,ws,temp;
    var	cIdx=event.col;
	var row = event.row
	
	if (cIdx==G2_from_time||cIdx==G2_to_time)
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
		var grd_from = grdDefect.GetGridData(row,G2_from_time)
		var grd_to = grdDefect.GetGridData(row,G2_to_time)
		if(grd_from!='' && grd_to !='')
		{
		    /*lam tam thoi vi se khong dung neu start time va end time khong cung mot ngay*/
		    var hour,minute
		    hour = Number(grd_to.substr(0,2)) -Number(grd_from.substr(0,2))
		    minute = Number(grd_to.substr(3,2)) -Number(grd_from.substr(3,2))
		    grdDefect.SetGridText(row,G2_duration,hour*60+minute)
		    
		    if(Number(grdDefect.GetGridData(row,G2_mc_speed)))
		    {
		        grdDefect.SetGridText(row,G2_loss_m,(hour*60+minute)*Number(grdDefect.GetGridData(row,G2_mc_speed)))
		    }
		}
	}
	if (cIdx==G2_duration||cIdx==G2_mc_speed)
	{
	    var duration,speed
	    duration = grdDefect.GetGridData(row,G2_duration)
	    speed = grdDefect.GetGridData(row,G2_mc_speed)
	    if(Number(duration)&& Number(speed) && Number(duration)>0 && Number(speed)>0)
	    {
	         grdDefect.SetGridText(row,G2_loss_m,Number(duration)* Number(speed))
	    }
	}
	
}
//--------------------------------------------------------
function OnReport()
{
        if (txtResult_pk.text!="")
        { 
              var url =System.RootURL + '/reports/fp/ep/YC_MillRollBC.aspx?tpr_prodresult_pk=' + txtResult_pk.text  ;
	          System.OpenTargetPage(url); 	
        }
        else
        {     
             alert("Please,Select a Production Result first !");
        }     
}
//----------------------------------------------------------
function OnCreateBC()
{
    
    if (txtResult_pk.text!="")
    { 
         fpep00041_5.Call() 	
    }
    else
    {     
         alert("Please,Select a Production Result first !");
    }   
}
//-------------------------------------------------------
function OnLossChange()
{
    if(chkLossYN.value=='Y')
        btnCreateBC.SetEnable(false);        
    else
        btnCreateBC.SetEnable(true);
}
//-------------------------------------------------------
function OnChangeTab()
{
    if(idTab.GetCurrentPageNo()==0)
    {
       /* idTotal.style.display=''
        btnChangeShift.style.display='none'
        btnAddDefect.style.display=''
        btnDelete.style.display=''
        btnUndelete.style.display=''*/
    }else
    {
       /* idTotal.style.display='none'
        btnChangeShift.style.display=''
       btnAddDefect.style.display='none'
        btnDelete.style.display='none'
        btnUndelete.style.display='none'*/
        fpep00041_8.Call('SELECT')
    }
}
//------------------------------------------------------------
function OnOpenNoneOperation()
{
      var path = System.RootURL + '/form/fp/ep/fpep00045.aspx?type=1';
      var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
}
//------------------------------------------------------------
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00041_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="prod.sp_sel_fpep00041_1" > 
                <input> 
                    <input bind="txtSWI" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />
                    <input bind="txtItem" />                                
                </input> 
                <output bind="grdWI" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00041_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29" function="prod.sp_sel_fpep00041_2"  procedure="prod.sp_upd_fpep00041_2"> 
                <inout>             
                     <inout  bind="txtResult_pk" />
                     <inout  bind="txtWINo" />
                     
                     <inout  bind="txtWI_PK" />
                     <inout  bind="dtStTime" />
                     <inout  bind="txtLine_pk" /> 
                     <inout  bind="txtLine_Id" /> 
                     <inout  bind="txtLine" />
                     
                     <inout  bind="txtShift_pk" />
                      
                     <inout  bind="txtBobbin" />   
                     <inout  bind="lstWinder" />
                     <inout  bind="txtSpeed" />  
                     <inout  bind="txtDuration" />   
                     
                     <inout  bind="txtRollId_pk" />   
                     <inout  bind="txtRollId" />   
                     <inout  bind="txtStTime" />   
                     <inout  bind="txtFnTime" />   
                       
                     <inout  bind="txtSTItemPK" />
                     <inout  bind="txtItemPk" /> 
                     <inout  bind="txtItemCode" /> 
                     <inout  bind="txtItemName" /> 
                     <inout  bind="dtItemUOM" /> 
                     
                     <inout  bind="txtProdQty" /> 
                     <inout  bind="txtProdWei" />
                     <inout  bind="txtWidth" />  
                     <inout  bind="lstGrade" />   
                     <inout  bind="txtChargerPK" /> 
                     <inout  bind="txtCharger" /> 
                     <inout  bind="lstGroup" /> 
                     
                     <inout  bind="txtHandOver" /> 
                     <inout  bind="chkLossYN" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="fpep00041_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_sel_fpep00041_3"  > 
                <input>
                    <input bind="txtWI_PK" /> 
                    <input bind="txtLine_pk" /> 
                    <input bind="txtItemPk" /> 
                </input> 
                <output> 
                    <output bind="txtResult_pk" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00041_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="prod.sp_sel_fpep00041_4" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12"  procedure='prod.sp_upd_fpep00041_4'> 
                <input> 
                    <inout  bind="txtResult_pk" />                            
                </input> 
                <output bind="grdDefect" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="fpep00041_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_pro_fpep00041"  > 
                <input>
                    <input bind="txtResult_pk" /> 
                </input> 
                <output> 
                    <output bind="txt_result" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
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
    <!----------------------------------------------------------------->
    <gw:data id="fpep00041_7" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_pro_fpep00041_2"  > 
                <input>
                    <input bind="txtStTime" /> 
                    <input bind="txtFnTime" /> 
                </input> 
                <output> 
                    <output bind="txtDuration" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------List of Shift----------------------------------->
    <gw:data id="fpep00041_8" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="prod.sp_sel_fpep00041_5" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" procedure="PROD.sp_upd_fpep00041_5" > 
                <input> 
                    <inout  bind="txtWI_PK" />  
                    <inout  bind="txtItemPk" />                           
                </input> 
                <output bind="grdShift" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="fpep00041_9" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_prod_fpep00041_3"  > 
                <input>
                      <input bind="txtWI_PK" /> 
                </input> 
                <output> 
                    <output bind="txtStatus" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpep00041_10" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_sel_fpep00041_7"  > 
                <input>
                    <input bind="txtRollId_pk" /> 
                </input> 
                <output> 
                    <output bind="txtResult_pk" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%">
        <tr style="height: 5%">
            <td style="width: 10%" align="right">
                WI No
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtSWI" styles="width:100%" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 10%" align="right">
                WI Date
            </td>
            <td style="width: 15%">
                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 10%" align="right">
                ST Item
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="" />
            </td>
            <td style="width: 10%">
                <gw:label id="lblRecord1" styles="width:100%;color:blue" text="record." onenterkey="" />
            </td>
            <td style="width: 5%">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
            </td>
            <td style="width: 5%">
                <gw:icon id="btnClose" onclick="OnClose()" text="Close WI" />
            </td>
        </tr>
        <tr style="height: 35%">
            <td colspan="9">

                <gw:grid id='grdWI' header='_work_ins_pk|WI No|WI Date|_TPR_LINE_PK|_LINE_ID|Line|_TCO_ITEM_PK|_PK|Item Code|Item Name|_Spec|_UOM|WI Qty(M)|WI QTY(KG)|Prod Qty(M)|Prod Qty(Kg)|Shift|Charger|From Date|Description|_prod_qty|_item_width|Close_YN'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|1200|0|1500|0|0|0|1500|2500|2500|1500|1500|1500|1500|1500|1500|1200|2000|0|0|0|800'
                    sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)' />
            </td>
        </tr>
        <tr style="height: 20%">
            <td colspan="9">
                <table style="width: 100%; height: 100%;" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%; background-color: #bde9ff">
                        <td style="width: 10%" align="right">
                            WI No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtWINo" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 10%" align="right">
                           <%-- Prod Date--%>
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtProdDate" styles="width:100%;" style="display:none" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 10%" align="right">
                            Charger
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtCharger" styles="width:100%" onenterkey="" />
                            <gw:textbox id="txtChargerPK" styles="display:none" onenterkey="" />
                        </td>
                        <td style="width: 15%">
                        </td>
                    </tr>
                    <tr style="height: 5%; background-color: #bde9ff">
                        <td style="width: 10%" align="right">
                            <!--<a style="text-decoration: none; color=#0000ff;" href='#tips' title="Select Roll"
                                onclick="OnPopup(3)">-->
                            Item</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSTItemPK" styles="width:100%;display:none" onenterkey="" />
                            <gw:textbox id="txtItemPk" styles="width:100%; display:none" onenterkey="" />
                            <gw:textbox id="txtItemCode" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 30%" colspan="2">
                            <gw:textbox id="txtItemName" styles="width:100%" onenterkey="" />
                            <gw:textbox id="dtItemUOM" styles="width:100%;display:none" onenterkey="" />
                        </td>
                        <td style="width: 10%" align="right">
                            Wi Qty
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtQty" styles="width:100%" onenterkey="" type='number' format="###,###,###.###" />
                        </td>
                        <td style="width: 15%" align="right" colspan='2'>
                        </td>
                    </tr>
                    <tr style="height: 5%; background-color: #bde9ff">
                        <td style="width: 10%" align="right">
                            Line
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtLine_pk" styles="width:100%;display:none" onenterkey="" />
                            <gw:textbox id="txtLine_Id" styles="width:100%;display:none" onenterkey="" />
                            <gw:textbox id="txtLine" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 10%" align="right">
                            Group
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstGroup" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Shift
                        </td>
                        <td style="width: 15%">
                            <gw:list id="txtShift_pk" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="right" colspan='2'>
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 10%" align="right">
                            <a style="text-decoration: none; color=#0000ff;" href='#tips' title="Select Roll"
                                onclick="OnPopup(1)">Roll ID</a>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtRollId_pk" styles="width:100%; display:none" onenterkey="" />
                            <gw:textbox id="txtRollId" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 10%" align="right">
                            Bobbin No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtBobbin" csstype="mandatory" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 10%" align="right">
                            Winder Side
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstWinder" csstype="mandatory" styles="width:100%" onenterkey="" />
                        </td>
                        <td align="center" style="width: 15%" colspan='2' style="color:Red">
                            <b>Loss Y/N</b><gw:checkbox id="chkLossYN"  defaultvalue="Y|N" value="N" onchange="OnLossChange()" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 10%" align="right">
                            <gw:icon id="btnStTime" text='Start' onclick="OnSetTime(1)"> </gw:icon>
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtStTime" styles="width:50%;" lang="<%=Session("Lang")%>" onchange="ValidTime('Y',txtStHH)" />
                            <gw:textbox id="txtStHH" styles="width:20%;" maxlen="2" onblur="ValidTime('Y',this)" />
                            :
                            <gw:textbox id="txtStMM" styles="width:20%;" maxlen="2" onblur="ValidTime('N',this)" />
                            <gw:textbox id="txtStTime" styles="width:0%;display:none" />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:icon id="btnFnTime" text='Finish' onclick="OnSetTime(2)"> </gw:icon>
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFnTime" styles='width:50%' lang="<%=Session("Lang")%>" onchange="ValidTime('Y',txtFnHH)" />
                            <gw:textbox id="txtFnHH" styles="width:20%" maxlen="2" onblur="ValidTime('Y',this)" />
                            : 
                            <gw:textbox id="txtFnMM" styles="width:20%" maxlen="2" onblur="ValidTime('N',this)" />
                            <gw:textbox id="txtFnTime" styles="width:0%;display:none" />
                        </td>
                        <td style="width: 10%" align="right">
                            Duration
                        </td>
                        <td style="width: 15%; white-space: nowrap" colspan="3">
                            <gw:textbox id="txtDuration" type="number" format="###,###.###" onenterkey="CheckNumber(this)"
                                style="width: 30%" />
                            (min) MC Speed
                            <gw:textbox id="txtSpeed" type="number" csstype="mandatory" format="###,###.###"
                                onenterkey="CheckNumber(this)" style="width: 30%" />
                            (m/min)
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 10%" align="right">
                            Prod Qty
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtProdQty" styles="width:40%" type="number" format="###,###.###"
                                onenterkey="CheckNumber(this)" />
                            M
                            <gw:textbox id="txtProdWei" styles="width:40%" type="number" format="###,###.###"
                                onenterkey="CheckNumber(this)" />
                            KG
                        </td>
                        <td style="width: 10%" align="right">
                            Width
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtWidth" styles="width:100%" type="number" format="###,###.###"
                                onenterkey="CheckNumber(this)" />
                        </td>
                        <td style="width: 10%" align="right">
                            Quality Grade
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstGrade" styles="width:100%" onenterkey="" />
                        </td>
                        <td style="width: 15%" colspan='2' align="right">
                            <table>
                                <tr>
                                    <td>
                                        <gw:icon id="btnNew" text="New" onclick="OnAddNew(1)" />
                                    </td>
                                    <td>
                                        <gw:icon id="btnOK" text="Save" onclick="OnSave(1)" />
                                    </td>
                                    <td>
                                        <gw:icon id="btnDeleteM" text="Delete" onclick="OnDelete(1)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 5%">
            <td colspan="9">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 100%">
                        <td align="left" style="width: 70%">
                            <gw:label id='lblStatus' text='' styles="color:red" />
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:icon id="btnNoneOperation" text='None Operation' onclick="OnOpenNoneOperation()" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn img="new" alt="Add" id="btnAddDefect" onclick="OnAddNew(2)" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete(2)" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn img="udelete" alt="Undelete" id="btnUndelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn img="excel" alt="QC Card" id="btnReport" onclick="OnReport()" />
                        </td>
                        <td style="width: 5%">
                            <gw:icon id="btnCreateBC" text='Create Barcode' onclick="OnCreateBC()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 30%">
            <td colspan="9">
                <gw:tab id='idTab' onpageactivate="OnChangeTab()">
                        <table style="width:100%; height:100%" name='List of Defect'>
                            <tr>
                                <td>
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
                         <table style="width:100%; height:100%" name='List of Shift'>
                            <tr>
                                <td>
                                    <gw:grid id='grdShift'
                                        header='_PK|_TPR_WORKINS_PK|_WI_NO|Process ID|_TCO_ITEM_PK|Item Code|Item Name|Shift|Num Of Worker(s)|_CHARGER|Charger|Change DT|Change Time|Hand Over'
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
        <tr style="height: 5%" id='idTotal'>
            <td colspan="5" align="right">
                Total Defect
            </td>
            <td style="white-space: nowrap">
                <gw:textbox id="txtLoss1" styles="width:80%" type='number' format="###,###.###" />
                (M)
            </td>
            <td colspan="2" style="white-space: nowrap">
                <gw:textbox id="txtLoss2" styles="width:80%" type='number' format="###,###.###" />
                (KG)
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtWI_PK" style="display: none" />
    <gw:textbox id="txtResult_pk" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_result" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtTimeServer" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtProdShiftPk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtStatus" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtHandOver" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
