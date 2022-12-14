<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facturar.aspx.cs" Inherits="ProyectoGym.Facturar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama:Facturacion</title>
    <link rel="stylesheet" href="CSS/llenado.css">
</head>
<body>
    
    <form id="form1" runat="server" class="form">
        <div>
            <header class="subnav">
                
                <asp:Button ID="Button1" CssClass="subnavbtn" runat="server" Text="Clientes" OnClick="Button1_Click" />
                <asp:Button ID="Button2" CssClass="subnavbtn" runat="server" Text="Productos" OnClick="Button2_Click" />
                <asp:Button ID="Button4" CssClass="subnavbtn" runat="server" Text="Reportes" OnClick="Button4_Click" />
                <asp:Button ID="Button3" CssClass="subnavbtn" runat="server" Text="Home" OnClick="Button3_Click" />
                
            </header>
            <br />
            <br />
            <br />
        </div>
        <div class="dropdown">
            <asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label>
            <asp:DropDownList ID="DDLUsuario" CssClass="dropdown-content" runat="server" DataTextField="codigo" DataValueField="codigo"></asp:DropDownList></div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="dropdown">
             <asp:Label ID="Label3" runat="server" Text="Producto"></asp:Label>
             <asp:DropDownList ID="DDLCodigo" CssClass="dropdown-content" runat="server" DataTextField="Codigo" DataValueField="Codigo" AutoPostBack="true" OnSelectedIndexChanged="DDLCodigo_SelectedIndexChanged"></asp:DropDownList></div>
           <div class ="textbox">
               <asp:Label ID="Label4" runat="server" Text="Nombre: "></asp:Label>
               <asp:TextBox ID="TextNombre" runat="server" Enabled="False"></asp:TextBox></div>
            <div class="textbox">
                <asp:Label ID="Label5" runat="server" Text="Cantidad: "></asp:Label>
                <asp:TextBox ID="TextCantidad" runat="server" TextMode="Number">1</asp:TextBox></div>
            <div class="textbox">
                <asp:Label ID="Label6" runat="server" Text="Precio: "></asp:Label>
                <asp:TextBox ID="TextPrecio" runat="server" Enabled="False"></asp:TextBox>
                </div>
          <div>  <asp:TextBox ID="LSB" runat="server" Enabled="False" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextLIVA" runat="server" Enabled="false" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextTotal" runat="server" Enabled="false" Visible="false"></asp:TextBox>
            
        </div>
        <div class="label">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:Button ID="Agregar" CssClass="boton" runat="server" Text="Agregar" OnClick="Agregar_Click" /> 
            <br />
            <br />
            <br />
        </div>
        <div>
            <asp:Button ID="Factura" CssClass="boton" runat="server" Text="Facturar" OnClick="Factura_Click" />
        </div>
        <div class="mGrid">
            
            <asp:GridView ID="Lines" runat="server" OnRowDeleting="OnRowDeleting" OnRowDatBound ="OnRowDataBound">
                <Columns>
                    
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />        
                </Columns>
            </asp:GridView>
        </div>
        
    </form>
</body>
</html>
