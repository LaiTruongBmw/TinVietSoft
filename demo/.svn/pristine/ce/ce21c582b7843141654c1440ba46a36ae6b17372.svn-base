<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>User Setting</title>
</head>

<script type="text/javascript">
var _bLoad = false;

var G1_T1_USER_PK = 0,
    G1_T1_USER_ID = 1,
    G1_T1_USER_NM = 2;
	
var G2_T1_WH_PK    = 0,
    G2_T1_WH_ID    = 1,
    G2_T1_WH_NM    = 2;
	
var G3_T1_MAP_PK   		= 0,
    G3_T1_WH_PK    		= 1,
    G3_T1_WH_ID    		= 2,
    G3_T1_WH_NM    		= 3, 
    G3_T1_USER_PK  		= 4,
    G3_T1_IN_WH_YN      = 5,
    G3_T1_OUT_WH_YN     = 6,
	G3_T1_REQ_WH_YN     = 7,
	G3_T1_CLOSE_WH_YN   = 8;
 //========================================================================================
 var G2_t2_line_pk  =0,
    G2_t2_line_id   =1,
    G2_t2_line_nm   =2,
    G2_t2_use_yn    =3,
    G2_t2_remark    =4;

 var G3_t2_pk      =0,
    G3_t2_line_pk    =1,
    G3_t2_line_id    =2,
    G3_t2_line_nm    =3,
    G3_t2_use_yn   =4,
    G3_t2_desc     =5,
    G3_t2_user_pk  =6,
    G3_t2_func_id  =7,
    G3_t2_func_nm  =8 ;  
 //========================================================================================
 
var G1_t3_user_pk = 0,
    G1_t3_user_id = 1,
    G1_t3_user_nm = 2;
	 
var G2_t3_group_pk   = 0,
    G2_t3_group_code = 1,
    G2_t3_group_name = 2;

 var G3_t3_map_pk    = 0,
    G3_t3_group_pk   = 1,
    G3_t3_group_code = 2,
    G3_t3_group_name = 3,
    G3_t3_null01     = 4,
    G3_t3_null02     = 5,
    G3_t3_null03     = 6,
    G3_t3_null04     = 7,
    G3_t3_user_pk    = 8,
	G3_t3_null05     = 9,
	G3_t3_null06     = 10; 	 
	
	
var G4_PK               = 0,
    G4_TCO_COMPANY_PK   = 1,
    G4_TCO_BSUSER_PK    = 2,
    G4_EMP_PK           = 3,
    G4_USER_ID          = 4,
    G4_USER_NAME        = 5,
    G4_DEPT_NAME        = 6,
    G4_EMP_NAME    		= 7;
  

//========================================================================================
var G1_t4_user_pk = 0,
    G1_t4_user_id = 1,
    G1_t4_user_nm = 2;
    
var G2_t4_CODE		    = 0,
    G2_t4_CODE_NM       = 1,
    G2_t4_USE_IF	    = 2,
    G2_t4_DESCRIPTION   = 3;
    
var G3_t4_MAP_PK		= 0,
    G3_t4_CODE		    = 1,
    G3_t4_CODE_NM		= 2,
    G3_t4_USER_PK		= 3;
//========================================================================================
var G1_T6_USER_PK = 0,
    G1_T6_USER_ID = 1,
    G1_T6_USER_NM = 2;

var G2_T6_DEPT_PK   = 0,
    G2_T6_DEPT_ID   = 1,
    G2_T6_DEPT_NM   = 2,
    G2_T6_DEPT_DESC = 3;
    
var G3_T6_MAP_PK            = 0,
    G3_T6_TLG_PO_DEPT_PK    = 1,
    G3_T6_DEPT_ID           = 2,
    G3_T6_DEPT_NAME         = 3,
    G3_T6_DESCRIPTION       = 4,
    G3_T6_USER_PK           = 5;
	
//========================================================================================
var G1_T7_USER_PK = 0,
    G1_T7_USER_ID = 1,
    G1_T7_USER_NM = 2;

var G2_T7_PROCESS_PK   = 0,
    G2_T7_PROCESS_ID   = 1,
    G2_T7_PROCESS_NM   = 2,
    G2_T7_PROCESS_DESC = 3;
    
var G3_T7_MAP_PK            = 0,
    G3_T7_PROCESS_PK    	= 1,
    G3_T7_PROCESS_ID        = 2,
    G3_T7_PROCESS_NAME      = 3,
    G3_T7_DESCRIPTION       = 4,
    G3_T7_USER_PK           = 5;	
