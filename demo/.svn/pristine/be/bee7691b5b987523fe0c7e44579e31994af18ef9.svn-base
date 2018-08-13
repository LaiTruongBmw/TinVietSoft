using System;
using System.Collections.Generic;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Data;
/// <summary>
/// Summary description for CJson
/// </summary>
public class CJson
{
    public CJson()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static String ResultSet2JSONString(DataSet ds)
    {
        
        JObject jResult = new JObject();
        JArray jsonArray = new JArray();
        jResult.Add(gwConstants.J_RESULTS, gwConstants.J_RS_SUCCESS);
        jResult.Add(gwConstants.J_TOTALS, ds.Tables.Count);

            for (int i = 0; i < ds.Tables.Count; i++)
            {
            JObject curObj = new JObject();
            JArray jRecords = new JArray();
            JArray jColumns = new JArray();
            try
            {
               
                DataTable dt = ds.Tables[i];
                int numCol = dt.Columns.Count;
                for (int col = 1; col < numCol; col++)
                {
                    jColumns.Add(dt.Columns[col].ColumnName.ToLower());
                }
                curObj.Add(gwConstants.J_COLUMNS, jColumns);

              
                int numRow = dt.Rows.Count;
                for (int row = 0; row < numRow; row ++)
                {
                    JObject jRecord = new JObject();
                    for (int col = 0; col < numCol; col++)
                    {
                        String colName = dt.Columns[col].ColumnName.ToLower();
                        Object colValue;
                        if (dt.Columns[col].DataType == typeof(System.Byte))
                        {
                            Byte[] buff = (byte[])dt.Rows[row][col];
                            colValue = Convert.ToBase64String(buff);
                        }
                        else
                        {
                            colValue = dt.Rows[row][col].ToString();
                            colValue = (colValue == null) ? gwConstants.NO_DATA : colValue;
                        }
                        jRecord.Add(colName, colValue.ToString());

                    }
                    jRecords.Add(jRecord);                   
                }
 
                curObj.Add(gwConstants.J_RECORDS, jRecords);               
                curObj.Add(gwConstants.J_TOTAL_ROWS, numRow);
              
            }
            catch (Exception e)
            {
                jResult = new JObject();
                jResult.Add(gwConstants.J_RESULTS, gwConstants.J_RS_FAILURE);

                JArray jErrors1 = new JArray();
                JObject jErrorsNo1 = new JObject();
                jErrorsNo1.Add(gwConstants.J_RESULT_ERROR_NO, "");
                jErrors1.Add(jErrorsNo1);
                JObject jErrorsMesg1 = new JObject();
                jErrorsMesg1.Add(gwConstants.J_RESULT_ERROR_MSG, "");
                jErrors1.Add(jErrorsNo1);

                //final info data
                jResult.Add(gwConstants.J_RESULT_ERROR, jErrors1);
            }

            jsonArray.Add(curObj);          
            /*
               //error part info
               JArray jErrors = new JArray();

               JObject jErrorsNo = new JObject();
               jErrorsNo.Add(gwConstants.J_RESULT_ERROR_NO, "");
               jErrors.Add( jErrorsNo);
               JObject jErrorsMesg = new JObject();
               jErrorsMesg.Add(gwConstants.J_RESULT_ERROR_MSG, "");
               jErrors.Add(jErrorsNo);

               //final info data
               jResult.Add(gwConstants.J_RESULT_ERROR, jErrors);

               //add login information
               jResult.Add(gwConstants.J_RESULT_LOGS, "");
               */
        }
        jResult.Add(gwConstants.J_OBJ_CUR_DATAS, jsonArray);
        return jResult.ToString();
    }
public static  String ResultSet2JSONError(int arg_ErrorNo, String arg_ErrorMsg, String arg_Statement, String arg_Parameter) {

		 
		
		JObject jResult = new JObject();
	
		jResult.Add(gwConstants.J_RESULTS, gwConstants.J_RS_FAILURE);			
		
		JArray jErrors = new JArray();
        JObject jErrorsNo = new JObject();
		jErrorsNo.Add(gwConstants.J_RESULT_ERROR_NO,arg_ErrorNo);
		jErrors.Add( jErrorsNo);
        JObject jErrorsMesg = new JObject();
		jErrorsMesg.Add(gwConstants.J_RESULT_ERROR_MSG,arg_ErrorMsg);
		jErrors.Add(jErrorsMesg);
		
		//final info data
		jResult.Add(gwConstants.J_RESULT_ERROR, jErrors);		
		
		JArray jLoggs = new JArray();			
		JObject jlogstatement = new JObject();
		jlogstatement.Add(gwConstants.J_RESULT_LOG_STATEMENT,arg_Statement);
		jLoggs.Add(jlogstatement);
		
		JObject jLoggParam = new JObject();
		jLoggParam.Add(gwConstants.J_RESULT_LOG_PARAMETER,arg_Parameter);
		jLoggs.Add(jLoggParam);		
		jResult.Add(gwConstants.J_RESULT_LOGS, jLoggs);		
		return jResult.ToString();
		
	}
	
	}