using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CoffeeShopAppBD
{
    internal class Class1
    {
        SqlConnection sqlConnection = new SqlConnection(@"Data Source= (localdb)\MSSQLLocalDB;Initial Catalog=CoffeeShop;Integrated Security=True");
        public void openConnection()
        {
            if (sqlConnection.State == System.Data.ConnectionState.Closed)
            {
                sqlConnection.Open();
            }
        }

        public void closeConnection()
        {
            if (sqlConnection.State == System.Data.ConnectionState.Open) 
            {
                sqlConnection.Close();
            }
        }

        public SqlConnection GetSqlConnection()
        {
            return sqlConnection;
        }

    }
}