//=========================================================================================
function BodyInit()
{	
    System.Translate(document); 
    grdPTypeM.SetEnable(false);
    grdMapping_t4.SetEnable(false);
    grdUser_t4.SetEnable(false);
    
    txtUserIDM.SetEnable(false);
    txtEmpNameM.SetEnable(false);
    
    var data = "<%=CtlLib.SetListDataSQL("select p.FUNCTION_ID, p.FUNCTION_NAME from TLG_POP_FUNCTION p where p.DEL_IF =0 order by p.FUNCTION_ID" )%>||-";    
    lstFunction.SetDataText(data); 
    lstFunction.value = '';
    
}
//=========================================================================================
function OnSearch(pos)
{
    switch(pos)
    {
        case'user':
            agds00090_list_user.Call("SELECT");
        break;    

        case'user_t6':
            agds00090_list_user_t6.Call("SELECT");
        break; 

		case'user_t7':
            agds00090_list_user_t7.Call("SELECT");
        break;  		
        		
        case'MAPWH':
            dso_agds00090_1.Call("SELECT");
        break;
        
        case'MAPDEPT':
            dso_agds00090_8.Call("SELECT");
        break; 

        case'MAPPROCESS':
            dso_agds00090_tab07.Call("SELECT");
        break;		
		
        case'WH':
            agds00090_list_wh.Call("SELECT");
        break;
        
        case'DEPT':
            agds00090_list_dept.Call("SELECT");
        break;  

		case'TAB_07':
            agds00090_list_process.Call("SELECT");
        break;		
        //---------------------------------
        case'MAPLINE':
            dso_agds00090_2.Call("SELECT");
        break;
		
        case'LUSER':
            agds00090_list_user_t2.Call("SELECT");
        break;  
		
        case'GroupUser':
            agds00090_list_user_t3.Call("SELECT");
        break; 
		
        case'GroupUser_Item':
            agds00090_list_item_group.Call("SELECT");
        break;		
		
        case'MAPUSERGROUP':
            dso_agds00090_3.Call("SELECT");
        break;		
        case 'user_t4':
            agds00090_list_user_t4.Call('SELECT');
        break; 	
        case 'PTypeM':
            agds00090_ma_type.Call('SELECT');
        break;	      
        case 'COMUSER':
            dso_agds00090_6.Call('SELECT');
        break;
        case 'USER2':
            dso_agds00090_7_user.Call('SELECT');
        break;
        case 'COMUSER1':
            if(grdCompany.row>0)
            {
                txtCOMPANY_PK.text= grdCompany.GetGridData(grdCompany.row,0);
                dso_agds00090_7.Call('SELECT');
            }
        break;
    }
}
//==========================================================================================
function OnSaveMap(p_tab)
{
    if(p_tab=='WH')
    {
        dso_agds00090_1.Call();
    }
    else if(p_tab=='DEPT')
    {
        dso_agds00090_8.Call();
    }
	else if (p_tab == 'GroupUser')
	{
		 dso_agds00090_3.Call();
	}
	else if (p_tab == 'LINE')
    {
        dso_agds00090_2.Call()
    }
    else if (p_tab == 'PTYPE')
    {
        dso_agds00090_4.Call()
    }
    else if (p_tab == 'COMP')
    {
        dso_agds00090_7.Call()
    }
	else if (p_tab == 'TAB_07')
    {
        dso_agds00090_tab07.Call()
    }
    
}
//==========================================================================================
function OnDataReceive(obj)
{
   switch (obj.id)
    {
        case 'dso_agds00090_1' :
            agds00090_list_wh.Call('SELECT');
        break; 
		
        case 'agds00090_list_user_t4':
            if(grdUser_t4.rows > 0)
            {
                lblStatus_t4.text = (grdUser_t4.rows - 1) + ' record(s)';
            }
        break;
		
        case 'agds00090_ma_type':
            if(grdPTypeM.rows > 0)
            {
                lblStatusM1.text = (grdPTypeM.rows -1 ) + ' record(s)';
            }
            dso_agds00090_4.Call('SELECT');
        break;
		
        case 'dso_agds00090_8':
            agds00090_list_dept.Call("SELECT");
        break;
   }
}
//==========================================================================================
function OnDelete(p_obj)
{
    if(p_obj=='WH')
    {
    var mapCtrl = grdMapping.GetGridControl();
	var WhCtrl = grdWarehouse.GetGridControl();
	var i = 0;
	if (mapCtrl.SelectedRows >0) {
	    for(i=mapCtrl.Rows -1; i>0; i --)
	    {
	        if (mapCtrl.IsSelected(i))
	        {
	            if(grdMapping.GetGridData(i,G3_T1_MAP_PK )=="")
	            {
	                grdWarehouse.AddRow();
		   	        grdWarehouse.SetGridText(grdWarehouse.rows-1,G2_T1_WH_PK,grdMapping.GetGridData(i,G3_T1_WH_PK))
		   	        grdWarehouse.SetGridText(grdWarehouse.rows-1,G2_T1_WH_ID,grdMapping.GetGridData(i,G3_T1_WH_ID))
		   	        grdWarehouse.SetGridText(grdWarehouse.rows-1,G2_T1_WH_NM,grdMapping.GetGridData(i,G3_T1_WH_NM))
    		   	    
		   	        grdMapping.RemoveRowAt(i)	
	            }else
	            {
	                grdMapping.DeleteRowAt(i)
	            }	              
	        }	        
	    }	    
	}
    }
    else if(p_obj=='DEPT')
    {
    var mapCtrl = grdMapping_t6.GetGridControl();
	var WhCtrl = grdDept_t6.GetGridControl();
	var i = 0;
	if (mapCtrl.SelectedRows >0) {
	    for(i=mapCtrl.Rows -1; i>0; i --)
	    {
	        if (mapCtrl.IsSelected(i))
	        {
	            if(grdMapping_t6.GetGridData(i, G3_T6_MAP_PK )=="")
	            {
	                grdDept_t6.AddRow();
		   	        grdDept_t6.SetGridText(grdDept_t6.rows-1,G2_T6_DEPT_PK  ,grdMapping_t6.GetGridData(i,G3_T6_TLG_PO_DEPT_PK))
		   	        grdDept_t6.SetGridText(grdDept_t6.rows-1,G2_T6_DEPT_ID  ,grdMapping_t6.GetGridData(i,G3_T6_DEPT_ID))
		   	        grdDept_t6.SetGridText(grdDept_t6.rows-1,G2_T6_DEPT_NM  ,grdMapping_t6.GetGridData(i,G3_T6_DEPT_NAME))
    		   	    grdDept_t6.SetGridText(grdDept_t6.rows-1,G2_T6_DEPT_DESC,grdMapping_t6.GetGridData(i,G3_T6_DESCRIPTION))
    		   	    
		   	        grdMapping_t6.RemoveRowAt(i)	
	            }else
	            {
	                grdMapping_t6.DeleteRowAt(i)
	            }	              
	        }	        
	    }	    
	}
    }
	else if (p_obj=='LINE')
    {
        var mapCtrl = grdMapping_t2.GetGridControl();
	    var i = 0;
	    if (mapCtrl.SelectedRows >0) {
	        for(i=mapCtrl.Rows -1; i>0; i --)
	        {
	            if (mapCtrl.IsSelected(i))
	            {
                     if(grdMapping_t2.GetGridData(i,G3_t2_pk )=="")
	                 {
                        grdMapping_t2.RemoveRowAt(i)
                     }else
                     {
                        grdMapping_t2.DeleteRowAt(i)
                     }
                }
           }
         }  
    }
	else if (p_obj=='GroupUser')
    {
        var mapCtrl = grdMapping_t3.GetGridControl();
	    var i = 0;
	    if (mapCtrl.SelectedRows >0) {
	        for(i=mapCtrl.Rows -1; i>0; i --)
	        {
	            if (mapCtrl.IsSelected(i))
	            {
                     if(grdMapping_t3.GetGridData(i,G3_t3_map_pk )=="")
	                 {
                        grdMapping_t3.RemoveRowAt(i)
                     }else
                     {
                        grdMapping_t3.DeleteRowAt(i)
                     }
                }
           }
         }  
    }
    else if (p_obj == 'PTYPE')
    {
       var mapCtrl = grdMapping_t4.GetGridControl();
	    var i = 0;
	    if (mapCtrl.SelectedRows >0) {
	        for(i=mapCtrl.Rows -1; i>0; i --)
	        {
	            if (mapCtrl.IsSelected(i))
	            {
                     if(grdMapping_t4.GetGridData(i,G3_t4_MAP_PK )=="")
	                 {
                        grdMapping_t4.RemoveRowAt(i)
                     }else
                     {
                        grdMapping_t4.DeleteRowAt(i)
                        idDeleteM.SetEnable(false);
                     }
                }
           }
         }  
    }
    else if(p_obj=='COMP')
    {
    var mapCtrl = grdComUserMap.GetGridControl();
	var i = 0;
	if (mapCtrl.SelectedRows >0) {
	    for(i=mapCtrl.Rows -1; i>0; i --)
	    {
	        if (mapCtrl.IsSelected(i))
	        {
	            if(grdComUserMap.GetGridData(i,0 )=="")
	            {
		   	        grdComUserMap.RemoveRowAt(i)	
	            }else
	            {
	                grdComUserMap.DeleteRowAt(i)
	            }	              
	        }	        
	    }	    
	}
    }
	else if(p_obj=='TAB_07')
    {
		var mapCtrl = grdMapping_t7.GetGridControl();
		var WhCtrl = grdProcess_t7.GetGridControl();
		var i = 0;
		
		if (mapCtrl.SelectedRows >0) {
			for(i=mapCtrl.Rows -1; i>0; i --)
			{
				if (mapCtrl.IsSelected(i))
				{
					if(grdMapping_t7.GetGridData(i, G3_T7_MAP_PK )=="")
					{
						grdProcess_t7.AddRow();
						grdProcess_t7.SetGridText(grdProcess_t7.rows-1,G2_T7_PROCESS_PK  ,grdMapping_t7.GetGridData(i,G3_T7_PROCESS_PK))
						grdProcess_t7.SetGridText(grdProcess_t7.rows-1,G2_T7_PROCESS_ID  ,grdMapping_t7.GetGridData(i,G3_T7_PROCESS_ID))
						grdProcess_t7.SetGridText(grdProcess_t7.rows-1,G2_T7_PROCESS_NM  ,grdMapping_t7.GetGridData(i,G3_T7_PROCESS_NAME))
						grdProcess_t7.SetGridText(grdProcess_t7.rows-1,G2_T7_PROCESS_DESC,grdMapping_t7.GetGridData(i,G3_T7_DESCRIPTION))
    		   	    
						grdMapping_t7.RemoveRowAt(i)	
					}
					else
					{
						grdMapping_t7.DeleteRowAt(i)
					}	              
				}	        
			}	    
		}
    }
}
//==========================================================================================
function OnGridCellClick(objGrid)
{
    switch(objGrid.id)
    {
        case 'grdMapping_t4':
        var ctrl 	= grdMapping_t4.GetGridControl();
        var rownum 	= ctrl.Row;
        var rownums 	= ctrl.Rows;
        
        if(rownum > 0 && rownums>1)
        {
            if(grdMapping_t4.GetRowStatus(rownum) >= 64)
            {
	                idDeleteM.SetEnable(false);
	                idUDeleteM.SetEnable(true);
            }
            else
            {
	                idDeleteM.SetEnable(true);
	                idUDeleteM.SetEnable(false);
            }
        }
        break;
    }
}
//==========================================================================================
function OnUnDelete(p_obj)
{
    if(p_obj=='WH')
    {
        grdMapping.UnDeleteRow()
    }
    else if(p_obj=='DEPT')
    {
        grdMapping_t6.UnDeleteRow()
    }
    else if (p_obj=='LINE')
    {
        grdMapping_t2.UnDeleteRow()
    }
	else if (p_obj=='GroupUser')
    {
        grdMapping_t3.UnDeleteRow()
    }
    else if (p_obj == 'PTYPE')
    {
        grdMapping_t4.UnDeleteRow()
    }
    else if (p_obj == 'COMP')
    {
        grdComUserMap.UnDeleteRow()
    }
	else if (p_obj == 'TAB_07')
    {
        grdMapping_t7.UnDeleteRow()
    }
}
//==========================================================================================
function OnGetLine()
{
     var path = System.RootURL + '/form/ag/ds/agds00091.aspx';
	 var obj = System.OpenModal( path ,500 , 500 ,  'resizable:yes;status:yes');
	  if ( obj != null )
         {
            for( var i=0; i < obj.length; i++)	  
            {	
                var arrTemp = obj[i];
                    grdMapping_t2.AddRow();
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_line_pk,arrTemp[0])
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_line_id,arrTemp[1])
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_line_nm,arrTemp[2])
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_use_yn,arrTemp[3])
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_desc,arrTemp[4])
        		   	
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_user_pk,txtUserPk_t2.text)    
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_func_id,lstFunction.value)  
		   	        grdMapping_t2.SetGridText(grdMapping_t2.rows-1,G3_t2_func_nm,lstFunction.GetText()) 		   	         
            }
          }
}
//==========================================================================================

