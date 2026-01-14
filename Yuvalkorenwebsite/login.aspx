<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 100%; max-width: 400px;">
                        </tr>
                    <td><label>Email</label></td>
            <td><input type ="text" name ="Email" style="width: 100%;" /></td>
                            <tr>
                            <tr>
            <td><label>Password</label></td>
            <td><input type ="text" name ="Password" style="width: 100%;" /></td>
            </tr>
             <tr>
             <td colspan="2">
             <button type="submit">Submit</button>
           
            </td>
         </tr>
           
</asp:Content>

