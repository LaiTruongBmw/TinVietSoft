
<html xmlns:gw >
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
<meta http-equiv="Expires" content="Mon,06 Jan 1990 00:00:01 GMT"/>
  <LINK  href="/demo/system/default.css" rel="stylesheet" />
  <LINK  href="/demo/system/controls/css/button/style.css" rel="stylesheet" />
  
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/vsflexgridconst.js"></script>
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/default.js"></script>
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/common.js"></script>
  <script LANGUAGE="JavaScript" SRC= "/demo/system/lib/template.js"></script>
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/globalVar.js"></script>
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/ajax.js"></script>
  <script LANGUAGE="JavaScript" SRC="/demo/system/lib/soapclient.js"></script>
</head>


<style>
  @media all
  {
  gw\:textbox  {  behavior: url(/demo/system/controls/textbox.htc) ;  }
  gw\:button  {  behavior: url(/demo/system/controls/button.htc?v=180701_02) ;  }
  gw\:icon {  behavior: url(/demo/system/controls/icon.htc) ;  }
  gw\:label {  behavior: url(/demo/system/controls/label.htc) ;  }
  gw\:htmledit {  behavior: url(/demo/system/controls/htmledit.htc) ;  }
  gw\:treeview {  behavior: url(/demo/system/controls/treeview.htc) ;  }
  gw\:grid {  behavior: url(/demo/system/controls/grid.htc?v=180412_16) ;  }
  gw\:datagrid {  behavior: url(/demo/system/controls/datagrid.htc) ;  }
  gw\:gridhtml {  behavior: url(/demo/system/controls/gridhtml.htc) ;  }
  gw\:textarea {  behavior: url(/demo/system/controls/textarea.htc) ;  }
  gw\:radio {  behavior: url(/demo/system/controls/radio.htc) ;  }
  gw\:checkbox {  behavior: url(/demo/system/controls/checkbox.htc) ;  }
  gw\:list {  behavior: url(/demo/system/controls/list.htc) ; }
  gw\:tab {  behavior: url(/demo/system/controls/tab.htc) ;  }
  gw\:datebox {  behavior: url(/demo/system/controls/datebox.htc) ;  }
  gw\:image{  behavior: url(/demo/system/controls/image.htc) ;  }
  gw\:data{  behavior: url(/demo/system/controls/data.htc) ;  }
  gw\:tree {  behavior: url(/demo/system/controls/tree.htc) ;  }
  gw\:download  {  behavior: url(/demo/system/controls/download.htc) ;  }
  gw\:imgBtn {  behavior: url(/demo/system/controls/imageBtn.htc) ;  }
  gw\:neogrid{  behavior: url(/demo/system/controls/neogrid.htc) ;  }
  gw\:label2 {  behavior: url(/demo/system/controls/label2.htc) ;  }
  }
  v\:* {behavior:url(#default#VML);}
  o\:* {behavior:url(#default#VML);}
  .shape {behavior:url(#default#VML);}
  .effect { behavior:  url(/demo/system/lib/effect.htc) }


</style>
  <script>
    function BodyInitInternal()
    {
            
         if ( typeof(BodyInit) != "undefined" )
             window.setTimeout("BodyInit()", 0);
    }

    function BodyCloseInternal()
    {
      if ( typeof(BodyClose) != "undefined" )
      BodyClose();
    }

    window.onload = BodyInitInternal;
    window.onunload = BodyCloseInternal;
  </script>  