//==========================================================================================
function  OnSelectUser(p_tap)
{
    if(p_tap == 'WH')
    {
        if(grdUser.row >0)
        {
            txtUserPk.text = grdUser.GetGridData(grdUser.row,G1_T1_USER_PK);
            txtUserID.text = grdUser.GetGridData(grdUser.row,G1_T1_USER_ID);
            txtEmpName.text = grdUser.GetGridData(grdUser.row,G1_T1_USER_NM);
			
            OnSearch('MAPWH');
        }
    }
    else if(p_tap == 'DEPT')
    {
        if(grdUser_t6.row >0)
        {
            txtUserPk_t6.text   = grdUser_t6.GetGridData(grdUser_t6.row,G1_T6_USER_PK);
            txtUserID_t6.text   = grdUser_t6.GetGridData(grdUser_t6.row,G1_T6_USER_ID);
            txtEmpName_t6.text  = grdUser_t6.GetGridData(grdUser_t6.row,G1_T6_USER_NM);
            OnSearch('MAPDEPT');
        }
    }
    else if (p_tap == 'LINE')
    {
        if(grdUser_t2.row >0)
        {
            txtUserPk_t2.text = grdUser_t2.GetGridData(grdUser_t2.row,G1_T1_USER_PK);
            txtUserID_t2.text = grdUser_t2.GetGridData(grdUser_t2.row,G1_T1_USER_ID);
            txtEmpName_t2.text = grdUser_t2.GetGridData(grdUser_t2.row,G1_T1_USER_NM);
            OnSearch('MAPLINE');
            
        }
    }
	else if (p_tap == 'GroupUser')
    {
        if(grdUser_t3.row >0)
        {  
            txtUserPk_t3.text = grdUser_t3.GetGridData(grdUser_t3.row,G1_t3_user_pk);
            txtUserID_t3.text = grdUser_t3.GetGridData(grdUser_t3.row,G1_t3_user_id);
            txtEmpName_t3.text = grdUser_t3.GetGridData(grdUser_t3.row,G1_t3_user_nm);
			 
            OnSearch('MAPUSERGROUP');
            
        }
    }	
    else if (p_tap == 'PTYPE')
    {
        if(grdUser_t4.row > 0)
        {
            txtUserPk_t4.text = grdUser_t4.GetGridData(grdUser_t4.row,G1_t4_user_pk);
            txtUserIDM.text = grdUser_t4.GetGridData(grdUser_t4.row,G1_t4_user_id);
            txtEmpNameM.text = grdUser_t4.GetGridData(grdUser_t4.row,G1_t4_user_nm);
            OnSearch('PTypeM');
        }
    }
	else if(p_tap == 'TAB_07')
    {
        if(grdUser_t7.row >0)
        {
            txtUserPk_t7.text   = grdUser_t7.GetGridData(grdUser_t7.row,G1_T7_USER_PK);
            txtUserID_t7.text   = grdUser_t7.GetGridData(grdUser_t7.row,G1_T7_USER_ID);
            txtEmpName_t7.text  = grdUser_t7.GetGridData(grdUser_t7.row,G1_T7_USER_NM);
            OnSearch('MAPPROCESS');
        }
    }
}
//==========================================================================================
function OnMSelect(obj)
{
    if(obj=='WH')
    {
        
        var mapCtrl = grdMapping.GetGridControl();
	    var WhCtrl = grdWarehouse.GetGridControl();
	    var i = 0;
    	
        if(txtUserPk.text !="")    
        {
            if (WhCtrl.SelectedRows >0) 
            {
			    for (i=WhCtrl.Rows-1;i>0;i--)
			    {
				    //Add row to mapping grid
				    if (WhCtrl.IsSelected(i))
				    {        
            
		   	        grdMapping.AddRow();
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_WH_PK,grdWarehouse.GetGridData(i,G2_T1_WH_PK))
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_WH_ID,grdWarehouse.GetGridData(i,G2_T1_WH_ID))
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_WH_NM,grdWarehouse.GetGridData(i,G2_T1_WH_NM))
        		   	
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_USER_PK,txtUserPk.text)
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_IN_WH_YN,-1)
		   	        grdMapping.SetGridText(grdMapping.rows-1,G3_T1_OUT_WH_YN,-1)	
    		   	    
		   	        grdWarehouse.RemoveRowAt(i)	
                    } //end if
                } //for
            }// end if
        }
        else
        {
            alert("Please select user first!");
        }
     }
    else if(obj=='DEPT')
    {
        
        var mapCtrl = grdMapping_t6.GetGridControl();
	    var WhCtrl = grdDept_t6.GetGridControl();
	    var i = 0;
    	
        if(txtUserPk_t6.text !="")    
        {
            if (WhCtrl.SelectedRows >0) 
            {
			    for (i = WhCtrl.Rows-1; i > 0; i--)
			    {
				    //Add row to mapping grid
				    if (WhCtrl.IsSelected(i))
				    {       
		   	            grdMapping_t6.AddRow();
		   	            grdMapping_t6.SetGridText(grdMapping_t6.rows-1,G3_T6_TLG_PO_DEPT_PK     ,grdDept_t6.GetGridData(i,G2_T6_DEPT_PK))
		   	            grdMapping_t6.SetGridText(grdMapping_t6.rows-1,G3_T6_DEPT_ID            ,grdDept_t6.GetGridData(i,G2_T6_DEPT_ID))
		   	            grdMapping_t6.SetGridText(grdMapping_t6.rows-1,G3_T6_DEPT_NAME          ,grdDept_t6.GetGridData(i,G2_T6_DEPT_NM))
            		   	grdMapping_t6.SetGridText(grdMapping_t6.rows-1,G3_T6_DESCRIPTION        ,grdDept_t6.GetGridData(i,G2_T6_DEPT_DESC))
            		   	
		   	            grdMapping_t6.SetGridText(grdMapping_t6.rows-1,G3_T6_USER_PK,txtUserPk_t6.text)
        		   	    
		   	            grdDept_t6.RemoveRowAt(i)	
                    } //end if
                } //for
            }// end if
        }
        else
        {
            alert("Please select user first!");
        }
     }
	else if(obj=='GroupUser')
    {
        
        var mapCtrl = grdMapping_t3.GetGridControl();
	    var WhCtrl = grdGroup.GetGridControl();
	    var i = 0;
    	
        if(txtUserPk_t3.text !="")    
        {
            if (WhCtrl.SelectedRows >0) 
            {
			    for (i=WhCtrl.Rows-1;i>0;i--)
			    {
				    //Add row to mapping grid
				    if (WhCtrl.IsSelected(i))
				    {        
            
		   	        grdMapping_t3.AddRow();
		   	        grdMapping_t3.SetGridText(grdMapping_t3.rows-1,G3_t3_group_pk, grdGroup.GetGridData(i,G2_t3_group_pk))
		   	        grdMapping_t3.SetGridText(grdMapping_t3.rows-1,G3_t3_group_code, grdGroup.GetGridData(i,G2_t3_group_code))
		   	        grdMapping_t3.SetGridText(grdMapping_t3.rows-1,G3_t3_group_name, grdGroup.GetGridData(i,G2_t3_group_name))
        		   	
		   	        grdMapping_t3.SetGridText(grdMapping_t3.rows-1,G3_t3_user_pk,txtUserPk_t3.text)
    		   	    
		   	        grdGroup.RemoveRowAt(i)	
                } //end if
            } //for
          }// end if
        }       
        else
        {
            alert("Please select user first!");
        }
    }
    else if (obj == 'PTYPE')
    {
         if(txtUserPk_t4.text != '')
         {
            var l_grdPTypeM = grdPTypeM.GetGridControl();
            if(l_grdPTypeM.SelectedRows >0) 
            {
                var mapCtrl = grdMapping_t4.GetGridControl();
                for (var i=l_grdPTypeM.rows-1;i>0;i--)
                {
                    if (l_grdPTypeM.IsSelected(i))
                    { 
                        grdMapping_t4.AddRow();
   	                    //mapCtrl.SetGridText(mapCtrl.rows-1,G2_t4_MAP_PK, grdGroup.GetGridData(i,G3_t4_MAP_PK))
   	                    grdMapping_t4.SetGridText(grdMapping_t4.rows-1,G3_t4_CODE, grdPTypeM.GetGridData(i,G2_t4_CODE))
   	                    grdMapping_t4.SetGridText(grdMapping_t4.rows-1,G3_t4_CODE_NM, grdPTypeM.GetGridData(i,G2_t4_CODE_NM))                		   	
   	                    grdMapping_t4.SetGridText(grdMapping_t4.rows-1,G3_t4_USER_PK,txtUserPk_t4.text)
   	                    	
                    }
                }
                for (var i=l_grdPTypeM.rows-1;i>0;i--)
                {
                    if (l_grdPTypeM.IsSelected(i))
                    {
                        grdPTypeM.RemoveRowAt(i)
                    }
                }
            }
        }
        else
        {
            alert("Please select user first!");
        }
    } 
    else if(obj == 'CompUser')
    {
        if(txtCOMPANY_PK.text!="")
        {
            var mapCtrl = grdComUserMap.GetGridControl();
	        var UserCtrl = grdUserCom.GetGridControl();
	        var i = 0;
	        if (UserCtrl.SelectedRows >0) 
            {
			    for (i=UserCtrl.Rows-1;i>0;i--)
			    {
				    //Add row to mapping grid
				    if (UserCtrl.IsSelected(i))
				    {        
            
		   	            grdComUserMap.AddRow();
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_TCO_BSUSER_PK, grdUserCom.GetGridData(i,0));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_EMP_PK, grdUserCom.GetGridData(i,1));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_USER_ID, grdUserCom.GetGridData(i,2));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_USER_NAME, grdUserCom.GetGridData(i,3));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_DEPT_NAME, grdUserCom.GetGridData(i,4));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_EMP_NAME, grdUserCom.GetGridData(i,5));
		   	            grdComUserMap.SetGridText(grdComUserMap.rows-1,G4_TCO_COMPANY_PK,txtCOMPANY_PK.text);
        		   	    
		   	            grdUserCom.RemoveRowAt(i)	;
                    } 
                } 
            }
        }
        else
        {
            alert("Please select company first!");
        }
    }
	else if(obj=='TAB_07')
    {
        
        var mapCtrl = grdMapping_t7.GetGridControl();
	    var WhCtrl = grdProcess_t7.GetGridControl();
	    var i = 0;
    	
        if(txtUserPk_t7.text !="")    
        {
            if (WhCtrl.SelectedRows >0) 
            {
			    for (i = WhCtrl.Rows-1; i > 0; i--)
			    {
				    //Add row to mapping grid
				    if (WhCtrl.IsSelected(i))
				    {       
		   	            grdMapping_t7.AddRow();
		   	            grdMapping_t7.SetGridText(grdMapping_t7.rows-1,G3_T7_PROCESS_PK     ,grdProcess_t7.GetGridData(i,G2_T7_PROCESS_PK))
		   	            grdMapping_t7.SetGridText(grdMapping_t7.rows-1,G3_T7_PROCESS_ID     ,grdProcess_t7.GetGridData(i,G2_T7_PROCESS_ID))
		   	            grdMapping_t7.SetGridText(grdMapping_t7.rows-1,G3_T7_PROCESS_NAME   ,grdProcess_t7.GetGridData(i,G2_T7_PROCESS_NM))
            		   	grdMapping_t7.SetGridText(grdMapping_t7.rows-1,G3_T7_DESCRIPTION    ,grdProcess_t7.GetGridData(i,G2_T7_PROCESS_DESC))
            		   	
		   	            grdMapping_t7.SetGridText(grdMapping_t7.rows-1,G3_T7_USER_PK,txtUserPk_t7.text)
        		   	    
		   	            grdProcess_t7.RemoveRowAt(i)	
                    } //end if
                } //for
            }// end if
        }
        else
        {
            alert("Please select user first!");
        }
     }
}
//============================================
function OnPopup(pos)
{
    if(pos == 'user')
    {
     txtWH_PK.text = grdMapping.GetGridData(grdMapping.row,1);
     txtWH_NAME.text = grdMapping.GetGridData(grdMapping.row,2) + ' - ' + grdMapping.GetGridData(grdMapping.row,3);
     var path = System.RootURL + '/form/ag/ds/agds00092.aspx';
	 var obj = System.OpenModal( path ,750 , 500 ,  'resizable:yes;status:yes',this);
	}
	else
	{
	 txtWH_PK.text = grdWarehouse.GetGridData(grdWarehouse.row,0);
     txtWH_NAME.text = grdWarehouse.GetGridData(grdWarehouse.row,1) + ' - ' + grdWarehouse.GetGridData(grdWarehouse.row,2);
     var path = System.RootURL + '/form/ag/ds/agds00092.aspx';
	 var obj = System.OpenModal( path ,750 , 500 ,  'resizable:yes;status:yes',this);
	}
}

