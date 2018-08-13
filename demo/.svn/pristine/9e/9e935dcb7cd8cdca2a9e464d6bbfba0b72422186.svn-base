 <!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""

%>
<head id="Head1" runat="server">
    <title>Slip No Formula</title>
</head>

<script>

var TemplatePK,sChar_Len,sExample,sType , sChar, sCurrentSeqNo;

var auto_num_end_yn, row_event;

var G1_pk          = 0 ,
    G1_Character   = 1 ,
    G1_Type        = 2 ,
    G1_Length      = 3 ,
    G1_Example     = 4 ,
    G1_Table       = 5 ,
    G1_Field       = 6 ,
    G1_PK_Field    = 7,
    G1_Foreign_PK  = 8,
    G1_Cardial     = 9 ,
    G1_Start_value = 10 ,
    G1_Code_Type   = 11 ,
    G1_Be_Used_YN  = 12;
    
//============================================================================

function BodyInit()
{
    System.Translate(document); 
    auto_num_end_yn="";
    
    BindingDataList();
    
}

//============================================================================

function xreplace(replaceStr,toberep,repwith)
{

    var temp = replaceStr;

    var i = temp.indexOf(toberep);

    while(i > -1)

    {

        temp = temp.replace(toberep, repwith);

        i = temp.indexOf(toberep, i + repwith.length + 1);
    }

        return temp;

}

//=============================================================================

