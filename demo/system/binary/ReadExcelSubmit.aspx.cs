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
using System.Data.OleDb;
using NativeExcel;
using System.IO;

namespace Ctl
{
    public partial class ReadExcelSubmit : System.Web.UI.Page
    {
        private string _table_name, _img_pk, _Master_pk, _login_user, _procedure, _dbuser, _dbpass, _p_1,_p_2,_p_3,_p_4,_p_5,_p_start,_p_cols, _import_seq, _record;
        private string _procedure_file = "", _error_continue;
		private int _count = 0;
		
        protected void Page_Load(object sender, EventArgs e)
        {
			try
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
						_img_pk 	= Request.Form["hiddenImgPK"];
						_record 	= Request.Form["hiddenRecord"];
						_import_seq = Request.Form["hiddenImportSeq"];
						
						_p_1 		= Request.Form["hiddenType1"];
						_p_2 		= Request.Form["hiddenType2"];
						_p_3 		= Request.Form["hiddenType3"];
						_p_4 		= Request.Form["hiddenType4"];
						_p_5 		= Request.Form["hiddenType5"];
						_p_start 	= Request.Form["hiddenStart"];
						_p_cols 	= Request.Form["hiddenCols"];

                        _error_continue = Request.Form["hiddenErrorCont"];
						
						_procedure_file = this.hiddenProcedureFile.Value;
						
						_table_name = this.hiddenTableName.Value;
						//_Master_pk = Request.Form["hiddenMaster_pk"];
						_Master_pk = this.hiddenMaster_pk.Value;
						_procedure = this.hiddenProcedure.Value;
						
						_dbuser = Session["APP_DBUSER"].ToString();
						_dbpass = Session["APP_DBPASS"].ToString();
						
						SaveToDB();
						
						if (_error_continue == "Y")
                        {
                            ImportDataNewHR();
                        }
                        else
                        {
                            ImportDataNew();//commit rows which has no error.
                        }
						
					}
				}
			}
			catch (Exception ex)
            {
                CtlLib.WriteLogError("Page_Load:" + ex.StackTrace);
            }
        }
        private void SaveToDB()
        {
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User Id="+ _dbuser +";Password="+ _dbpass + ";";
			
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
				
				//CtlLib.WriteLogError(conString);
				
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

                command.ExecuteNonQuery();
                tx.Commit();
				
                this.hiddenImgPK.Value = command.Parameters["p_rtn_pk"].Value.ToString();
				_img_pk = command.Parameters["p_rtn_pk"].Value.ToString();
				
				
            }
            catch (Exception e)
            {
                //this.hiddenImgPK.Value = e.Message;
                CtlLib.WriteLogError("SaveToDB:" + e.Message);
            }
        }
		private void ImportDataNew()
        {
			
			DataTable myDT = new DataTable();
			string SQL = "";
			string _file = "";
			string temp = "";
            string user_id = "", result ="";
			try
			{
				if (!string.IsNullOrEmpty(_img_pk))
				{
					CtlLib.SetUser(_dbuser);
					
					SQL = "SELECT DATA, FILENAME, FILESIZE, CRT_BY FROM "+_dbuser+".TC_FSBINARY WHERE PK = " + _img_pk;
					myDT = CtlLib.TableReadOpen(SQL);
					
										
					_file = myDT.Rows[0]["FILENAME"].ToString();
					_file = _file.Substring(_file.LastIndexOf("\\") + 1, _file.Length - _file.LastIndexOf("\\") - 1);
					_file = "../temp/" + _file;
					_file =  Server.MapPath(_file);
					
					if(File.Exists(_file))
						File.Delete(_file);
					
					byte[] MyData = new byte[0];
					MyData = (byte[])myDT.Rows[0]["DATA"];
					BinaryWriter bw = new BinaryWriter(File.Open(_file,FileMode.OpenOrCreate));
					bw.Write(MyData);
					bw.Close();
					
					user_id = myDT.Rows[0]["CRT_BY"].ToString();
					
					IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(_file);
					IWorksheet exSheet = exBook.Worksheets[1];
					exSheet.UsedRange.UnMerge();

                    int sCols = 0;
                    if (string.IsNullOrEmpty(_p_cols))
                        sCols = myDT.Columns.Count;
                    else
                        sCols = int.Parse(_p_cols);
						
										
					int sRow = 0;
					if (string.IsNullOrEmpty(_p_start))
						sRow = 2;
					else
						sRow = int.Parse(_p_start);					
					
					// chỗ này hơi chuối, vì dữ liệu trên file execel đã mer
					// nên phải set lại để truyền đủ tham số vào
					if ( _procedure_file.Substring(_procedure_file.IndexOf(".") + 1, _procedure_file.Length - _procedure_file.IndexOf(".")-1) == "HR_PRO_10020018_IMP_WT_OT")
					{
						myDT = exSheet.UsedRange.GetDataTable(false, false);
						for (int i = sRow; i <= myDT.Rows.Count; i++)
						{
							exSheet.Cells["A" + i].Value = i - sRow;
							
							if (exSheet.Cells["B" + i].Value == null)
								exSheet.Cells["B" + i].Value = exSheet.Cells["B" + (i - 1)].Value;

							if (exSheet.Cells["C" + i].Value == null)
								exSheet.Cells["C" + i].Value = exSheet.Cells["C" + (i - 1)].Value;

							if (exSheet.Cells["D" + i].Value == null)
								exSheet.Cells["D" + i].Value = exSheet.Cells["D" + (i - 1)].Value;

							if (exSheet.Cells["E" + i].Value == null)
								exSheet.Cells["E" + i].Value = exSheet.Cells["E" + (i - 1)].Value;

						}
					}

                    string conString = CtlLib.GetConnecting();
                    OracleConnection connection = new OracleConnection(conString);
                    connection.Open();
                    OracleCommand command = connection.CreateCommand();
                    OracleTransaction transaction;
                    transaction = connection.BeginTransaction();
                    command.Transaction = transaction;

					myDT = exSheet.UsedRange.GetDataTable(false, false);
					//for(int row = sRow; row < myDT.Rows.Count; row++)
                    for (int row = sRow; row < myDT.Rows.Count; row++)
					{
						temp = "";
                        for (int col = 0; col < sCols; col++)
						{
							temp += myDT.Rows[row][col].ToString().Replace("'","''").ToString() + "!";
						}
                        CtlLib.WriteLogError(_procedure_file + "('" + temp + "')");
						temp += _p_1 + "!" + _p_2 + "!" +_p_3 + "!" +_p_4 + "!" +_p_5 + "!" + _import_seq;
						
						//temp += "!" + user_id;
						string[] paraIn = temp.Split('!');
						
						
                        result = CtlLib.ExecuteProcedureNotCommit(connection,command, _procedure_file, paraIn);

                        if (result == "1")
                        {
                            _count++;
                        }
                        else
                        {
                            CtlLib.WriteLogError(_procedure_file + "('" + temp + "')");
                            this.hiddenRecord.Value = result;
                            command.Dispose();
                            connection.Close();
                            connection.Dispose();
                            return;
                        }
					}

                    if (result == "1")
                    {
                        this.hiddenRecord.Value = _count.ToString();
                    }
                    else
                    {
                        this.hiddenRecord.Value = result;
                    }

                    transaction.Commit();
                    command.Dispose();
                    connection.Close();
                    connection.Dispose();
				}
			}
			catch(Exception e)
			{
                CtlLib.WriteLogError("ImportData:" + e.StackTrace );
                //Response.Write("ImportData:" +e.Message);	
                this.hiddenRecord.Value = e.Message;
			}
		}

        private void ImportDataNewHR()
        {
			
			DataTable myDT = new DataTable();
			string SQL = "";
			string _file = "";
			string temp = "";
			string user_id = "";
            string _file_name = "";
			try
			{	
				if (!string.IsNullOrEmpty(_img_pk))
				{
					CtlLib.SetUser(_dbuser);
					SQL = "SELECT DATA, FILENAME, FILESIZE, CRT_BY FROM "+_dbuser+".TC_FSBINARY WHERE PK = " + _img_pk;
					myDT = CtlLib.TableReadOpen(SQL);

                    _file_name = myDT.Rows[0]["FILENAME"].ToString();										
					_file = myDT.Rows[0]["FILENAME"].ToString();
					_file = _file.Substring(_file.LastIndexOf("\\") + 1, _file.Length - _file.LastIndexOf("\\") - 1);
					_file = "../temp/" + _file;
					_file =  Server.MapPath(_file);
					
					if(File.Exists(_file))
						File.Delete(_file);
					
					byte[] MyData = new byte[0];
					MyData = (byte[])myDT.Rows[0]["DATA"];
					BinaryWriter bw = new BinaryWriter(File.Open(_file,FileMode.OpenOrCreate));
					bw.Write(MyData);
					bw.Close();
					
					user_id = myDT.Rows[0]["CRT_BY"].ToString();
					
					IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(_file);
					IWorksheet exSheet = exBook.Worksheets[1];
					exSheet.UsedRange.UnMerge();					
										
					int sRow = 0;
					if (string.IsNullOrEmpty(_p_start))
						sRow = 2;
					else
						sRow = int.Parse(_p_start);					
					
					// chỗ này hơi chuối, vì dữ liệu trên file execel đã mer
					// nên phải set lại để truyền đủ tham số vào
					if ( _procedure_file.Substring(_procedure_file.IndexOf(".") + 1, _procedure_file.Length - _procedure_file.IndexOf(".")-1) == "HR_PRO_10020018_IMP_WT_OT")
					{
						myDT = exSheet.UsedRange.GetDataTable(false, false);
						for (int i = sRow; i <= myDT.Rows.Count; i++)
						{
							exSheet.Cells["A" + i].Value = i - sRow;
							
							if (exSheet.Cells["B" + i].Value == null)
								exSheet.Cells["B" + i].Value = exSheet.Cells["B" + (i - 1)].Value;

							if (exSheet.Cells["C" + i].Value == null)
								exSheet.Cells["C" + i].Value = exSheet.Cells["C" + (i - 1)].Value;

							if (exSheet.Cells["D" + i].Value == null)
								exSheet.Cells["D" + i].Value = exSheet.Cells["D" + (i - 1)].Value;

							if (exSheet.Cells["E" + i].Value == null)
								exSheet.Cells["E" + i].Value = exSheet.Cells["E" + (i - 1)].Value;

						}
					}
								
					int sCols = 0;
					if (string.IsNullOrEmpty(_p_cols))
						sCols = myDT.Columns.Count;
					else
						sCols = int.Parse(_p_cols);
						
					myDT = exSheet.UsedRange.GetDataTable(false, false);
					for(int row = sRow; row < myDT.Rows.Count; row++)
					{
						temp = "";
						for(int col = 0; col < sCols; col++)
						{
							temp += myDT.Rows[row][col].ToString().Replace("'","''").ToString() + "!";
						}

                        //bien thu 5 dung de luu ten file MR TRUONG ADD
                        _p_5 = _file_name;
						
						temp += _p_1 + "!" + _p_2 + "!" +_p_3 + "!" +_p_4 + "!" +_p_5 + "!" + _import_seq;
						
						//temp += "!" + user_id;
						string[] paraIn = temp.Split('!');
						
						CtlLib.WriteLogError(_procedure_file + "('" + temp + "')");						
						if(CtlLib.TableReadOpenString(_procedure_file,paraIn) == "1")
							_count++;
						else
						{
							CtlLib.WriteLogError(_procedure_file + "('" + temp + "')");
						}
					}
					this.hiddenRecord.Value = _count.ToString();
				}
			}
			catch(Exception e)
			{
                CtlLib.WriteLogError("ImportData:" + e.Message + "/" + myDT.Rows.Count.ToString());
                Response.Write("ImportData:" +e.Message);				
			}
		}
    
    }
}