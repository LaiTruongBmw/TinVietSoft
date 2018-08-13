using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Xml;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OracleClient;

namespace Ctl
{
    public class DSOHandler : IHttpHandler, IReadOnlySessionState
    {
        private string _dsoType, _action, _user_id;
        private string _function = "", _procedure = "", _dbuser = "", _dbpass = "";
        private string _p_rtn_value;
        private string _parameter = "", _exeStatement = "";
        private string _errorno, _errormsg;
        private string _logmsg = "";
        private XmlDocument _clientXMLDoc;

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        
        public void ProcessRequest(HttpContext ctx)
        {
            _dsoType = ctx.Request["dso_type"];
            _action = ctx.Request["action"];
			//check session timeout
			// Produce XML response
			ctx.Response.ContentType = "application/xml";
			ctx.Response.Flush();
			//ctx.Response.BufferOutput = true;
			XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding());
		
			if(ctx.Session["User_ID"] != null){
				_user_id = ctx.Session["User_ID"].ToString();
			}else{
				_user_id = "";
			}
			
			if (_user_id == null || _user_id == "")
			{
				_user_id = "sss";
				_errorno = "100";
				_errormsg = "Your session was timeout. Please logout and login again.";
				SaveLogData();
				BuildErrorXML(xw);
				xw.Close();
				return;
			}
			
            if (_dsoType != "menu")
            {
                if (ctx.Request.InputStream.Length > 0 && ctx.Request.ContentType.ToLower().IndexOf("/xml") > 0)
                {
                    _clientXMLDoc = new XmlDocument();
                    _clientXMLDoc.Load(ctx.Request.InputStream);
                    _function = _clientXMLDoc.ChildNodes[0].ChildNodes[0].InnerText;
                    if (_function.Length > 3 && _function != "null")
                    {
                        if (_function.IndexOf(".", 0) > 0)
                        {
                            _dbuser = _function.Substring(0, _function.IndexOf(".", 0));
                            _dbpass = _dbuser + "2";
                            if (_dbuser.ToUpper() != "CTL")
                            {
                                _dbuser = ctx.Session["APP_DBUSER"].ToString();
                                _dbpass = ctx.Session["APP_DBPASS"].ToString();
                                _function = _function.Substring(_function.IndexOf(".", 0) + 1, _function.Length - _function.IndexOf(".", 0) - 1 );
                            }
                        
                        }
                        else
                        {
                            _dbuser = ctx.Session["APP_DBUSER"].ToString();
                            _dbpass = ctx.Session["APP_DBPASS"].ToString();
                        }
                    }
                    else
                    {
                        if (_dsoType == "process" || _dsoType == "list")
                        {
                            _procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[0].InnerText;
                        }
                        else
                        {
                            _procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[1].InnerText;
                        }

                        if (_procedure.IndexOf(".", 0) > 0)
                        {
                            _dbuser = _procedure.Substring(0, _procedure.IndexOf(".", 0));
                            _dbpass = _dbuser + "2";

                            if (_dbuser.ToUpper() != "CTL")
                            {
                                _dbuser = ctx.Session["APP_DBUSER"].ToString();
                                _dbpass = ctx.Session["APP_DBPASS"].ToString();
                            }
                        }
                        else
                        {
                            _dbuser = ctx.Session["APP_DBUSER"].ToString();
                            _dbpass = ctx.Session["APP_DBPASS"].ToString();
                        }
                    }

                    if (_dsoType == "process" || _dsoType == "list")
                    {
                        _procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[0].InnerText;

                        if (_dbuser.ToUpper() != "CTL")
                        {
                            _procedure = _procedure.Substring(_procedure.IndexOf(".", 0)+1, _procedure.Length - _procedure.IndexOf(".", 0)-1);
                        }
                    }
                    else
                    {
                        _procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[1].InnerText;

                        if (_dbuser.ToUpper() != "CTL")
                        {
                            _procedure = _procedure.Substring(_procedure.IndexOf(".", 0) + 1, _procedure.Length - _procedure.IndexOf(".", 0)-1);
                        }
                    }
                }
            
            
                xw.Close();
                switch (_action)
                {
                    case "SELECT": ExecuteSQLSelect(ctx);
                        break;
                    case "UPDATE": ExecuteSQLUpdate(ctx);
                        break;
                    case "PROCESS":
                        ExecuteSQLExtension(ctx);
                        break;
                    case "BINARY":
                        SaveBinay(ctx);
                        break;
                    case "SELECT_BINARY":
                        SelectBinay(ctx);
                        break;
                    default: ExecuteSQLSelect(ctx);
                        break;
                }
            } else {
                string menu_list = Bind_Menu(ctx);
                //ctx.Response.ContentType = "application/xml";
                ctx.Response.Write(menu_list);
            }        
        }