function BindingDataList()
{

    data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('LGAB0020','','') FROM DUAL" )%>";    
    lstCodeType.SetDataText(data);       

    data = "|#D;D Date|#N;N Auto Number|#F;F Date Data Field|#C;C Constant|#G;G Text Data Field";       
    grdCharacters.SetComboFormat(G1_Type,data);
    
    data = "|#Y;Y Auto increase|#N;N Non|#C;C Increase with Condition";       
    grdCharacters.SetComboFormat(G1_Cardial,data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   NULL, NULL table_name FROM DUAL union all SELECT  u.NAME || '.'||o.NAME user_name, u.NAME || ' - ' || o.NAME table_name FROM SYS.obj$ o, SYS.user$ u WHERE o.owner# = u.user# AND (u.NAME = 'PROD' OR u.NAME = 'SALE' OR u.NAME = 'ACNT' OR u.NAME = 'INV' OR u.NAME = 'IMEX' OR u.NAME = 'COMM' OR u.NAME = 'CRM') AND flags = 0 AND o.type# = 2 ORDER BY table_name ASC NULLS FIRST " )  %> " ; 
    grdCharacters.SetComboFormat( G1_Table , data );

    txt_Code_Temp.SetEnable(false);
    txtCode_Sample.SetEnable(false);

}

//=============================================================================

function OnAddNew(obj)
{
    switch (obj)
    {
        case 'grdCharacters' :
         
            grdCharacters.AddRow();
            //---------------------
            grdCharacters.SetGridText( grdCharacters.rows - 1, G1_Code_Type, lstCodeType.value );
            //---------------------
        break; 
        
        case 'Template' :
            OnReset();
        break;    
    }
}

//=============================================================================

function CheckSave()
{
    for (i = 1; i < grdCharacters.rows ; i++)
    {
        if (grdCharacters.GetGridData(i, G1_Type)==""  )
        {
            alert("Please, select data type for row"+i+"!")
            return false;
        }
        else
        {           
            if((grdCharacters.GetGridData(i,G1_Type)!="F" ) && (grdCharacters.GetRowStatus(i)!=64) )
            {
                if(grdCharacters.GetGridData(i,G1_Character)=="")
                {
                    alert("Character at row"+i+" is not null!")
                    return false;
                }
                        
                if (grdCharacters.GetGridData(i,G1_Type)=="N" && grdCharacters.GetGridData(i,G1_Cardial)=="C"  )
                {
                    if(grdCharacters.GetGridData(i,G1_Field)=="" )
                    {
                        alert("Table Name and Field Name at row"+i+" is not null!")
                        return false;
                    }
                }
            }
            else 
            { 
                if( grdCharacters.GetGridData(i,G1_Field) == "" )
                {
                    alert("Field Name is not null!")
                    return false;
                }
            }

        }
    }    
    return true;
}

//===============================================================================

function OnSave(obj)
{
    switch (obj)
    {
        case 'grdCharacters' :
            if( CheckSave() )
            {
                agds00010.Call();
            }        
        break ;
        
        case 'Template' :
            if ( CheckTemplateValid() )
            {
                if ( txtTemp_PK.text.length == 0 && TemplatePK.length > 0 )
                { 
                       agds00010_1.StatusInsert();
                }
                else
                {
                       agds00010_1.StatusUpdate();
                }  
                      
                //------------------------------
                txtChar_pks.text = TemplatePK ;
                txtChars.text    = sChar      ;
                txtTemps.text    = sExample   ;
                //------------------------------
                agds00010_1.Call();
                //------------------------------
           
            }
        break ;
    }
                   
}

//==============================================================================

function OnDelete(obj)
{
    switch (obj)
    {
        case 'grdCharacters' :
        
            var ctrl = grdCharacters.GetGridControl();
	        var row  = ctrl.row;
        	
	        if ( grdCharacters.GetGridData( ctrl.row, 0 ) == "" ) 
            {						
			
			    grdCharacters.RemoveRow();					
	        }
	        else
	        {
	            grdCharacters.DeleteRow();
	        }			

        break ;
        
        case 'Template' :
    		if ( confirm( "Do you want to delete this template?" ) ) 
		    {
			    agds00010_1.StatusDelete();
			    agds00010_1.Call();
		    }
        break ;        			    

	}
}

//=============================================================================

function ShowSelectedCharacter()
{
    txt_Code_Temp.text  = xreplace( sChar    , ',', '' ) ;
    txtCode_Sample.text = xreplace( sExample , ',', '' ) ;
}

//==========================================================================

function OnSelectChar()
{
    var select_auto_num_yn = grdCharacters.GetGridData(grdCharacters.row,G1_Type);
    
    if( auto_num_end_yn == "Y" && select_auto_num_yn == "N" )
    {   
       alert("This formular already contain an auto number!")
    }
    else
    {           
        if ( grdCharacters.row == 0 )
        {
            alert("Please select character!");
        }    
        else
        {   
            if ( TemplatePK.length == 0 )
            {    
                TemplatePK = grdCharacters.GetGridData( grdCharacters.row, G1_pk        ); 
                
                sChar      = grdCharacters.GetGridData( grdCharacters.row, G1_Character );
                
                sChar_Len  = grdCharacters.GetGridData( grdCharacters.row, G1_Length    );
                
                sType      = grdCharacters.GetGridData( grdCharacters.row, G1_Type      );
                
                sExample   = grdCharacters.GetGridData( grdCharacters.row, G1_Example   );
            }  
            else
            {
                TemplatePK = TemplatePK + "," + grdCharacters.GetGridData( grdCharacters.row, G1_pk        ); 
                
                sChar      = sChar      + "," + grdCharacters.GetGridData( grdCharacters.row, G1_Character );
                
                sChar_Len  = sChar_Len  + "," + grdCharacters.GetGridData( grdCharacters.row, G1_Length    );
                
                sType      = sType      + "," + grdCharacters.GetGridData( grdCharacters.row, G1_Type      );
                
                sExample   = sExample   + "," + grdCharacters.GetGridData( grdCharacters.row, G1_Example   );
            }  
                
       }                      
       //------------------------------
       if ( select_auto_num_yn == "N" )
       {
            auto_num_end_yn = "Y";  
            txtPosAuto.text = Number(txtPosAuto.text) + 1;          
       }
       else
           txtPosAuto.text = Number(txtPosAuto.text) + Number(grdCharacters.GetGridData( grdCharacters.row, G1_Length ))
       
       //------------------------------
       ShowSelectedCharacter();
       //------------------------------
   }

}

//===========================================================================

function OnDelectChar()
{
       if (TemplatePK.length>0)
        {    
            
            for(var i =1 ; i<grdCharacters.rows; i++)
            {
                var pk = grdCharacters.GetGridData(i,G1_pk)
                if(pk == TemplatePK.substring(TemplatePK.lastIndexOf(',')+1,TemplatePK.length))
                {
                    var select =grdCharacters.GetGridData(i,G1_Type)
                    if (select=="N")
                    {
                        auto_num_end_yn="N";
                    }
                }
            }
            
            TemplatePK = TemplatePK.substr(0,TemplatePK.lastIndexOf(',')); 
            
            sChar      = sChar.substr(0,sChar.lastIndexOf(','));
            
            sChar_Len  = sChar_Len.substr(0,sChar_Len.lastIndexOf(','));
            
            sType      = sType.substr(0,sType.lastIndexOf(','));
            
            sExample   = sExample.substr(0,sExample.lastIndexOf(','));
        }
        //----------------------- 
        ShowSelectedCharacter() ;
        //-----------------------
}

//==============================================================================

function ShowTemp()
{
    //--------------------------
    txtTemp_PK.text = grdTemplates.GetGridData( grdTemplates.row, 0) ;
       
    TemplatePK      = grdTemplates.GetGridData( grdTemplates.row, 1) ; 
    sChar           = grdTemplates.GetGridData( grdTemplates.row, 2) ;
    sExample        = grdTemplates.GetGridData( grdTemplates.row, 3) ;
    sCurrentSeqNo   = grdTemplates.GetGridData( grdTemplates.row, 7) ;
    
    SetUSE_YN.value = grdTemplates.GetGridData( grdTemplates.row, 4) ;
    txtCurrentSeqNo.text = sCurrentSeqNo ;
    //--------------------------
    auto_num_end_yn = "Y" ;
    ShowSelectedCharacter(); 
    //--------------------------            
}

//==============================================================================

function OnReset()
{
    txtTemp_PK.text     = "" ;
    txt_Code_Temp.text  = "" ;
    txtCode_Sample.text = "" ;
    TemplatePK          = "" ;
    sChar               = "" ;
    sChar_Len           = "" ;
    sExample            = "" ; 
    sType               = "" ;
    auto_num_end_yn                = "N" ;
}
//==============================================================================
function OnDataReceive(obj)
{
    
    switch (obj.id)
    {
        case 'agds00010_1' :
        
             TemplatePK = txtChar_pks.text ;
             sChar      = txtChars.text ;
             sExample   = txtTemps.text ;
             //------------------------
             agds00010_2.Call("SELECT");
             
        break;     

        case 'agds00010' :         
              
              if ( grdCharacters.rows > 1 )
              {
                    grdCharacters.SetCellBold( 1, G1_Character, grdCharacters.rows - 1, G1_Character, true);
                    //------------------------
                    for ( var i = 1 ; i <= grdCharacters.rows - 1 ; i ++ )
                    {
                        if ( grdCharacters.GetGridData( i, G1_Be_Used_YN ) == "Y"  )
                        {
                            grdCharacters.SetCellBold( 1, G1_Character, grdCharacters.rows - 1, G1_Character, true);
                            //-----------------------------------------------------
                            grdCharacters.GetGridControl().Cell( 6 , i , G1_Character , i, G1_Be_Used_YN ) = 0xCCFFFF;
                        }
                    }
              }
              
              agds00010_2.Call("SELECT");
              
        break;
        
        case 'agds00010_2' :
        
            var i
            for(i=1;i<grdTemplates.rows; i++)
            {
                  var s1 ,s2
                  s1 =  grdTemplates.GetGridData(i,2) 
                  grdTemplates.SetGridText(i,5,xreplace(s1,',',''))
                  s2 = grdTemplates.GetGridData(i,3)
                  grdTemplates.SetGridText(i,6,xreplace(s2,',',''))
                  if (grdTemplates.GetGridData(i,4).toString()=="Y" )
                  {
                      grdTemplates.GetGridControl().Cell( 6, i, 5, i, 5 )   = 0xd4d2ff;
                      grdTemplates.GetGridControl().Cell( 6, i, 6, i, 6 )   = 0xd4d2ff;
                   }
                   else
                   {
                      grdTemplates.GetGridControl().Cell( 6, i, 5, i, 5 )   = 0xffffff;
                      grdTemplates.GetGridControl().Cell( 6, i, 6, i, 6 )   = 0xffffff;
                   }
            }
            
            OnReset() ;
        break ;
        case 'agds00010_3':
            
            if(txtTable.text =='')
                break;
                
            var path = System.RootURL + "/standard/forms/ag/ds/agds00011.aspx?table_name=" + txtTable.text ;

             var object = System.OpenModal( path ,500 , 400 ,  'resizable:yes;status:yes');
             if ( object != null )
             {    	         
                grdCharacters.SetGridText( row_event , G1_Foreign_PK , object[1] );
             }
        break;
    }     
}

//==============================================================================

function CheckTemplateValid()
{
    if ( TemplatePK == "" )
    {
        alert("Invalid template!!")
        return false;
    }
    else
    {
       if( auto_num_end_yn == "N" )
       {
            alert("The template must be contain auto number!!!") ;
            return false;
       }
    }
    return true;
    
}

//==============================================================================

 function AfterEdit(obj)
 {
    var col, row

    switch (obj.id)
    {
        case 'grdCharacters' :
	         var row  = event.row ;
	         var col  = event.col ; 
	         
            if ( col == G1_Table )
            {
                 if ( grdCharacters.GetGridData( row, G1_Table) == '' )
                 {
                    grdCharacters.SetGridText( row, G1_Field, '' );
                    break ;
                 }
            
                 var path = System.RootURL + "/standard/forms/ag/ds/agds00011.aspx?table_name=" + grdCharacters.GetGridData( row, col) ;
	             var object = System.OpenModal( path ,500 , 400 , 'resizable:yes;status:yes');
	             if ( object != null )
	             {    	         
                    grdCharacters.SetGridText( row, G1_Field, object[1] );
                    //------------------------
	             }
            } 
            else if ( col == G1_Type )
            {
                if ( grdCharacters.GetGridData( row, G1_Type) == 'N' ) // |#D;Date|#N;Auto Number|#F;Data Field|#C;Constant 
                {
                    var dNum = grdCharacters.GetGridData( row, G1_Character) ;
                    
                    grdCharacters.SetGridText( row, G1_Character, !Number(dNum)?grdCharacters.SetGridText( row ,G1_Character ,""):grdCharacters.GetGridData( row, G1_Character)  );
                    
                    // Check Cardinal Type 
                    if ( grdCharacters.GetGridData( row, G1_Cardial) == 'N' ) // "N" : Non / "Y" : Au to Increase / "C" : Increase with Condition  
                    {
                        alert("Cardinal will be set up as Auto Increase !!!");
                        grdCharacters.SetGridText( row , G1_Cardial, "Y");
                    }
                    //----------------------                    
                }
                else if ( grdCharacters.GetGridData( row, G1_Type) == 'G' )
                {
                    grdCharacters.SetGridText( row, G1_Character, 'NONE' );
                }
            } 
            else if ( col == G1_Cardial )
            {
                if ( grdCharacters.GetGridData( row, G1_Cardial) == 'N' ) // "N" : Non / "Y" : Au to Increase / "C" : Increase with Condition  
                {
                    if ( grdCharacters.GetGridData( row, G1_Type) == 'N' )
                    {
                        alert("Type will be set up as Constant !!!");
                        grdCharacters.SetGridText( row , G1_Type, "C");
                    }
                }                                
            }              

        break;
 
    }   
 }
 
//==============================================================================

 function OnGridCellDoubleClick(obj)
 {
    var col, row

    switch (obj.id)
    {       
        case 'grdCharacters' :
	         var row  = event.row ;
	         var col  = event.col ; 
	         row_event = event.row ;
            if (( col == G1_Field )||( col == G1_PK_Field ))
            {
                 if ( grdCharacters.GetGridData( row, col - 1 ) == '' )
                 {
                    break ;
                 }
                 
                 var path = System.RootURL + "/standard/forms/ag/ds/agds00011.aspx?table_name=" + grdCharacters.GetGridData( row, G1_Table  ) ;

	             var object = System.OpenModal( path ,500 , 400 ,  'resizable:yes;status:yes');
	             if ( object != null )
	             {    	         
                    grdCharacters.SetGridText( row, col , object[1] );
	             }
            }    
            
            if (col==G1_Foreign_PK)
            {
                agds00010_3.Call();
            }
        break;
 
    }   
 }

//==============================================================================

 function OnSearch(obj)
 {
    switch (obj)
    {
        case 'CharactersList' :  
            agds00010.Call("SELECT");
        break;            
    }
 }
 
//==============================================================================

</script>

<body>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="sale.sp_sel_agds00010" procedure="sale.sp_upd_agds00010" > 
                <input> 
                    <input bind="lstCodeType" /> 
                </input>
               <output  bind="grdCharacters"/>                                   
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6"  function="sale.sp_sel_agds00010_1" procedure="sp_upd_agds00010_1"> 
                <input> 
                   <inout bind="txtTemp_PK" />
                   <inout bind="txtChar_pks" />
                   <inout bind="txtChars" />
                   <inout bind="txtTemps" />
                   <inout bind="lstCodeType" />
                   <inout bind="SetUSE_YN" />
                   <inout bind="txtPosAuto" />
                </input>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid"  function="sale.sp_sel_agds00010_2"  > 
                <input> 
                    <input bind="lstCodeType" />
                 </input>
               <output  bind="grdTemplates"/>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <gw:data id="agds00010_3" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="sale.sp_pro_agds00010_3" > 
            <input>
                <input bind="lstCodeType" />
            </input> 
            <output>
                <output bind="txtTable" />
            </output>
        </dso> 
    </xml> 
</gw:data>
    <!-------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td style="width: 60%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td width="10%" align="right">
                        </td>
                        <td width="15%" align="right">
                            Code Type
                        </td>
                        <td width="35%">
                            <gw:list id="lstCodeType" styles="color:blue;width:100%" onchange="OnSearch('CharactersList')" />
                        </td>
                        <td width="5%" align="right">
                            <gw:imgbtn id="btnSearch_C" img="search" alt="Search Characters" onclick="OnSearch('CharactersList')" />
                        </td>
                        <td width="5%" align="right">
                            <gw:imgbtn id="btnAdd_C" img="new" alt="Add Characters" onclick="OnAddNew('grdCharacters')" />
                        </td>
                        <td width="5%" align="right">
                            <gw:imgbtn id="btnDelete_C" img="delete" alt="Delete" onclick="OnDelete('grdCharacters')" />
                        </td>
                        <td width="5%" align="right">
                            <gw:imgbtn id="btnSave_C" img="save" alt="Save Characters" onclick="OnSave('grdCharacters')" />
                        </td>
                        <td width="10%" align="right">
                        </td>
                        <td width="10%" align="right">
                            <gw:imgbtn id="btnSelect" img="select" alt="Select Characters" onclick="OnSelectChar()" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="9">
                            <gw:grid id='grdCharacters' 
                                header='_PK|Character|Data Type|Length|Example|Table Name|Field Name|Pk Field Nm|Foreign Pk Field|Cardial No|Start Value|_lstCodeType|Format Date Condition|_Be_Used'
                                format='0|0|0|1|0|0|0|0|0|0|1|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                defaults='|||||||||||||'
                                editcol='0|1|1|1|1|0|0|1|1|1|1|0|1|0' 
                                widths='0|1500|1500|1000|1500|2000|2000|2000|2000|2000|1000|1500|0'
                                sorting='T' styles='width:100%; height:100%' 
                                param="0,1,2,3,4,5,6,7,8,9,10,11,12,13" 
                                onafteredit="AfterEdit(this)"
                                oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 15%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 30%">
                                    <td width="20%" align="right">
                                        USE</td>
                                    <td width="40%" align="left">
                                        <gw:checkbox id="SetUSE_YN" defaultvalue="Y|N" value="N" />
                                    </td>
                                    <td width="10%">
                                    </td>
                                    <td width="10%" align="right">
                                        <gw:imgbtn id="btnNew" img="new" alt="New Template" onclick="OnAddNew('Template')" />
                                    </td>
                                    <td width="10%" align="right">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete('Template')" />
                                    </td>
                                    <td width="10%" align="right">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Template')" />
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td align="right">
                                        ID Code</td>
                                    <td colspan="4">
                                        <gw:textbox id="txt_Code_Temp" styles="width:100%" />
                                    </td>
                                    <td align="right">
                                        <gw:imgbtn id="btnClear" img="reset" alt="Clear" onclick="OnDelectChar()" />
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td width="15%" align="right">
                                        Code Sample</td>
                                    <td width="30%" colspan="5">
                                        <gw:textbox id="txtCode_Sample" styles="width:100%" />
                                    </td>
                                    <td width="5%" align="right">
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td width="15%" align="right">
                                        Current Seq No</td>
                                    <td width="30%" colspan="5">
                                        <gw:textbox id="txtCurrentSeqNo" styles="width:100%" />
                                    </td>
                                    <td width="5%" align="right">
                                    </td>
                                </tr>                                
                                <tr style="height: 10%">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 85%">
                        <td style="width: 100%">
                            <gw:grid id="grdTemplates" 
                                header="_PK|_Character_pks|_Templates|_Example|_Used|Templates|Example|Current Seq No"
                                format="0|0|0|0|0|0|0|0" 
                                aligns="0|0|0|0|0|0|0|0" 
                                defaults="|||||||" 
                                editcol="0|0|0|0|0|0|0|0"
                                widths="0|0|0|0|0|3000|3000|1000" 
                                styles="width:100%; height:100%" 
                                sorting="T" oncellclick="ShowTemp()"
                                param="0,1,2,3,4,5" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtTemp_PK" text="" style="display: none" />
    <gw:textbox id="txtChar_pks" text="" style="display: none" /> 
    <gw:textbox id="txtChars" text="" style="display: none" />
    <gw:textbox id="txtTemps" text="" style="display: none" />
    <gw:textbox id="txtTable" text="" style="display: none" />
    <gw:textbox id="txtPosAuto" text="" style="display: none" />
    <!------------------------------------------------------------------------------>
</body>
</html>
