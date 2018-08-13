<!-- #include file="../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Combine Lot</title>
</head>
<%  ESysLib.SetUser("prod")%>

<script>
var
g_pk  =0,
g_order = 1,
g_lotno_pk =2,
g_lotno =3,
g_item_pk =4,
g_item_code =5,
g_item_name =6,
g_cur_lotno_pk =7,
g_weight =8,
g_lenght =9,
g_remark =10,
g_master_pk = 11;
 var callerWindowObj = dialogArguments;     
        
//------------------------------------------------------------------------
function BodyInit()
{
  
    var type  = "<%=request.QueryString("type")%>";
    current_roll_pk  = callerWindowObj.txtRollPK.text  ,  
    current_roll_id  = callerWindowObj.txtRollId.text  ,  
    item_pk   = callerWindowObj.txtItemPk.text  ,
    txtType.text = type ;
    combineMPK = callerWindowObj.txtCombineMPK.text;
    
    txtCurRollID.SetEnable(false);
    txtCurLength.SetEnable(false);
    txtCurWeight.SetEnable(false);
    txtCurItemID.SetEnable(false);
    txtCurItemName.SetEnable(false);
    
    txtCombineMPK.text = combineMPK
    if(txtCombineMPK.text == "")
       { 
         txtCurRollID.text = current_roll_id;
         pro_fpep00043_1.Call('SELECT')
       }
    else
        {
            fpep00043_3.Call('SELECT')
        } 
    //BindingDataList();
}
function OnPopUp()
 {
       var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?type='+txtType.text ;
             path = path + '&item_pk='  + txtCurItemPK.text ;
               
         var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
         if ( obj != null )
         {
             txtNewRollPK.text = obj[0]; //tpr_lotno_pk
             txtNewRollID.text = obj[1]; //LOT NO
             txtNewItemPK.text = obj[4]; //item pk
             txtNewItemPK.text = obj[5]; //item id
             txtNewItemPK.text = obj[6]; //item name
             OnEnterRoll()
         }	 
}
function OnEnterRoll()
{
    pro_fpep00043_2.Call('SELECT')
}
function OnUnCombine()
{
    fpep00043_6.Call();
}
function OnOK()
{
    
    if (txtNewRollID.text != '')
    {
        if(callerWindowObj.txtCombineMPK.text != txtCombineMPK.text )
        {
              callerWindowObj.txtCombineMPK.text = txtCombineMPK.text
              callerWindowObj.txtRollId.text = txtNewRollID.text
        }
    }
    window.close();
}
function OnCombine1()
{
    //Current
    grdCombine.AddRow()
    grdCombine.SetGridText(grdCombine.rows -1 , g_order ,1)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_pk ,txtCurItemPK.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_code ,txtCurItemID.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_name ,txtCurItemName.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lotno_pk ,txtCurRollPK.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lotno ,txtCurRollID.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_weight ,txtCurWeight.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lenght ,txtCurLength.text)
    //New
    grdCombine.AddRow()
    grdCombine.SetGridText(grdCombine.rows -1 , g_order ,2)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_pk ,txtNewItemPK.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_code ,txtNewItemID.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_item_name ,txtNewItemName.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lotno_pk ,txtNewRollPK.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lotno ,txtNewRollID.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_weight ,txtNewWeight.text)
    grdCombine.SetGridText(grdCombine.rows -1 , g_lenght ,txtNewLength.text)
    
    if(txtCombineMPK.text =="")
    { 
        flag =1;
        fpep00043_3.StatusInsert();
        fpep00043_3.Call();
    }
    
}
var flag =0;
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'fpep00043_4':
             if(flag==2)
            {
                flag=0;
                fpep00043_5.Call();
            }else
            {
                if (grdCombine.rows >1)
                {
                
                 txtCurItemPK.text = grdCombine.GetGridData(1,g_item_pk);
                 txtCurItemID.text = grdCombine.GetGridData(1,g_item_code);
                 txtCurItemName.text = grdCombine.GetGridData(1,g_item_name);;
                 txtCurRollPK.text =  grdCombine.GetGridData(1,g_lotno_pk);
                 txtCurRollID.text = grdCombine.GetGridData(1,g_lotno);
                 txtCurWeight.text = grdCombine.GetGridData(1,g_weight);
                 txtCurLength.text =  grdCombine.GetGridData(1,g_lenght);
                 
                 txtNewItemPK.text = grdCombine.GetGridData(2,g_item_pk);
                 txtNewItemID.text = grdCombine.GetGridData(2,g_item_code);
                 txtNewItemName.text = grdCombine.GetGridData(2,g_item_name);
                 txtNewRollPK.text =  grdCombine.GetGridData(2,g_lotno_pk);
                 txtNewRollID.text = grdCombine.GetGridData(2,g_lotno);
                 txtNewWeight.text = grdCombine.GetGridData(2,g_weight);
                 txtNewLength.text =  grdCombine.GetGridData(2,g_lenght);
                }
            }
        break;
        case 'fpep00043_3':
            if(flag==1)
            {
               if(txtNewItemPK.text != "")
               {
                    for ( i = 1; i < grdCombine.rows ; i++ )
                    {
                            grdCombine.SetGridText( i , g_master_pk, txtCombineMPK.text ) ;
                    } 
                    flag=2
                    fpep00043_4.Call() 
                   
                }
               else
                    alert('Please select new roll!')
            }else
            {
                 fpep00043_4.Call('SELECT') 
            }
        break;
        case 'pro_fpep00043_2':
              if(txtNewItemPK.text != txtCurItemPK.text)
              {
                alert("New Roll must be the same item as current Roll!")
                txtNewItemPK.text = "";
                txtNewItemID.text = "";
                txtNewItemName.text = "";
                txtNewRollPK.text =  "";
                txtNewRollID.text = "";
                txtNewWeight.text = "";
                txtNewLength.text =  "";
              }
              if( txtNewRollPK.text == txtCurRollPK.text)
              {
                 alert("New Roll must difference from current Roll")
                txtNewItemPK.text = "";
                txtNewItemID.text = "";
                txtNewItemName.text = "";
                txtNewRollPK.text =  "";
                txtNewRollID.text = "";
                txtNewWeight.text = "";
                txtNewLength.text =  "";
              }
        break;
        case 'fpep00043_5':
            alert(txtStatus.text)
        break;
         case 'fpep00043_6':
            alert(txtStatus.text)
        break;
       }
}
    
