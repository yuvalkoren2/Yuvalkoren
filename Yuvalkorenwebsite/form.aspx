<%@ Page Title="Add Movie" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .form-container { max-width: 450px; margin: 0 auto; padding: 20px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; text-align: left; }
        /* תיקון עיצוב: הוספת הגדרה כדי שתיבות הטקסט ייראו רחבות ומסודרות */
        .form-group input[type="text"] { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; margin-top: 5px; }
        .submit-btn { background-color: #2ecc71; color: white; border: none; padding: 10px 20px; cursor: pointer; width: 100%; border-radius: 4px; font-size: 16px; margin-top: 10px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <div class="form-container">
            <h1>Add a New Movie</h1>
            
            <div class="form-group">
                <label>Movie Name:</label>
                <%-- שדה טקסט לשם הסרט --%>
                <asp:TextBox ID="movieName" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Poster URL:</label>
                <%-- שדה טקסט לכתובת התמונה --%>
                <asp:TextBox ID="moviePoster" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Choose Genre:</label>
                <%-- רשימת בחירה לז'אנר --%>
                <asp:RadioButtonList ID="movieGenre" runat="server">
                    <asp:ListItem Text="Action" Value="Action" />
                    <asp:ListItem Text="Sci-Fi" Value="Science fiction" />
                    <asp:ListItem Text="Romance" Value="Romance" />
                </asp:RadioButtonList>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Add Movie to Website" 
                        CssClass="submit-btn" OnClick="btnSubmit_Click" />

            <div style="margin-top:20px; color:red; text-align: center;">
                <%= msg %>
            </div>
        </div>
    </form> </asp:Content>