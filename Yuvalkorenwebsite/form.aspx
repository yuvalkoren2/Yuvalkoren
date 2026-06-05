<%-- הגדרת דף בן בשפת C#, קישור לקובץ הקוד שלו, שימוש בדף האב (MasterPage) והגדרת מחלקת הירושה --%>
<%@ Page Title="Add Movie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<%-- אזור התוכן שמיועד להכנסה בתוך ה-head של דף האב (בעיקר לעיצובים וסקריפטים) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <%-- תגיות עיצוב (CSS) ייחודיות לנראות של טופס הוספת הסרט --%>
    <style>
        /* עיצוב הקופסה המרכזית שמכילה את הטופס: הגבלת רוחב, מרכוס העמוד, ופינות מעוגלות */
        .form-container {
            max-width: 450px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
        }

        /* עיצוב של שורת קלט (שדה): מרווח מלמטה ויישור הטקסט לימין (בשביל עברית/נוחות) */
        .form-group {
            margin-bottom: 15px;
            text-align: right;
        }

        /* עיצוב כותרת השדה (התווית): הפיכה לבלוק עצמאי, הדגשת טקסט וצבע כהה */
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #2c3e50;
        }

        /* עיצוב תיבות הטקסט: רוחב מלא, ריפוד פנימי, גבול עדין ופינות מעוגלות */
        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* מבטיח שהריפוד לא ירחיב את התיבה מעבר ל-100% */
        }

        /* עיצוב אזור בחירת הז'אנרים כדי ליצור מרווח קל מהכותרת שלו */
        .checkbox-group {
            margin-top: 5px;
        }

        /* עיצוב כפתור השליחה: רקע ירוק, טקסט לבן, בלי גבול, פינות מעוגלות ושינוי סמן העכבר ליד */
        .submit-btn {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: 0.3s; /* אפקט מעבר חלק כאשר עוברים עם העכבר */
        }

        /* שינוי רקע הכפתור לירוק כהה יותר כאשר המשתמש מרחף מעליו */
        .submit-btn:hover {
            background-color: #27ae60;
        }
    </style>
</asp:Content>

<%-- אזור התוכן המרכזי של הדף שיוצג בתוך גוף ה-MasterPage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- תיבת הטופס המעוצבת - שים לב שאין פה תגית form פנימית כדי שלא תתנגש עם ה-MasterPage --%>
    <div class="form-container">
        
        <%-- כותרת הדף הראשית והסבר קצר למשתמש --%>
        <h1>Add a New Movie</h1>
        <p>הוסף סרט חדש לאוסף האתר</p>

        <%-- שדה קלט 1: שם הסרט (מכיל name שישמש אותנו לשליפה ב-C#) --%>
        <div class="form-group">
            <label for="movieName">Movie Name (שם הסרט):</label>
            <input type="text" id="movieName" name="movieName" placeholder="Enter movie title..." />
        </div>

        <%-- שדה קלט 2: קישור לפוסטר (כתובת אינטרנט של תמונת הסרט) --%>
        <div class="form-group">
            <label for="moviePoster">Poster URL (קישור לתמונת פוסטר):</label>
            <input type="text" id="moviePoster" name="moviePoster" placeholder="https://upload.wikimedia.org/..." />
        </div>

        <%-- שדה קלט 3: בחירת ז'אנר מתוך רשימה באמצעות כפתורי רדיו (מאפשר בחירה של ז'אנר אחד בלבד) --%>
        <div class="form-group">
            <label>Choose Genre (בחר ז'אנר אחד):</label>
            <div class="checkbox-group">
                <%-- כפתורי הרדיו חולקים את אותו name כדי שהדפדפן ידע שהם שייכים לאותה קבוצה --%>
                <label><input type="radio" name="movieGenre" value="Action" /> Action (אקשן)</label><br />
                <label><input type="radio" name="movieGenre" value="Science fiction" /> Sci-Fi (מדע בדיוני)</label><br />
                <label><input type="radio" name="movieGenre" value="Romance" /> Romance (רומנטיקה)</label>
            </div>
        </div>

        <%-- אזור כפתור השליחה של הטופס לשרת --%>
        <div style="margin-top: 20px;">
            <button type="submit" class="submit-btn">Add Movie to Website</button>
        </div>

        <%-- הדפסת הודעת ההצלחה או השגיאה שנשלחה מקוד ה-C# --%>
        <%= msg %>
        
    </div>

</asp:Content>