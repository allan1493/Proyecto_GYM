using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoGym
{
    public partial class Clientes : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string constr = ConfigurationManager.ConnectionStrings["GymConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               provincias.DataSource = getData("selectProvincia", null);
               provincias.DataBind();  
                ListItem liProvincia = new ListItem("Seleccionar Provincia","-1");
                provincias.Items.Insert(0, liProvincia);
                ListItem liCanton = new ListItem("Seleccionar Canton", "-1");
                cantones.Items.Insert(0, liCanton);
                ListItem liDistrito = new ListItem("Seleccionar Distrito", "-1");
                distrito.Items.Insert(0, liDistrito);
                cantones.Enabled = false;
                distrito.Enabled = false;
            }


        }

        private DataSet getData(string sPname, SqlParameter spParameter)
        {
            conexion = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter(sPname, conexion);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if(spParameter != null)
            {
                da.SelectCommand.Parameters.Add(spParameter);   
            }
            DataSet DS = new DataSet();
            da.Fill(DS);    
            return DS;
        }

        private void ingresarUsuario()
        {
            SqlConnection con;
            con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd3 = new SqlCommand("insertarUsuario", con);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Parameters.AddWithValue("@usuario", correo.Text);
            cmd3.Parameters.AddWithValue("@contrasena",generarContrasena());
            SqlDataReader reader3 = cmd3.ExecuteReader();
            con.Close();
        }
        protected void Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd = new SqlCommand("insertarCliente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigo", correo.Text);
                cmd.Parameters.AddWithValue("@nombre", nombre.Text);
                cmd.Parameters.AddWithValue("@apellido", apellidos.Text);
                cmd.Parameters.AddWithValue("@telefono", telefono.Text);

                SqlDataReader reader = cmd.ExecuteReader();

                conexion.Close();
                conexion.Open();

                SqlCommand cmd2 = new SqlCommand("insertarDirecciones", conexion);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@codigo", correo.Text);
                cmd2.Parameters.AddWithValue("@provincia", provincias.SelectedValue);
                cmd2.Parameters.AddWithValue("@canton", cantones.SelectedValue);
                cmd2.Parameters.AddWithValue("@distrito", distrito.SelectedValue);
                cmd2.Parameters.AddWithValue("@comentarios", comentarios.Text);

                SqlDataReader reader2 = cmd2.ExecuteReader();
                conexion.Close();

                ingresarUsuario();

                Label9.Text = "Ingreso exitoso";

                

            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                Label9.Text = ex.Message;
            }

            finally
            {
                conexion.Close();
            }



        }

        protected void provincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(provincias.SelectedIndex == 0)
            {

            }
            else
            {
                cantones.Enabled = true;
                SqlParameter parameter = new SqlParameter("@codigo",provincias.SelectedValue);
                DataSet DS = getData("selectCanton", parameter);

                cantones.DataSource = DS;
                cantones.DataBind();
                ListItem liCantones = new ListItem("Seleccionar Canton", "-1");
                cantones.Items.Insert(0,liCantones);
                distrito.SelectedIndex = 0;
            }
            

            

        }

        protected void cantones_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cantones.SelectedIndex == 0)
            {

            }
            else
            {
                distrito.Enabled = true;
                SqlParameter parameter = new SqlParameter("@codigo", cantones.SelectedValue);
                DataSet DS = getData("selectDistrito", parameter);

                distrito.DataSource = DS;
                distrito.DataBind();
                ListItem lidistrito = new ListItem("Seleccionar Distrito", "-1");
                distrito.Items.Insert(0, lidistrito);
            }

        }
        private static string generarContrasena()
        {
            Random rdn = new Random();
            string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890%$#@";
            int longitud = caracteres.Length;
            char letra;
            int longitudContrasenia = 10;
            string contraseniaAleatoria = string.Empty;
            for (int i = 0; i < longitudContrasenia; i++)
            {
                letra = caracteres[rdn.Next(longitud)];
                contraseniaAleatoria += letra.ToString();
            }
            return contraseniaAleatoria;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conexion = new SqlConnection(constr);
            conexion.Open();
           
            SqlCommand cmd3 = new SqlCommand("selectClientes", conexion);
            SqlDataReader lector3 = cmd3.ExecuteReader();
            GridView1.DataSource = lector3;
            GridView1.DataBind();
            conexion.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            correo.Text = GridView1.SelectedRow.Cells[1].Text;
            nombre.Text = GridView1.SelectedRow.Cells[2].Text;
            apellidos.Text = GridView1.SelectedRow.Cells[3].Text;
            telefono.Text = GridView1.SelectedRow.Cells[4].Text;
            //provincias.DataTextField = GridView1.SelectedRow.Cells[5].Text;    
            //cantones.DataTextField = GridView1.SelectedRow.Cells[6].Text;
            //distrito.DataTextField = GridView1.SelectedRow.Cells[7].Text;
            comentarios.Text =  GridView1.SelectedRow.Cells[8].Text;
        }

        private void actualizaUsuario() {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd = new SqlCommand("actualizarUsuario", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", GridView1.SelectedRow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@nuevo", correo.Text);
            SqlDataReader reader = cmd.ExecuteReader();
        }

        private void actualizarCliente()
        {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd = new SqlCommand("actualizarCliente", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@codigo", GridView1.SelectedRow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@codigoNuevo", correo.Text);
            cmd.Parameters.AddWithValue("@nombre", nombre.Text);
            cmd.Parameters.AddWithValue("@apellido", apellidos.Text);
            cmd.Parameters.AddWithValue("@telefono", telefono.Text);

            SqlDataReader reader = cmd.ExecuteReader();
        }

        private void eliminarDireccion()
        {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd2 = new SqlCommand("eliminarDireccion", conexion);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@cliente", GridView1.SelectedRow.Cells[1].Text);
           
            SqlDataReader reader2 = cmd2.ExecuteReader();
        }

        private void crearDireccion()
        {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd2 = new SqlCommand("insertarDirecciones", conexion);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@codigo", correo.Text);
            cmd2.Parameters.AddWithValue("@provincia", provincias.SelectedValue);
            cmd2.Parameters.AddWithValue("@canton", cantones.SelectedValue);
            cmd2.Parameters.AddWithValue("@distrito", distrito.SelectedValue);
            cmd2.Parameters.AddWithValue("@comentarios", comentarios.Text);

            SqlDataReader reader2 = cmd2.ExecuteReader();
            conexion.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                actualizaUsuario();
                eliminarDireccion();
                actualizarCliente();
                crearDireccion();
                // actualizarDireccion();
                Label9.Text = "Actualización exitosa";

                
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Label9.Text = ex.Message;
            }

            finally
            {
                conexion.Close();
            }
        }

        private void eliminarUsuario() {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd = new SqlCommand("eliminarUsuario", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", correo.Text);
            SqlDataReader reader = cmd.ExecuteReader();
        }
        private void eliminarCliente() {
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd = new SqlCommand("eliminarCliente", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cliente", correo.Text);
            SqlDataReader reader = cmd.ExecuteReader();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                eliminarUsuario();
                eliminarDireccion();
                eliminarCliente();

                // actualizarDireccion();
                Label9.Text = "Eliminado exitosamente";


            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Label9.Text = ex.Message;
            }

            finally
            {
                conexion.Close();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Facturar.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuSA.aspx");
        }
    }

    
    
}