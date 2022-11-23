using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Examen2
{
    public partial class Ventas : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string constr = ConfigurationManager.ConnectionStrings["Examen2ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                string cajero = "Select * from Cajeros";
                string maquina = "Select * from Maquinas_Registradoras";
                string producto = "Select * from Productos";

                SqlCommand comCajero = new SqlCommand(cajero, conexion);
                SqlCommand comMaquina = new SqlCommand(maquina, conexion);
                SqlCommand comProducto = new SqlCommand(producto, conexion);

                SqlDataAdapter sqlCajero = new SqlDataAdapter(comCajero);
                SqlDataAdapter sqlMaquina = new SqlDataAdapter(comMaquina);
                SqlDataAdapter sqlProducto = new SqlDataAdapter(comProducto);

                DataSet ds1 = new DataSet();
                sqlCajero.Fill(ds1);
                DataSet ds2 = new DataSet();
                sqlMaquina.Fill(ds2);
                DataSet ds3 = new DataSet();
                sqlProducto.Fill(ds3);

                DropDownList1.DataTextField = ds1.Tables[0].Columns["Codigo"].ToString();
                //DropDownList1.DataValueField = ds1.Tables[0].Columns["Codigo"].ToString();
                DropDownList1.DataSource = ds1.Tables[0];

                DropDownList1.DataBind();



                DropDownList2.DataTextField = ds2.Tables[0].Columns["Codigo"].ToString();
                //DropDownList2.DataValueField = ds2.Tables[0].Columns["Codigo"].ToString();
                DropDownList2.DataSource = ds2.Tables[0];
                DropDownList2.DataBind();

                DropDownList3.DataTextField = ds3.Tables[0].Columns["Codigo"].ToString();
                // DropDownList3.DataValueField = ds3.Tables[0].Columns["Codigo"].ToString();
                DropDownList3.DataSource = ds3.Tables[0];
                DropDownList3.DataBind();
                conexion.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conexion = new SqlConnection(constr);
            conexion.Open();


            string insertar = "Insert into Venta(Codigo_Cajero,Codigo_Maquina,Codigo_Producto,Fecha) values(@codigoCajero, @codigoMaquina, @codigoProducto, @fecha)";
            SqlCommand cmd = new SqlCommand(insertar, conexion);
            cmd.Parameters.AddWithValue("@codigoCajero", int.Parse(DropDownList1.SelectedValue));
            cmd.Parameters.AddWithValue("@codigoMaquina", int.Parse(DropDownList2.SelectedValue));
            cmd.Parameters.AddWithValue("@codigoProducto", int.Parse(DropDownList3.SelectedValue));
            cmd.Parameters.AddWithValue("@fecha", DateTime.Today);
            
            SqlDataReader reader = cmd.ExecuteReader();
            conexion.Close();

            conexion.Open();
            string sql3 = "Select Cajeros.Nombre as NombreCajero, Productos.Nombre as NombreProducto, Productos.Precio, Maquinas_Registradoras.Piso from Cajeros join Venta on Cajeros.Codigo = Venta.Codigo_Cajero join Productos on Productos.Codigo = Venta.Codigo_Producto join Maquinas_Registradoras on Maquinas_Registradoras.Codigo = Venta.Codigo_Maquina";
            SqlCommand cmd3 = new SqlCommand(sql3, conexion);
            SqlDataReader lector3 = cmd3.ExecuteReader();
            GridView1.DataSource = lector3;
            GridView1.DataBind();
            conexion.Close();
        }
    }
}