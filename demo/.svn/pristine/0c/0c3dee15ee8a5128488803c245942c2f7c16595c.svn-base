<!-- #include file="../../../../system/lib/form.inc"  -->
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="ftb" %>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
 
<script type="text/javascript" language="javascript">
     //---------------------------------------------------------

     var flag;
	 var dstatus;
     var gLeftWidth,gRightWidth;
     var STitemPK;
     //---------------------------------------------------------
     function BodyInit()
     {
       
        BindingDataList();             
        
	    gLeftWidth=document.all("left").clientWidth;
        gRightWidth=document.all("right").clientWidth;       
        OnChangeGroup();
        onAutoYNChange();
        cboGroupQuery.value="-1";  
        onNew(0);
     }
     //---------------------------------------------------------
     function BindingDataList()
     {   
        System.Translate(document); 
         var data1 = "<%=CtlLib.SetListDataSQL("select pk, PARTNER_NAME from TCO_COMPANY where del_if=0")%>";   
         
         //select pk,grp_cd || ' - ' || grp_nm from tco_itemgrp v where del_if = 0 and LEAF_YN ='Y' and pur_yn ='Y' and exists ( select * from tco_grpspecgrp v1 where v.pk=v1.TCO_ITEMGRP_PK)  ORDER BY grp_cd
         var data3 = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tco_itemgrp v where del_if = 0 and LEAF_YN ='Y'  and exists ( select * from tco_grpspecgrp v1 where v.pk=v1.TCO_ITEMGRP_PK)  ORDER BY grp_cd")%>";   
         var data4 = "<%=CtlLib.SetListDataSQL("select pk, wh_id || '-' || wh_name  from TIN_WAREHOUSE where del_if = 0 and use_yn='Y'")%>";
         var data5 = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";
         var data6 = "<%=CtlLib.SetListDataSQL("select pk, itemtype_name from tco_itemtype  where del_if=0 ")%>";   
         var data7 = "<%=CtlLib.SetListDataSQL("SELECT PK, MODEL_NAME  FROM TCO_MODEL where del_if=0")%>";
         var data8 = "<%=CtlLib.SetListDataSQL("select a.CODE, a.CODE || '-' || a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='COAB0070' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>";
         var data9 = "<%=CtlLib.SetListDataSQL("select a.CODE, a.CODE || '-' || a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='PRAB0220' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>";
         var data10 = "<%=CtlLib.SetListDataSQL("select a.CODE, a.CODE || '-' || a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='PRAB0240' and a.del_if=0 and b.del_if=0 order by a.CODE ")%>";
         var data11 = "<%=CtlLib.SetListDataSQL("select a.CODE, a.CODE || '-' || a.CODE_NM from TCO_ABCODE a, TCO_ABCODEGRP b where TCO_ABCODEGRP_PK=b.pk and b.id='PRAB0250' and a.del_if=0 and b.del_if=0 order by 1 ")%>";
         var data2 = "<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0 and DIMENSION_TYPE = 'WET' order by UOM_CODE")%>";   
         var data12= "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('COAB0070','','') FROM DUAL" )%>";
           
         cboUOM_WT.SetDataText(data2);
         data2 = '<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0 and DIMENSION_TYPE = 'VOL' order by UOM_CODE")%>';   
         cboUOM_VOL.SetDataText(data2);
         data2 = "<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0 and DIMENSION_TYPE = 'DIM' order by UOM_CODE")%>";   
         cboUOM_DIM.SetDataText(data2);
         cbouom_sur.SetDataText(data2);
         cboUOM_LOT.SetDataText(data2);         
         cboOrganization.SetDataText(data1);
         data2 = '<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0 order by UOM_CODE")%>';   
         cboUOM.SetDataText(data2);
         cboGroup.SetDataText(data3);
         data3=data3+"|-1|SELECT ALL"
         cboGroupQuery.SetDataText(data3);
         cboWarehouse.SetDataText(data4);
         cboBOMSTitemType.SetDataText(data9);
         
         cboCurrency.SetDataText(data5);
         cboType.SetDataText(data6);
         cboModel.SetDataText(data7);
         cboPICLanguage.SetDataText(data8);
         cboPur_type.SetDataText(data10);
         cbocont_type.SetDataText(data11);
         lstATTLanguage.SetDataText(data12);
     }
     //---------------------------------------------------------
     function onSearch(index)
     {
        switch(index)
        {
            case 0:
                 datagci00080_2.Call("SELECT");
            break;
        }
      }
     //---------------------------------------------------------
     function onSave(index)
     {
        switch(index)
        {
            case 0: // save master
                if(Validate())
                {
                    flag='save';
                   
                   txttco_STitemphoto_pk.SetDataText(imgSTitem.oid);
				   if ( datagci00080_1.GetStatus()=='10')
				   		dstatus=	'update';				 
                   datagci00080_1.Call();
                }
            break;
            case 1:// save spec                
                if(txtSTitemPk.GetData()!="")
                {
                    for(i=1; i<grdSTitemSpec.rows; i++)
                    {
                        if(grdSTitemSpec.GetGridData(i,0)!="")
                        {                   
                            grdSTitemSpec.SetRowStatus(i,0x10); // update
                            grdSTitemSpec.SetGridText(i,9,txtSTitemPk.GetData());                      
                        }
                        else
                        {                                      
                            // insert
                            grdSTitemSpec.SetRowStatus(i,0x20);
                            grdSTitemSpec.SetGridText(i,9,txtSTitemPk.GetData());                       
                        }                 
                    }                  
                     datagci00080_3.Call();                                                
                 }   
            break;
            case 3://?????
                txtTmpPK.text=txtSTitemPk.GetData();
                txtcontent_att.SetDataText(document.getElementById('ftbContent').value);
          	    datagci00080_10.Call();	 
            break;
            case 5:  
            {  if(Validate())
                {
                    datagci00080_5.StatusUpdate();   
                    txttco_STpic_pk.SetDataText(imgPic.oid); 
                    datagci00080_5.Call(); 
                }   
            }
            break;
         }
     }
     //---------------------------------------------------------
     function onNew(index)
     {
        switch(index)
        {
            case 0: // add new master
                 txtHScode.SetEnable(false);
                 txtHsname.SetEnable(false);
                 txtBS_id.SetEnable(false);
                 txtBS_nm.SetEnable(false);
                 txtAccCode.SetEnable(false);
	             txtAccNM.SetEnable(false);
	             cboModel.SetEnable(false);  
	            // cboType.SetEnable(false);
                 txtSTitemPk.SetDataText("-1");
                 datagci00080_1.StatusInsert();   
                 datagci00080_10.StatusInsert(); 
                  btnSave.SetEnable(true);             
                 imgSTitem.SetDataText(txttco_STitemphoto_pk.text );     
                 OnChangeGroup();
                              
                 chkAutoYN.value="Y";
                 chkActive.value='Y';
                 flag='view';
                 onAutoYNChange();
                     
            break;
            case 1:// add new spec
                if(txtSTitemPk!="")
                {
                    grdSpec.AddRow();
                    grdSpec.SetGridText(grdSpec.rows - 1,1,txtSTitemPk.GetData());
                }
                else
                {
                   alert("You should input and save master information first.");
                   return;
                }
            break;
            case 3:
                 txtATTPK.SetDataText("-1");
                 datagci00080_10.StatusInsert(); 
             break;
            case 5: 
            {
                 txttco_STpic_pk.SetDataText("-1");
                 datagci00080_5.StatusInsert();                 
                 imgPic.SetDataText(txttco_STpic_pk.text );      
             }   
            break;
        }
     }
     //---------------------------------------------------------
     function onDelete(index)
     {     
        switch(index)
        {
           case 0:// delete master
                if(confirm('Do you want to delete selected STitem ?'))
                {
                    flag='delete';
                    datagci00080_1.StatusDelete();
                    datagci00080_1.Call();
                }   
            break;
            case 1:// delete spec
                if(confirm('Do you want to delete selected spec ?'))
                {
                     grdSpec.DeleteRow();
                     idData_Dsql_wcodc00001_1.Call();
                }
            break;
            case 2:// delete document
                if(confirm('Do you want to delete selected file ?'))
                {
                     idGridlistDOC.DeleteRow();
                     datagci00080_4.Call();
                }
            break;
            case 3:
                 if(confirm('Do you want to delete selected attention ?'))
                {
                     datagci00080_10.StatusDelete();
                     datagci00080_10.Call();
                }
            break;
            case 5:
                if(confirm('Do you want to delete selected picture ?'))
                {
                     datagci00080_5.StatusDelete();
                     datagci00080_5.Call();
                }
            break;
         }        
     }
     //---------------------------------------------------------
     function loadBSDetail1()
     {
	    var row  = grdSTitem.row;
	    txtSTitemPk.text  = grdSTitem.GetGridData(row,0);
	    flag='view';
	    datagci00080_1.StatusSelect();  
	    datagci00080_1.Call("SELECT");
    }
    //---------------------------------------------------------
    function loadBSDetail2()
    {
        var row  = grdlistATT.row;
	    txtATTPK.text  = grdlistATT.GetGridData(row,0);
	    flag='view';
	    datagci00080_10.StatusSelect();  
	    datagci00080_10.Call("SELECT");
    }
    
     function openPopup(index)
     {
	    var fpath = '';
	    switch(index)
	    {
	        case 0:// HS code
	           fpath = System.RootURL + '/form/ag/ci/agci00050_1.aspx';
	            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
	            if ( aValue != null )
	            {      
	                txtHS_pk.SetDataText(aValue[1]);
	                txtHScode.SetDataText(aValue[2]);
	                txtHsname.SetDataText(aValue[3]);
	            }	
	        break;
	        case 1:// Business partner
	            fpath = System.RootURL + '/form/ag/ec/agec00010_p.aspx';
	            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
	            if ( aValue != null )
	            {      
	                txtBS_pk.SetDataText(aValue[0]);
	                txtBS_id.SetDataText(aValue[1]);
	                txtBS_nm.SetDataText(aValue[2]);
	            }	
	        break;
	        case 2:// Account code
	            fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
	            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
	            if ( aValue != null )
	            {      
	                txtAcc_pk.SetDataText(aValue[0]);
	                txtAccCode.SetDataText(aValue[1]);
	                txtAccNM.SetDataText(aValue[2]);
	            }	
	        break;
	    }
    }
     //---------------------------------------------------------
     function OnDataReceive(oId) 
     {
        switch(oId.id)
        {
            case "datagci00080_1":
                 imgSTitem.SetDataText(txttco_STitemphoto_pk.text );
                 
                 if(flag=='view')
                 {
                    // btnSave.SetEnable(false); 
                    datagci00080_3.Call("SELECT");               
                 }                 
                 if (flag=='save')
                    onSave(1);
                 else
                    if (flag=='delete')
                        onSearch(0);
            break;
            case "datagci00080_2":
                 imgSTitem.SetDataText(txttco_STitemphoto_pk.text ); 
                 if (flag=='delete')
                 {
                    flag='view';
                    txtSTitemPk.SetDataText("-1");
                    datagci00080_1.StatusInsert();              
                 }
            break;
            case "datagci00080_3":
                for(i=1;i<grdSTitemSpec.rows;i++)
		        {
			      grdSTitemSpec.SetGridText( i, 1, i); 
			    } 
			    SetEditRow();	
                if (flag!='view')
                {
                    txtSTitemQuery.text=txtSTitemcode.text;
                    onSearch(0);
                } 
            break;
            case "datagci00080_5" :
                datagci00080_6.Call("SELECT");
            break;  
            case "datagci00080_7":  
                txtSTitemcode.SetDataText(txtGroupCode.text + txtGroupMaxSeq.text);
                if (txtIsProduct.text=="Y")
                    cboModel.SetEnable(true);  
                else
                    {
                        cboModel.value=''
                        cboModel.SetEnable(false);                          
                    }
                    
                datagci00080_3.Call("SELECT");
            break;   
            case "datagci00080_9" :            
                if ( flag=='view')
                     datagci00080_1.Call("SELECT");
           break;
           case "datagci00080_10"://?????
		        if ( flag=='view') 
		        {
		             var index;
                    index=idTab.GetCurrentPageNo();
                    if(index==9)
                    {
		                FTB_API['ftbContent'].SetHtml(""); 
                        FTB_API['ftbContent'].InsertHtml(txtcontent_att.GetData()); 
                     }
		        }
		         datagci00080_11.Call("SELECT");
		   break;
           
        }
     }
     //---------------------------------------------------------
     function Validate()
     {  
        if (chkAutoYN.value=="N")        
            if(txtSTitemcode.GetData()=="")
            {
                alert("You should input ST item code first");
                txtSTitemcode.GetControl().focus();
                return false;
            }
        if(txtSTitemnm.GetData()=="")
        {
            alert("You should input ST item name first");
            txtSTitemnm.GetControl().focus();
            return false;
        }
        /*if (txtBS_pk.text=="")
        {
            alert("You should input Business partner first");
            //txtBS_id.GetControl().focus();
            return false;        
        }*/
       
        if (txtPICSEQ.text!='')
            if (!Number(txtPICSEQ.text))
            {
                alert("Sequency is a number");
                txtPICSEQ.GetControl().focus();
                return false;
            }
           
       for(var i=1;i<grdSTitemSpec.rows;i++)
       {              
            if (grdSTitemSpec.GetGridData(i,11) == "-1")
            {
                if(Trim(grdSTitemSpec.GetGridData(i,7))=="")
                {
                   alert("You must input data to spec name at row " + i);                    
                    return false;
                }
            }
       }    
        
        return true;
        
     }
     //---------------------------------------------------------
     function OnChangeGroup()
     {
            txtGroupPk.SetDataText(cboGroup.value);           
            datagci00080_7.Call("SELECT");     
       
     }
     //---------------------------------------------------------
     function OnGridCellDoubleClick(p_oGrid)
    {
        if (event.row > 0)
        {
            gPreviousRow=event.row;
            var queryString = "?pk="+grdSTitemSpec.GetGridData(gPreviousRow,10)
                      +"&spec_id="+grdSTitemSpec.GetGridData(gPreviousRow,5)
                      +"&p_spec_id="+grdSTitemSpec.GetGridData(1,5)
                      +"&spec_name="+grdSTitemSpec.GetGridData(gPreviousRow,6)
                      +"&grp_pk=" +cboGroup.value
                      +"&parent_pk=" + grdSTitemSpec.GetGridData(gPreviousRow,15);;
            GetSpec(queryString);
        }
    }
    //----------------------------------------------------------
    function GetSpec(p_querystring)
    {
       var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + p_querystring;
	   var aValue  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes');	
	   
	   if (aValue!=null) 
	    {	
		    grdSTitemSpec.SetGridText(gPreviousRow,8 ,aValue[1]);//pk
		    grdSTitemSpec.SetGridText(gPreviousRow,5 ,aValue[5]);//id
		    grdSTitemSpec.SetGridText(gPreviousRow,6 ,aValue[6]);//name
		    grdSTitemSpec.SetGridText(gPreviousRow,7 ,aValue[7]);//lname
		    //if (chkAutoYN.value=='Y')
		        AutoMakeName();		   
	    }
    }
    //---------------------------------------------------------
    function AutoMakeName()
    {
        var str = GetAllAttributes();
        AutoMakeCode();
    }
    //----------------------------------------------------------
    function AutoMakeCode()
    {
        var str = GetAllAttributesID();
        if (Trim(str)!="")
        {
		    txtSTitemcode.text = str;		   
        }
    }
    //----------------------------------------------------------
    function GetAllAttributesID()
    {
      var str="";
      var strtmp="";
      var strname="";
      for(var i=1;i<grdSTitemSpec.rows;i++)
      {   
        //str=txtGroupCode.text + txtGroupMaxSeq.text;
        if (grdSTitemSpec.GetGridData(i,12) == "N")
        {
            
            if(Trim(grdSTitemSpec.GetGridData(i,5))!="")
            {
              str = str + grdSTitemSpec.GetGridData(i,5);
              strtmp = strtmp + grdSTitemSpec.GetGridData(i,5);
            }
        }
        
        if((Trim(grdSTitemSpec.GetGridData(i,6))!="" && grdSTitemSpec.GetGridData(i,16) == 'Y' )&& (i==1))
            {
              strname = grdSTitemSpec.GetGridData(i,6 ) ;
            }
            
        if((Trim(grdSTitemSpec.GetGridData(i,6))!="" && grdSTitemSpec.GetGridData(i,16) == 'Y' )&& i>1)
            {
              if (grdSTitemSpec.GetGridData(i-1,14 )=='blank' )
                  strname = strname + ' '+ grdSTitemSpec.GetGridData(i,6 ) ;
              else 
                 strname = strname + grdSTitemSpec.GetGridData(i-1,14 )+ grdSTitemSpec.GetGridData(i,6 ) ;
            }
            
      }
      txtSTitemnm.text=strname;
      txtCodeGenerate.text=strtmp;

      return str;
    }
    //----------------------------------------------------------
    function GetAllAttributes()
    {
      var str="";
      
      CheckAttributeFormat();
      
      for(var i=1;i<grdSTitemSpec.rows;i++)
      {
        if(Trim(grdSTitemSpec.GetGridData(i,6))!="" && grdSTitemSpec.GetGridData(i,16) == 'Y')
        {
            str = str + grdSTitemSpec.GetGridData(i,6)+ " ";
        }
        else if(Trim(grdSTitemSpec.GetGridData(i,5))!="")
        {
            str = str + grdSTitemSpec.GetGridData(i,5)+ " "; //for new STitem spec , if user doesn't input the name of STitem spec
        }
      }
      return str;
    }
    //----------------------------------------------------------
    function CheckAttributeFormat()
    { 
      var str = new String();
      for(var i=1;i<grdSTitemSpec.rows;i++)
      {
        str = Trim(grdSTitemSpec.GetGridData(i,6));
        if(Trim(grdSTitemSpec.GetGridData(i,2)) == "WIDTH" && str.substr(str.length-1,1)!="*")
        {
          grdSTitemSpec.SetGridText(i,6,Trim(grdSTitemSpec.GetGridData(i,6)) );
          return;
        }
      }
    }
    //----------------------------------------------------------
    function OnCheckTab()
    {
        var index;
        index=idTab.GetCurrentPageNo();
        if (index==7)
            datagci00080_4.Call("SELECT");
        if (index==8)
            datagci00080_6.Call("SELECT");
        if (index==9)
        {
             FTB_API['ftbContent'].SetHtml(""); 
             FTB_API['ftbContent'].InsertHtml(txtcontent_att.GetData()); 
            datagci00080_11.Call("SELECT");
        }
            
    }
     //---------------------------------------------------------
     function OnToggle()
     {
        var left  = document.all("left");    
        var right = document.all("right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../../system/images/prev_orange.gif";
        }
        else{
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="80%";
            imgArrow.src = "../../../../system/images/prev_orange.gif";
        }
     }
     //---------------------------------------------------------
     function OnResize()
     {    
         var offsetLeftTable  = document.all("tableID1").offsetLeft;    
         var offsetLeftCell   = document.all("left").offsetLeft;    
         var leftDistant = (document.all("left").clientWidth + offsetLeftTable + offsetLeftCell);	
         var n = Math.abs(window.event.clientX - leftDistant);	
         
         if(n<15){		
            document.body.style.cursor = "col-resize" ;	
         }
         else{		
            document.body.style.cursor = "auto" ;	
         }		
         
         if((window.event.button == 1)&& n < 30){	
            document.all("left").width = window.event.clientX-(offsetLeftTable + 2*offsetLeftCell);		
            var LeftWidthNew = document.all("left").clientWidth;	
            var delTa = gLeftWidth-LeftWidthNew;
            document.all("right").width = gRightWidth + delTa;	
         }
     }
     //-------------------------------------------------------------------------
    function AttachFiles()
    {
        imgFile.MasterPK=txtSTitemPk.text;
        imgFile.ChangeImage();
                    
        if( imgFile.oid == 0 )
        {
            return false;
        }
        else
        {
           datagci00080_4.Call();
        }
        
        // Sau khi upload file xong phai reset oid(pk) lai
        // Neu ko no se giu lai oid(pk) da upload truoc
        imgFile.oid= "";        
    }
    
    function OnOpenFile()
    {
        var img_pk = idGridlistDOC.GetGridData(idGridlistDOC.GetGridControl().row,0)	
        var url = System.RootURL + "/system/binary/viewfile.aspx?img_pk=" + img_pk + "&table_name=TCO_STITEMDOC";	
	    window.open(url);
    }
    
    function OncellClickGrd()
    {
        txttco_STpic_pk.SetDataText(grdlistPIC.GetGridData(grdlistPIC.GetGridControl().row,0));
        imgPic.SetDataText(txttco_STpic_pk.text );
        datagci00080_5.Call("SELECT");
    }
    
    function OnImgClick()
    {
        imgPic.MasterPK=txtSTitemPk.text;
        
    }
    
    function onAutoYNChange()
    {
        if (chkAutoYN.value=='Y')        
        {
            txtSTitemcode.SetEnable(false); 
                                     
        }
        else
        {
            txtSTitemcode.SetEnable(true); 
            AutoMakeName();
        }                
    }
      
    function OnGridCellAfterEdit()
    {       
         if (grdSTitemSpec.col==6)             
            if (grdSTitemSpec.GetGridData(grdSTitemSpec.row,6) != "")
            {
                 grdSTitemSpec.SetGridText(grdSTitemSpec.row,7,grdSTitemSpec.GetGridData(grdSTitemSpec.row,6) );               
                 if (grdSTitemSpec.GetGridData(grdSTitemSpec.row,2) == "SPEC NAME")
                    txtSTitemnm.text=grdSTitemSpec.GetGridData(grdSTitemSpec.row,6);
            }
            
    }    
    
    function SetEditRow()
    {
        for(var i=1;i<grdSTitemSpec.rows;i++)
          {                     
            if(Trim(grdSTitemSpec.GetGridData(i,13)) == "M" )            
              grdSTitemSpec.SetRowEditable(i,1);
            else 
                 grdSTitemSpec.SetRowEditable(i,0);
          }
    }
    
    
