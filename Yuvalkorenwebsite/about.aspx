<%-- הגדרת דף ה-ASPX, ציון שפת הפיתוח, חיבור לדף האב (MasterPage) וקישור לקובץ צד השרת --%>
<%@ Page Title="Home - MOVIES" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%-- אזור התוכן שמוזרק לתוך תגית ה-head של דף האב --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- פתיחת תגית הגדרות עיצוב CSS ברמת הדף --%>
    <style>
        /* עיצוב תיבת הטקסט הראשית של דף הבית */
        .welcome-container {
            padding: 20px; /* הוספת ריווח פנימי מסביב לתוכן התיבה */
            text-align: center; /* יישור כל הטקסט והאלמנטים שבתוך המיכל למרכז */
        }

        /* עיצוב כותרת הברוכים הבאים */
        .welcome-title {
            color: #2c3e50; /* הגדרת צבע כחול-כהה לטקסט הכותרת */
            font-size: 32px; /* הגדרת גודל גופן לכותרת הראשית */
            margin-bottom: 15px; /* יצירת מרווח תחתון המפריד בין הכותרת לאלמנט הבא */
        }

     /* עיצוב התמונה: הגבלת רוחב וגם גובה  */
        .home-image {
            max-width: 80%;       /* הגבלת הרוחב ל-80% מהמסך */
            max-height: 400px;    /* הגבלת גובה מקסימלי כדי שלא תהיה ענקית */
            object-fit: contain;  /* מוודא שהתמונה נכנסת לתוך התיבה בלי להימעך */
            border-radius: 15px;  /* עיגול פינות */
            margin-bottom: 25px;  /* מרווח תחתון מהטקסט */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* צל עדין */
        }

        /* עיצוב פסקת ההסבר המרכזית על האתר */
        .welcome-text {
            font-size: 18px; /* הגדרת גודל גופן נוח לקריאה לפסקת טקסט */
            color: #555; /* הגדרת צבע אפור לטקסט */
            line-height: 1.6; /* הגדרת מרווח אנכי בין שורות הטקסט לשיפור הקריאות */
            max-width: 600px; /* הגבלת הרוחב המקסימלי של הפסקה כדי למנוע שורות ארוכות מדי */
            margin: 0 auto 30px auto; /* מרכוז הפסקה עצמה ויצירת מרווח תחתון של 30 פיקסלים */
        }

        /* עיצוב כותרת רשימת הפיצ'רים של האתר */
        .features-title {
            color: #34495e; /* הגדרת צבע כחול-אפרפר לכותרת המשנית */
            font-size: 22px; /* הגדרת גודל גופן קטן יותר מהכותרת הראשית */
            margin-top: 20px; /* יצירת מרווח עליון המפריד מהאלמנט שמעל */
            margin-bottom: 15px; /* יצירת מרווח תחתון המפריד מהרשימה שמתחת */
        }

        /* עיצוב רשימת התכונות */
        .features-list {
            list-style-type: none; /* הסרת התבליטים (נקודות) המובנים של הרשימה */
            padding: 0; /* איפוס הריווח הפנימי של הרשימה */
            display: inline-block; /* שינוי התצוגה כך שהמיכל יתכווץ לרוחב התוכן ויאפשר מרכוז */
            text-align: left; /* יישור הטקסט עצמו לשמאל (מותאם לשפה האנגלית) */
        }

        /* עיצוב כל פריט (שורה) ברשימה */
        .features-list li {
            font-size: 16px; /* הגדרת גודל הגופן לפריטי הרשימה */
            color: #2c3e50; /* הגדרת צבע הטקסט של פריטי הרשימה */
            margin-bottom: 10px; /* יצירת מרווח תחתון בין הפריטים ברשימה */
            position: relative; /* הגדרת מיקום יחסי לשינויי עיצוב עתידיים במידת הצורך */
        }
    <%-- סגירת תגית העיצוב --%>
    </style>
<%-- סגירת אזור התוכן של ה-head --%>
</asp:Content>

<%-- אזור התוכן הראשי שיוזרק לתוך מרכז דף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- פתיחת מיכל התוכן הראשי והחלת מחלקת העיצוב --%>
    <div class="welcome-container">
        
        <%-- יצירת כותרת ראשית לדף --%>
        <h1 class="welcome-title">Welcome to MOVIES!</h1>
        
        <%-- שילוב תמונה באמצעות קישור ישיר לקובץ תמונה מויקיפדיה, והחלת מחלקת עיצוב --%>
        <img src="images/d23fb2a9-dd93-4ae8-a78f-5c8ec3ce17d4.jpg" alt="Movie Scene" class="home-image" />
        
        <%-- יצירת פסקת טקסט המכילה הסבר על האתר --%>
        <p class="welcome-text">
            Our website is the perfect place for movie lovers. 
            Here you can track your watchlist, discover new content, and share your passion for cinema in the simplest and smoothest way possible.
        </p>

        <%-- יצירת כותרת משנית לרשימה --%>
        <h2 class="features-title">What can you do here?</h2>
        
        <%-- פתיחת רשימה לא ממוספרת --%>
        <ul class="features-list">
            <%-- יצירת פריט ראשון ברשימה --%>
            <li>Check out the latest and hottest movies hitting theaters right now.</li>
            <%-- יצירת פריט שני ברשימה --%>
            <li>Explore a gallery of famous and top-rated movies of all time.</li>  
            <%-- יצירת פריט רביעי ברשימה --%>
            <li>easily choose what your next movie will be!</li>
        <%-- סגירת הרשימה הלא ממוספרת --%>
        </ul>

    <%-- סגירת מיכל התוכן הראשי --%>
    </div>
<%-- סגירת אזור התוכן הראשי --%>
</asp:Content>