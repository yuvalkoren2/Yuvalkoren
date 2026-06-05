<%-- הגדרת הדף: קישור למאסטר פייג' ולקובץ ה-C# שלו --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%-- אזור התוכן הראשון שמוזרק ל-head של הדף (בשביל סקריפטים) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script language="javascript">
    // פונקציה ראשית שרצה בזמן שליחת הטופס ובודקת את השדות
    function checkAll() {
        // משתנה שמחזיק את מצב תקינות הטופס (מתחיל כאישור)
        var retVal = true;

        // אם בדיקת השם הפרטי נכשלה, נשנה את משתנה האישור ל-false
        if (checkFirstName() == false)
            retVal = false;
        // אם בדיקת שם המשפחה נכשלה, נשנה את משתנה האישור ל-false
        if (checkLastName() == false)
            retVal = false;
        // אם בדיקת האימייל נכשלה, נשנה את משתנה האישור ל-false
        if (checkEmail() == false)
            retVal = false;
        // אם בדיקת הסיסמה נכשלה, נשנה את משתנה האישור ל-false
        if (checkPassword() == false)
            retVal = false;

        // החזרת התוצאה: true מאשר את השליחה, false עוצר אותה
        return retVal;
    }

    // פונקציה לבדיקת השם הפרטי
    function checkFirstName() {
        // שליפת תיבת הקלט של השם הפרטי לפי ה-ID שלה
        var inputEl = document.getElementById("firstname");
        // שליפת אלמנט השגיאה של השם הפרטי לפי ה-ID שלו
        var errorEl = document.getElementById("firstnameErr");

        // בדיקה ששני האלמנטים קיימים בדף
        if (inputEl && errorEl) {
            // שליפת הערך שהמשתמש הקליד (באמצעות .value)
            var firstNameString = inputEl.value || "";

            // איפוס הודעת השגיאה הקודמת
            errorEl.innerHTML = "";

            // הצגת התראת alert עם מה שהוקלד (כמו בקוד המקורי שלך)
           // alert(firstNameString);

            // בדיקה אם השדה ריק (לאחר הסרת רווחים)
            if (firstNameString.trim() == "") {
                // הצגת הודעת שגיאה מתאימה
                errorEl.innerHTML = "נא להזין שם פרטי";
                // החזרת false כי השדה נכשל בבדיקה
                return false;
            }

            // בדיקה אם אורך השם קצר מ-2 תווים
            if (firstNameString.length < 2) {
                // הצגת הודעת שגיאה שהשם קצר מדי
                errorEl.innerHTML = "השם הפרטי קצר מדי";
                // החזרת false כי השדה נכשל בבדיקה
                return false;
            }
        }

        // אם הכל תקין, מחזירים true
        return true;
    }

    // פונקציה לבדיקת שם המשפחה
    function checkLastName() {
        // שליפת תיבת הקלט של שם המשפחה לפי ה-ID שלה
        var inputEl = document.getElementById("lastname");
        // שליפת אלמנט השגיאה של שם המשפחה לפי ה-ID שלו
        var errorEl = document.getElementById("lastnameErr");

        // בדיקה ששני האלמנטים קיימים בדף
        if (inputEl && errorEl) {
            // שליפת הערך שרשום בתיבה (באמצעות .value)
            var lastNameString = inputEl.value || "";

            // ניקוי הודעת שגיאה קודמת
            errorEl.innerHTML = "";

            // בדיקה אם השדה ריק
            if (lastNameString.trim() == "") {
                // הצגת הודעת שגיאה באלמנט השגיאה של שם המשפחה
                errorEl.innerHTML = "נא להזין שם משפחה";
                // החזרת false כי השדה נכשל
                return false;
            }
        }
        // אם הכל תקין, מחזירים true
        return true;
    }

    // פונקציה פשוטה לבדיקת שדה האימייל
    function checkEmail() {
        // שליפת תיבת הקלט של האימייל לפי ה-ID שלה
        var inputEl = document.getElementById("email");
        // שליפת אלמנט השגיאה של האימייל לפי ה-ID שלו
        var errorEl = document.getElementById("emailErr");

        // בדיקה ששני האלמנטים קיימים בדף
        if (inputEl && errorEl) {
            // שליפת הטקסט שהוקלד בתיבת האימייל
            var emailString = inputEl.value || "";

            // ניקוי הודעת שגיאה קודמת
            errorEl.innerHTML = "";

            // בדיקה אם שדה האימייל נשאר ריק
            if (emailString.trim() == "") {
                // הצגת הודעת שגיאה מתאימה
                errorEl.innerHTML = "נא להזין כתובת אימייל";
                // החזרת false לעצירת הטופס
                return false;
            }

            // בדיקה בסיסית ופשוטה ביותר: האם קיים סימן @ במחרוזת
            if (emailString.indexOf("@") == -1) {
                // הצגת הודעת שגיאה שהאימייל אינו תקין
                errorEl.innerHTML = "כתובת אימייל לא תקינה (חסר @)";
                // החזרת false לעצירת הטופס
                return false;
            }
        }
        // אם הכל תקין, מחזירים true
        return true;
    }

    // פונקציה פשוטה לבדיקת שדה הסיסמה
    function checkPassword() {
        // שליפת תיבת הקלט של הסיסמה לפי ה-ID שלה
        var inputEl = document.getElementById("password");
        // שליפת אלמנט השגיאה של הסיסמה לפי ה-ID שלו
        var errorEl = document.getElementById("passwordErr");

        // בדיקה ששני האלמנטים קיימים בדף
        if (inputEl && errorEl) {
            // שליפת הטקסט שהוקלד בתיבת הסיסמה
            var passwordString = inputEl.value || "";

            // ניקוי הודעת שגיאה קודמת
            errorEl.innerHTML = "";

            // בדיקה אם שדה הסיסמה נשאר ריק
            if (passwordString.trim() == "") {
                // הצגת הודעת שגיאה מתאימה
                errorEl.innerHTML = "נא להזין סיסמה";
                // החזרת false לעצירת הטופס
                return false;
            }

            // בדיקה אם הסיסמה קצרה מדי (פחות מ-4 תווים למשל)
            if (passwordString.length < 4) {
                // הצגת הודעת שגיאה שהסיסמה קצרה מדי
                errorEl.innerHTML = "הסיסמה חייבת להכיל לפחות 4 תווים";
                // החזרת false לעצירת הטופס
                return false;
            }
        }
        // אם הכל תקין, מחזירים true
        return true;
    }

    // פונקציה חדשה ופשוטה לסינון הסרטים בגלריה
    function filterMovies() {
        // שליפת כל תיבות הסימון של ה-genre שמסומנות כרגע (checked)
        var checkboxes = document.querySelectorAll('input[name="genre"]:checked');

        // יצירת מערך ריק שיכיל את שמות הז'אנרים שנבחרו
        var selectedGenres = [];
        // לולאה שעוברת על התיבות המסומנות ומכניסה את הערך שלהן למערך
        for (var i = 0; i < checkboxes.length; i++) {
            selectedGenres.push(checkboxes[i].value);
        }

        // שליפת שלושת אלמנטים של הסרטים לפי ה-ID שלהם
        var interstellar = document.getElementById("movie_interstellar");
        var avatar = document.getElementById("movie_avatar");
        var titanic = document.getElementById("movie_titanic");

        // בדיקה עבור אינטרסטלר: יוצג אם לא נבחר כלום, או אם נבחר Science fiction
        if (selectedGenres.length == 0 || selectedGenres.includes("Science fiction")) {
            interstellar.style.display = ""; // הצגה
        } else {
            interstellar.style.display = "none"; // הסתרה
        }

        // בדיקה עבור אווטאר: יוצג אם לא נבחר כלום, או אם נבחר Action
        if (selectedGenres.length == 0 || selectedGenres.includes("Action")) {
            avatar.style.display = ""; // הצגה
        } else {
            avatar.style.display = "none"; // הסתרה
        }

        // בדיקה עבור טיטאניק: יוצג אם לא נבחר כלום, או אם נבחר Romance
        if (selectedGenres.length == 0 || selectedGenres.includes("Romance")) {
            titanic.style.display = ""; // הצגה
        } else {
            titanic.style.display = "none"; // הסתרה
        }
    }
