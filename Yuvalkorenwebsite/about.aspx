<%-- הגדרת דף ה-About (דף הבית), קישור לקובץ הקוד שלו (C#) וציון דף האב (MasterPage) ממנו הוא יורש --%>
<%@ Page Title="Home - MOVIES" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<%-- אזור התוכן שמוזרק לתוך ה-head של דף האב (כאן נשים את העיצוב הייחודי של דף הבית) --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- פתיחת תגית עיצוב (CSS) פנימית עבור הדף --%>
    <style>
        /* עיצוב תיבת הטקסט הראשית של דף הבית */
        .welcome-container {
            padding: 20px; /* מרווח פנימי מסביב לתוכן */
            text-align: center; /* מרכז את כל הטקסט שבתוך המיכל */
        }

        /* עיצוב כותרת הברוכים הבאים */
        .welcome-title {
            color: #2c3e50; /* צבע כחול-כהה ייחודי */
            font-size: 32px; /* גודל גופן גדול לכותרת ראשית */
            margin-bottom: 15px; /* מרווח תחתון קטן מהפסקה הבאה */
        }

        /* עיצוב פסקת ההסבר המרכזית על האתר */
        .welcome-text {
            font-size: 18px; /* גודל גופן בינוני וקריא */
            color: #555; /* צבע אפור כהה לטקסט רץ */
            line-height: 1.6; /* רווח אנכי נעים בין שורות הטקסט */
            max-width: 600px; /* הגבלת רוחב מקסימלי לפסקה כדי שלא תימרח */
            margin: 0 auto 30px auto; /* ממרכז את הפסקה ומייצר רווח תחתון של 30 פיקסלים */
        }

        /* עיצוב כותרת רשימת הפיצ'רים של האתר */
        .features-title {
            color: #34495e; /* צבע כחול-אפרפר לכותרת המשנית */
            font-size: 22px; /* גודל גופן קטן יותר מהכותרת הראשית */
            margin-top: 20px; /* מרווח עליון מהאלמנטים שמעליה */
            margin-bottom: 15px; /* מרווח תחתון קטן לפני הרשימה */
        }

        /* עיצוב רשימת התכונות - מיושר לשמאל (Left) בגלל השפה האנגלית */
        .features-list {
            list-style-type: none; /* מסיר לחלוטין את הנקודות המובנות של הרשימה */
            padding: 0; /* מאפס את הריווח הפנימי הדיפולטיבי של הדפדפן */
            display: inline-block; /* מאפשר למיכל של הרשימה להתכווץ לפי גודל הטקסט */
            text-align: left; /* יישור הטקסט לשמאל עבור שפה אנגלית */
        }

        /* עיצוב כל פריט (שורה) ברשימה */
        .features-list li {
            font-size: 16px; /* גודל גופן סטנדרטי ונוח לקריאה */
            color: #2c3e50; /* צבע הטקסט התואם לכותרת הראשית */
            margin-bottom: 10px; /* מרווח קטן בין שורה לשורה ברשימה */
            position: relative; /* הגדרת מיקום יחסי עבור האלמנט */
        }
    </style>
</asp:Content>

<%-- אזור התוכן הראשי שיוזרק לתוך מרכז דף האב (במקום ה-ContentPlaceHolder1) --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- מיכל התוכן הראשי של דף הבית --%>
    <div class="welcome-container">
        
        <%-- כותרת ברוכים הבאים באנגלית --%>
        <h1 class="welcome-title">Welcome to MOVIES!</h1>
        
        <%-- פסקת הסבר חלקה וברורה על האתר באנגלית --%>
        <p class="welcome-text">
            Our website is the perfect place for movie lovers. 
            Here you can track your watchlist, discover new content, and share your passion for cinema in the simplest and smoothest way possible.
        </p>

        <%-- כותרת משנית לרשימת הפיצ'רים באנגלית --%>
        <h2 class="features-title">What can you do here?</h2>
        
        <%-- רשימת הפיצ'רים של האתר באנגלית (ללא נקודות וללא אימוג'ים מציקים) --%>
        <ul class="features-list">
            <%-- שורה ראשונה ברשימה --%>
            <li>Check out the latest and hottest movies hitting theaters right now.</li>
            <%-- שורה שנייה ברשימה --%>
            <li>Explore a gallery of famous and top-rated movies of all time.</li>
            <%-- שורה שלישית ברשימה --%>
            <li>Create a personal user account and manage your own movie watchlist.</li>
            <%-- שורה רביעית ברשימה --%>
            <li>Keep track and easily choose what your next movie will be!</li>
        </ul>

    </div>

</asp:Content>