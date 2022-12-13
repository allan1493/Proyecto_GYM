<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facturar.aspx.cs" Inherits="ProyectoGym.Facturar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama:Facturacion</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header></header>
        </div>
        <div>
            <asp:DropDownList ID="DDLUsuario" runat="server" DataTextField="codigo" DataValueField="codigo"></asp:DropDownList>
            <asp:DropDownList ID="DDLCodigo" runat="server" DataTextField="Codigo" DataValueField="Codigo" AutoPostBack="true" OnSelectedIndexChanged="DDLCodigo_SelectedIndexChanged"></asp:DropDownList>
            <asp:TextBox ID="TextNombre" runat="server" Enabled="False"></asp:TextBox>
            <asp:TextBox ID="TextCantidad" runat="server" TextMode="Number">1</asp:TextBox>
            <asp:TextBox ID="TextPrecio" runat="server" Enabled="False"></asp:TextBox>
            <asp:TextBox ID="LSB" runat="server" Enabled="False" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextLIVA" runat="server" Enabled="false" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextTotal" runat="server" Enabled="false" Visible="false"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Agregar_Click" />
            <asp:Button ID="Factura" runat="server" Text="Facturar" OnClick="Factura_Click" />
        </div>
        <div>
            
            <asp:GridView ID="Lines" runat="server" OnRowDeleting="OnRowDeleting" OnRowDatBound ="OnRowDataBound">
                <Columns>
                    
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />        
                </Columns>
            </asp:GridView>
        </div>
        
    </form>
</body>
</html>