</script>

<body>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00090_list_user" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_user"  > 
			<input bind="grdUser" >		
			    <input bind="txtFilter" />						
			</input> 
			<output bind="grdUser" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00090_list_wh" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_wh"  > 
			<input bind="grdWarehouse" >	
			    <input bind="txtWHFilter" />	
                <input bind="txtUserPk" />				    							
			</input> 
			<output bind="grdWarehouse" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_1" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_1" parameter="0,1,2,3,4,5,6,7,8"  procedure="st_lg_upd_agds00090_1" > 
			<input bind="grdMapping" >		
			     <input bind="txtUserPk" />							
			</input> 
			<output bind="grdMapping" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------TAB 2------------------------------------------------->
    <gw:data id="agds00090_list_user_t2" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_user"  > 
			<input bind="grdUser_t2" >		
			    <input bind="txtFilter_t2" />						
			</input> 
			<output bind="grdUser_t2" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_2" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_2" parameter="0,1,2,3,4,5,6,7,8"  procedure="st_lg_upd_agds00090_2" > 
			<input bind="grdMapping_t2" >		
			     <input bind="txtUserPk_t2" />	
			     <input bind="lstFunction" />							
			</input> 
			<output bind="grdMapping_t2" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <!-------------------------------------TAB 3------------------------------------------------->
    <gw:data id="agds00090_list_user_t3" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_user"  > 
			<input bind="grdUser_t3" >		
			    <input bind="txtFilter_t3" />						
			</input> 
			<output bind="grdUser_t3" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00090_list_item_group" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_item_group"  > 
			<input bind="grdGroup" >	
			    <input bind="txtGroupFilter_t3" />	
                <input bind="txtUserPk_t3" />				    							
			</input> 
			<output bind="grdGroup" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_3" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_3" parameter="0,1,2,3,4,5,6,7,8,9,10"  procedure="st_lg_upd_agds00090_3" > 
			<input bind="grdMapping_t3" >		
			     <input bind="txtUserPk_t3" />							
			</input> 
			<output bind="grdMapping_t3" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <!-------------------------------------TAB 4------------------------------------------------->
    <gw:data id="agds00090_list_user_t4" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_user"  > 
			<input bind="grdUser_t4" >		
			    <input bind="txtFilter_t4" />						
			</input> 
			<output bind="grdUser_t4" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00090_ma_type" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_ma_ptype"  > 
			<input bind="grdPTypeM" >	
			    <input bind="txtFilterM" />	
                <input bind="txtUserPk_t4" />				    							
			</input> 
			<output bind="grdPTypeM" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_4" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_4" parameter="0,1,2,3"  procedure="st_lg_upd_agds00090_4" > 
			<input bind="grdMapping_t4" >		
			     <input bind="txtUserPk_t4" />							
			</input> 
			<output bind="grdMapping_t4" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_6" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_6"> 
			<input bind="grdCompany" >		
			     <input bind="txtCompany" />							
			</input> 
			<output bind="grdCompany" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_7" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_7" parameter="0,1,2,3,4,5,6,7" procedure="st_lg_upd_agds00090_7"> 
			<input bind="grdComUserMap" >		
			     <input bind="txtCOMPANY_PK" />				     					
			</input> 
			<output bind="grdComUserMap" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="dso_agds00090_7_user" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_7_user"> 
			<input bind="grdUserCom" >	
			     <input bind="txtUserSearch" />
			     <input bind="txtCOMPANY_PK" />				     					
			</input> 
			<output bind="grdUserCom" /> 
		</dso> 
	</xml> 
    </gw:data>
        <!-------------------------------------TAB 6------------------------------------------------->
    <gw:data id="agds00090_list_user_t6" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_user"  > 
			<input bind="grdUser_t6" >		
			    <input bind="txtFilter_t6" />						
			</input> 
			<output bind="grdUser_t6" /> 
		</dso> 
	</xml> 
    </gw:data>
    
    <gw:data id="agds00090_list_dept" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_SEL_AGDS00090_DEPT"  > 
			<input bind="grdDept_t6" >	
			    <input bind="txtDeptFilter_t6" />	
                <input bind="txtUserPk_t6" />				    							
			</input> 
			<output bind="grdDept_t6" /> 
		</dso> 
	</xml> 
    </gw:data>
    
    <gw:data id="dso_agds00090_8" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_SEL_AGDS00090_8" parameter="0,1,2,3,4,5"  procedure="st_lg_upd_agds00090_8" > 
			<input bind="grdMapping_t6" >		
			     <input bind="txtUserPk_t6" />							
			</input> 
			<output bind="grdMapping_t6" /> 
		</dso> 
	</xml> 
    </gw:data>

    <!-------------------------------------TAB 7------------------------------------------------->
	
    <gw:data id="agds00090_list_user_t7" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="grid" function="st_lg_sel_agds00090_user"  > 
				<input bind="grdUser_t7" >		
					<input bind="txtFilter_t7" />						
				</input> 
				<output bind="grdUser_t7" /> 
		</dso> 
	</xml> 
    </gw:data>
    
    <gw:data id="agds00090_list_process" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" function="st_lg_SEL_AGDS00090_PROCESS"  > 
			<input bind="grdProcess_t7" >	
			    <input bind="txtProcessFilter_t7" />	
                <input bind="txtUserPk_t7" />				    							
			</input> 
			<output bind="grdProcess_t7" /> 
		</dso> 
	</xml> 
    </gw:data>
    
    <gw:data id="dso_agds00090_tab07" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="grid" function="st_lg_SEL_AGDS00090_tab07" parameter="0,1,2,3,4,5"  procedure="st_lg_upd_agds00090_tab07" > 
				<input bind="grdMapping_t7" >		
					<input bind="txtUserPk_t7" />							
				</input> 
				<output bind="grdMapping_t7" /> 
			</dso> 
		</xml> 
    </gw:data>   
    
    <!-------------------------------------------------------------------------------------->
     <gw:tab id="tab">
    <table name="User Warehouse Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>User</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilter" styles="width:100%" onenterkey="OnSearch('user')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('user')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="3">
                            <gw:grid id='grdUser' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('WH')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserID" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpName" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete" img="delete" alt="Remove" text="Delete" onclick="OnDelete('WH')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('WH')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate" img="save" alt="Save" text="Save" onclick="OnSaveMap('WH')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping' header='_MAP_PK|_wh_PK|W/H ID|W/H Name|_USER_PK|From W/H|To W/H|Req W/H|Close W/H'
                                format='0|0|0|0|0|3|3|3|3' aligns='0|0|0|0|0|0|0|0|0' check='||||||||' editcol='0|0|0|0|0|1|1|1|1'
                                widths='0|0|1500|2000|1000|1000|1000|1000|1000' sorting='F' styles='width:100%; height:100%' oncelldblclick="OnPopup('user')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>Warehouse</b></td>
                        <td width="100%">
                            <gw:textbox id="txtWHFilter" styles="width:100%" onenterkey="OnSearch('WH')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch('WH')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnOpen" img="open" alt="Search" onclick="OnPopup('wh')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect" img="Select" alt="Search" onclick="OnMSelect('WH')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="5">
                            <gw:grid id='grdWarehouse' header='_PK|W/H ID|W/H Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|1000|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnMSelect('WH')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table name="User Line Mapping" class="table" width="100%" style="height: 100%" border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>User</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilter_t2" styles="width:100%" onenterkey="OnSearch('LUSER')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t2" img="search" alt="Search" onclick="OnSearch('LUSER')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="3">
                            <gw:grid id='grdUser_t2' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('LINE')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 5%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserID_t2" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpName_t2" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idAdd" img="new" alt="Remove" text="Delete" onclick="OnGetLine()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_t2" img="delete" alt="Remove" text="Delete" onclick="OnDelete('LINE')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_t2" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('LINE')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_t2" img="save" alt="Save" text="Save" onclick="OnSaveMap('LINE')" />
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="width: 10%" align="right">
                            POP Function
                        </td>
                        <td colspan="3">
                            <gw:list id="lstFunction" styles='width:100%;' onchange="OnSelectUser('LINE')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping_t2' header='_MAP_PK|_line_PK|Line ID|Line Name|_Use YN|_DESCRIPTION|_USER_PK|_func_id|Function Name'
                                format='0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0' check='|||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='0|0|1500|2000|0|0|0|0|1500' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table name="User Item Group Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>User</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilter_t3" styles="width:100%" onenterkey="OnSearch('GroupUser')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t3" img="search" alt="Search" onclick="OnSearch('GroupUser')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="3">
                            <gw:grid id='grdUser_t3' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('GroupUser')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserID_t3" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpName_t3" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_t3" img="delete" alt="Remove" text="Delete" onclick="OnDelete('GroupUser')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_t3" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('GroupUser')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_t3" img="save" alt="Save" text="Save" onclick="OnSaveMap('GroupUser')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping_t3' header='_MAP_PK|_grp_PK|Group Code|Group Name|Mod Item|Mod Acc|Mod Inv|_NULL_04|_USER_PK|_NULL_05|_NULL_06'
                                format='0|0|0|0|3|3|3|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0' check='||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|1|1' widths='0|0|1500|2000|0|0|0|0|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            Group</td>
                        <td width="50%">
                            <gw:textbox id="txtGroupFilter_t3" styles="width:100%" onenterkey="OnSearch('GroupUser_Item')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t3" img="search" alt="Search" onclick="OnSearch('GroupUser_Item')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect_t3" img="Select" alt="Search" onclick="OnMSelect('GroupUser')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="4">
                            <gw:grid id='grdGroup' header='_PK|Group Code|Group Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='0|0|0' widths='0|1500|1500' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table name="User Maintenance Process Type Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td style="width: 40%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td width="5%">
                            <b>User</b></td>
                        <td width="49%">
                            <gw:textbox id="txtFilter_t4" styles="width:100%" onenterkey="OnSearch('user_t4')" />
                        </td>
                        <td width="49%">
                            <gw:label id="lblStatus_t4" styles="font-weight: bold; color:red; font-size: 12"
                                text="0 record(s" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch_t4" img="search" alt="Search" onclick="OnSearch('user_t4')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="4">
                            <gw:grid id='grdUser_t4' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('PTYPE')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserIDM" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpNameM" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDeleteM" img="delete" alt="Remove" text="Delete" onclick="OnDelete('PTYPE')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDeleteM" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('PTYPE')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdateM" img="save" alt="Save" text="Save" onclick="OnSaveMap('PTYPE')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id='grdMapping_t4' header='_MAP_PK|Code|Code Name|_USER_PK' format='1|0|0|1'
                                aligns='0|0|0|0' check='|||' editcol='0|0|0|0' widths='1000|1000|1000|1000' sorting='T'
                                autosize='T' defaults='|||' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td style="width: 40%">
                <table width="100%" style="height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap;">
                            <b>Process Type</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilterM" styles="width:100%" onenterkey="OnSearch('PTYPE')" />
                        </td>
                        <td style="width: 43%">
                            <gw:label id="lblStatusM1" styles="font-weight: bold; color:red; font-size: 12" text="0 record(s)" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSearch2M" img="search" alt="Search" onclick="OnSearch('PTYPE')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="btnSelectM" img="Select" alt="Search" onclick="OnMSelect('PTYPE')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id='grdPTypeM' header='Code|Code Name|Use If|Remark' format='0|0|3|0' aligns='0|0|1|0'
                                check='|||' editcol='0|0|0|0' widths='600|1500|1000|1000' sorting='T' autosize='T'
                                defaults='|||' styles='width:100%; height:100%' oncelldblclick="OnMSelect('PTYPE')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table name="User Company Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 50%">
                        <td style="width: 100%">
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 1%">
                                    <td width="10%">
                                        <b>Company</b></td>
                                    <td width="50%">
                                        <gw:textbox id="txtCompany" styles="width:100%" onenterkey="OnSearch('COMUSER')" />
                                    </td>
                                    <td align="right">
                                        <gw:imgbtn id="btnSearch_tC2" img="search" alt="Search" onclick="OnSearch('COMUSER')" />
                                    </td>
                                </tr>
                                <tr style="height: 90%">
                                    <td colspan="3">
                                        <gw:grid id='grdCompany' header='_PK|Company ID|Company Name|Address' format='0|0|0|0'
                                            aligns='0|0|0|0' check='||||' editcol='0|0|0|0' widths='1000|1000|1000|1000'
                                            sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSearch('COMUSER1')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 50%">
                        <td style="width: 100%">
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 1%">
                                    <td width="10%">
                                        <b>User</b></td>
                                    <td width="50%">
                                        <gw:textbox id="txtUserSearch" styles="width:100%" />
                                    </td>
                                    
                                    <td align="right">
                                        <gw:imgbtn id="btnSearch_tC3" img="search" alt="Search" onclick="OnSearch('USER2')" />
                                    </td>
                                    <td align="right">
                                        <gw:imgbtn id="btnSelect_t35" img="Select" alt="Select" onclick="OnMSelect('CompUser')" />
                                    </td>
                                </tr>
                                <tr style="height: 90%">
                                    <td colspan="4">
                                        <gw:grid id='grdUserCom' header='_PK|_EMP_PK|User ID|User Name|Department|Position' format='0|0|0|0|0|0'
                                            aligns='0|0|0|0|0|0' check='|||||' editcol='0|0|0|0|0|0' widths='0|500|1000|1000|1000|1000'
                                            sorting='T' autosize='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 5%">
                        <td width="99%">
                        </td>
                        <td width="3%">
                            
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_tC2" img="delete" alt="Remove" text="Delete" onclick="OnDelete('COMP')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_tC2" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('COMP')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_tC2" img="save" alt="Save" text="Save" onclick="OnSaveMap('COMP')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdComUserMap' header='_PK|_TCO_COMPANY_PK|_TCO_BSUSER_PK|_EMP_PK|User ID|User Name|Department|Emp Name'
                                format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table name="User Department Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>User</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilter_t6" styles="width:100%" onenterkey="OnSearch('user_t6')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t6" img="search" alt="Search" onclick="OnSearch('user_t6')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="3">
                            <gw:grid id='grdUser_t6' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('DEPT')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserID_t6" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpName_t6" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_t6" img="delete" alt="Remove" text="Delete" onclick="OnDelete('DEPT')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_t6" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('DEPT')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_t6" img="save" alt="Save" text="Save" onclick="OnSaveMap('DEPT')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping_t6' header='_MAP_PK|_dept_PK|Dept ID|Dept Name|Description|_USER_PK'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' check='|||||' editcol='0|0|0|0|0|0'
                                widths='0|0|1500|2000|1000|0' sorting='F' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>Department</b></td>
                        <td width="100%">
                            <gw:textbox id="txtDeptFilter_t6" styles="width:100%" onenterkey="OnSearch('DEPT')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch2_t6" img="search" alt="Search" onclick="OnSearch('DEPT')" />
                        </td>
                        <td align="right">
                            
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect_t6" img="Select" alt="Search" onclick="OnMSelect('DEPT')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="5">
                            <gw:grid id='grdDept_t6' header='_PK|Dept ID|Dept Name|Description' format='0|0|0|0' aligns='0|0|0|0'
                                check='|||' editcol='0|0|0|0' widths='0|1000|1600|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnMSelect('DEPT')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	
	<table name="User Process Mapping" class="table" width="100%" style="height: 100%"
        border="1">
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>User</b></td>
                        <td width="50%">
                            <gw:textbox id="txtFilter_t7" styles="width:100%" onenterkey="OnSearch('user_t7')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch_t7" img="search" alt="Search" onclick="OnSearch('user_t7')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="3">
                            <gw:grid id='grdUser_t7' header='_PK|User ID|Employee Name|Department|Position' format='0|0|0|0|0'
                                aligns='0|0|0|0|0' check='||||' editcol='0|0|0|0|0' widths='1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' styles='width:100%; height:100%' oncellclick="OnSelectUser('TAB_07')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="2" width="60%" valign="top">
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="15%">
                            User ID</td>
                        <td width="25%">
                            <gw:textbox id="txtUserID_t7" text="" />
                        </td>
                        <td width="10%">
                            Employee</td>
                        <td width="40%">
                            <gw:textbox id="txtEmpName_t7" text="" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idDelete_t7" img="delete" alt="Remove" text="Delete" onclick="OnDelete('TAB_07')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idUDelete_t7" img="udelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete('TAB_07')" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="idBtnUpdate_t7" img="save" alt="Save" text="Save" onclick="OnSaveMap('TAB_07')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="8">
                            <gw:grid id='grdMapping_t7' header='_MAP_PK|_process_PK|Process ID|Process Name|Remark|_USER_PK'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' check='|||||' editcol='0|0|0|0|0|0'
                                widths='0|0|1500|2000|1000|0' sorting='F' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 50%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 10%">
                        <td width="10%">
                            <b>Process</b></td>
                        <td width="100%">
                            <gw:textbox id="txtProcessFilter_t7" styles="width:100%" onenterkey="OnSearch('TAB_07')" />
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSearch2_t7" img="search" alt="Search" onclick="OnSearch('TAB_07')" />
                        </td>
                        <td align="right">
                            
                        </td>
                        <td align="right">
                            <gw:imgbtn id="btnSelect_t7" img="Select" alt="Search" onclick="OnMSelect('TAB_07')" />
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td colspan="5">
                            <gw:grid id='grdProcess_t7' header='_PK|Process ID|Process Name|Remark' format='0|0|0|0' aligns='0|0|0|0'
                                check='|||' editcol='0|0|0|0' widths='0|1000|1600|1500' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick="OnMSelect('TAB_07')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	
    </gw:tab>
    <!----------------------------------------------------------------------->
    <gw:textbox id="txtUserPk" text="" styles="display:none" />
    <gw:textbox id="txtUserPk_t2" text="" styles="display:none" />
    <gw:textbox id="txtUserPk_t3" text="" styles="display:none" />
    <gw:textbox id="txtUserPk_t4" text="" styles="display:none" />
    <gw:textbox id="txtUserPk_t6" text="" styles="display:none" />
	<gw:textbox id="txtUserPk_t7" text="" styles="display:none" />
    <gw:textbox id="txtWH_PK" text="" styles="display:none" />
    <gw:textbox id="txtWH_NAME" text="" styles="display:none" />
    <gw:textbox id="txtCOMPANY_PK" text="" styles="display:none" />
</body>
</html>
