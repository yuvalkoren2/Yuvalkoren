<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%-- אזור ה-head: כאן אפשר להוסיף סקריפטים או עיצובים נוספים אם נרצה --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<%-- אזור התוכן המרכזי: זה מה שיוצג בתוך ה-MasterPage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form runat="server">
    
        <h2>Login (התחברות)</h2>
        
        <%-- יצירת טבלה לעיצוב סימטרי ונוח של שדות ההתחברות --%>
        <table style="width: 100%; max-width: 400px; margin: 0 auto;">
            
            <%-- שורה 1: שדה קלט עבור כתובת האימייל --%>
            <tr>
                <td><label>Email:</label></td>
                <td><input type="text" name="Email" style="width: 100%;" /></td>
            </tr>
            
            <%-- שורה 2: שדה קלט עבור הסיסמה (מוגדר כ-password כדי להסתיר את התווים) --%>
            <tr>
                <td><label>Password:</label></td>
                <td><input type="password" name="Password" style="width: 100%;" /></td>
            </tr>
            
            <%-- שורה 3: כפתור השליחה --%>
            <tr>
                <td colspan="2" style="text-align: center; padding-top: 15px;">
                    <%-- כפתור ASP.NET שקושר את הלחיצה לפונקציה btnLogin_Click בקובץ ה-C# --%>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>

        <%-- אזור להצגת הודעות שגיאה (אם המשתמש טעה בפרטים) --%>
        <div style="color:red; margin-top:10px; text-align: center;">
            <%=stResult %>
        </div>

    </form> 
</asp:Content>