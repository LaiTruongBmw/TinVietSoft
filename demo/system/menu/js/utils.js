
var keyArray=null;
var isKeyboardLocked=false;

var isCtrlPressed = null;
var isAltPressed = null;
var isTabBlocked = false;
var pressedKeyCode = null;
var isInputFile = false;


/**
* Stops the propagation and the default action of the browser shortchut
* @param {Event} evt Event handling object.
*/
function stopKeyPressEvent(evt) {
  try {
    if (evt.ctrlKey) {
      evt.cancelBubble = true;
      evt.returnValue = false;
        if (evt.stopPropagation) {
          evt.preventDefault();
        }
    } else if (evt.altKey) {
      evt.cancelBubble = true;
      evt.returnValue = false;
        if (evt.stopPropagation) {
          evt.preventDefault();
        }
    }
  } catch(e) {}
}


/**
* Enables the propagation and the default action of the browser shortchut
* @param {Event} evt Event handling object.
*/
function startKeyPressEvent(evt) {
  return true;
}


/**
* Builds the keys array on each screen. Each key that we want to use should have this structure.
* @param {String} key A text version of the handled key.
* @param {String} evalfunc Function that will be eval when the key is is pressed.
* @param {String} field Name of the field on the window. If is null, is a global event, for the hole window.
* @param {String} auxKey Text defining the auxiliar key. The value could be CTRL for the Control key, ALT for the Alt, null if we don't have to use an auxiliar key.
* @param {Boolean} propagateKey True if the key is going to be prograpated or false if is not going to be propagated.
* @param {String} eventShotter Function that will launch the process.
*/
function keyArrayItem(key, evalfunc, field, auxKey, propagateKey, event) {
  this.key = key;
  this.evalfunc = evalfunc;
  this.field = field;
  this.auxKey = auxKey;
  this.propagateKey = propagateKey;
  this.eventShotter = event;
}
/**
* Defines the keys array for all the application.
*/
function getShortcuts(type) {
  if (type==null || type=="" || type=="null") {
  } else if (type=='applicationCommonKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("M", "executeMenuButton('buttonExpand');executeMenuButton('buttonCollapse');", null, "ctrlKey+shiftKey", false, 'onkeydown'),
        new keyArrayItem("U", "executeMenuButton('buttonUserOptions');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("Q", "executeMenuButton('buttonQuit');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("F8", "executeMenuButton('buttonAlerts');", null, null, false, 'onkeydown'),
        new keyArrayItem("F9", "menuShowHide();", null, null, false, 'onkeydown'),
        new keyArrayItem("I", "executeWindowButton('buttonAbout');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("H", "executeWindowButton('buttonHelp');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("R", "executeWindowButton('buttonRefresh');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("BACKSPACE", "executeWindowButton('buttonBack');", null, "ctrlKey+shiftKey", false, 'onkeydown')
      );
  } else if (type=='menuSpecificKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("M", "putFocusOnWindow();", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("TAB", "menuTabKey(true);", null, null, false, 'onkeydown'),
        new keyArrayItem("TAB", "menuTabKey(false);", null, null, false, 'onkeyup'),
        new keyArrayItem("TAB", "menuShiftTabKey(true);", null, "shiftKey", false, 'onkeydown'),
        new keyArrayItem("TAB", "menuShiftTabKey(false);", null, "shiftKey", false, 'onkeyup'),
        new keyArrayItem("ENTER", "menuEnterKey();", null, null, false, 'onkeydown'),
        new keyArrayItem("UPARROW", "menuUpKey(true);", null, null, false, 'onkeydown'),
        new keyArrayItem("RIGHTARROW", "menuRightKey();", null, null, false, 'onkeydown'),
        new keyArrayItem("DOWNARROW", "menuDownKey(true);", null, null, false, 'onkeydown'),
        new keyArrayItem("LEFTARROW", "menuLeftKey();", null, null, false, 'onkeydown'),
        new keyArrayItem("HOME", "menuHomeKey();", null, null, false, 'onkeydown'),
        new keyArrayItem("END", "menuEndKey();", null, null, false, 'onkeydown'),
        new keyArrayItem("UPARROW", "menuUpKey(false);", null, null, null, 'onkeyup'),
        new keyArrayItem("DOWNARROW", "menuDownKey(false);", null, null, null, 'onkeyup')
      );
  } else if (type=='windowCommonKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("M", "putFocusOnMenu();", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("F10", "swichSelectedArea();", null, null, false, 'onkeydown'),
        new keyArrayItem("N", "executeWindowButton('linkButtonNew',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("N", "executeWindowButton('linkButtonSave_Next',true);", null, "ctrlKey+shiftKey", false, 'onkeydown'),
        new keyArrayItem("G", "executeWindowButton('linkButtonSave_Relation',true);", null, "ctrlKey+shiftKey", false, 'onkeydown'),
        new keyArrayItem("S", "executeWindowButton('linkButtonSave',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("S", "executeWindowButton('linkButtonSave_New',true);", null, "ctrlKey+shiftKey", false, 'onkeydown'),
        new keyArrayItem("D", "executeWindowButton('linkButtonDelete');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("Z", "executeWindowButton('linkButtonUndo');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("A", "executeWindowButton('linkButtonAttachment');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("F", "executeWindowButton('linkButtonSearch');executeWindowButton('linkButtonSearchFiltered');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("HOME", "executeWindowButton('linkButtonFirst',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("END", "executeWindowButton('linkButtonLast',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("LEFTARROW", "executeWindowButton('linkButtonPrevious',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("RIGHTARROW", "executeWindowButton('linkButtonNext',true);", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("L", "executeWindowButton('linkButtonRelatedInfo');", null, "ctrlKey", false, 'onkeydown')
      );
  } else if (type=='editionSpecificKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("TAB", "windowTabKey(true);", null, null, false, 'onkeydown'),
        new keyArrayItem("TAB", "windowTabKey(false);", null, null, false, 'onkeyup'),
        new keyArrayItem("TAB", "windowShiftTabKey(true);", null, "shiftKey", false, 'onkeydown'),
        new keyArrayItem("TAB", "windowShiftTabKey(false);", null, "shiftKey", false, 'onkeyup'),
        new keyArrayItem("ENTER", "windowCtrlShiftEnterKey();", null, "ctrlKey+shiftKey", false, 'onkeydown'),
        new keyArrayItem("ENTER", "windowCtrlEnterKey();", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("G", "executeWindowButton('buttonRelation');", null, "ctrlKey", false, 'onkeydown')
      );
  } else if (type=='relationSpecificKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("TAB", "windowTabKey(true);", null, null, false, 'onkeydown'),
        new keyArrayItem("TAB", "windowTabKey(false);", null, null, false, 'onkeyup'),
        new keyArrayItem("TAB", "windowShiftTabKey(true);", null, "shiftKey", false, 'onkeydown'),
        new keyArrayItem("TAB", "windowShiftTabKey(false);", null, "shiftKey", false, 'onkeyup'),
        new keyArrayItem("G", "executeWindowButton('buttonEdition');", null, "ctrlKey", false, 'onkeydown'),
        new keyArrayItem("DELETE", "executeWindowButton('linkButtonDelete');", null, null, false, 'onkeydown'),
        new keyArrayItem("ENTER", "windowEnterKey();", null, null, true, 'onkeydown')
      );
  } else if (type=='gridKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("UPARROW", "windowUpKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("RIGHTARROW", "windowRightKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("DOWNARROW", "windowDownKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("LEFTARROW", "windowLeftKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("HOME", "windowHomeKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("END", "windowEndKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("REPAGE", "windowRepageKey();", null, null, true, 'onkeydown'),
        new keyArrayItem("AVPAGE", "windowAvpageKey();", null, null, true, 'onkeydown')
      );
  } else if (type=='popupSpecificKeys') {
      this.keyArray.splice(keyArray.length-1, 0,
        new keyArrayItem("ESCAPE", "parent.window.close();", null, null, false, 'onkeydown')
      );
  }
}


/**
* Returns the ASCII code of the given key
* @param {String} code Text version of a key
* @returns The ASCII code of the key
* @type Number
*/
function obtainKeyCode(code) {
  if (code==null) return 0;
  else if (code.length==1) return code.toUpperCase().charCodeAt(0);
  switch (code.toUpperCase()) {
    case "BACKSPACE": return 8;
    case "TAB": return 9;
    case "ENTER": return 13;
    case "SPACE": return 32;
    case "DELETE": return 46;
    case "INSERT": return 45;
    case "END": return 35;
    case "HOME": return 36;
    case "REPAGE": return 33;
    case "AVPAGE": return 34;
    case "LEFTARROW": return 37;
    case "RIGHTARROW": return 39;
    case "UPARROW": return 38;
    case "DOWNARROW": return 40;
    case "NEGATIVE": return 189;
    case "NUMBERNEGATIVE": return 109;
    case "DECIMAL": return 190;
    case "NUMBERDECIMAL": return 110;
    case "ESCAPE": return 27;
    case "F1": return 112;
    case "F2": return 113;
    case "F3": return 114;
    case "F4": return 115;
    case "F5": return 116;
    case "F6": return 117;
    case "F7": return 118;
    case "F8": return 119;
    case "F9": return 120;
    case "F10": return 121;
    case "F11": return 122;
    case "F12": return 123;
    case "P": return 80;
/*    case "shiftKey": return 16;
    case "ctrlKey": return 17;
    case "altKey": return 18;*/
    default: return 0;
  }
}


/**
* Handles the events execution of keys pressed, based on the events registered in the keyArray global array.
* @param {Event} pushedKey Code of the key pressed.
* @returns True if the key is not registered in the array, false if a event for this key is registered in keyArray array.
* @type Boolean
* @see #obtenerCodigoTecla
*/
function keyControl(pushedKey) {
  try {
    if (keyArray==null || keyArray.length==0) return true;
  } catch (e) {
    return true;
  }
  if (!pushedKey) pushedKey = window.event;
  var thereIsShortcut = false;
  isCtrlPressed = false;
  isAltPressed = false;
  if (pushedKey.ctrlKey) isCtrlPressed = true;
  if (pushedKey.altKey) isAltPressed = true;
  pressedKeyCode = pushedKey.keyCode;
  if (isTabPressed == true && isInputFile == true) {
    return true;
  }

  var keyCode = pushedKey.keyCode ? pushedKey.keyCode : pushedKey.which ? pushedKey.which : pushedKey.charCode;
  if (isKeyboardLocked==false) {
    var keyTarget = pushedKey.target ? pushedKey.target: pushedKey.srcElement;
    var total = keyArray.length;
    for (var i=0;i<total;i++) {
      if (keyArray[i] != null && keyArray[i] && keyArray[i].eventShotter != 'onkeyup' && pushedKey.type=='keydown') {
        if (keyCode == obtainKeyCode(keyArray[i].key)) {
          if (keyArray[i].auxKey == null || keyArray[i].auxKey == "" || keyArray[i].auxKey == "null") {
            if (!pushedKey.ctrlKey && !pushedKey.altKey && !pushedKey.shiftKey) {
              if (!keyArray[i].propagateKey || isGridFocused) {
                if (window.event && window.event.keyCode == 116) { //F5 Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
                if (window.event && window.event.keyCode == 121) { //F10 Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
                if (window.event && window.event.keyCode == 27) { //ESC Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
              }
              if (!keyArray[i].propagateKey || isGridFocused) 
                //document.onkeypress = stopKeyPressEvent;
              if (keyArray[i].field==null || (keyTarget!=null && keyTarget.name!=null && isIdenticalField(keyArray[i].field, keyTarget.name))) {
                var evalfuncTrl = replaceEventString(keyArray[i].evalfunc, keyTarget.name, keyArray[i].field);
                try {
                  eval(evalfuncTrl);
                  thereIsShortcut = true;
                  if (!keyArray[i].propagateKey || isGridFocused) 
                    return false; else 
                    return true;
                } catch (e) {
                  document.onkeypress = startKeyPressEvent;
                  return true;
                }
                document.onkeypress = startKeyPressEvent;
                return true;
              }
            }
          } else if (keyArray[i].field == null || (keyTarget!=null && keyTarget.name!=null && isIdenticalField(keyArray[i].field, keyTarget.name))) {
            var evalfuncTrl = replaceEventString(keyArray[i].evalfunc, keyTarget.name, keyArray[i].field);
            //if (!keyArray[i].propagateKey || isGridFocused) document.onkeypress = stopKeyPressEvent;
            if (keyArray[i].auxKey == "ctrlKey" && pushedKey.ctrlKey && !pushedKey.altKey && !pushedKey.shiftKey) {
              if (!keyArray[i].propagateKey || isGridFocused) document.onkeypress = stopKeyPressEvent;
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "altKey" && !pushedKey.ctrlKey && pushedKey.altKey && !pushedKey.shiftKey) {
              if (!keyArray[i].propagateKey || isGridFocused) document.onkeypress = stopKeyPressEvent;
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "shiftKey" && !pushedKey.ctrlKey && !pushedKey.altKey && pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "ctrlKey+shiftKey" && pushedKey.ctrlKey && !pushedKey.altKey && pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            }
          }
        }
      } else if (keyArray[i] != null && keyArray[i] && keyArray[i].eventShotter == 'onkeyup'  && pushedKey.type=='keyup') {
        if (keyCode == obtainKeyCode(keyArray[i].key)) {
          if (keyArray[i].auxKey == null || keyArray[i].auxKey == "" || keyArray[i].auxKey == "null") {
            if (!pushedKey.ctrlKey && !pushedKey.altKey && !pushedKey.shiftKey) {
              if (!keyArray[i].propagateKey || isGridFocused) {
                if (window.event && window.event.keyCode == 116) { //F5 Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
                if (window.event && window.event.keyCode == 121) { //F10 Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
                if (window.event && window.event.keyCode == 27) { //ESC Special case
                  window.event.keyCode = 8;
                  keyCode = 8;
                }
              }
              if (!keyArray[i].propagateKey || isGridFocused) 
                //document.onkeypress = stopKeyPressEvent;
              if (keyArray[i].field==null || (keyTarget!=null && keyTarget.name!=null && isIdenticalField(keyArray[i].field, keyTarget.name))) {
                var evalfuncTrl = replaceEventString(keyArray[i].evalfunc, keyTarget.name, keyArray[i].field);
                try {
                  eval(evalfuncTrl);
                  thereIsShortcut = true;
                  if (!keyArray[i].propagateKey || isGridFocused) 
                    return false; else 
                    return true;
                } catch (e) {
                  document.onkeypress = startKeyPressEvent;
                  return true;
                }
                document.onkeypress = startKeyPressEvent;
                return true;
              }
            }
          } else if (keyArray[i].field == null || (keyTarget!=null && keyTarget.name!=null && isIdenticalField(keyArray[i].field, keyTarget.name))) {
            var evalfuncTrl = replaceEventString(keyArray[i].evalfunc, keyTarget.name, keyArray[i].field);
            //if (!keyArray[i].propagateKey || isGridFocused) document.onkeypress = stopKeyPressEvent;
            if (keyArray[i].auxKey == "ctrlKey" && pushedKey.ctrlKey && !pushedKey.altKey && !pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "altKey" && !pushedKey.ctrlKey && pushedKey.altKey && !pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "shiftKey" && !pushedKey.ctrlKey && !pushedKey.altKey && pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            } else if (keyArray[i].auxKey == "ctrlKey+shiftKey" && pushedKey.ctrlKey && !pushedKey.altKey && pushedKey.shiftKey) {
              try {
                eval(evalfuncTrl);
                thereIsShortcut = true;
                document.onkeypress = startKeyPressEvent;
                if (!keyArray[i].propagateKey || isGridFocused) 
                  return false; else 
                  return true;
              } catch (e) {
                document.onkeypress = startKeyPressEvent;
                return true;
              }
              document.onkeypress = startKeyPressEvent;
              return true;
            }
          }
        }
      }
    }
  } else {
    return false;
  }
  if (isKeyboardLocked==false && thereIsShortcut==false && !isCtrlPressed && !isAltPressed && pushedKey.type=='keydown' && pressedKeyCode!='16' && pressedKeyCode!='17' && pressedKeyCode!='18') {
    alert(pressedKeyCode+" . Not defined command.")
  }
  return true;
}

/**
* Put the focus on the Menu frame
*/
function putFocusOnMenu() {
  //if (parent.frameAplicacion.selectedArea == 'tabs') parent.frameAplicacion.swichSelectedArea();
  //parent.frameMenu.focus();
  frmLeftMenu.focus();
  return true;
}

/**
* Put the focus on the Window frame
*/
function putFocusOnWindow() {
  parent.frameMenu.onBlurMenu();
  parent.frameAplicacion.selectedArea = 'window'
  parent.frameAplicacion.focus();
  parent.frameAplicacion.setWindowElementFocus(parent.frameAplicacion.focusedWindowElement);
  return true;
  //parent.frameAplicacion.focus();
}

/**
* Used to activate the key-press handling. Must be called after set the keys global array <em>keyArray</em>.
*/
function enableShortcuts(type) {
  if (type!=null && type!='null' && type!='') {
    try {
      this.keyArray = new Array();
      if (type=='menu') {
        getShortcuts('applicationCommonKeys');
        getShortcuts('menuSpecificKeys');
      } else if (type=='edition') {
        getShortcuts('applicationCommonKeys');
        getShortcuts('windowCommonKeys');
        getShortcuts('editionSpecificKeys');
        enableDefaultAction();
      } else if (type=='relation') {
        getShortcuts('applicationCommonKeys');
        getShortcuts('windowCommonKeys');
        getShortcuts('relationSpecificKeys');
        getShortcuts('gridKeys');
      } else if (type=='popup') {
        getShortcuts('applicationCommonKeys');
        getShortcuts('windowCommonKeys');
        getShortcuts('editionSpecificKeys');
        getShortcuts('popupSpecificKeys');
        getShortcuts('gridKeys');
        enableDefaultAction();
      }
    } catch (e) {
    }
  }
  document.onkeydown=keyControl;
  document.onkeyup=keyControl;  
}



/**
* Function Description
* @param {String} eventoJS
* @param {String} inputname
* @param {String} arrayName
* @returns
* @type String
* @see #ReplaceText
*/
function replaceEventString(eventoJS, inputname, arrayName) {
  eventoJS = ReplaceText(eventoJS, "@inputname@", inputname);
  if (arrayName!=null && arrayName!="" && arrayName.substring(arrayName.length-1)=="%") {
    var endname = inputname.substring(arrayName.length-1);
    eventoJS = ReplaceText(eventoJS, "@endinputname@", endname);
  }
  return eventoJS;
}

function setClass(id, selectClass) {
  var obj = getReference(id);
  if (obj==null) return null;
  obj.className = selectClass;
}

function getObjectClass(id, previousClass) {
  var obj = getReference(id);
  if (obj==null) return previousClass;
  return(obj.className);
}

/**
* Replace the occurrence of the search string with the replacement string
* @param {String} texto The original String.
* @param {String} replaceWhat The search String.
* @param {String} replaceWith The replacement String.
* @returns A String with the replaced text.
* @type String
*/
function ReplaceText(texto, replaceWhat, replaceWith) {
  if (texto==null || texto.length==0) return "";
  texto += "";
  var i = texto.indexOf(replaceWhat);
  var j = 0;
  while (i!=-1) {
    var partial = texto.substring(0, i);
    texto = texto.substring(i+replaceWhat.length);
    texto = partial + replaceWith + texto;
    j = i + replaceWith.length;
    i = texto.indexOf(replaceWhat, j);
  }
  return texto;
}