        private string Bind_Menu(HttpContext ctx)
        {
            string xmlRespone = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
            int idx = 0;
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=ctl;Password=ctl2";
            OracleConnection connection = new OracleConnection(conString);
            OracleCommand command = new OracleCommand();
            DataTable dt = new DataTable();

            string content = "";
            string _language = ctx.Request["language"];
            string _db_user = ctx.Request["dbu"];
            string _ac_user = ctx.Request["dba"];
            try
            {
                connection.Open();
                command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                command.CommandText = "Call ctl.sp_get_menus_language('" + ctx.Session["LOGIN_ID"].ToString() + "','" + _language + "','" + _db_user + "','" + _ac_user + "',:p_rtn_value)";
                command.Connection = connection;

                OracleDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    dt.Load(reader);
                }

                xmlRespone += "<data><sverror><![CDATA[Y]]></sverror>";
                for (int x = 0; x < dt.Rows.Count; x++)
                {
                    xmlRespone += "<rows>";
                    for (int y = 0; y < dt.Columns.Count; y++)
                    {
                        xmlRespone += "<cols><![CDATA[" + dt.Rows[x][y].ToString() + "]]></cols>";
                    }
                    xmlRespone += "</rows>";
                }
                xmlRespone += "</data>";
                /*
                for (int x = 0; x < dt.Rows.Count; x++) {
                    if (x < dt.Rows.Count - 1) {
                        if (dt.Rows[x][1].ToString() == "M" && dt.Rows[x + 1][1].ToString() == "M")
                        {
                            if(x != 0) master += "</master>";
                            master += "<master>"; idx++;
                            for (int y = 0; y < dt.Columns.Count; y++)
                            {
                                switch (y)
                                {
                                    case 0:
                                        master += "<i_id><![CDATA[fd" + idx.ToString() + "]]></i_id>";
                                        master += "<i_sub><![CDATA[sub" + idx.ToString() + "]]></i_sub>";
                                        master += "<i_sub><![CDATA[sub" + idx.ToString() + "]]></i_sub>";
                                        master += "<i_mn_id><![CDATA[" + dt.Rows[x][y].ToString() + "]]></i_mn_id>";
                                        break;
                                    case 2: master += "<i_mn_pk><![CDATA[" + dt.Rows[x][y].ToString() + "]]></i_mn_pk>"; break;
                                    case 3: master += "<i_mn_name><![CDATA[" + dt.Rows[x][y].ToString() + "]]></i_mn_name>"; break;
                                    case 4: master += "<i_mn_lname><![CDATA[" + dt.Rows[x][y].ToString() + "]]></i_mn_lname>"; break;
                                }
                            }
                        }//MT

                        if (dt.Rows[x][1].ToString() == "M" && dt.Rows[x + 1][1].ToString() == "I") {
                            detail += "<detail>";    
                            detail += "<title>";
                            detail += "<ii_mn_name><![CDATA[" + dt.Rows[x][3].ToString() + "]]></ii_mn_name>";
                            detail += "</title>";
                            detail += "</detail>";
                        }
                        master += detail;

                    } else master += "</master>";
                }
                xmlRespone += master;
                xmlRespone += "</data>";*/
            }
            catch (Exception ex)
            {
                xmlRespone += "<data><sverror><![CDATA[" + ex.Message + "]]></sverror></data>";
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
			/*CtlLib.WriteLogFile(xmlRespone);/**/
            return xmlRespone;
        }
        
