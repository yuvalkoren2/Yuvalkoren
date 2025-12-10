<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1>Yuval Koren's website: choose a movie genre</h1>

    <form id="genre-form">
        <label>First Name</label>
        <input type="text" name"firstname"
            <br><br>
        <label>Last Name</label>
        <input type="text" name"lastname"
            <br /><br />

        <label><input type="checkbox" value="Action" /> Action</label><br>
        <label><input type="checkbox" value="Animation" /> Animation</label><br>
        <label><input type="checkbox" value="Fantasy" /> Fantasy</label><br>
        <label><input type="checkbox" value="Comedy" /> Comedy</label><br>
        <label><input type="checkbox" value="Horror" /> Horror</label><br>
        <label><input type="checkbox" value="Science fiction" /> Sci-fi</label><br>
        <label><input type="checkbox" value="Romance" /> Romance</label><br>
        <label><input type="checkbox" value="Thriller" /> Thriller</label><br><br>

        <button type="submit">Submit</button>
        <br><br>
   
    </form>

</asp:Content>