</script>
</asp:Content>

<%-- אזור התוכן השני שמוזרק לתוך ה-Body של הדף --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Register to Yuval Koren's website</h1>

    <form runat="server" method="post" onsubmit="return checkAll();">
        <table style="width: 100%; max-width: 400px;">
            <tr>
                <td><label>First Name</label></td>
                <td><input type="text" name="firstname" id="firstname" style="width: 100%;" /></td>
                <td id="firstnameErr" style="color: red;"></td>
            </tr>
            <tr>
                <td><label>Last Name</label></td>
                <td><input type="text" name="lastname" id="lastname" style="width: 100%;" /></td>
                <td id="lastnameErr" style="color: red;"></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><input type="text" name="Email" id="email" style="width: 100%;" /></td>
                <td id="emailErr" style="color: red;"></td>
            </tr>
            <tr>
                <td><label>Password</label></td>
                <td><input type="text" name="Password" id="password" style="width: 100%;" /></td>
                <td id="passwordErr" style="color: red;"></td>
            </tr>
            <tr>
                <td>choose a movie genre</td>
                <td>
                    <label><input name="genre" type="checkbox" value="Action" onclick="filterMovies()" /> Action</label><br />
                    <label><input name="genre" type="checkbox" value="Science fiction" onclick="filterMovies()" /> Sci-fi</label><br />
                    <label><input name="genre" type="checkbox" value="Romance" onclick="filterMovies()" /> Romance</label><br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Submit</button>
                </td>
            </tr>
        </table>
    </form>

    <hr />

  <h2>Movie Gallery</h2>
    
    <%-- קבוצת סרטי מד"ב - מגיבים ל-movie_interstellar ב-JavaScript הקיים שלך --%>
    <div id="movie_interstellar" style="margin-bottom: 15px;">
        <div style="margin-bottom: 10px;">
            <img src="https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg" alt="Interstellar" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>Interstellar (Sci-Fi)</span>
        </div>
        <div style="margin-bottom: 10px;">
            <img src="https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg" alt="Inception" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>Inception (Sci-Fi)</span>
        </div>
    </div>

    <%-- קבוצת סרטי אקשן - מגיבים ל-movie_avatar ב-JavaScript הקיים שלך --%>
    <div id="movie_avatar" style="margin-bottom: 15px;">
        <div style="margin-bottom: 10px;">
            <img src="https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg" alt="Avatar" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>Avatar (Action)</span>
        </div>
        <div style="margin-bottom: 10px;">
            <img src="https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg" alt="The Dark Knight" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>The Dark Knight (Action)</span>
        </div>
        <div style="margin-bottom: 10px;">
            <img src="https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg" alt="The Lion King" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>The Lion King (Action)</span>
        </div>
    </div>

    <%-- קבוצת סרטי רומנטיקה - מגיבים ל-movie_titanic ב-JavaScript הקיים שלך --%>
    <div id="movie_titanic" style="margin-bottom: 15px;">
        <div>
            <img src="https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png" alt="Titanic" style="height: 150px; vertical-align: middle; margin-right: 10px;" />
            <span>Titanic (Romance)</span>
        </div>
    </div>
    <%=stResult %>
</asp:Content>