        private void SaveBinay(HttpContext ctx)
        {
            string connString = ConfigurationManager.AppSettings["strConn"];
            connString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            XmlNodeList xinputs;
            OracleConnection connection = new OracleConnection(connString);
            connection.Open();
            OracleCommand command = connection.CreateCommand();

            string table_name, master_pk, table_pk, content, content_type;
            
            try
            {
                //get input parameter listt
                xinputs = _clientXMLDoc.SelectNodes("//input");


                _parameter = xinputs[0].InnerText;

                parameter = _parameter.Split(CDelimeter, System.StringSplitOptions.None);

                table_name = parameter[0];
                master_pk = parameter[1];
                table_pk = parameter[2];
                content_type = parameter[3];
                content = parameter[4];

                OracleLob tempLob;
                OracleTransaction tx;
                Byte[] buff = System.Text.UTF8Encoding.ASCII.GetBytes(content);
                int docLen = buff.Length;

                tx = connection.BeginTransaction();
                command = connection.CreateCommand();
                command.Transaction = tx;

                command.CommandText = "declare xx blob; begin dbms_lob.createtemporary(xx, false, 0); :tempblob := xx; end;";
                command.Parameters.Add("tempblob", OracleType.Blob).Direction = ParameterDirection.Output;
                command.Parameters["tempblob"].Size = docLen;
                command.ExecuteNonQuery();

                tempLob = (OracleLob)command.Parameters[0].Value;
                tempLob.BeginBatch(OracleLobOpenMode.ReadWrite);
                tempLob.Write(buff, 0, buff.Length);
                tempLob.EndBatch();

                command.Parameters.Clear();

                command.CommandText = _procedure;
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("p_table_name", OracleType.VarChar, 100);
                command.Parameters["p_table_name"].Value = table_name;
                
                command.Parameters.Add("p_table_pk", OracleType.VarChar, 20);
                command.Parameters["p_table_pk"].Value = master_pk;

                command.Parameters.Add("p_pk", OracleType.VarChar, 20);
                command.Parameters["p_pk"].Value = table_pk;

                command.Parameters.Add("p_content_type", OracleType.VarChar, 20);
                command.Parameters["p_content_type"].Value = content_type;

                command.Parameters.Add("p_data", OracleType.Blob);
                command.Parameters["p_data"].Value = tempLob;
                command.Parameters["p_data"].Size = tempLob.ChunkSize;

                command.Parameters.Add("p_crt_by", OracleType.VarChar, 20);
                command.Parameters["p_crt_by"].Value = _user_id;

                command.Parameters.Add("p_rtn_pk", OracleType.VarChar, 200);
                command.Parameters["p_rtn_pk"].Direction = ParameterDirection.Output;

                command.ExecuteNonQuery();
                tx.Commit();
                _p_rtn_value = command.Parameters["p_rtn_pk"].Value.ToString();

                SaveLogData();
                ExecuteSQLSelect(ctx);
            }
            catch (Exception ex)
            {
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }

        private void SelectBinay(HttpContext ctx)
        {
            string connString = ConfigurationManager.AppSettings["strConn"];
            connString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            XmlNodeList xinputs;
            OracleConnection connection = new OracleConnection(connString);
            connection.Open();
            OracleCommand command = connection.CreateCommand();

            string table_name, table_pk;

            try
            {
                //get input parameter listt
                xinputs = _clientXMLDoc.SelectNodes("//input");


                _parameter = xinputs[0].InnerText;

                parameter = _parameter.Split(CDelimeter, System.StringSplitOptions.None);

                table_name = parameter[0];
                table_pk = parameter[1];

                string sqlText = "select * from " + table_name + " where pk =" + table_pk;
                command.CommandText = sqlText;
                OracleDataReader dr = command.ExecuteReader();
                if (dr.Read())
                {
                    Byte[] buff = (byte[])dr["DATA"];
                    _p_rtn_value = System.Text.ASCIIEncoding.ASCII.GetString(buff);
                }
                
                SaveLogData();

                ExecuteSQLSelect(ctx);
            }
            catch (Exception ex)
            {
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }

        public void ExecuteSQLSelect(HttpContext ctx)
        {
            if (_dsoType == "grid" || _dsoType == "tree" || _dsoType == "array" || _dsoType == "table")
            {
                GetDataForGrid(ctx);
            }
            else if (_dsoType == "control")
            {
                GetDataForControl(ctx);
            }
            else if (_dsoType == "process")
            {
                GetDataForProcess(ctx);
            }
            else if (_dsoType == "list")
            {
                GetDataForList(ctx);
            }
        }

        private void GetDataForGrid(HttpContext ctx)
        {

            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            //CtlLib.WriteLogFile(conString);

            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            OracleConnection connection = new OracleConnection(conString);
            OracleCommand command = new OracleCommand();
            try
            {
                connection.Open();
                command = BuildSelectCommand(command);
                command.Connection = connection;
                SaveLogData();

                OracleDataReader reader = command.ExecuteReader();

                xw.WriteStartElement("Result");
                xw.WriteStartElement("data");

                //row
                while (reader.Read())
                {
                    xw.WriteStartElement("row");
                    string temp = "";
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (reader.IsDBNull(i))
                        {
                            temp += "|!";
                        }
                        else
                        {
                           temp += reader.GetOracleValue(i) + "|!";
                        }
                    }
                    temp = temp.Substring(0, temp.Length - 2);
                    //remove null character
                    temp = temp.Replace("\0", "");
                    xw.WriteString(temp);
                    xw.WriteEndElement(); // row
                }
                xw.WriteEndElement(); // data

                //Error element
                xw.WriteStartElement("Error");
                xw.WriteStartElement("errno");
                xw.WriteEndElement();
                xw.WriteStartElement("errmsg");
                xw.WriteEndElement();
                xw.WriteEndElement();

                //Log element
                xw.WriteStartElement("Log");
                xw.WriteStartElement("logdata");
                xw.WriteString(GetLogData());
                xw.WriteEndElement();
                xw.WriteEndElement();

                xw.WriteEndElement(); // Result
                xw.Flush();
                xw.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
                _errorno = "1";
                _errormsg = ex.Message;
                //SaveLogData();
                BuildErrorXML(xw);
                xw.Close();
            }
            finally
            {
                command.Dispose();
                connection.Close();
                //connection.Dispose();
            }
        }

        private void GetDataForList(HttpContext ctx)
        {
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            string temp = "DATA|";
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=" + _dbuser + ";Password=" + _dbpass;

            OracleConnection connection = new OracleConnection(conString);
            OracleCommand command = new OracleCommand();
            try
            {
                connection.Open();
                command = BuildSelectCommand(command);
                command.Connection = connection;
                SaveLogData();

                OracleDataReader reader = command.ExecuteReader();


                while (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (reader.IsDBNull(i))
                        {
                            temp += "|";
                        }
                        else
                        {
                            temp += reader.GetOracleValue(i) + "|";
                        }
                    }
                }
                temp = temp.Substring(0, temp.Length - 1);
                //_procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[0].InnerText;
                SaveLogData();

                xw.WriteStartElement("Result");
                xw.WriteStartElement("data");
                xw.WriteStartElement("row");
                xw.WriteString(temp);
                xw.WriteEndElement(); // row
                xw.WriteEndElement(); // data

                //Error element
                xw.WriteStartElement("Error");
                xw.WriteStartElement("errno");
                xw.WriteEndElement();
                xw.WriteStartElement("errmsg");
                xw.WriteEndElement();
                xw.WriteEndElement();

                //Log element
                xw.WriteStartElement("Log");
                xw.WriteStartElement("logdata");
                xw.WriteString(GetLogData());
                xw.WriteEndElement();
                xw.WriteEndElement();

                xw.WriteEndElement(); // Result
                xw.Close();
            }
            catch (Exception ex)
            {
                xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }

        private void GetDataForControl(HttpContext ctx)
        {

            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=" + _dbuser + ";Password=" + _dbpass;

            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            OracleConnection connection = new OracleConnection(conString);
            OracleCommand command = new OracleCommand();
            try
            {
                connection.Open();
                command = BuildSelectCommand(command);
                command.Connection = connection;
                SaveLogData();

                OracleDataReader reader = command.ExecuteReader();

                xw.WriteStartElement("Result");
                xw.WriteStartElement("data");
                //row
                while (reader.Read())
                {
                    xw.WriteStartElement("row");
                    string temp = "";
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        if (reader.IsDBNull(i))
                        {
                            temp += "|!";
                        }
                        else
                        {
                            temp += reader.GetOracleValue(i) + "|!";
                        }
                    }
                    temp = temp.Substring(0, temp.Length - 2);
                    xw.WriteString(temp);
                    xw.WriteEndElement(); // row
                }
                xw.WriteEndElement(); // data

                //Error element
                xw.WriteStartElement("Error");
                xw.WriteStartElement("errno");
                xw.WriteEndElement();
                xw.WriteStartElement("errmsg");
                xw.WriteEndElement();
                xw.WriteEndElement();

                //Log element
                xw.WriteStartElement("Log");
                xw.WriteStartElement("logdata");
                xw.WriteString(GetLogData());
                xw.WriteEndElement();
                xw.WriteEndElement();

                xw.WriteEndElement(); // Result
                xw.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }

        private void GetDataForProcess(HttpContext ctx)
        {
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));

