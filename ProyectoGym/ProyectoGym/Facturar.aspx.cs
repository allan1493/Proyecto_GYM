using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ProyectoGym
{
    public partial class Facturar : System.Web.UI.Page
    {
        public SqlConnection conexion;
        public string cl;
        public string constr = ConfigurationManager.ConnectionStrings["GymConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DDLCodigo.DataSource = getData("selectProducto", null);
                DDLCodigo.DataBind();
                ListItem liCodigo = new ListItem("Seleccionar Producto", "-1");
                DDLCodigo.Items.Insert(0, liCodigo);

                DDLUsuario.DataSource = getData("selectClientes", null);
                DDLUsuario.DataBind();
                ListItem liUsuario = new ListItem("Seleccionar Usuario", "-1");
                DDLUsuario.Items.Insert(0, liUsuario);

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Codigo"), new DataColumn("Nombre"), new DataColumn("cantidad"), new DataColumn("Precio"), new DataColumn("Subtotal")});
                ViewState["Factura"] = dt;
                this.BindGrid();
            }
        }

        protected void BindGrid()
        {
            Lines.DataSource = (DataTable)ViewState["Factura"];
            Lines.DataBind();
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

        protected void Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)ViewState["Factura"];
                float sb = (float.Parse(TextCantidad.Text) * float.Parse(TextPrecio.Text));
                ViewState["Subtotal"] = (float.Parse(TextCantidad.Text) * float.Parse(TextPrecio.Text));
                dt.Rows.Add(DDLCodigo.SelectedValue.Trim(), TextNombre.Text.Trim(), TextCantidad.Text.Trim(), TextPrecio.Text.Trim(), ViewState["Subtotal"]);
                ViewState["Factura"] = dt;
                this.BindGrid();

               // ViewState["subtotal"] = (float.Parse(LSB.Text) + sb);
               //LSB.Text = (ViewState["subtotal"]).ToString();
                ViewState["IVA"] = (sb * 0.13);
                
                TextLIVA.Text = (ViewState["IVA"]).ToString();
                
                ViewState["total"] = ((float.Parse(TextCantidad.Text) * float.Parse(TextPrecio.Text)) + float.Parse(TextLIVA.Text));
                
                TextTotal.Text = (ViewState["total"]).ToString();
                

               // DDLCodigo.Focus();
                //tcodigo.Text = "";
                //tnombre.Text = "";
                //tcantidad.Text = "";
                //tprecio.Text = "";


            }
            catch (System.Data.SqlClient.SqlException ex)
            {

                Label1.Text = ex.ToString();
            }


            finally
            {


            }
        }

        private void agregarMaestroFactura()
        {
            // int retorno = 0;

            conexion = new SqlConnection(constr);
            

            try
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("insertMae_Factura", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    cmd.Parameters.Add(new SqlParameter("@Cliente", DDLUsuario.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@Total", devolverTotal()));
                    cmd.Parameters.Add(new SqlParameter("@IV", devolverIVA()));
                SqlDataReader lector3 = cmd.ExecuteReader();




            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                
            }
            finally
            {
                conexion.Close();
            }

           
        }

        private void selectCodigoFactura()
        {
            
            conexion = new SqlConnection(constr);


            try
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("selectUsuario", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@usuario", DDLUsuario.SelectedValue));
                
                SqlDataReader lector3 = cmd.ExecuteReader();

                while (lector3.Read())
                {
                    cl = lector3[0].ToString();
                    
                }


                

            }
            catch (System.Data.SqlClient.SqlException ex)
            {

            }
            finally
            {
                conexion.Close();
            }
        }

        private void agregarDetFactura()
        {

            selectCodigoFactura();
            foreach (GridViewRow item in Lines.Rows)
                {
                agregarLineas(item.Cells[1].Text, item.Cells[3].Text, item.Cells[4].Text, item.Cells[5].Text);


                }

            
            
        }

        private void agregarLineas(string col1, string col2, string col3, string col4)
        {
            conexion = new SqlConnection(constr);
           // Label1.Text = col1;

            try
            {

                conexion.Open();
                
                    SqlCommand cmd = new SqlCommand("inserDet_Factura", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    cmd.Parameters.Add(new SqlParameter("@factura", cl));
                    cmd.Parameters.Add(new SqlParameter("@producto", col1));
                    cmd.Parameters.Add(new SqlParameter("@cantidad", col2));
                    cmd.Parameters.Add(new SqlParameter("@precio", col3));
                    cmd.Parameters.Add(new SqlParameter("@iv", lineaIVA(col4)));
                    SqlDataReader lector3 = cmd.ExecuteReader();


                

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

        private double devolverIVA()
        {
            double iva = 0;
            foreach(GridViewRow item in Lines.Rows)
            {
                iva = iva + (float.Parse(item.Cells[5].Text)*0.13);
            }
            return iva;
        }

        private double lineaIVA( string subtotal)
        {
            double total = 0;
            total = total + (double.Parse(subtotal)*0.13);
            return total;
        }

        private double lineaTotal(string subtotal)
        {
            double total = 0;
            total = total +((double.Parse(subtotal)*0.13)+double.Parse(subtotal));   
            return total;
        }

        private double devolverTotal() { 
            double total = 0;
            foreach(GridViewRow item in Lines.Rows)
            {
                total = total +( (double.Parse(item.Cells[5].Text)*0.13) + double.Parse(item.Cells[5].Text)) ;
            }
            return total;
        }

        protected void DDLCodigo_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            conexion = new SqlConnection(constr);
            conexion.Open();

            SqlCommand cmd3 = new SqlCommand("selectDetProducto", conexion);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Parameters.AddWithValue("@codigo", DDLCodigo.SelectedValue);
            SqlDataReader lector3 = cmd3.ExecuteReader();
            while (lector3.Read())
            {
                TextNombre.Text = lector3[1].ToString();
                TextPrecio.Text = lector3[2].ToString();
            }
            conexion.Close();
        }

        protected void Factura_Click(object sender, EventArgs e)
        {
            agregarMaestroFactura();
            agregarDetFactura();
            Label1.Text = "Facturado exitosamente";
        }

        protected void Lines_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Factura"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Factura"] = dt;
            this.BindGrid();
            
            
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuSA.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx");
        }
    }
}