</script>
<body>
<gw:data id="datagci00080_1"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,71" function="COMM.sp_sel_STitem_Control"  procedure="comm.sp_upd_tco_STitem"> 
            <inout> 
                 <inout  bind="txtSTitemPk" /> 
                 <inout  bind="cboOrganization" />
                 <inout  bind="cboGroup" />
                 <inout  bind="txtBS_pk" />
                 <inout  bind="cboModel" /> 
                 <inout  bind="cboType" />                 
                 <inout  bind="txtSTitemcode" />
                 <inout  bind="txtSTitemnm" />
                 <inout  bind="txtSTitemnm_LC" />
                 <inout  bind="txtSTitemnm_FR" />
                 <inout  bind="cboUOM" />
                 <inout  bind="cboUOM_WT" />
                 <inout  bind="cboUOM_VOL" />
                 <inout  bind="cboUOM_DIM" />
                 <inout  bind="cbouom_sur" />
                 <inout  bind="cboUOM_LOT" />
                 <inout  bind="chkSet" />
                 <inout  bind="chkpict_yn" />
                 <inout  bind="chkBOM" />
                 <inout  bind="cboBOMSTitemType" />
                 <inout  bind="chkCosting" />
                 <inout  bind="chkContainer" />
                 <inout  bind="cbocont_type" />
                 <inout  bind="chkVehicle" />
                 <inout  bind="chkIsInventory" />
                 <inout  bind="chkEquipment" />
                 <inout  bind="chkOutsourcing" />
                 <inout  bind="chkMAT_STG_YN" />
                 <inout  bind="chkSHELFLIFE_CTRL" />
                 <inout  bind="txtshelf_life_days" />
                 <inout  bind="chkLOT_CTRL_YN" />
                 <inout  bind="txtLOT_START_PREFIX" />
                 <inout  bind="txtLOT_START_NUMBER" />
                 <inout  bind="chkSERIAL_CRTL_YN" />
                 <inout  bind="txtSERIAL_START_PREFIX" />
                 <inout  bind="txtSERIAL_START_NUMBER" />
                 <inout  bind="txtHS_pk" />
                 <inout  bind="txtAcc_pk" />
                 <inout  bind="chkIsPurchased" />
                 <inout  bind="cboPur_type" />
                 <inout  bind="txtMin_order_qty" />
                 <inout  bind="cboWarehouse" />
                 <inout  bind="txttco_STitemphoto_pk" />
                 <inout  bind="txtWeight" />
                 <inout  bind="txtSurface" />
                 <inout  bind="txtVolume" /> 
                 <inout  bind="txtSTitem_length" />
                 <inout  bind="txtSTitem_width" />
                 <inout  bind="txtSTitem_height" />
                 <inout  bind="txtU_price" />
                 <inout  bind="txtW_price" />
                 <inout  bind="txtV_price" />
                 <inout  bind="txtS_price" />
                 <inout  bind="txtLot_qty" />
                 <inout  bind="txtLot_weight" />
                 <inout  bind="cboCurrency" />
                 <inout  bind="txtList_price" />
                 <inout  bind="txtStdPrice" />
                 <inout  bind="txtLimit_price" />
                 <inout  bind="txtMart_price" />
                 <inout  bind="txtDesc" />
                 <inout  bind="chkActive" />
                 <inout  bind="dtaFrom" />
                 <inout  bind="dtaTo" />   
                 <inout  bind="chkAutoYN" />   
                 <inout  bind="txtHScode" />   
                 <inout  bind="txtHsname" />   
                 <inout  bind="txtBS_id" />   
                 <inout  bind="txtBS_nm" />   
                 <inout  bind="txtAccCode" />   
                 <inout  bind="txtAccNM" /> 
                 <inout  bind="txtCodeGenerate" />        
            </inout>
        </dso> 
    </xml> 
