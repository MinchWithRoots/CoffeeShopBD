using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CoffeeShopAppBD
{
    public partial class LogInForm : Form
    {
        private Class1 db = new Class1();

        public LogInForm()
        {

            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void LogInbtn_Click(object sender, EventArgs e)
        {
            string email = logInTxt.Text.Trim();
            string password = txtPassword.Text.Trim();
            try
            {
                db.openConnection();

                string query = "SELECT * FROM Customers WHERE email = @Email AND password = @Password";
                SqlCommand command = new SqlCommand(query, db.GetSqlConnection());
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    MessageBox.Show("Login successful! Welcome, User.");
                    UserForm userForm = new UserForm();
                    userForm.Show();
                    this.Hide();
                }
                else
                {
                    reader.Close();

                    query = "SELECT * FROM Employees WHERE name = @name AND password = @Password";
                    command = new SqlCommand(query, db.GetSqlConnection());
                    command.Parameters.AddWithValue("@name", email);
                    command.Parameters.AddWithValue("@Password", password);

                    reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        MessageBox.Show("Login successful! Welcome, Admin.");
                        AdminForm adminForm = new AdminForm();
                        adminForm.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Invalid email or password.");
                    }
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
            finally
            {
                db.closeConnection();
            }
        }
       

        private void registration_Click(object sender, EventArgs e)
        {
            RegistrationForm frm = new RegistrationForm();
            frm.Show();

        }
    }
}
