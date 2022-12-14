using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;

namespace ProyectoGym
{
    public partial class Login : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string constr = ConfigurationManager.ConnectionStrings["GymConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conexion = new SqlConnection(constr);
            
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            
            try
            {
                conexion.Open();

                SqlCommand cmd = new SqlCommand("selectLogin", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usuario", TextBox1.Text);
                cmd.Parameters.AddWithValue("@contrasena", TextBox2.Text);

                SqlDataReader reader = cmd.ExecuteReader();

                Response.Redirect("MenuSA.aspx");
                /*if (reader.Read())
                {
                    if(TextBox1.Text.Equals("sa"))
                        Response.Redirect("Clientes.aspx");
                    else
                        Response.Redirect("MenuUsuario.aspx");

                }*/
                

            }

            catch(System.Data.SqlClient.SqlException ex) 
            {
                Label1.Text = ex.Message;   
            }

            finally
            {
                conexion.Close();  
            }
            
            

        }

        
    }
}