</gw:data> 
<!------------------------------------------------------------------>
<gw:data id="datagci00080_2"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="comm.sp_sel_STitem_List" > 
                <input> 
                    <input bind="txtSTitemQuery" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="chkActiveQuery" />                     
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
</gw:data> 
 <!-----------------grdSpec ---------------------------------------->
 <gw:data id="datagci00080_3"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,4,5,6,7,8,9,10,13"  function="comm.sp_sel_STitemgroup_spec"  procedure="comm.sp_upd_tco_STitemspec"> 
              <input  bind="grdSTitemSpec">
                    <input bind="cboGroup" /> 
                    <input bind="txtSTitemPk" /> 
                </input> 
                <output bind="grdSTitemSpec" />   
            </dso> 
        </xml> 
</gw:data> 

<!----------------------grdDoc--------------------------------------->
<gw:data id="datagci00080_4" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0"  function="comm.sp_sel_tco_stitemdoc_control"  procedure="comm.sp_upd_tco_stitemdoc">
            <input bind="idGridlistDOC" >                            
                <input bind="txtSTitemPk" />   
            </input>
            <output bind="idGridlistDOC" />
        </dso>                    
    </xml>
</gw:data>
<!---------------------grdlistPIC----------------------------------------------->   
<gw:data id="datagci00080_5"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="control" id="05"  parameter="0,1,2,3,4,5,6"  function="comm.sp_get_tco_stitemphoto"  procedure="comm.sp_upd_tco_stitemphoto"> 
            <inout> 
                 <inout  bind="txttco_STpic_pk" />
                 <inout  bind="chkOrigin" />   
                 <inout  bind="chkLine" />  
                 <inout  bind="cboPICLanguage" /> 
                 <inout  bind="txtPICNAME" /> 
                 <inout  bind="txtPICSEQ" />   
            </inout>
        </dso> 
    </xml> 
