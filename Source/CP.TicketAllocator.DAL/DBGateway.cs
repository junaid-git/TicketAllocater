using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace CP.TicketAllocator.DAL
{
    public class DBGateway
    {
        public static DataTable GetData(string DBObject)
        {
            DataTable dataTable = null;
            
            string connectionString = "server=(localdb)\\V11.0;Integrated Security=SSPI;database=TestDataBase";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(DBObject, connection);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds != null && ds.Tables != null && ds.Tables.Count > 0)
                        dataTable = ds.Tables[0];
                }
            }
            catch (Exception e)
            {
                
            }

            return dataTable;
        }
    }
}
