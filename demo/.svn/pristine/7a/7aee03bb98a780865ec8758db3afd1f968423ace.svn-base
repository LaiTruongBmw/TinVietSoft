using System;
using System.IO;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Configuration;
using System.Data.OracleClient;
using Newtonsoft.Json;

/// <summary>
/// Summary description for gwWebService
/// </summary>
[WebService(Namespace = "http://vinagenuwin.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class gwWebService : System.Web.Services.WebService
{
    string json;
    private string _conString = "Data Source={0};Integrated Security=no;User Id={1};Password={2};Unicode=true";

    public gwWebService()
    {
    }

    [WebMethod(EnableSession = true, MessageName = "Arg")]
    public DataTable GetDataTableArg(string Procedure, string para, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;
        DataTable dt;
        try
        {
            if (!para.Contains("*|*"))
            {
                object[] ParaIn = para.Split('|');

                string exeStatement, temp = "";
                dt = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
				
                OracleCommand command = new OracleCommand(Procedure, connection);
                command.CommandType = CommandType.Text;

                for (int i = 0; i < ParaIn.Length; i++)
                {
                    temp += "'" + ParaIn[i].ToString().Trim() + "',";
                }
                if (temp.Length >= 3 && ParaIn.Length > 0)
                {
                    temp = temp.Substring(0, temp.Length - 1);
                    exeStatement = "Call " + Procedure + "(" + temp + ",:p_rtn_value)";
					//CtlLib.WriteLogError(exeStatement);
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                else
                {
                    //select data for grid without any condition
                    exeStatement = "Call " + Procedure + "(:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                command.CommandText = exeStatement;
                OracleDataReader reader = command.ExecuteReader();
                dt.Load(reader);
                connection.Close();
                connection.Dispose();
				
                return dt;
            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);
                DataTable rs = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
                dt = new DataTable(Procedure);
                foreach (string row in rows)
                {
                    string[] stringSeparators1 = new string[] { "|" };
                    object[] ParaIn = row.Split(stringSeparators1, StringSplitOptions.None);
                    string exeStatement = "", temp = "";
                    dt = new DataTable(Procedure);
                    try
                    {
                        OracleCommand command = new OracleCommand(Procedure, connection);
                        command.CommandType = CommandType.Text;

                        for (int i = 0; i < ParaIn.Length; i++)
                        {
                            temp += "'" + ParaIn[i].ToString().Trim() + "',";
                        }
                        if (temp.Length >= 3 && ParaIn.Length > 0)
                        {
                            temp = temp.Substring(0, temp.Length - 1);
                            exeStatement = "Call " + Procedure + "(" + temp + ",:p_rtn_value)";
                            command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        else
                        {
                            //select data for grid without any condition
                            exeStatement = "Call " + Procedure + "(:p_rtn_value)";
                            command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        command.CommandText = exeStatement;
                        OracleDataReader reader = command.ExecuteReader();
                        dt.Load(reader);
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //                            rs.Rows.Add(new object[] { r.ItemArray, "OK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }

                    }
                    catch (Exception e)
                    {
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //rs.Rows.Add(new object[] { r.ItemArray, "NOOK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }
                    }

                }

                connection.Close();
                connection.Dispose();
                return rs;
            }

        }
        catch (Exception ex)
        {
            dt = new DataTable(Procedure);
            dt.Columns.Add("ERROR");
            dt.Rows.Add(ex.Message);

            return dt;
        }
    }

    [WebMethod(EnableSession = true, MessageName = "TableReadOpenString")]
    public String TableReadOpenString(string Procedure, string para, string dbName, string dbUser, string dbPwd)
    {
        string[] paraOut = new string[] { "" };
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;
        connection = new OracleConnection(_conString);
        connection.Open();
        DataTable dt;
        string result = "", procName = "", _exeStatement = "";

        try
        {
            if (!para.Contains("*|*"))
            {
                object[] ParaIn = para.Replace("|!", "|").Split('|');

                OracleCommand command = new OracleCommand(Procedure, connection);
                command.CommandType = CommandType.Text;

                procName = "Call " + Procedure + "( ";
                _exeStatement = procName;
                for (int j = 0; j < ParaIn.Length - 1; j++)
                {
                    command.Parameters.AddWithValue(":" + j.ToString(), ParaIn[j].ToString().Trim());
                    command.Parameters[j].Direction = ParameterDirection.Input;
                    procName += ":" + j.ToString() + ",";
                    _exeStatement += "'" + ParaIn[j] + "',";
                }
                procName += ":p_crt_by,";
                _exeStatement += "'" + ParaIn[ParaIn.Length - 1] + "',";

                command.Parameters.AddWithValue(":p_crt_by", ParaIn[ParaIn.Length - 1]);
                command.Parameters[":p_crt_by"].Direction = ParameterDirection.Input;

                for (int j = 0; j < paraOut.Length; j++)
                {
                    command.Parameters.Add(":out" + j.ToString(), OracleType.VarChar, 200);
                    command.Parameters[command.Parameters.Count - 1].Direction = ParameterDirection.Output;
                    procName += ":out" + j.ToString() + ",";
                    _exeStatement += "'',";
                }
                procName = procName.Substring(0, procName.Length - 1) + ")";
                _exeStatement = _exeStatement.Substring(0, _exeStatement.Length - 1) + ")";

                //	ESysLib.WriteLogTablet(_exeStatement);

                command.CommandText = procName;
                command.ExecuteNonQuery();

                for (int j = paraOut.Length; j > 0; j--)
                {
                    result += command.Parameters[command.Parameters.Count - j].Value.ToString() + "|!";
                }
                result = result.Substring(0, result.Length - 2);

                connection.Close();
                connection.Dispose();
                return result;
            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);
                foreach (string row in rows)
                {
                    object[] ParaIn = row.Replace("|!", "|").Split('|');

                    OracleCommand command = new OracleCommand(Procedure, connection);
                    command.CommandType = CommandType.Text;

                    procName = "Call " + Procedure + "( ";
                    _exeStatement = procName;
                    for (int j = 0; j < ParaIn.Length - 1; j++)
                    {
                        command.Parameters.AddWithValue(":" + j.ToString(), ParaIn[j].ToString().Trim());
                        command.Parameters[j].Direction = ParameterDirection.Input;
                        procName += ":" + j.ToString() + ",";
                        _exeStatement += "'" + ParaIn[j] + "',";
                    }
                    procName += ":p_crt_by,";
                    _exeStatement += "'" + ParaIn[ParaIn.Length - 1] + "',";

                    command.Parameters.AddWithValue(":p_crt_by", ParaIn[ParaIn.Length - 1]);
                    command.Parameters[":p_crt_by"].Direction = ParameterDirection.Input;

                    for (int j = 0; j < paraOut.Length; j++)
                    {
                        command.Parameters.Add(":out" + j.ToString(), OracleType.VarChar, 200);
                        command.Parameters[command.Parameters.Count - 1].Direction = ParameterDirection.Output;
                        procName += ":out" + j.ToString() + ",";
                        _exeStatement += "'',";
                    }
                    procName = procName.Substring(0, procName.Length - 1) + ")";
                    _exeStatement = _exeStatement.Substring(0, _exeStatement.Length - 1) + ")";

                    //	ESysLib.WriteLogTablet(_exeStatement);

                    command.CommandText = procName;
                    command.ExecuteNonQuery();

                    for (int j = paraOut.Length; j > 0; j--)
                    {
                        result += command.Parameters[command.Parameters.Count - j].Value.ToString() + "|!";
                    }
                    result = result.Substring(0, result.Length - 2);
                    result += "*!";
                }
                result = result.Substring(0, result.Length - 2);
                connection.Close();
                connection.Dispose();
                return result;
            }
        }
        catch (Exception ex)
        {
            connection.Close();
            connection.Dispose();
            return ex.Message;
        }
    }

    [WebMethod(EnableSession = true, MessageName = "NoArg")]
    public DataTable GetDataTableNoArg(string Procedure, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;
        DataTable dt;

        try
        {
            string exeStatement;
            dt = new DataTable(Procedure);
            connection = new OracleConnection(_conString);
            connection.Open();
            OracleCommand command = new OracleCommand(Procedure, connection);
            command.CommandType = CommandType.Text;


            //select data for grid without any condition
            exeStatement = "Call " + Procedure + "(:p_rtn_value)";
            command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;

            command.CommandText = exeStatement;
            OracleDataReader reader = command.ExecuteReader();
            dt.Load(reader);
            connection.Close();
            connection.Dispose();

            return dt;
        }
        catch (Exception ex)
        {
            dt = new DataTable();
            dt.Columns.Add("ERROR");
            dt.Rows.Add(ex.Message);

            return dt;
        }
    }

    [WebMethod(EnableSession = true, MessageName = "InsertTable")]
    public string InsertTableArg(string Procedure, string para, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;

        try
        {
            if (!para.Contains("*|*"))
            {
                string[] stringSeparators = new string[] { "|!" };
                object[] ParaIn = para.Replace("|!", "|").Split('|');

                string exeStatement = "", temp = "";
                connection = new OracleConnection(_conString);
                connection.Open();
                string rs = "";
                try
                {

                    OracleCommand command = new OracleCommand(Procedure, connection);
                    command.CommandType = CommandType.Text;

                    for (int i = 0; i < ParaIn.Length; i++)
                    {
                        temp += "'" + ParaIn[i].ToString().Trim() + "',";
                    }

                    if (temp.Length >= 3 && ParaIn.Length > 0)
                    {
                        temp = temp.Substring(0, temp.Length - 1);
                        exeStatement = "Call " + Procedure + "(" + temp + ")";
                    }

                    command.CommandText = exeStatement;
                    command.ExecuteNonQuery();

                    rs = string.Format("{0}|!{1}|!{2}", new object[] { para, "OK", "" });


                }
                catch (Exception e)
                {

                    rs = string.Format("{0}|!{1}|!{2}", new object[] { para, "NOOK", e.Message });
                }
                connection.Close();
                connection.Dispose();
                return rs;
            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);

                connection = new OracleConnection(_conString);
                connection.Open();
                string rs = "";

                foreach (string row in rows)
                {
                    //string[] stringSeparators1 = new string[] { "|!" };
                    //object[] ParaIn = row.Split(stringSeparators, StringSplitOptions.None);
                    object[] ParaIn = row.Replace("|!", "|").Split('|');
                    string exeStatement = "", temp = "";
                    try
                    {
                        OracleCommand command = new OracleCommand(Procedure, connection);
                        command.CommandType = CommandType.Text;

                        for (int i = 0; i < ParaIn.Length; i++)
                        {
                            temp += "'" + ParaIn[i].ToString().Trim() + "',";
                        }

                        if (temp.Length >= 3 && ParaIn.Length > 0)
                        {
                            temp = temp.Substring(0, temp.Length - 1);
                            exeStatement = "Call " + Procedure + "(" + temp + ")";
                        }

                        command.CommandText = exeStatement;
                        command.ExecuteNonQuery();

                        rs += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });
                    }
                    catch (Exception e)
                    {
                        rs += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "NOOK", e.Message });
                    }

                }

                connection.Close();
                connection.Dispose();
                if (rs.EndsWith("*|*"))
                {
                    rs = rs.Substring(0, rs.Length - 3);
                }
                return rs;
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }


    [WebMethod(EnableSession = true, MessageName = "UploadFile")]
    public string UploadFile(byte[] f, string fileName)
    {
        // the byte array argument contains the content of the file
        // the string argument contains the name and extension
        // of the file passed in the byte array
        try
        {
            // instance a memory stream and pass the
            // byte array to its constructor
            MemoryStream ms = new MemoryStream(f);

            // instance a filestream pointing to the 
            // storage folder, use the original file name
            // to name the resulting file
            FileStream fs = new FileStream
                (System.Web.Hosting.HostingEnvironment.MapPath("~/TransientStorage/") +
                fileName, FileMode.Create);

            // write the memory stream containing the original
            // file as a byte array to the filestream
            ms.WriteTo(fs);

            // clean up
            ms.Close();
            fs.Close();
            fs.Dispose();

            // return OK if we made it this far
            return "OK";
        }
        catch (Exception ex)
        {
            // return the error message if the operation fails
            return ex.Message.ToString();
        }
    }

    [WebMethod(EnableSession = true, MessageName = "UploadImage")]
    public string UploadImage(string dbName
                                , string _dbuser, string _dbpass, string _procedure
                                , string _table_name, string _Master_pk, string p_tc_fsbinary_pk, string p_filename
                                , string p_filesize, string p_contenttype, byte[] buff, string _login_user)
    {

        string result = "OK";

        _conString = string.Format(_conString, dbName, _dbuser, _dbpass);

        OracleConnection connection;

        try
        {
            OracleLob tempLob;

            OracleTransaction tx;
            //int docLen = FileInput.PostedFile.ContentLength;
            //Stream theStream = FileInput.PostedFile.InputStream;
            //Byte[] buff = new Byte[docLen];
            //theStream.Read(buff, 0, docLen);

            connection = new OracleConnection(_conString);
            connection.Open();
            tx = connection.BeginTransaction();
            OracleCommand command = connection.CreateCommand();
            command.Transaction = tx;

            command.CommandText = "declare xx blob; begin dbms_lob.createtemporary(xx, false, 0); :tempblob := xx; end;";
            command.Parameters.Add("tempblob", OracleType.Blob).Direction = ParameterDirection.Output;
            command.Parameters["tempblob"].Size = buff.Length;
            command.ExecuteNonQuery();


            tempLob = (OracleLob)command.Parameters[0].Value;
            tempLob.BeginBatch(OracleLobOpenMode.ReadWrite);
            tempLob.Write(buff, 0, buff.Length);
            tempLob.EndBatch();

            command.Parameters.Clear();

            if (_procedure != "" && _procedure != null)
            {
                command.CommandText = _procedure;
                return "000";
            }
            else
            {
                command.CommandText = "TL_es_insert_image";
            }


            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("p_table_name", OracleType.VarChar, 100);
            command.Parameters["p_table_name"].Value = _table_name;
            command.Parameters.Add("p_master_pk", OracleType.Number, 20);
            command.Parameters["p_master_pk"].Value = _Master_pk;

            command.Parameters.Add("p_tc_fsbinary_pk", OracleType.Number, 20);
            command.Parameters["p_tc_fsbinary_pk"].Value = p_tc_fsbinary_pk;

            command.Parameters.Add("p_data", OracleType.Blob);
            command.Parameters["p_data"].Value = tempLob;
            command.Parameters["p_data"].Size = buff.Length;

            command.Parameters.Add("p_filename", OracleType.VarChar, 100);
            command.Parameters["p_filename"].Value = p_filename;


            command.Parameters.Add("p_filesize", OracleType.Number, 20);
            command.Parameters["p_filesize"].Value = p_filesize;

            command.Parameters.Add("p_contenttype", OracleType.VarChar, 100);
            command.Parameters["p_contenttype"].Value = p_contenttype;

            command.Parameters.Add("p_crt_by", OracleType.VarChar, 10);
            command.Parameters["p_crt_by"].Value = _login_user;

            command.Parameters.Add("p_rtn_pk", OracleType.VarChar, 200);
            command.Parameters["p_rtn_pk"].Direction = ParameterDirection.Output;   //

            command.ExecuteNonQuery();
            tx.Commit();


            result = command.Parameters["p_rtn_pk"].Value.ToString();

            return result;
        }
        catch (Exception ex)
        {
            // return the error message if the operation fails
            return ex.Message.ToString();
        }

        return result;
    }


    [WebMethod(EnableSession = true, MessageName = "GetImage")]
    public string GetImage(string dbName
                                , string _dbuser, string _dbpass
                                , string _table_name, string _pk)
    {

        string result = "ERROR";


        _conString = string.Format(_conString, dbName, _dbuser, _dbpass);

        OracleConnection connection;

        try
        {
            OracleLob tempLob;

            OracleTransaction tx;
            //int docLen = FileInput.PostedFile.ContentLength;
            //Stream theStream = FileInput.PostedFile.InputStream;
            //Byte[] buff = new Byte[docLen];
            //theStream.Read(buff, 0, docLen);

            connection = new OracleConnection(_conString);
            connection.Open();
            tx = connection.BeginTransaction();
            OracleCommand command = connection.CreateCommand();
            command.Transaction = tx;

            string sqlText = " SELECT * " +
                                " FROM 	TCO_BPPHOTO  " +
                                " WHERE PK = (	SELECT 	MAX(PK) " +
                                " 				FROM 	TCO_BPPHOTO	" +
                                "				WHERE	TABLE_NAME = '" + _table_name + "' AND TABLE_PK = '" + _pk + "')";

            //	string sqlText = "SELECT MAX(DATA) FROM TCO_BPPHOTO  WHERE TABLE_NAME = 'TLG_INSPECTION_ENTRY_M' AND TABLE_PK = '337'" ;

            command.CommandText = sqlText;
            OracleDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                Byte[] buff = (byte[])dr["DATA"];
                //result = System.Text.ASCIIEncoding.ASCII.GetString(buff);


                result = Convert.ToBase64String(buff);
                //result = System.Text.Encoding.Default.GetString(buff);

            }

            return result;

        }
        catch (Exception ex)
        {
            // return the error message if the operation fails
            return result + ":" + ex.Message.ToString();
        }


        return result;
    }

    [WebMethod(EnableSession = true, MessageName = "GetImagePosition")]
    public string GetImagePosition(string dbName
                                , string _dbuser, string _dbpass
                                , string _table_name, string _pk, int _position)
    {

        string result = "ERROR";

        _conString = string.Format(_conString, dbName, _dbuser, _dbpass);

        OracleConnection connection;

        try
        {
            OracleLob tempLob;

            OracleTransaction tx;
            //int docLen = FileInput.PostedFile.ContentLength;
            //Stream theStream = FileInput.PostedFile.InputStream;
            //Byte[] buff = new Byte[docLen];
            //theStream.Read(buff, 0, docLen);

            connection = new OracleConnection(_conString);
            connection.Open();
            tx = connection.BeginTransaction();
            OracleCommand command = connection.CreateCommand();
            command.Transaction = tx;
            _position = _position + 1;

            string sqlText = " SELECT pk, data  FROM (SELECT pk, data, ROWNUM seq " +
                                                    " FROM ( SELECT pk, data " +
                                                            " FROM TCO_BPPHOTO " +
                                                            " WHERE     TABLE_NAME = '" + _table_name + "' AND TABLE_PK = '" + _pk + "' ORDER BY PK ASC))" +
                                " WHERE seq = " + _position;

            //	string sqlText = "SELECT MAX(DATA) FROM TCO_BPPHOTO  WHERE TABLE_NAME = 'TLG_INSPECTION_ENTRY_M' AND TABLE_PK = '337'" ;

            command.CommandText = sqlText;
            OracleDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                //DataTable dt = new DataTable();
                //dt.Load(dr);
                Byte[] buff = (byte[])dr["data"];
                //result = System.Text.ASCIIEncoding.ASCII.GetString(buff);


                result = Convert.ToBase64String(buff);
                //result = System.Text.Encoding.Default.GetString(buff);

            }

            return result;

        }
        catch (Exception ex)
        {
            // return the error message if the operation fails
            return result + ":" + ex.Message.ToString();
        }


        return result;
    }

    [WebMethod(EnableSession = true, MessageName = "UploadImage1")]
    public string UploadImage1()
    {

        string result = "OK";


        return result;
    }
    //Giang" 2-4-2016 4PM
    /*
	[WebMethod(EnableSession = true, MessageName = "UploadImage")]
	private string UploadImageArg(string dbName, string _dbuser, string _dbpass, string _procedure, 
								string _table_name, string _Master_pk, string _img_pk, string p_filename, 
								string p_filesize, string p_contenttype, byte[] buff, string _login_user)
	{
      
     //       _conString = string.Format(_conString, dbName, _dbuser, _dbpass);

     //       OracleConnection connection;
			string result = "OK";
			
			
            try
            {
				
                OracleLob tempLob;
				
                OracleTransaction tx;
                //int docLen = FileInput.PostedFile.ContentLength;
                //Stream theStream = FileInput.PostedFile.InputStream;
                //Byte[] buff = new Byte[docLen];
                //theStream.Read(buff, 0, docLen);

                connection = new OracleConnection(_conString);
                connection.Open();
                tx = connection.BeginTransaction();
                OracleCommand command = connection.CreateCommand();
                command.Transaction = tx;

                command.CommandText = "declare xx blob; begin dbms_lob.createtemporary(xx, false, 0); :tempblob := xx; end;";
                command.Parameters.Add("tempblob", OracleType.Blob).Direction = ParameterDirection.Output;
                command.Parameters["tempblob"].Size = buff.Length;
                command.ExecuteNonQuery();
				
				
                tempLob = (OracleLob)command.Parameters[0].Value;
                tempLob.BeginBatch(OracleLobOpenMode.ReadWrite);
                tempLob.Write(buff, 0, buff.Length);
                tempLob.EndBatch();

                command.Parameters.Clear();

                if (_procedure != "" && _procedure != null)
                {
                    command.CommandText = _procedure;
                }
                else
                {
                    command.CommandText = "es_insert_image";
                }


                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("p_table_name", OracleType.VarChar, 100);
                command.Parameters["p_table_name"].Value = _table_name;
                command.Parameters.Add("p_master_pk", OracleType.VarChar, 20);
                command.Parameters["p_master_pk"].Value = _Master_pk;

                command.Parameters.Add("p_tc_fsbinary_pk", OracleType.VarChar, 100);
                command.Parameters["p_tc_fsbinary_pk"].Value = _img_pk;

                command.Parameters.Add("p_data", OracleType.Blob);
                command.Parameters["p_data"].Value = tempLob;
                command.Parameters["p_data"].Size = buff.Length;

                command.Parameters.Add("p_filename", OracleType.VarChar, 100);
                command.Parameters["p_filename"].Value = p_filename;

				
                command.Parameters.Add("p_filesize", OracleType.Number, 20);
                command.Parameters["p_filesize"].Value = p_filesize;

                command.Parameters.Add("p_contenttype", OracleType.VarChar, 100);
                command.Parameters["p_contenttype"].Value = p_contenttype;
				
                command.Parameters.Add("p_crt_by", OracleType.VarChar, 10);
                command.Parameters["p_crt_by"].Value = _login_user;

                command.Parameters.Add("p_rtn_pk", OracleType.VarChar, 200);
           //     command.Parameters["p_rtn_pk"].Direction = ParameterDirection.Output;	//

                command.ExecuteNonQuery();
                tx.Commit();
				
				
            //    result =  command.Parameters["p_rtn_pk"].Value.ToString();
            }
            catch (Exception e)
            {
                result = e.Message;
                ESysLib.WriteLogError("Upload file error: " + e.Message);
                
            }
			
			return result;
        }
		*/


    [WebMethod(EnableSession = true, MessageName = "WSTEST")]
    public string WSTEST(string strPara)
    {
        return strPara;
    }

    [WebMethod(EnableSession = true, MessageName = "TEST")]
    public string TEST(string strPara)
    {
        return strPara;
    }


    [WebMethod(EnableSession = true, MessageName = "ArgJson")]
    public string GetDataTableArgJson(string Procedure, string para, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;
        DataTable dt;

        try
        {
            if (!para.Contains("*|*"))
            {
                object[] ParaIn = para.Split('|');

                string exeStatement, temp = "";
                dt = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
                OracleCommand command = new OracleCommand(Procedure, connection);
                command.CommandType = CommandType.Text;

                for (int i = 0; i < ParaIn.Length; i++)
                {
                    temp += "'" + ParaIn[i].ToString().Trim() + "',";
                }
                if (temp.Length >= 3 && ParaIn.Length > 0)
                {
                    temp = temp.Substring(0, temp.Length - 1);
                    exeStatement = "Call " + Procedure + "(" + temp + ",:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;

                }
                else
                {
                    //select data for grid without any condition
                    exeStatement = "Call " + Procedure + "(:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                command.CommandText = exeStatement;
                OracleDataReader reader = command.ExecuteReader();

                dt.Load(reader);
                connection.Close();
                connection.Dispose();
                json = JsonConvert.SerializeObject(dt, Formatting.Indented);
                return json;

            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);
                DataTable rs = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
                dt = new DataTable(Procedure);
                foreach (string row in rows)
                {
                    string[] stringSeparators1 = new string[] { "|" };
                    object[] ParaIn = row.Split(stringSeparators1, StringSplitOptions.None);
                    string exeStatement = "", temp = "";
                    dt = new DataTable(Procedure);
                    try
                    {
                        OracleCommand command = new OracleCommand(Procedure, connection);
                        command.CommandType = CommandType.Text;

                        for (int i = 0; i < ParaIn.Length; i++)
                        {
                            temp += "'" + ParaIn[i].ToString().Trim() + "',";
                        }
                        if (temp.Length >= 3 && ParaIn.Length > 0)
                        {
                            temp = temp.Substring(0, temp.Length - 1);
                            exeStatement = "Call " + Procedure + "(" + temp + ",:p_rtn_value)";
                            command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        else
                        {
                            //select data for grid without any condition
                            exeStatement = "Call " + Procedure + "(:p_rtn_value)";
                            command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        command.CommandText = exeStatement;
                        OracleDataReader reader = command.ExecuteReader();
                        dt.Load(reader);
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //rs.Rows.Add(new object[] { r.ItemArray, "OK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }

                    }
                    catch (Exception e)
                    {
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //rs.Rows.Add(new object[] { r.ItemArray, "NOOK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }
                    }

                }

                connection.Close();
                connection.Dispose();
                json = JsonConvert.SerializeObject(rs, Formatting.Indented);
                return json;
            }

        }
        catch (Exception ex)
        {
            dt = new DataTable(Procedure);
            dt.Columns.Add("ERROR");
            dt.Rows.Add(ex.Message);
            json = JsonConvert.SerializeObject(dt, Formatting.Indented);
            return json;
        }
    }

    // New Method return string Json
    //Create by: trangtq
    [WebMethod(EnableSession = true, MessageName = "GetDataByJson")]
    public string GetDataByJson(string Procedure, string para, int numcurr, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;
        DataTable dt;

        try
        {
            if (!para.Contains("*|*"))
            {
                object[] ParaIn = para.Split('|');

                string exeStatement, temp = "";
                dt = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
                OracleCommand command = new OracleCommand(Procedure, connection);
                command.CommandType = CommandType.Text;

                for (int i = 0; i < ParaIn.Length; i++)
                {
                    temp += "'" + ParaIn[i].ToString().Trim() + "',";
                }
                if (temp.Length >= 3 && ParaIn.Length > 0)
                {
                    temp = temp.Substring(0, temp.Length - 1);
                    //exeStatement = "Call " + Procedure + "(" + temp + ",:p_cv_1)";
                    exeStatement = "Call " + Procedure + "(" + temp;
                    String outparr = "";
                    for (int ou = 1; ou <= numcurr; ou++)
                    {
                        outparr += ",:p_cv_" + ou;
                        command.Parameters.Add(":p_cv_" + ou, OracleType.Cursor).Direction = ParameterDirection.Output;
                    }
                    exeStatement += outparr + ")";

                }
                else //no parram
                {
                    //select data for grid without any condition
                    exeStatement = "Call " + Procedure + "(";
                    String outparr = "";
                    for (int ou = 1; ou <= numcurr; ou++)
                    {
                        outparr += ":p_cv_" + ou + ",";
                        command.Parameters.Add(":p_cv_" + ou, OracleType.Cursor).Direction = ParameterDirection.Output;
                    }
                    outparr = outparr.Substring(0, outparr.Length - 1);
                    exeStatement += outparr + ")";

                    exeStatement = "Call " + Procedure + "(:p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                }
                command.CommandText = exeStatement;
                OracleDataReader reader = command.ExecuteReader();
                DataSet ds = new DataSet();
                do
                {
                    DataTable table = new DataTable();
                    table.Load(reader);
                    ds.Tables.Add(table);
                } while (!reader.IsClosed);
                connection.Close();
                connection.Dispose();
                json = CJson.ResultSet2JSONString(ds);
                return json;
            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);
                DataTable rs = new DataTable(Procedure);
                connection = new OracleConnection(_conString);
                connection.Open();
                dt = new DataTable(Procedure);
                foreach (string row in rows)
                {
                    string[] stringSeparators1 = new string[] { "|" };
                    object[] ParaIn = row.Split(stringSeparators1, StringSplitOptions.None);
                    string exeStatement = "", temp = "";
                    dt = new DataTable(Procedure);
                    try
                    {
                        OracleCommand command = new OracleCommand(Procedure, connection);
                        command.CommandType = CommandType.Text;

                        for (int i = 0; i < ParaIn.Length; i++)
                        {
                            temp += "'" + ParaIn[i].ToString().Trim() + "',";
                        }
                        if (temp.Length >= 3 && ParaIn.Length > 0)
                        {
                            temp = temp.Substring(0, temp.Length - 1);
                            exeStatement = "Call " + Procedure + "(" + temp + ",:p_cv_1)";
                            command.Parameters.Add(":p_cv_1", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        else
                        {
                            //select data for grid without any condition
                            exeStatement = "Call " + Procedure + "(:p_cv_1)";
                            command.Parameters.Add(":p_cv_1", OracleType.Cursor).Direction = ParameterDirection.Output;
                        }
                        command.CommandText = exeStatement;
                        OracleDataReader reader = command.ExecuteReader();
                        dt.Load(reader);
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //rs.Rows.Add(new object[] { r.ItemArray, "OK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }

                    }
                    catch (Exception e)
                    {
                        if (rs.Columns.Count == 0)
                        {
                            rs = dt.Clone();
                            if (rs.Columns.IndexOf("_RSTATUS_".ToLower()) == -1)
                                rs.Columns.Add("_RSTATUS_");
                        }
                        foreach (DataRow r in dt.Rows)
                        {
                            rs.Rows.Add(r.ItemArray);
                            //rs.Rows.Add(new object[] { r.ItemArray, "NOOK" });// += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });    
                        }
                    }

                }
                DataSet ds = new DataSet();
                ds.Tables.Add(rs);
                json = CJson.ResultSet2JSONString(ds);
                connection.Close();
                connection.Dispose();
                //json = JsonConvert.SerializeObject(rs, Formatting.Indented);
                return json;
            }
            return "";
        }
        catch (Exception ex)
        {
            json = CJson.ResultSet2JSONError(100, ex.Message, Procedure, para);
            return json;
        }
    }

    [WebMethod(EnableSession = true, MessageName = "OnExcute")]
    public string OnExcute(string Procedure, string para, string dbName, string dbUser, string dbPwd)
    {
        _conString = string.Format(_conString, dbName, dbUser, dbPwd);
        OracleConnection connection;

        try
        {
            if (!para.Contains("*|*"))
            {
                string[] stringSeparators = new string[] { "|!" };
                object[] ParaIn = para.Replace("|!", "|").Split('|');

                string exeStatement = "", temp = "";
                connection = new OracleConnection(_conString);
                connection.Open();
                string rs = "";
                try
                {

                    OracleCommand command = new OracleCommand(Procedure, connection);
                    command.CommandType = CommandType.Text;

                    for (int i = 0; i < ParaIn.Length; i++)
                    {
                        temp += "'" + ParaIn[i].ToString().Trim() + "',";
                    }

                    if (temp.Length >= 3 && ParaIn.Length > 0)
                    {
                        temp = temp.Substring(0, temp.Length - 1);
                        exeStatement = "Call " + Procedure + "(" + temp + ")";
                    }

                    command.CommandText = exeStatement;
                    command.ExecuteNonQuery();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable(Procedure);
                    dt.Columns.Add("parr");
                    dt.Columns.Add("status");
                    dt.Rows.Add(new object[] { para, "OK" });
                    ds.Tables.Add(dt);
                    rs = CJson.ResultSet2JSONString(ds);


                }
                catch (Exception e)
                {
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable(Procedure);
                    dt.Columns.Add("parr");
                    dt.Columns.Add("status");
                    dt.Rows.Add(new object[] { para, "NOOK" });
                    ds.Tables.Add(dt);
                    rs = CJson.ResultSet2JSONString(ds);

                    //rs = string.Format("{0}|!{1}|!{2}", new object[] { para, "NOOK", e.Message });
                }
                connection.Close();
                connection.Dispose();
                return rs;
            }
            else
            {
                //tach thanh nhieu dong
                string[] stringSeparators = new string[] { "*|*" };
                string[] rows = para.Split(stringSeparators, StringSplitOptions.None);

                connection = new OracleConnection(_conString);
                connection.Open();
                string rs = "";
                DataSet ds = new DataSet();
                DataTable dt = new DataTable(Procedure);
                dt.Columns.Add("parr");
                dt.Columns.Add("status");

                foreach (string row in rows)
                {
                    //string[] stringSeparators1 = new string[] { "|!" };
                    //object[] ParaIn = row.Split(stringSeparators, StringSplitOptions.None);
                    object[] ParaIn = row.Replace("|!", "|").Split('|');
                    string exeStatement = "", temp = "";
                    try
                    {
                        OracleCommand command = new OracleCommand(Procedure, connection);
                        command.CommandType = CommandType.Text;

                        for (int i = 0; i < ParaIn.Length; i++)
                        {
                            temp += "'" + ParaIn[i].ToString().Trim() + "',";
                        }

                        if (temp.Length >= 3 && ParaIn.Length > 0)
                        {
                            temp = temp.Substring(0, temp.Length - 1);
                            exeStatement = "Call " + Procedure + "(" + temp + ")";
                        }

                        command.CommandText = exeStatement;
                        command.ExecuteNonQuery();
                        dt.Rows.Add(new object[] { row, "OK" });

                        //  rs += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "OK", "" });
                    }
                    catch (Exception e)
                    {
                        dt.Rows.Add(new object[] { row, "NOOK" });
                        //rs += string.Format("{0}|!{1}|!{2}*|*", new object[] { row, "NOOK", e.Message });
                    }

                }
                ds.Tables.Add(dt);
                rs = CJson.ResultSet2JSONString(ds);
                connection.Close();
                connection.Dispose();
                return rs;
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }



}

