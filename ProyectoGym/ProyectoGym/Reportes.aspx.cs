using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class Reportes : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string cl;
        public string constr = ConfigurationManager.ConnectionStrings["GymConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDLUsuario.DataSource = getData("selectClientes", null);
                DDLUsuario.DataBind();
                ListItem liUsuario = new ListItem("Seleccionar Usuario", "-1");
                DDLUsuario.Items.Insert(0, liUsuario);
            }
        }

        private DataSet getData(string sPname, SqlParameter spParameter)
        {
            conexion = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter(sPname, conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (spParameter != null)
            {
                da.SelectCommand.Parameters.Add(spParameter);
            }
            DataSet DS = new DataSet();
            da.Fill(DS);
            return DS;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DDLUsuario.Enabled = true;
        }

        private void reporteFacturas()
        {
            conexion = new SqlConnection(constr);


            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd3 = new SqlCommand("facturaCliente", conexion);
                cmd3.CommandType = CommandType.StoredProcedure;
                cmd3.Parameters.AddWithValue("@cliente", DDLUsuario.SelectedValue);
                SqlDataReader lector3 = cmd3.ExecuteReader();
                GridView1.DataSource = lector3;
                GridView1.DataBind();
                conexion.Close();



            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Label1.Text = ex.Message;   
            }
            finally
            {
                conexion.Close();
            }
        }

        protected void DDLUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            reporteFacturas();  
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            conexion = new SqlConnection(constr);


            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd3 = new SqlCommand("verInfoUsuarios", conexion);
                cmd3.CommandType = CommandType.StoredProcedure;
                SqlDataReader lector3 = cmd3.ExecuteReader();
                GridView1.DataSource = lector3;
                GridView1.DataBind();
                conexion.Close();



            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                conexion.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            conexion = new SqlConnection(constr);


            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd3 = new SqlCommand("selectProducto", conexion);
                cmd3.CommandType = CommandType.StoredProcedure;
                SqlDataReader lector3 = cmd3.ExecuteReader();
                GridView1.DataSource = lector3;
                GridView1.DataBind();
                conexion.Close();



            }
            catch (System.Data.SqlClient.SqlException ex)
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