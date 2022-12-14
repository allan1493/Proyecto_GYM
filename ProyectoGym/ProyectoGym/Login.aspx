<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Login.aspx.cs" Inherits="ProyectoGym.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gym Saitama</title>
    <link rel="stylesheet" href="CSS/loginCSS.css">
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="center">
            
             <asp:Image CssClass="Imagen" ID="Image2" runat="server" ImageUrl="~/Images/saitama.jpg"/>
            
               
                <div class="text_Field">
                   
                    <span></span>
                    <label>Usuario</label>
                   
                    <asp:TextBox CssClass="texbox" ID="TextBox1" runat="server" Width="490px"></asp:TextBox>
                </div>
                <div class="text_Field">
                    
                    <asp:TextBox CssClass="texbox" ID="TextBox2" runat="server" TextMode="Password" Width="491px"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="Contraseña o usuario incorrecto" Visible="False"></asp:Label>
                    <span></span>
                    <label>Contraseña</label>
                </div>
                <div class="pass">Olvidó contraseña?</div>
                
                <div>
                    <asp:Button ID="Button1" CssClass ="boton" runat="server" Text="Login" OnClick="Button1_Click1" />
                </div>
                
          
        </div>
        
    </form>
</body>
</html>
