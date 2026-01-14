<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1>Register to Yuval Koren's website</h1>

    <form id="genre-form">
        <table style="width: 100%; max-width: 400px;">
            <tr>
                <td><label>First Name</label></td>
                 <td><input type ="text" name ="firstname" style="width: 100%;" /></td>
                    </tr>
                    <tr>
            <td><label>Last Name</label></td>
             <td><input type ="text" name ="lastname" style="width: 100%;" /></td>
                        <tr>
                        </tr>
                    <td><label>Email</label></td>
            <td><input type ="text" name ="Email" style="width: 100%;" /></td>
                            <tr>
                            <tr>
            <td><label>Password</label></td>
            <td><input type ="text" name ="Password" style="width: 100%;" /></td>
            </tr>
            <tr>
                <td>
                    choose a movie genre
                </td>
                <td>
                    <label><input type="checkbox" value="Action" /> Action</label><br>
                    <label><input type="checkbox" value="Animation" /> Animation</label><br>
                    <label><input type="checkbox" value="Fantasy" /> Fantasy</label><br>
                    <label><input type="checkbox" value="Comedy" /> Comedy</label><br>
                    <label><input type="checkbox" value="Horror" /> Horror</label><br>
                    <label><input type="checkbox" value="Science fiction" /> Sci-fi</label><br>
                    <label><input type="checkbox" value="Romance" /> Romance</label><br>
                    <label><input type="checkbox" value="Thriller" /> Thriller</label><br><br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                        <button type="submit">Submit</button>

                </td>
            </tr>
            </table>
    </form>

</asp:Content>

