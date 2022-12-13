﻿using System;
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
    public partial class Producto : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string constr = ConfigurationManager.ConnectionStrings["GymConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd = new SqlCommand("insertProducto", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigo", CodigoText.Text);
                cmd.Parameters.AddWithValue("@nombre", NombreText.Text);
                cmd.Parameters.AddWithValue("@precio", PrecioText.Text);
               

                SqlDataReader reader = cmd.ExecuteReader();

                conexion.Close();

            }

            catch (System.Data.SqlClient.SqlException ex) {
                Label1.Text = ex.ToString();
            }
            finally
            {
                conexion.Close();
            }

        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd = new SqlCommand("actualizarProducto", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigo", GridView1.SelectedRow.Cells[1].Text);
                cmd.Parameters.AddWithValue("@nombre", Nombre.Text);
                cmd.Parameters.AddWithValue("@precio", PrecioText.Text);


                SqlDataReader reader = cmd.ExecuteReader();

                conexion.Close();

            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                Label1.Text = ex.ToString();
            }
            finally
            {
                conexion.Close();
            }
        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd = new SqlCommand("selectProducto", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                conexion.Close();


            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                Label1.Text = ex.ToString();
            }
            finally
            {
                conexion.Close();
            }
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion = new SqlConnection(constr);
                conexion.Open();

                SqlCommand cmd = new SqlCommand("eliminarProducto", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigo", GridView1.SelectedRow.Cells[1].Text);
                SqlDataReader reader = cmd.ExecuteReader();

                conexion.Close();

            }

            catch (System.Data.SqlClient.SqlException ex)
            {
                Label1.Text = ex.ToString();
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}