</script>

<body>
   <!------------------------------find result----------------------------------->
    <gw:data id="pro_fpep00043_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="PROD.sp_pro_fpep00043_1_1"  > 
                 <inout > 
                     <inout bind="txtCurRollID" /> 
                     <inout bind="txtCurRollPK" />
                     <inout bind="txtCurItemPK" /> 
                     <inout bind="txtCurItemID" /> 
                     <inout bind="txtCurItemName" /> 
                     <inout bind="txtCurWeight" />
                     <inout bind="txtCurLength" />
                 </inout> 
             </dso> 
        </xml> 
    </gw:data>
    
    <!------------------------------find result----------------------------------->
    <gw:data id="pro_fpep00043_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="PROD.sp_pro_fpep00043_1_1"  > 
                 <inout > 
                     <inout bind="txtNewRollID" /> 
                     <inout bind="txtNewRollPK" />
                     <inout bind="txtNewItemPK" /> 
                     <inout bind="txtNewItemID" /> 
                     <inout bind="txtNewItemName" />
                     <inout bind="txtNewWeight" />
                     <inout bind="txtNewLength" />
                 </inout> 
             </dso> 
        </xml> 
    </gw:data>
    <!-----------------------------------Combine master------------------------------------------>
      <gw:data id="fpep00043_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="prod.sp_sel_fpep00043_1_2" parameter="0,1" procedure="PROD.SP_UPD_FPEP00043_1_2" > 
                <inout > 
                     <inout bind="txtCombineMPK" /> 
                     <inout bind="txtCurRollPK" /> 
                </inout> 
             </dso> 
         </xml> 
      </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="fpep00043_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="prod.sp_sel_fpep00043_1_3" parameter="0,1,2,3,4,5,6,7,8,9,10,11" procedure="prod.sp_upd_fpep00043_1_3" > 
                <input bind="grdCombine" > 
                     <input bind="txtCombineMPK" /> 
                </input> 
                <output bind="grdCombine" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------combine----------------------------------->
    <gw:data id="fpep00043_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_pro_fpep00043_1_4"  > 
                 <input >  
                     <input bind="txtCombineMPK" />
                 </input> 
                 <output>
                    <ouput bind="txtStatus" />
                 </output>
             </dso> 
        </xml> 
    </gw:data>
      <!------------------------------Un combine----------------------------------->
     <gw:data id="fpep00043_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"  procedure="prod.sp_pro_fpep00043_1_5"  > 
                 <input >  
                     <input bind="txtCombineMPK" />
                 </input> 
                 <output>
                    <ouput bind="txtStatus" />
                 </output>
             </dso> 
        </xml> 
    </gw:data>
    
    <table style="height: 100%; width: 100%" cellpadding="1" cellspacing="1">
        <tr>
            <td width="15%" align="right">
                Current Item
            </td>
            <td width="25%">
                  <gw:textbox id="txtCurItemID" styles="width:100%" />
            </td>
            <td width="30%" colspan="3">
                  <gw:textbox id="txtCurItemName" styles="width:100%" />
            </td>
        </tr>
        <tr style="height: 5%">
            <td width="15%" align="right">
                <b id="Roll">Current Roll </b>
            </td>
            <td width="25%">
                <gw:textbox id="txtCurRollPK" styles="display:none" />
                <gw:textbox id="txtCurRollID" styles="width:100%" />
            </td>
            <td width="30%" align="right">
                <gw:textbox id="txtCurLength" styles="width:100%" />
            </td>
             <td width="5%">(M)</td>
            <td width="30%" align="right">
                <gw:textbox id="txtCurWeight" styles="width:100%" />
            </td>
             <td width="5%">(KG)</td>
        </tr>
        <tr>
            <td  colspan="6"><hr style="border-color:Blue" /> </td>
        </tr>
        <tr>
            <td width="15%" align="right">
                New Item
            </td>
            <td width="25%">
                  <gw:textbox id="txtNewItemID" styles="width:100%" />
            </td>
            <td width="30%" colspan="3">
                  <gw:textbox id="txtNewItemName" styles="width:100%" />
            </td>
        </tr>
        <tr style="height: 5%">
            <td width="15%" align="right">
               <a style="text-decoration: none; color:#0000ff;" href='#tips' title="Select Roll"
                                                    onclick="OnPopUp('Roll')">New Roll </a>
            </td>
            <td width="25%">
                <gw:textbox id="txtNewRollPK" styles="display:none" />
                <gw:textbox id="txtNewRollID" styles="width:100%" />
            </td>
            <td width="25%" align="right">
                <gw:textbox id="txtNewLength" styles="width:100%" />
            </td>
             <td width="5%">(M)</td>
            <td width="25%" align="right">
                <gw:textbox id="txtNewWeight" styles="width:100%" />
            </td>
            <td width="5%">(KG)</td>
        </tr>
        <tr style="height:8%">
            <td width="15%" align="right" colspan ="6">
               <table>
                   <tr>
                        <td style="width:50%">
                            
                        </td>
                        <td >
                             <gw:icon id="btnCombine" text="Combine"  onclick="OnCombine1()" />
                        </td>
                        <td  align="right">
                            <gw:icon id="btnUCombine" text="Uncombine"  onclick="OnUnCombine()" />
                        </td>
                        <td align="right">
                            <gw:icon id="btnOK" text="OK"  onclick="OnOK()" />
                        </td>
                   </tr>
               </table>
            </td>            
        </tr>
    </table>
    <!--------------------------------------------------------------------------------------->
    <gw:textbox id="txtCurItemPK" styles="width:100%;display:none" />
    <gw:textbox id="txtNewItemPK" styles="width:100%;display:none" />
    <gw:textbox id="txtType" styles="width:100%;display:none" />
    <gw:textbox id="txtItemUOM" styles="width:100%;display:none" />
     <gw:grid id='grdCombine'
        header='_PK|COMBINE_ORDER|_TPR_LOTNO_PK|LOT_NO|_TCO_ITEM_PK|ITEM_CODE|ITEM_NAME|_CURRENT_LOTNO_PK|TPR_WEIGHT|TPR_LENGHT|REMARK|_Master_pk'
        format='0|0|0|0|0|0|0|0|1|1|0|0'
        aligns='0|0|0|0|0|0|0|0|0|0|0|0'
        defaults='|||||||||||'
        editcol='0|0|0|0|0|0|0|0|0|0|0|0'
        widths='0|1000|0|1500|0|1500|2500|0|1500|1500|0|0'
        sorting='T'
        styles='width:100%; height:100%; display:none'
        />
    <!--------------------------------------------------------------------------------------->
    <gw:textbox id="txtCombineMPK" styles="width:100%;display:none" />
    <gw:textbox id="txtStatus" styles="width:100%;display:none" />
</body>
</html>
