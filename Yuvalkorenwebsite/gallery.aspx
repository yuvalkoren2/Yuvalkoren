<%-- הגדרת דף ה-Gallery, קישור לקובץ הקוד שלו (C#) וציון דף האב (MasterPage) ממנו הוא יורש --%>
<%@ Page Title="גלריית סרטים" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<%-- אזור התוכן שמוזרק לתוך ה-head של דף האב (כאן נשים את העיצוב הייחודי של הגלריה) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* כותרת משנית של הדף */
        .gallery-title {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        /* פסקת ההסבר על האתר */
        .gallery-intro {
            font-size: 16px;
            color: #7f8c8d;
            margin-bottom: 30px;
        }

        /* המיכל הראשי של הסרטים - מציג אותם בשורה אחת וממרכז אותם */
        .movies-container {
            display: flex;
            justify-content: center;
            gap: 20px; /* רווח קבוע של 20 פיקסלים בין סרט לסרט */
            flex-wrap: wrap; /* אם אין מקום במסך, הסרטים ירדו שורה בצורה יפה */
        }

        /* עיצוב של כרטיס סרט בודד (בסגנון Letterboxd פשוט) */
        .movie-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* צל עדין מסביב לכרטיס */
            padding: 15px;
            width: 200px; /* רוחב קבוע לכל כרטיס סרט */
            text-align: center;
            transition: transform 0.2s; /* אפקט תנועה קל כשנוגעים בסרט */
        }

        /* אפקט הרמה קטן כאשר המשתמש מרחף עם העכבר מעל כרטיס הסרט */
        .movie-card:hover {
            transform: translateY(-5px);
        }

        /* עיצוב תמונת הפוסטר של הסרט */
        .movie-card img {
            width: 100%; /* התמונה תתפרס על כל רוחב הכרטיס */
            height: 280px; /* גובה קבוע כדי שכל הפוסטרים יהיו שווים בגודלם */
            object-fit: cover; /* שומר על פרופורציות התמונה שלא תתעוות */
            border-radius: 6px;
            margin-bottom: 10px;
        }

        /* עיצוב שם הסרט מתחת לתמונה */
        .movie-card h3 {
            font-size: 16px;
            color: #2c3e50;
            margin: 10px 0 5px 0;
        }
    </style>
</asp:Content>

<%-- אזור התוכן הראשי שיוזרק לתוך מרכז דף האב (במקום ה-ContentPlaceHolder1) --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- מיכל הסרטים הראשי שומר על העיצוב הקיים שלך --%>
    <div class="movies-container">

        <%-- 
           תגית הזרקה קצרה של ASP.NET (סימן השווה <%= %> משמש כקיצור לפקודת Response.Write).
           היא לוקחת את כל מחרוזת ה-HTML הענקית של כרטיסי הסרטים שבנינו דינמית בתוך קוד ה-C# (במשתנה dynamicMovies),
           ושותלת אותה ישירות במרכז הדף בזמן אמת, כך שכל הסרטים מופיעים על המסך בצורה אוטומטית.
        --%>
        <%= dynamicMovies %>

    </div>
</asp:Content>