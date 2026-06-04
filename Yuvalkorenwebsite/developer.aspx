<%-- הגדרת הדף, קישור לדף האב (MasterPage) וחיבור לקובץ ה-C# (CodeBehind) --%>
<%@ Page Title="About Me" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="developer.aspx.cs" Inherits="developer" %>

<%-- אזור ה-Head להזרקת עיצוב ה-CSS הייחודי לדף זה --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* עיצוב המיכל המרכזי של דף האודות למרכוז התוכן */
        .about-container {
            max-width: 600px;         /* הגבלת רוחב המיכל למראה נקי */
            margin: 40px auto;        /* מרכוז אופקי של המיכל בדף */
            padding: 30px;            /* ריווח פנימי מסביב לתוכן */
            background-color: #fff;   /* צבע רקע לבן לתוכן */
            border-radius: 20px;      /* עיגול פינות המיכל למראה מודרני */
            box-shadow: 0 5px 15px rgba(0,0,0,0.1); /* הוספת צל לעומק */
            text-align: center;       /* מרכוז כל הטקסט והאלמנטים */
        }

        /* עיצוב התמונה האישית (אווטאר) */
        .profile-img {
            width: 180px;             /* הגדרת רוחב התמונה */
            height: 180px;            /* הגדרת גובה התמונה */
            border-radius: 50%;       /* הפיכת התמונה לעיגול מושלם */
            border: 5px solid #3498db;/* הוספת מסגרת בצבע כחול */
            margin-bottom: 20px;      /* ריווח מתחת לתמונה */
        }

        /* עיצוב כותרת הדף */
        h1 {
            color: #2c3e50;           /* צבע כחול כהה לכותרת */
            margin-bottom: 15px;      /* ריווח מתחת לכותרת */
        }

        /* עיצוב פסקאות הטקסט */
        .bio-text {
            font-size: 18px;          /* גודל גופן לקריאה נוחה */
            color: #555;              /* צבע טקסט אפור כהה */
            line-height: 1.8;         /* מרווח בין שורות לקריאות */
        }
    </style>
</asp:Content>

<%-- אזור התוכן הראשי (ContentPlaceHolder) שמוזרק לדף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- יצירת מיכל התוכן עם מחלקת העיצוב --%>
    <div class="about-container">
        <h1>קצת עליי</h1>
        
       <%-- השורה המתוקנת: סלאש אחד בסוף בלבד, ה-class נמצא בתוך התגית --%>
<img src="images/901fd364-c2f5-4fbd-be6c-3656e2b7189f.png" alt="Developer Avatar" class="profile-img" />
        
        <%-- הצגת הטקסט המשודרג --%>
        <div class="bio-text">
            <p>שלום! שמי יובל, ואני תלמיד בכיתה י"א 6 בתיכון כצנלסון. ברוכים הבאים לאתר שלי</p>
            <p>האתר הזה נבנה כפרויקט גמר במדעי המחשב. כאן תוכלו למצוא מגוון רחב של סרטים, ולסנן אותם לפי ז'אנרים כדי למצוא בדיוק את הסרט שמתאים לכם.</p>
        </div>
    </div>

</asp:Content>