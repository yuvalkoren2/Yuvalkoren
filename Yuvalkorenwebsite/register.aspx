<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script language="javascript">
function checkAll() {
    var retVal = true;

    if (checkFirstName() == false)
        retVal = false;
    if (checkLastName() == false)
        retVal = false;

    return retVal;
}

function checkFirstName() {
    // 1. שליפת אלמנט הקלט ואלמנט השגיאה בצורה מסודרת
    var inputEl = document.getElementById("firstname");
    var errorEl = document.getElementById("firstnameErr");

    if (inputEl && errorEl) {
        // 2. הטריק הסופי: הפיכת האלמנט ל-any זמני כדי לקרוא את ה-value האמיתי שהוקלד
        var firstNameString = inputEl.getAttribute("value") || "";

        // איפוס הודעת השגיאה הקודמת (אם הייתה)
        errorEl.innerHTML = "";

        alert(firstNameString);

        // 3. בדיקה אם השדה ריק
        if (firstNameString.trim() == "") {
            errorEl.innerHTML = "נא להזין שם פרטי";
            return false;
        }

        // 4. בדיקת אורך מינימלי
        if (firstNameString.length < 2) {
            errorEl.innerHTML = "השם הפרטי קצר מדי";
            return false;
        }
    }

    return true;
}

function checkLastName() {
    var inputEl = document.getElementById("lastname");

    if (inputEl) {
        var lastNameString = inputEl.getAttribute("value") || "";

        if (lastNameString.trim() == "") {
            lastnameErr.innerHTML= "נא להזין שם משפחה";
            return false;
        }
    }
    return true;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Register to Yuval Koren's website</h1>

    <form runat="server" method="post" onSubmit="return checkAll();">
        <table style="width: 100%; max-width: 400px;">
            <tr>
                <td>
                    <label>First Name</label></td>
                <td>
                    <input type="text" name="firstname" id="firstname" style="width: 100%;" /></td>
                <td id="firstnameErr"></td>
            </tr>
            <tr>
                <td>
                    <label>Last Name</label></td>
                <td>
                    <input type="text" name="lastname" id="lastname" style="width: 100%;" /></td>
                <td id="lastnameErr"></td>
                <tr>
                </tr>
            <td>
                <label>Email</label></td>
            <td>
                <input type="text" name="Email" style="width: 100%;" /></td>
            <tr>
            <tr>
                <td>
                    <label>Password</label></td>
                <td>
                    <input type="text" name="Password" style="width: 100%;" /></td>
            </tr>
            <tr>
                <td>choose a movie genre
                </td>
                <td>
                    <label>
                        <input name="genre" type="checkbox" value="Action" />
                        Action</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Animation" />
                        Animation</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Fantasy" />
                        Fantasy</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Comedy" />
                        Comedy</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Horror" />
                        Horror</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Science fiction" />
                        Sci-fi</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Romance" />
                        Romance</label><br>
                    <label>
                        <input name="genre" type="checkbox" value="Thriller" />
                        Thriller</label><br>
                    <br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Submit</button>

                </td>
            </tr>
        </table>
    </form>
    <%=stResult %>
</asp:Content>

