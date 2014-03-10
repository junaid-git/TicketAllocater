using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using CP.TicketAllocator.Logger;
using System.Configuration;
using System.Data.Common;

namespace CP.TicketAllocator.DAL
{
    public class DBGateway
    {
        private static readonly string dataProvider;
        private static readonly DbProviderFactory dataFactory;

        private static readonly string connectionStringName;
        private static readonly string connectionString;

        static DBGateway()
        {
            //dataProvider = ConfigurationManager.AppSettings.Get(Configuration.DataProvider);
            //dataFactory = DbProviderFactories.GetFactory(dataProvider);
            //connectionStringName = ConfigurationManager.AppSettings.Get(Configuration.ConnectionStringName);
            //connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;             

            dataProvider = "System.Data.SqlClient";
            dataFactory = DbProviderFactories.GetFactory(dataProvider);
            connectionString = @"Data Source=SWEETY\SQLEXPRESS;Initial Catalog=TicketAllocator; Integrated Security=true";
        }

        //public static DataTable GetData(string DBObject)
        //{
        //    DataTable dataTable = null;


        //    try
        //    {
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();
        //            SqlCommand cmd = new SqlCommand(DBObject, connection);
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataSet ds = new DataSet();
        //            da.Fill(ds);
        //            if (ds != null && ds.Tables != null && ds.Tables.Count > 0)
        //                dataTable = ds.Tables[0];
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        ExceptionLogger.LogException(LogType.Error, "Error occurred while fetching data...", e);
        //    }

        //    return dataTable;
        //}

        public static List<T> GetData<T>(string DBObject, Func<IDataReader, T> CreateObjectFunc, Dictionary<string, object> param = null)
        {
            List<T> listData = null;
            try
            {
                using (var connection = dataFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (var command = dataFactory.CreateCommand())
                    {
                        command.Connection = connection;
                        command.CommandText = DBObject;
                        command.CommandType = CommandType.StoredProcedure;
                        if (param != null)
                        {
                            foreach (KeyValuePair<string, object> item in param)
                            {
                                SqlParameter sqlParam = new SqlParameter(item.Key, item.Value);
                                command.Parameters.Add(sqlParam);
                            }
                        }
                        connection.Open();

                        listData = new List<T>();
                        var reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            listData.Add(CreateObjectFunc(reader));
                        }
                    }
                }
            }
            catch (Exception e)
            {
                ExceptionLogger.LogException(LogType.Error, "Error occurred while fetching data...", e);
            }
            return listData;
        }

        public static bool UpdateData(string DBObject, ref Dictionary<string, object> outParam, Dictionary<string, object> inParam = null)
        {
            bool result = true;
            try
            {
                using (var connection = dataFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (var command = dataFactory.CreateCommand())
                    {
                        command.Connection = connection;
                        command.CommandText = DBObject;
                        command.CommandType = CommandType.StoredProcedure;
                        if (inParam != null)
                        {
                            foreach (KeyValuePair<string, object> item in inParam)
                            {
                                SqlParameter sqlParam = new SqlParameter(item.Key, item.Value);
                                command.Parameters.Add(sqlParam);
                            }
                        }

                        if (outParam != null)
                        {
                            foreach (KeyValuePair<string, object> item in outParam)
                            {
                                SqlParameter sqlParam = new SqlParameter(item.Key, item.Value);
                                sqlParam.Direction = ParameterDirection.Output;
                                command.Parameters.Add(sqlParam);
                            }
                        }
                        connection.Open();
                        command.ExecuteNonQuery();

                        if (outParam != null)
                        {

                            List<string> keys = new List<string>(outParam.Keys);
                            for (int i = 0; i < outParam.Count; i++)
                            {
                                outParam[keys[i]] = command.Parameters[keys[i]].Value;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                ExceptionLogger.LogException(LogType.Error, "Error occurred while fetching data...", e);
                result = false;
            }
            return result;
        }
    }
}