            try
            {
                //_procedure = _clientXMLDoc.ChildNodes[0].ChildNodes[0].InnerText;
                SaveLogData();

                xw.WriteStartElement("Result");
                xw.WriteStartElement("data");
                xw.WriteStartElement("row");
                xw.WriteString(_p_rtn_value);
                xw.WriteEndElement(); // row
                xw.WriteEndElement(); // data

                //Error element
                xw.WriteStartElement("Error");
                xw.WriteStartElement("errno");
                xw.WriteEndElement();
                xw.WriteStartElement("errmsg");
                xw.WriteEndElement();
                xw.WriteEndElement();

                //Log element
                xw.WriteStartElement("Log");
                xw.WriteStartElement("logdata");
                xw.WriteString(GetLogData());
                xw.WriteEndElement();
                xw.WriteEndElement();

                xw.WriteEndElement(); // Result
                xw.Close();
            }
            catch (Exception ex)
            {
                xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
        }

        private void BuildErrorXML(XmlTextWriter xw)
        {
            xw.Flush();
            xw.WriteStartElement("Result");

            //data element
            xw.WriteStartElement("data");
            xw.WriteStartElement("row");
            xw.WriteEndElement();
            xw.WriteEndElement();

            //Error element
            xw.WriteStartElement("Error");
            xw.WriteStartElement("errno");
            xw.WriteString(_errorno);
            xw.WriteEndElement();
            xw.WriteStartElement("errmsg");
            xw.WriteString(_errormsg);
            xw.WriteEndElement();
            xw.WriteEndElement();

            //Log element
            xw.WriteStartElement("Log");
            xw.WriteStartElement("logdata");
            xw.WriteString(GetLogData());
            xw.WriteEndElement();
            xw.WriteEndElement();

            xw.WriteEndElement(); // Result
            xw.Close();

        }