</gw:data>      
<!---------------------grdlistPIC----------------------------------------------->     
<gw:data id="datagci00080_6" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0"  function="comm.sp_sel_tco_stitemphoto"  >
            <input bind="grdlistPIC" >                            
                <input bind="txtSTitemPk" />   
            </input>
            <output bind="grdlistPIC" />
        </dso>                    
    </xml>
</gw:data>  
<!------------------------------------------------------------->
<gw:data id="datagci00080_7"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="control" parameter="0,1,2"   function="comm.sp_sel_tco_itemgrp_info" > 
              <inout>               
                <inout bind="txtGroupPk" />   
                <inout bind="txtIsProduct" />  
                <inout bind="txtGroupCode" /> 
              </inout>
            </dso> 
        </xml> 
</gw:data> 
<!------------------------------------------------------------->
<gw:data id="datagci00080_9"  onreceive="OnDataReceive(this)" > 
        <xml> 
           <dso id="1" type="process" parameter="0,1"  procedure="comm.sp_update_stitem_code" > 
              <input>      
                <input bind="cboGroup" />          
                <input bind="txtSTitemPk" />                     
              </input> 
              <output>
                <output bind="txtAuto_PK" /> 
              </output>           
            </dso> 
        </xml> 
</gw:data>
<!---------------------grdlistATT---------------------------------------------->     
<gw:data id="datagci00080_10" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="control" parameter="0,1,2,3,4,5,6,7"  function="comm.sp_sel_tco_stitematt_control"  procedure="comm.sp_upd_tco_stitematt">
             <inout>         
                 <inout  bind="txtATTPK" />                 
                 <inout  bind="txtATTSEQ" /> 
                 <inout  bind="txtATTNAME" /> 
                 <inout  bind="lstATTLanguage" /> 
                 <inout  bind="chkATTLine" />  
                 <inout  bind="txtcontent_att" />
                 <inout  bind="cboOrganization" />
                 <inout  bind="txtTmpPK" />   
            </inout>
        </dso>                    
    </xml>
</gw:data> 
<!---------------------grdlistATTs----------------------------------------------->     
<gw:data id="datagci00080_11" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" parameter="0"  function="comm.sp_sel_tco_stitematt"  >
            <input bind="grdlistATT" >                            
                <input bind="txtSTitemPk" />   
            </input>
            <output bind="grdlistATT" />
        </dso>                    
    </xml>
</gw:data>  
<!------------------------------------------------------------->
 <form id="Form1" runat=server >
