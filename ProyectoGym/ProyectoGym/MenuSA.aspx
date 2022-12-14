<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="MenuSA.aspx.cs" Inherits="ProyectoGym.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GYM Saitama</title>
    <link rel="stylesheet" href="CSS/Menu.css">
</head>
<body>
    <form id="form1" runat="server">
        
  <div class="subnav">
    
      <asp:Button ID="Button1" class="subnavbtn" runat="server" Text="Clientes" OnClick="Button1_Click" />
    </div>
  
  <div class="subnav">
    
      <asp:Button ID="Button2" class="subnavbtn" runat="server" Text="Productos" OnClick="Button2_Click" />
    </div>
  
  <div class="subnav">
    
      <asp:Button ID="Button3" class="subnavbtn" runat="server" Text="Facturar" OnClick="Button3_Click" />
  </div>
  <div class="subnav">
    
        <asp:Button ID="Button4" class="subnavbtn" runat="server" Text="Reportes" OnClick="Button4_Click" />
    
  </div>
        <div>

        </div>
        <div>

        </div>
        <div>

        </div>
        <div >
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" CssClass="label"  runat="server" Text="Bienvenido al GYM Saitama!" Width="142px"></asp:Label>
        </div>
        
    </form>
</body>
</html>
