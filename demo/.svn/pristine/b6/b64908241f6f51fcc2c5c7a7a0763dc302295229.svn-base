using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OracleClient;
namespace Ctl
{
    public partial class PostFileSubmit : System.Web.UI.Page
    {
        private string _table_name, _img_pk, _Master_pk, _login_user, _procedure, _dbuser, _dbpass, _file_path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"].ToString() == "")
            {
                Response.Redirect(Application["rooturl"] + "/system/Login.aspx");
            }
            _login_user = Session["User_ID"].ToString();
            // Only accept image types.ok
            // FileInput.Accept = "image/*";
            if (Page.IsPostBack)
            {
                if (FileInput.PostedFile == null) return;

                if (FileInput.PostedFile.FileName == "")
                {
                    this.hiddenImgPK.Value = "No file specified.";
                }
                else
                {
                    _table_name = Request.Form["hiddenTableName"];
                    _img_pk = Request.Form["hiddenImgPK"];
                    _table_name = this.hiddenTableName.Value;
                    _file_path = Request.Form["hiddenFilePath"];
                    _Master_pk = this.hiddenMaster_pk.Value;
                    _procedure = this.hiddenProcedure.Value;

                    _dbuser = Session["APP_DBUSER"].ToString();
                    _dbpass = Session["APP_DBPASS"].ToString();

                    if (_file_path == null || _file_path == "")
                    {
                        SaveToDB();
                    }
                    else
                    {
                        SaveToDBFile();
                    }
                }
            }

        }
        private void SaveToDB()
        {
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            OracleConnection connection;
            try
            {
                OracleLob tempLob;
                OracleTransaction tx;
                int docLen = FileInput.PostedFile.ContentLength;
                Stream theStream = FileInput.PostedFile.InputStream;
                Byte[] buff = new Byte[docLen];
                theStream.Read(buff, 0, docLen);

                connection = new OracleConnection(conString);
                connection.Open();
                tx = connection.BeginTransaction();
                OracleCommand command = connection.CreateCommand();
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

                if (_procedure != "" && _procedure != null)
                {
                    command.CommandText = _procedure;
                }
                else
                {
                    command.CommandText = "ST_HR_PRO_CO_INSERT_IMAGE";
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
                command.Parameters["p_data"].Size = FileInput.PostedFile.ContentLength;

                command.Parameters.Add("p_filename", OracleType.VarChar, 100);
                command.Parameters["p_filename"].Value = FileInput.PostedFile.FileName;
				
                command.Parameters.Add("p_filesize", OracleType.Number, 20);
                command.Parameters["p_filesize"].Value = Math.Round((double)FileInput.PostedFile.ContentLength / 1024, 2);

                command.Parameters.Add("p_contenttype", OracleType.VarChar, 100);
                command.Parameters["p_contenttype"].Value = FileInput.PostedFile.ContentType;

                command.Parameters.Add("p_crt_by", OracleType.VarChar, 10);
                command.Parameters["p_crt_by"].Value = _login_user;
				
                command.Parameters.Add("p_rtn_pk", OracleType.VarChar, 200);
                command.Parameters["p_rtn_pk"].Direction = ParameterDirection.Output;
				//CtlLib.WriteLogError("test");
				
                command.ExecuteNonQuery();
                tx.Commit();
                this.hiddenImgPK.Value = command.Parameters["p_rtn_pk"].Value.ToString();
				
            }
            catch (Exception e)
            {
                this.hiddenImgPK.Value = e.Message;
                CtlLib.WriteLogError("Upload file error: " + e.Message);
                Response.Write(e.Message);
            }
        }

        private void SaveToDBFile()
        {
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id=" + _dbuser + ";Password=" + _dbpass;
            OracleConnection connection;
            try
            {
               
                connection = new OracleConnection(conString);
                connection.Open();
                OracleCommand command = connection.CreateCommand();

                DateTime now = DateTime.Now;
                string time = String.Format("{0:yyyyMMdd-HHmmss}", now);
                string fn = time + System.IO.Path.GetFileName(FileInput.PostedFile.FileName);
                string SaveLocation = @"D:\upload\" + fn;

                FileInput.PostedFile.SaveAs(SaveLocation);

                if (_procedure != "" && _procedure != null)
                {
                    command.CommandText = _procedure;
                }
                else
                {
                    command.CommandText = "ST_HR_PRO_CO_INSERT_IMAGE";
                }


                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("p_table_name", OracleType.VarChar, 100);
                command.Parameters["p_table_name"].Value = _table_name;
                command.Parameters.Add("p_master_pk", OracleType.VarChar, 20);
                command.Parameters["p_master_pk"].Value = _Master_pk;

                command.Parameters.Add("p_tc_fsbinary_pk", OracleType.VarChar, 100);
                command.Parameters["p_tc_fsbinary_pk"].Value = _img_pk;

                command.Parameters.Add("p_data", OracleType.Blob);
                command.Parameters["p_data"].Value = null;
                command.Parameters["p_data"].Size = FileInput.PostedFile.ContentLength;

                command.Parameters.Add("p_filename", OracleType.VarChar, 500);
                command.Parameters["p_filename"].Value = SaveLocation;

                command.Parameters.Add("p_filesize", OracleType.Number, 20);
                command.Parameters["p_filesize"].Value = Math.Round((double)FileInput.PostedFile.ContentLength / 1024, 2);

                command.Parameters.Add("p_contenttype", OracleType.VarChar, 100);
                command.Parameters["p_contenttype"].Value = FileInput.PostedFile.ContentType;

                command.Parameters.Add("p_crt_by", OracleType.VarChar, 10);
                command.Parameters["p_crt_by"].Value = _login_user;

                command.Parameters.Add("p_rtn_pk", OracleType.VarChar, 200);
                command.Parameters["p_rtn_pk"].Direction = ParameterDirection.Output;

                command.ExecuteNonQuery();
             
                this.hiddenImgPK.Value = command.Parameters["p_rtn_pk"].Value.ToString();
            }
            catch (Exception e)
            {
                this.hiddenImgPK.Value = e.Message;
                CtlLib.WriteLogError("Upload file error: " + e.Message);
                Response.Write(e.Message);
            }
        }

    }
}