        private string GetLogData()
        {
            return _logmsg;
        }

        private void SaveLogData()
        {
            string log = "<table width=100% debugtable><tr><td width=20% class='debug_title'>" + _dbuser + " connected</td><td class='debug_title'>" + _function + "</td></tr>";
            log += "<tr><td width=20% class='debug_title2'>Parameter</td><td class='debug_title2'>" + _parameter + "</td></tr>";
            log += "<tr><td width=20% class='debug_title' >Statement</td><td class='debug_title'>" + _exeStatement + "</td></tr></table>";
            _logmsg += log;
        }

        private OracleCommand BuildSelectCommand(OracleCommand command)
        {
            if (_dsoType != "list")
            {
                _parameter = _clientXMLDoc.ChildNodes[0].ChildNodes[2].InnerText;
            }
            else
            {   
                _parameter = _clientXMLDoc.ChildNodes[0].ChildNodes[1].InnerText;
            }

            string temp = "";
            string[] stringSeparators = new string[] { "|!" };
            string[] parameters = _parameter.Split(stringSeparators, StringSplitOptions.None);

            if (_dsoType == "grid" || _dsoType == "tree" || _dsoType == "list" || _dsoType == "array" || _dsoType == "table")
            {
                for (int i = 0; i < parameters.Length; i++)
                {
                    temp += "'" + parameters[i].ToString().Trim() + "',";
                }
                if (temp.Length >= 3 && _parameter.Length > 0)
                {
                    temp = temp.Substring(0, temp.Length - 1);
                    _exeStatement = "Call " + _function + "(" + temp + ",:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                else
                {
                    //select data for grid without any condition
                    _exeStatement = "Call " + _function + "(:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
            }
            else if (_dsoType == "control")
            {
                if (_action == "SELECT")
                {
                    //only one parameter(pk of object)
                    _exeStatement = "Call " + _function + "('" + _parameter + "',:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                else
                {
                    //select new data which has just inserted or updated
                    _exeStatement = "Call " + _function + "('" + _p_rtn_value + "',:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
            }
            else if (_dsoType == "process")
            {
                //
            }
            command.CommandText = _exeStatement;

            return command;
        }
        public void ExecuteSQLExtension(HttpContext ctx)
        {
            string connString = ConfigurationManager.AppSettings["strConn"];
            connString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            string procName;
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            XmlNodeList xinputs;
            OracleConnection connection = new OracleConnection(connString);
            connection.Open();
            OracleCommand command = connection.CreateCommand();
            OracleTransaction transaction;
            transaction = connection.BeginTransaction();
            command.Transaction = transaction;
            try
            {
                if(_dsoType == "process")
                {
                    //get input parameter listt
                    xinputs = _clientXMLDoc.SelectNodes("//input");

                    procName = "Call " + _procedure + "( ";
                    _exeStatement = procName;
                    _parameter = xinputs[0].InnerText;
                    parameter = _parameter.Split(CDelimeter, System.StringSplitOptions.None);

                    command.CommandText = "select data from esys.tes_dxf_file where pk = '" + parameter[0]+"'";
                    //SaveLogData();
                    //string s = (string) command.ExecuteOracleScalar();
                    OracleDataReader reader = command.ExecuteReader();
                    reader.Read();
                    OracleLob blob = reader.GetOracleLob(0);
                    StreamReader myStreamReader = new StreamReader(blob,System.Text.Encoding.Default);
                    string s = myStreamReader.ReadToEnd();
                    string file_name = "temp/tmp"+DateTime.Now.ToString("yymmdd-hh24miss")+".dxf";
                    CtlLib.EmptyFolder("temp");
                    CtlLib.CreateFile(file_name, s);
                    _p_rtn_value = file_name;
                }
                transaction.Commit();
                ExecuteSQLSelect(ctx);
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }
        public void ExecuteSQLUpdate(HttpContext ctx)
        {
            string connString = ConfigurationManager.AppSettings["strConn"];
            connString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            string procName, outparam;
            XmlTextWriter xw = new XmlTextWriter(ctx.Response.OutputStream, new System.Text.UTF8Encoding(true));
            XmlNodeList xrows, xinputs, xoutputs;
            OracleConnection connection = new OracleConnection(connString);
            connection.Open();
            OracleCommand command = connection.CreateCommand();
            OracleTransaction transaction;
            transaction = connection.BeginTransaction();
            command.Transaction = transaction;
            try
            {
                if (_dsoType != "process")
                {

                    _parameter = _clientXMLDoc.ChildNodes[0].ChildNodes[2].InnerText;
                    xrows = _clientXMLDoc.SelectNodes("//row");

                    for (int i = 0; i < xrows.Count; i++)
                    {
                        procName = "Call " + _procedure + "( ";
                        _exeStatement = procName;
                        _parameter = xrows[i].InnerText;
                        parameter = _parameter.Split(CDelimeter, System.StringSplitOptions.None);

                        for (int j = 0; j < parameter.Length; j++)
                        {
                            command.Parameters.AddWithValue(":" + j.ToString(), parameter[j].Trim());
                            command.Parameters[j].Direction = ParameterDirection.Input;
                            procName += ":" + j.ToString() + ",";
                            _exeStatement += "'" + parameter[j] + "',";
                        }
                        command.Parameters.AddWithValue(":p_crt_by", _user_id);
                        command.Parameters[":p_crt_by"].Direction = ParameterDirection.Input;

                        if (_dsoType == "grid")
                        {
                            procName += ":p_crt_by)";
                            _exeStatement += "'" + _user_id + "')";
                        }
                        else if (_dsoType == "control")
                        {
                            procName += ":p_crt_by,:p_rtn_value)";
                            _exeStatement += "'" + _user_id + "','')";
                            command.Parameters.Add(":p_rtn_value", OracleType.VarChar, 20);
                            command.Parameters[":p_rtn_value"].Direction = ParameterDirection.Output;
                        }

                        command.CommandText = procName;
                        //SaveLogData();
                        command.ExecuteNonQuery();

                        if (_dsoType == "control")
                        {
                            _p_rtn_value = command.Parameters[":p_rtn_value"].Value.ToString();
                        }
                    }
                }
                else
                {
                    //get input parameter listt
                    xinputs = _clientXMLDoc.SelectNodes("//input");

                    procName = "Call " + _procedure + "( ";
                    _exeStatement = procName;
                    _parameter = xinputs[0].InnerText;
                    parameter = _parameter.Split(CDelimeter, System.StringSplitOptions.None);

                    for (int j = 0; j < parameter.Length; j++)
                    {
                        command.Parameters.AddWithValue(":" + j.ToString(), parameter[j].Trim());
                        command.Parameters[j].Direction = ParameterDirection.Input;
                        procName += ":" + j.ToString() + ",";
                        _exeStatement += "'" + parameter[j] + "',";
                    }

                    procName += ":p_crt_by,";
                    _exeStatement += "'" + _user_id + "',";

                    command.Parameters.AddWithValue(":p_crt_by", _user_id);
                    command.Parameters[":p_crt_by"].Direction = ParameterDirection.Input;

                    //get output parameter list
                    xoutputs = _clientXMLDoc.SelectNodes("//output");
                    outparam = xoutputs[0].InnerText;
                    parameter = outparam.Split(CDelimeter, System.StringSplitOptions.None);

                    for (int j = 0; j < parameter.Length; j++)
                    {
                        command.Parameters.Add(":out" + j.ToString(), OracleType.VarChar, 4000);
                        command.Parameters[command.Parameters.Count - 1].Direction = ParameterDirection.Output;
                        procName += ":out" + j.ToString() + ",";
                        _exeStatement += "'',";
                    }
                    procName = procName.Substring(0, procName.Length - 1) + ")";
                    _exeStatement = _exeStatement.Substring(0, _exeStatement.Length - 1) + ")";

                    command.CommandText = procName;
                    //SaveLogData();
                    command.ExecuteNonQuery();

                    for (int j = parameter.Length; j > 0; j--)
                    {
                        _p_rtn_value += command.Parameters[command.Parameters.Count - j].Value.ToString() + "|!";
                    }
                    _p_rtn_value = _p_rtn_value.Substring(0, _p_rtn_value.Length - 2);
                }
                transaction.Commit();
                ExecuteSQLSelect(ctx);
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                _errorno = "1";
                _errormsg = ex.Message;
                SaveLogData();
                BuildErrorXML(xw);
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
        }
    }
}