<table width="100%" border="1" id="tableID1">
    <tr valign=top >
        <td id="left" width="20%" onmousemove="">
            <table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
                <tr valign="center">
                    <td width="25%"><b>&nbsp;Group</b></td>
                    <td width="72%" colspan=2><gw:list id="cboGroupQuery" styles="width:100%;" ></gw:list></td>                    
                </tr>
                <tr valign="center">
                    <td width="25%"><b>&nbsp;ST STitem</b></td>
                    <td width="72%"><gw:textbox id="txtSTitemQuery" styles="width:120px;" csstype="filter" onenterkey="onSearch(0)" /></td>
                    <td width="3%" align="right"></td>
                </tr>
                <tr valign="center">
                    <td width="25%" align="right"><b>&nbsp;Active</b></td>
                    <td width="72%" align="left"><gw:checkbox id="chkActiveQuery" styles="align:left" defaultvalue="Y|N" value="Y" onchange="onSearch(0)" /></td>
                    <td width="3%" align="right"><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="onSearch(0)" /></td>
                </tr>                
                <tr>
                    <td colspan=3>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="100%">
                               <gw:grid   
                                id="grdSTitem"  
                                header="_PK|Code|Name"   
                                format="0|0|0"  
                                aligns="0|0|0"  
                                defaults="||"   
                                editcol="1|1|1"  
	                            widths="0|0|1200"  
                                styles="width:100%; height:420"   
                                sorting="T"   
                                param="0,1,2"  oncellclick="loadBSDetail1()" /> 
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td id="right" width="80%" onmousemove="">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                   <td>
                        <table width=100%>
                            <tr>
                                <td width="23%" valign="middle"><b>&nbsp;&nbsp;&nbsp; Company</b></td>
                                <td width="30%"  align=left><gw:list id="cboOrganization" styles="width:100%;"></gw:list></td> 
                                <td width="42%"></td>       
                                <td width="1%" align="right" style="height: 19px"><gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="onNew(0)" /></td>
                                <td width="1%" style="height: 19px"><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="onSave(0)" /></td>
                                <td width="1%" style="height: 19px"><gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="onDelete(0)" /></td>                               
                            </tr>
                        </table>
                   </td>
                </tr>
                <tr>
                    <td>
                        <table width=100%>
                            <tr valign=top>
                                <td valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td colspan="4" width="70%" >
                                                <table width=100%  cellpadding=0 cellspacing=0 border=0>                            
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle"><b>&nbsp;&nbsp;&nbsp; Group</b></td>
                                                        <td width="70%" colspan="3">
                                                            <gw:list id="cboGroup" styles="width:100%;" onchange="OnChangeGroup()"></gw:list>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle"><b>&nbsp;&nbsp;&nbsp; Model</b></td>
                                                        <td width="70%" colspan="3">
                                                            <gw:list id="cboModel" styles="width:100%;" onchange=""></gw:list>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle"><b>&nbsp;&nbsp;&nbsp; ST item Type</b></td>
                                                        <td width="70%" colspan="3">
                                                            <gw:list id="cboType" styles="width:100%;" onchange=""></gw:list>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; STitem code</b>
                                                        </td>
                                                        <td width="55%">
                                                            <gw:textbox id="txtSTitemcode"  csstype="mandatory" styles="width:100%;" />
                                                        </td>
                                                        <td width="10%" align=right valign=middle> Auto YN
                                                        </td>
                                                        <td width="5%" >
                                                            <gw:checkbox id="chkAutoYN"  defaultvalue="Y|N" value="Y" styles="width:100%;" onChange="onAutoYNChange()"/>
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; ST item name</b>
                                                        </td>
                                                        <td width="70%" colspan="3">
                                                            <gw:textbox id="txtSTitemnm" csstype="mandatory" styles="width:100%;" />
                                                        </td>
                                                    </tr>
                                                     <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; STitem Name LC</b>
                                                        </td>
                                                        <td width="70%" colspan="3">
                                                            <gw:textbox id="txtSTitemnm_LC" styles="width:100%;" />
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; ST item Name FR</b>
                                                        </td>
                                                        <td width="70%" colspan="3">
                                                            <gw:textbox id="txtSTitemnm_FR" styles="width:100%;" />
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; Description</b>
                                                        </td>
                                                        <td width="70%" colspan="3">
                                                            <gw:textbox id="txtDesc" styles="width:100%;" />
                                                        </td>
                                                    </tr>
                                                    <tr valign="top">
                                                        <td width="30%" valign="middle">
                                                            <b>&nbsp;&nbsp;&nbsp; Warehouse</b>
                                                        </td>
                                                        <td width="70%" colspan="3">
                                                            <gw:list id="cboWarehouse" styles="width:100%;"></gw:list>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td  rowspan =7 valign=top  width="30%" ><gw:image id="imgSTitem" table_name="TCO_STITEMPHOTO" oid="0" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:280;height:150" /></td>                                          
                                        </tr>
                                        <tr>
                                            <td colspan="6" height="2">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" height="1" bgcolor="#999999">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6" width="100%">
                                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td>
                                                            <gw:tab id="idTab" onpageactivate="return OnCheckTab()" style="width: 100%; height: 220; border1px">
				                                            <!--onpageactivate="showActiveTab()"-->
				                                            <table width="100%" border="0" cellpadding="1" cellspacing="0"
					                                            name="Spec" id="Spec" align="top"
					                                            style="overflow:scroll">
					                                            <tr>
                                                                    <td colspan="5" height="2" ></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6" height="1" bgcolor="#999999"></td>
                                                                </tr>
					                                            <tr>
									                            <td width="90%" align="right">                            									
									                            </td>
                            									
									                            <td width="4%" align="right">
									                            </td>
									                            <td width="3%">										                            
									                            </td>
									                            <td width="4%">
									                            </td>
								                            </tr>
					                                            <tr>
					                                                <td colspan =6>
			                                                          <gw:grid
                                                                        id="grdSTitemSpec"
                                                                        header="_pk|No|Spec grp nm|Spec grp lnm|Active|Spec ID|Spec Name|Spec lnm|_tco_cispec_pk|_tco_ciSTitem_pk|_tco_cispecgrp_pk|_mandatory|_idauto_yn|_IN_TYPE|_prefix|_parent_pk|_display_yn"
                                                                        format="0|0|0|0|3|0|0|0|0|0|0|3|0|0|0|0|0"
                                                                        aligns="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                                        defaults="||||||||||||||||"
                                                                        editcol="0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0"
                                                                        widths="0|600|1500|1500|800|1500|1500|1500|0|0|0|1000|0|0|0|0|0"
                                                                        styles="width:100%; height:160"
                                                                        sorting="F"
                                                                        onafteredit="OnGridCellAfterEdit()"
                                                                        oncelldblclick="OnGridCellDoubleClick(this)"
                                                                        param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16"  />
					                                                </td>
					                                            </tr>
					                                        </table>
				                                            <table width="100%" border="0" cellpadding="0" cellspacing="0"  name="General Info" id="TabGeneralInfo" align="top"
					                                            style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
					                                                        <tr>
		                                                                        <td colspan="5" height="2" ></td>
	                                                                        </tr>
	                                                                        <tr>
		                                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                                        </tr>
	                                                                        <tr>
	                                                                             <td width=30% valign=Top>
	                                                                                 <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                      <tr>
							                                                                <td width=100% colspan=2>
                                                                                                <fieldset style="padding: 5">
                                                                                                  <legend><font color="black"  ><b>Unit of Measure</b></font></legend>
                                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                                     <tr>
                                                                                                           <td width=100%><gw:list id="cboUOM"   styles="width:100%;" ></gw:list></td>
                                                                                                          </tr>
								                                                                     </table>
                                                                                              </fieldset>
                                                                                            </td>
								                                                          </tr>
							                                                            <tr>
							                                                                <td width=100% colspan=2>
                                                                                                <fieldset style="padding: 5">
                                                                                               <legend><font color="black"  ><a title="Click here to select HS code" onclick="openPopup(0)" href="#tips" style="text-decoration : none; color=#0000FF"><b>&nbsp;&nbsp;&nbsp;HS Code</b></a></font></legend>
                                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                                     <tr>
                                                                                                           <td width=30%><gw:textbox id="txtHScode"   styles="width:100%;" /><gw:textbox id="txtHS_pk"   styles="width:100%;display:none" /></td>
                                                                                                           <td width=70%><gw:textbox id="txtHsname"   styles="width:100%;" /></td>
                                                                                                          </tr>
								                                                                    </table>
                                                                                              </fieldset>
                                                                                            </td>
								                                                          </tr>
							                                                        </table>
                                                                                  </td>
                                                                                 <td width=5% valign=Top></td>   
	                                                                             <td width=60% valign=Top>
	                                                                                <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                      <tr>
							                                                                <td width=100% colspan=2>
                                                                                                <fieldset style="padding: 5">
                                                                                                  <legend><font color="black"> <a title="Click here to select business partner" onclick="openPopup(1)" href="#tips" style="text-decoration : none; color=#0000FF"><b>Business partner</b></a></font></legend>
                                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                                     <tr>
                                                                                                           <td width=20%><gw:textbox id="txtBS_id"   styles="width:100%;" /><gw:textbox id="txtBS_pk"   styles="width:100%;display:none" /></td>
                                                                                                           <td width=80%><gw:textbox id="txtBS_nm"   styles="width:100%;" /></td>
                                                                                                          </tr>
								                                                                    </table>
                                                                                              </fieldset>
                                                                                            </td>
								                                                         </tr>
							                                                            <tr>
							                                                                <td width=100% colspan=2>
                                                                                                <fieldset style="padding: 5">
                                                                                                  <legend><font color="black"  ><a title="Click here to select account code" onclick="openPopup(2)" href="#tips" style="text-decoration : none; color=#0000FF"><b>Account code</b></a></font></legend>
                                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                                     <tr>
                                                                                                           <td width=20%><gw:textbox id="txtAccCode"   styles="width:100%;" /><gw:textbox id="txtAcc_pk"   styles="width:100%;display:none" /></td>
                                                                                                           <td width=80%><gw:textbox id="txtAccNM"   styles="width:100%;" /></td>
                                                                                                         </tr>
								                                                                    </table>
                                                                                              </fieldset>
                                                                                            </td>
								                                                          </tr>
                                                                                       <tr>
                                                                                            <td width=100% colspan=2>
                                                                                                <fieldset style="padding: 5">
                                                                                                  <legend><font color="black"  ><b>STitem status</b></font></legend>
                                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                                     <tr>
                                                                                                           <td width=15%>Active</td>
                                                                                                           <td width=1% align=left><gw:checkbox id="chkActive" defaultvalue="Y|N" value="Y" /></td>
                                                                                                            <td width=84% colspan=3 align=right><b> &nbsp;</b></td>
								                                                                         </tr>
								                                                                        <tr>
                                                                                                            <td width=15% align=left> From&nbsp;</td>
								                                                                            <td width=10%><gw:datebox id="dtaFrom"  lang="<%=Application("Lang")%>" mode="01"	onchange="" /></td>
								                                                                            <td width=5% align=center><b>~</b></td>
								                                                                            <td width=10%><gw:datebox id="dtaTo" nullaccept lang="<%=Application("Lang")%>" mode="01"	onchange="" /></td>
								                                                                            <td width=60%  align=right><b> &nbsp;</b></td>
								                                                                        </tr>
                                                                                                    </table>
                                                                                              </fieldset>
                                                                                            </td>
                                                                                        </tr>
							                                                          </table>
	                                                                             </td>
	                                                                          </tr>    
								                                         </table>
					                                                </td>
					                                            </tr>
					                                        </table>
				                                             <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Inventory" id="Inventory" align="top"  style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
					                                                        <tr>
		                                                                        <td colspan="5" height="2" ></td>
	                                                                        </tr>
	                                                                        <tr>
		                                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                                        </tr>
	                                                                       <tr>
	                                                                         <td colspan=3 width=100%>
	                                                                            <table width=100% cellpadding=0 cellspacing=0 border=0>
	                                                                                <tr>
		                                                                                <td  width=9% align=left><b>&nbsp;&nbsp;&nbsp;Inventory</b></td>
		                                                                                <td width=2% align=left><gw:checkbox id="chkIsInventory" defaultvalue="Y|N" value="N"  /></td>
		                                                                                <td  width=9% align=left><b>&nbsp;&nbsp;&nbsp;Shortage</b></td>
		                                                                                <td width=2% align=left><gw:checkbox id="chkMAT_STG_YN" defaultvalue="Y|N" value="N" /></td>
		                                                                                <td width="50%">&nbsp;</td>
	                                                                                </tr>
	                                                                            </table>
	                                                                         </td>
		                                                                    </tr>
	                                                                        <tr>
	                                                                             <td width=30% valign=Top>
	                                                                                <fieldset style="padding: 10">
                                                                                      <legend> <font color="black" size="2"><b>Lot Expiration (Shelf Life)</b></font></legend>
                                                                                     <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                     <tr>
                                                                                            <td width=50%>&nbsp; &nbsp;Control</td>
                                                                                            <td width=2% colspan=1 align=left><gw:checkbox id="chkSHELFLIFE_CTRL" defaultvalue="Y|N" value="N" /></td>
								                                                        </tr>
                                                                                        <tr>
                                                                                            <td width=50%>&nbsp; &nbsp;Shelf Life Days</td>
                                                                                            <td width=50% colspan=1><gw:textbox id="txtshelf_life_days" styles="width:100%;" /></td>
                                                                                        </tr>
                                                                                     </table>
                                                                                   </fieldset>
                                                                                 </td>
	                                                                            <td width=2%></td>
					                                                             <td width=30% valign=Top></td>
	                                                                              <td width=38% valign=Top></td>
	                                                                         </tr>    								                                             
	                                                                        <tr>
	                                                                             <td width=30% valign=Top>
	                                                                                <fieldset style="padding: 5">
                                                                                      <legend> <font color="black" size="2"><b>Lot </b></font></legend>
                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                    <tr>
                                                                                          <td width=50%>&nbsp; &nbsp;Control</td>
                                                                                          <td width=2% colspan=1><gw:checkbox id="chkLOT_CTRL_YN" defaultvalue="Y|N" value="N" /></td>
								                                                        </tr>
                                                                                        <tr>
                                                                                            <td width=50%>&nbsp; &nbsp;Starting Prefix</td>
                                                                                            <td width=50% colspan=1><gw:textbox id="txtLOT_START_PREFIX" styles="width:100%;" /></td>
								                                                        </tr>
								                                                         <tr>
                                                                                            <td width=50%>&nbsp; &nbsp;Starting Number</td>
                                                                                            <td width=50% colspan=1><gw:textbox id="txtLOT_START_NUMBER" styles="width:100%;" /></td>
								                                                        </tr>
							                                                         </table>
                                                                                   </fieldset>
                                                                                 </td>
	                                                                            <td width=2%></td>
					                                                             <td width=30% valign=Top>
	                                                                                 <fieldset style="padding: 5">
                                                                                      <legend> <font color="black" size="2"><b>Serial </b></font></legend>
                                                                                        <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                        <tr>
                                                                                                <td width=50%>&nbsp; &nbsp;Serial control</td>
                                                                                                <td width=2% colspan=1><gw:checkbox id="chkSERIAL_CRTL_YN" defaultvalue="Y|N" value="N" /></td>
								                                                            </tr>
                                                                                            <tr>
                                                                                                <td width=50%>&nbsp; &nbsp;Starting Prefix</td>
                                                                                                <td width=50% colspan=1><gw:textbox id="txtSERIAL_START_PREFIX" styles="width:100%;" /></td>
								                                                            </tr>
								                                                             <tr>
                                                                                                <td width=50%>&nbsp; &nbsp;Starting Number</td>
                                                                                                <td width=50% colspan=1><gw:textbox id="txtSERIAL_START_NUMBER" type="number" format="###" styles="width:100%;" /></td>
								                                                            </tr>
							                                                          </table>
                                                                                      </fieldset>
	                                                                             </td>
	                                                                             <td width=38%></td>
	                                                                         </tr> 
	                                                                          <tr>
		                                                                        <td colspan="6" height="4" bgcolor=""></td>
	                                                                        </tr>
							                                            </table>
					                                                </td>
                            					                   
					                                            </tr>
					                                        </table>
					                                         <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Bills of Material " id="BOM" align="top"  style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
					                                                        <tr>
		                                                                        <td colspan="5" height="2" ></td>
	                                                                        </tr>
	                                                                        <tr>
		                                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                                        </tr>
	                                                                       <tr>
	                                                                         <td colspan=3 width=100%>
	                                                                            <table width=100% cellpadding=0 cellspacing=0 border=0>
	                                                                                <tr>
	                                                                                    <td  width=15% align=left><b>&nbsp;&nbsp;&nbsp;BOM Allowed</b></td>
		                                                                                <td width=2% align=left><gw:checkbox id="chkBOM" defaultvalue="Y|N" value="N" /></td>
		                                                                                <td width=80% align=left></td>
	                                                                                </tr>
	                                                                                <tr>
	                                                                                    <td  width=15% align=left><b>&nbsp;&nbsp;&nbsp;BOM STitem Type</b></td>
		                                                                                <td width=85% colspan=2 align=left><gw:list id="cboBOMSTitemType" styles="width:30%"></gw:list> </td>
		                                                                            </tr>
	                                                                            </table>
	                                                                         </td>
		                                                                    </tr>
	                                                                     </table>  
					                                               </td>
					                                            </tr>
					                                        </table>
					                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Costing" id="Costing" align="top"  style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
					                                                        <tr>
		                                                                        <td colspan="5" height="2" ></td>
	                                                                        </tr>
	                                                                        <tr>
		                                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                                        </tr>
	                                                                       <tr>
	                                                                         <td colspan=3 width=100%>
	                                                                            <table width=100% cellpadding=0 cellspacing=0 border=0>
	                                                                                <tr>
	                                                                                    <td  width=15% align=left><b>&nbsp;&nbsp;&nbsp;Costing Enabled</b></td>
		                                                                                <td width=2% align=left><gw:checkbox id="chkCosting" defaultvalue="Y|N" value="N" /></td>
		                                                                                <td width=80% align=left></td>
	                                                                                </tr>
	                                                                             </table>
	                                                                         </td>
		                                                                    </tr>
	                                                                     </table>  
					                                               </td>
					                                            </tr>
					                                        </table>
					                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Purchasing" id="Purchasing" align="top"  style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                    <table width="100%" cellpadding="0" cellspacing="2" border=0>
					                                                        <tr>
		                                                                        <td colspan="5" height="2" ></td>
	                                                                        </tr>
	                                                                        <tr>
		                                                                        <td colspan="6" height="1" bgcolor="#999999"></td>
	                                                                        </tr>
	                                                                       <tr>
	                                                                         <td colspan=3 width=100%>
	                                                                            <table width=100% cellpadding=0 cellspacing=0 border=0>
	                                                                                <tr>
	                                                                                  <td  width=19% align=left><b>&nbsp;&nbsp;&nbsp;Purchased</b></td>
		                                                                              <td width=2% align=left><gw:checkbox id="chkIsPurchased" defaultvalue="Y|N" value="N" /></td>
		                                                                              <td width=79% align=left></td>
	                                                                                </tr>
	                                                                                <tr>
	                                                                                  <td  width=20% align=left><b>&nbsp;&nbsp;&nbsp;Purchased type</b></td>
		                                                                              <td width=30% align=left><gw:list id="cboPur_type" styles="width:100%" /></td>
		                                                                              <td width=50% align=left></td>
	                                                                                </tr>
	                                                                            </table>
	                                                                         </td>
		                                                                    </tr>
	                                                                       <tr>
	                                                                             <td width=50% valign=Top>
	                                                                                <fieldset style="padding: 5">
                                                                                      <legend> <font color="black" size="2"><b>Price</b></font></legend>
                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                    <tr>
                                                                                            <td width=30%>&nbsp; &nbsp;Currency</td>
                                                                                            <td width=25%><gw:list id="cboCurrency" type="number" format="#,###,###,###,###.##R" styles="width:100%;"></gw:list></td>
                                                                                            <td width=20%>&nbsp; &nbsp;Weight Price</td>
                                                                                            <td width=25%><gw:textbox id="txtW_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
								                                                        </tr>
								                                                        <tr>
                                                                                            <td width=25%>&nbsp; &nbsp;Unit price</td>
                                                                                            <td width=25%><gw:textbox id="txtU_price" styles="width:100%;" /></td>
                                                                                            <td width=25%>&nbsp; &nbsp;Volume Price</td>
                                                                                            <td width=25%><gw:textbox id="txtV_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
								                                                        </tr>
                                                                                        <tr>
                                                                                            <td width=25%>&nbsp; &nbsp;List price</td>
                                                                                            <td width=25%><gw:textbox id="txtList_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                                            <td width=25%>&nbsp; &nbsp;Surface Price</td>
                                                                                            <td width=25%><gw:textbox id="txtS_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
								                                                        </tr>
							                                                            <tr>
                                                                                            <td width=25%>&nbsp; &nbsp;Standard price</td>
                                                                                            <td width=25%><gw:textbox id="txtStdPrice" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
								                                                        </tr>
								                                                        <tr>
                                                                                            <td width=25%>&nbsp; &nbsp;Price limit</td>
                                                                                            <td width=25%><gw:textbox id="txtLimit_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
								                                                        </tr>
								                                                        <tr>
                                                                                            <td width=25%>&nbsp; &nbsp;Market price</td>
                                                                                            <td width=25%><gw:textbox id="txtMart_price" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
                                                                                            <td width=25%>&nbsp; &nbsp;</td>
								                                                        </tr>
								                                                    </table>
                                                                                   </fieldset>
                                                                                  </td>
	                                                                            <td width=2%></td>
					                                                            <td width=30% valign=Top>
	                                                                                 <fieldset style="padding: 10">
                                                                                      <legend> <font color="black" size="2"><b>Misc </b></font></legend>
                                                                                      <table width=100% cellpadding=0 cellspacing=1 border=0>
	                                                                                    <tr>
                                                                                            <td width=50% nowrap>&nbsp; &nbsp;Minimum Order Qty</td>
                                                                                            <td width=50% colspan=1><gw:textbox id="txtMin_order_qty" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
								                                                        </tr>
                                                                                     </table>
                                                                                      </fieldset>
	                                                                            </td>
	                                                                            <td width=38% valign=Top></td>
	                                                                         </tr>    
								                                         </table>
					                                                </td>
                            					                   
					                                            </tr>
					                                        </table>
					                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Physical Attribute" id="Physical_Attribute" align="top"  style="overflow:scroll">
					                                            <tr>
					                                                <td width=100%>
					                                                  <table width="100%" cellpadding="0" cellspacing="2" border="0">
                                                                      <tr>
                                                                        <td colspan="4" height="2"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td colspan="4" height="1" bgcolor="#999999"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="30%" valign="Top"><fieldset style="padding: 2">
                                                                            <legend><font color="black" size="2"><b>Weight</b></font></legend>
                                                                                <table width="100%" cellpadding="0" cellspacing="1" border="0">
                                                                                  <tr>
                                                                                    <td width="50%">&nbsp;&nbsp; Unit of Measure</td>
                                                                                    <td width="50%" colspan="1"><gw:list id="cboUOM_WT" styles="width:100%;"></gw:list></td>
                                                                                  </tr>
                                                                                  <tr>
                                                                                    <td width="50%">&nbsp;&nbsp; Unit Weight</td>
                                                                                    <td width="50%" colspan="1"><gw:textbox id="txtWeight" styles="width:100%;" /></td>
                                                                                  </tr>
                                                                               </table>
                                                                            </fieldset> 
                                                                        </td>
                                                                        <td width="2%"></td>
                                                                        <td width="30%" valign="Top" rowspan="3"><fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Surface</b></font></legend>
                                                                        <table width="100%" cellpadding="1" cellspacing="3" border="0">
                                                                           <tr>
                                                                            <td width="49%">&nbsp;&nbsp; Unit of Measure</td>
                                                                            <td width="61%" colspan="3"><gw:list id="cbouom_sur" styles="width:100%;"></gw:list></td>
                                                                          </tr>  
                                                                          <tr>
                                                                            <td width="49%">&nbsp;&nbsp; Surface</td>
                                                                            <td width="61%" colspan="1"><gw:textbox id="txtSurface" styles="width:100%;" /></td>                                                                           
                                                                          </tr>                                                                         
                                                                        </table>
                                                                        </fieldset> <fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Type </b></font></legend>
                                                                        <table width="100%" cellpadding="1" cellspacing="2" border="0">
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Equipment</td>
                                                                            <td width="2%" colspan="1" align=left><gw:checkbox id="chkEquipment" defaultvalue="Y|N" value="N" /></td>
                                                                          </tr>
                                                                           <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Set Y/N</td>
                                                                            <td width="2%" colspan="1" align=left><gw:checkbox id="chkSet" defaultvalue="Y|N" value="N" /></td>
                                                                          </tr>
                                                                           <tr>
                                                                            <td width="50%">&nbsp;&nbsp;Outsourcing Y/N</td>
                                                                            <td width="2%" colspan="1" align=left><gw:checkbox id="chkOutsourcing"defaultvalue="Y|N" value="N" /></td>
                                                                          </tr>
                                                                        </table>
                                                                        </fieldset><fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Lot </b></font></legend>
                                                                        <table width="100%" cellpadding="1" cellspacing="2" border="0">
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp;Unit of Measure</td>
                                                                            <td width="50%" colspan="1" align=left><gw:list id="cboUOM_LOT" styles="width:100%" /></td>
                                                                          </tr>
                                                                           <tr>
                                                                            <td width="50%">&nbsp;&nbsp;Quantity</td>
                                                                            <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_qty" type="number" format="#,###,###,###,###.##R" styles="width:100%" /></td>
                                                                          </tr>
                                                                           <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Weight</td>
                                                                            <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_weight" type="number" format="#,###,###,###,###.##R" styles="width:100%" /></td>
                                                                          </tr>
                                                                        </table>
                                                                        </fieldset></td>
                                                                        <td width="38%" valign="Top"><fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Container </b></font></legend>
                                                                        <table width="100%" cellpadding="1" cellspacing="3" border="0">
                                                                          <tr>
                                                                            <td width="49%">&nbsp;&nbsp; Container</td>
                                                                            <td width="2%" colspan="1">
                                                                            <gw:checkbox id="chkContainer" defaultvalue="Y|N" value="N" /></td>
                                                                            <td width="49%">&nbsp;&nbsp; Vehicle</td>
                                                                            <td width="2%" colspan="1">
                                                                            <gw:checkbox id="chkVehicle" defaultvalue="Y|N" value="N" /></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td width="49%">&nbsp;&nbsp; Container type</td>
                                                                            <td width="61%" colspan="3">
                                                                            <gw:list id="cbocont_type" styles="width:100%;"></gw:list></td>
                                                                          </tr>
                                                                        </table>
                                                                        </fieldset></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="30%" valign="Top"><fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Volume </b></font></legend>
                                                                        <table width="100%" cellpadding="0" cellspacing="1" border="0">
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Unit of Measure</td>
                                                                            <td width="50%" colspan="1"><gw:list id="cboUOM_VOL" styles="width:100%;"></gw:list></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Unit Volume</td>
                                                                            <td width="50%" colspan="1"><gw:textbox id="txtVolume" styles="width:100%;" /></td>
                                                                          </tr>
                                                                        </table>
                                                                        </fieldset> </td>
                                                                        <td width="2%"></td>
                                                                        <td width="38%"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="30%" valign="Top"><fieldset style="padding: 2">
                                                                        <legend><font color="black" size="2"><b>Dimentions </b></font></legend>
                                                                        <table width="100%" cellpadding="0" cellspacing="1" border="0">
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Unit of Measure</td>
                                                                            <td width="50%" colspan="1"><gw:list id="cboUOM_DIM" styles="width:100%;"></gw:list></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Lenght</td>
                                                                            <td width="50%" colspan="1"><gw:textbox id="txtSTitem_length" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Width</td>
                                                                            <td width="50%" colspan="1"><gw:textbox id="txtSTitem_width" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td width="50%">&nbsp;&nbsp; Height</td>
                                                                            <td width="50%" colspan="1"><gw:textbox id="txtSTitem_height" type="number" format="#,###,###,###,###.##R" styles="width:100%;" /></td>
                                                                          </tr>
                                                                        </table>
                                                                        </fieldset> </td>
                                                                        <td width="2%"></td>
                                                                        <td width="30%" valign="Top"></td>
                                                                        <td width="38%"></td>
                                                                      </tr>
                                                                    </table>
                                                                    </td>
					                                            </tr>
					                                        </table>
					                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" name="Documents" id="Table10" align="top"  style="overflow:scroll">
					                                            <tr>						                                                 
                                                                    <td width="3%"><gw:imgBtn id="btnAttach"  img="attach" alt="Attach file" onclick="AttachFiles()"/></td>
                                                                    <td ><gw:imgBtn id="btnDelDoc" img="delete" alt="Delete" onclick="onDelete(2)"/></td>                            
					                                            </tr>
					                                            <tr>
					                                                <td colspan=2>
					                                                    <gw:grid    
			                                                                 id="idGridlistDOC"   
			                                                                 header="_pk|SEQ|File Name" 
			                                                                 format="0|0|0"   
			                                                                 aligns="0|1|2"   
			                                                                 defaults="||"   
			                                                                 editcol="0|0|0"   
			                                                                 widths="0|1500|2500"   
			                                                                 styles="width:100%; height:220"    
			                                                                 sorting="T"    
			                                                                 param="0,1,2" 
			                                                                 oncelldblclick="OnOpenFile()"
				                                                             onafteredit="" /> 
					                                                </td>						                     
					                                            </tr>
					                                        </table>			
					                                        <table name="Picture" align="top" cellspacing=0 cellpadding=0  width="100%"  border="0" >
				                                                <tr   bgcolor="#DFF2FF">                						 
					                                               <td width="88%"></td> 					
					                                               <td align="right" width=3%></td>
					                                               <td align="right" width=3%><gw:imgBtn id="btnNewp" img="new" alt="New" onclick="onNew(5)"/></td>
					                                               <td align="right" width=3%><gw:imgBtn id="btnDeletep" img="delete" alt="Delete" onclick="onDelete(5)"/></td>
					                                               <td align="right" width=3%><gw:imgBtn id="btnSavep" img="save" alt="Save" onclick="onSave(5)"/></td>                		           
				                                                </tr> 
				                                                <tr>
				                                                    <td  width="100%" colspan="5">
							                                            <table width="100%" cellspacing=0 cellpadding=0 >
								                                            <tr>
									                                            <td width="40%">
										                                            <gw:grid    
									                                                     id="grdlistPIC"   
									                                                     header="_PK|SEQ|Name|Language" 
									                                                     format="0|0|0|0"   
									                                                     aligns="0|3|2|1"   
									                                                     defaults="|||"   
									                                                     editcol="1|1|1|1"   
									                                                     widths="0|800|2500|1500"   
									                                                     styles="width:100%; height:250"    
									                                                     sorting="T"    
									                                                     param="0,1,2,3"  
										                                                 oncelldblclick="" 
										                                                 onafteredit="" 
										                                                 oncellclick="OncellClickGrd()"/>  										               
									                                            </td>
								                                                <td  width="30%" valign="top">
								   		                                            <table width=100%>
								                                                       <tr>
					                                                                      <td width=35%><b>PIC SEQ</b></td>
															                              <td width=65%><gw:textbox csstype="mandatory" id="txtPICSEQ" styles='width:100%'   /></td>
					                                                                   </tr>
					                                                                   <tr>
					                                                                      <td width=35%><b>PIC Name</b></td>
															                              <td width=65%><gw:textbox  id="txtPICNAME" styles='width:100%' csstype="mandatory" maxlen=200 onmouseenter="OnImgClick()" /></td>
					                                                                   </tr>
					                                                                   <tr> 
					                                                                       <td width=35%><b>PIC Language</b></td>
															                               <td  width=65%><gw:list id="cboPICLanguage"  styles="width:100%"> </gw:list ></td>												                                          
											                                           </tr>
											                                           <tr>															                   
												                                           <td width=35% ><gw:checkbox id="chkOrigin" styles="color:blue;width:100%" value="-1" defaultvalue="-1|0" ><b>Origin</b></gw:checkbox ></td>
												                                           <td width=65%><gw:checkbox id="chkLine" styles="color:blue;width:100%" value="-1" defaultvalue="-1|0" ><b>Line</b></gw:checkbox ></td>
											                                           </tr>  
											                                           <tr > 
											                                               <td width=35% ><b></b></td>
															                               <td width=65%></td>
											                                           </tr>
								                                                   </table>
								                                               </td>
								                                               <td valign=top width=30%>
								                                                    <gw:image id="imgPic" table_name="TCO_STITEMPHOTO" oid="0" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:100%;height:150" />
								                                               </td>
								                                            </tr>
							                                            </table>
						                                            </td>
				                                               </tr>
			                                                </table>		
			                                                <table name="Attention" align="top" cellspacing=0 cellpadding=0  width="100%"  border="0"  >
					                                             <tr bgcolor="#DFF2FF" >                                            						 
						                                             <td width="88%"></td> 					
						                                             <td align="right" width=3%></td>
						                                             <td align="right" width=3%><gw:imgBtn id="ibtnNew" img="new" alt="New" onclick="onNew(3)"/></td>
						                                             <td align="right" width=3%><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="onDelete(3)"/></td>
						                                             <td align="right" width=3%><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="onSave(3)"/></td>                                           		           
					                                               </tr> 
					                                               <tr >
					                                                    <td  width="100%" colspan="5">
								                                            <table width="100%" cellspacing=0 cellpadding=0  >
									                                            <tr>
										                                            <td width="40%" valign="top">										                                           
										                                                <table width="100%">
										                                                    <tr >
										                                                        <td width="100%">
										                                                            <gw:grid   
											                                                         id="grdlistATT"  
											                                                         header="_PK|SEQ|Name|Language"   
											                                                         format="0|0|0|0"  
											                                                         aligns="0|0|0|1"  
											                                                         defaults="|||"  
											                                                         editcol="1|1|1|1"
											                                                         widths="0|1000|2000|1500"  
											                                                         styles="width:100%; height:400"  
											                                                         sorting="T"   
											                                                         param="0,1,2,3" 
											                                                         oncellclick="loadBSDetail2()" /> 	
										                                                        </td>
										                                                    </tr>
										                                                </table>
									                                                     									                                          
										                                            </td>
									                                               <td  width="60%" valign="top" >
									                                                          <table width="100%" border="1" >
												                                                <tr >
												 	                                                <td width="10%"  align="right"><b>ATT SEQ</b></td>
													                                                <td width="10%"><gw:textbox csstype="mandatory" id="txtATTSEQ"    /></td>
													                                                <td width="15%" align="right"><b>ATT Name</b></td>
													                                                <td width="15%"><gw:textbox  id="txtATTNAME"    /></td>
												                                                     <td width="15%" align="right"><b>ATT Language</b></td>
													                                                <td  width="15%"><gw:list id="lstATTLanguage"  styles="width:100%"></gw:list ></td>                             
													                                                <td width="10%" align="left" ><gw:checkbox id="chkATTLine" styles="color:blue" value="Y" defaultvalue="Y|N" ><b>Line</b></gw:checkbox ></td>																										
												                                                </tr>
												                                                <tr >   
											                                                        <td colspan="7" width="80%">
        											                                               
                                                                                                        <ftb:freetextbox id="ftbContent" runat="server" height="220px" imagegallerypath="~/images/Gallery/" supportfolder="~/form/ag/ci/picture/"  width="100%" BreakMode="LineBreak" ToolbarLayout="ParagraphMenu,FontFacesMenu, FontSizesMenu, FontForeColorsMenu,FontForeColorPicker, FontBackColorsMenu, FontBackColorPicker|Preview,Cut, Copy, Paste, Delete, Undo, Redo, Print | JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, NumberedList, Indent, Outdent , InsertDate, InsertTime ,RemoveFormat| Bold, Italic, Underline, Strikethrough, Superscript, Subscript ,InsertRule, CreateLink, Unlink, InsertImage,InsertImageFromGallery,InsertTable, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,DeleteTableColumn,SymbolsMenu,WordClean"></ftb:freetextbox> 
                                                                                                    
                                                                                                    </td>
												                                                </tr>
											                                                </table>
										                                            </td>
									                                            </tr>
								                                            </table>
							                                            </td>
					                                               </tr>
				                                                </table>	           
					                                    </gw:tab>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
 </form>
    <gw:grid   
    id="grdSpec"  
    header="pk|spec_id|spec_nm|spec_lnm"   
    format="0|0|0|0"  
    aligns="0|0|0|0"  
    defaults="|||"  
    editcol="1|1|1|1"  
    widths="0|0|0|0"  
    styles="width:100%; height:200;display:none"   
    sorting="F"   
    param="0,1,2,3"  />   
    <gw:textbox id="txttpr_stSTitem_pk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txttco_STitemphoto_pk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txttco_STpic_pk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txttco_pic_pk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtSTitemPk" maxlen="100" styles='width:100%;display:none' csstype="" />
	<gw:textbox id="txtSTitemPktmp" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtParentPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtGroupPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtGroupCode" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtGroupMaxSeq" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtIsProduct" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtCodeGenerate" maxlen="100" styles='width:100%;display:none ' />
    <gw:textbox id="txtIsDuplicate" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:checkbox id="chkpict_yn" defaultvalue="Y|N" value="N" styles='width:100%;display:none' />  
    <gw:checkbox id="txtAuto_PK" defaultvalue="Y|N" value="N" styles='width:100%;display:none' />
    <gw:textarea id="txtcontent_att" styles="display:none"  />
    <gw:textbox id="txtATTPK" text= '' size=15  style="display:none"/>
    <gw:textbox id="txtTmpPK" text= '' size=15  style="display:none"/>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor:hand;position:absolute;left:1;top:0;" onclick="OnToggle()"  /> 
    <gw:image id="imgFile"  table_name="TCO_STITEMDOC" view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:100;height:100;display:none"  />
</body>

</html>
