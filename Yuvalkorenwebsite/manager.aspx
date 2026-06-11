<%@ Page Title="ניהול משתמשים" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* הגדרות עיצוב (CSS) לטבלה ולאזור הניהול */
        .manager-container { max-width: 900px; margin: 30px auto; padding: 20px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); font-family: Arial, sans-serif; text-align: center; }
        
        /* הגדרות מבנה הטבלה, כיוון כתיבה מימין לשמאל ומרווחים */
        .manager-container table { width: 100%; border-collapse: collapse; margin-top: 20px; direction: rtl; }
        
        /* ריווח פנימי ויישור קו אחיד למרכז עבור תאי הכותרת ותאי המידע (שומר שהנתונים יישרו קו בדיוק מתחת לשם השדה) */
        .manager-container th, .manager-container td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        
        /* עיצוב קבוע ובולט לשורת הכותרת הכללית בראש הטבלה (שמות השדות) */
        .manager-container th { background-color: #34495e; color: white; font-weight: bold; font-size: 15px; }
        
        /* צביעת שורות הנתונים לסירוגין (שורה כן, שורה לא) כדי להקל על קריאת הפרטים */
        .manager-container tr:nth-child(even) { background-color: #f9f9f9; }
        
        /* אפקט שינוי צבע קל בעת מעבר עכבר על שורת נתונים */
        .manager-container tr:hover { background-color: #f1f1f1; }
        
        /* עיצוב המיקום והמבנה של אזור תיבת הסינון */
        .search-box { margin: 20px 0; display: flex; justify-content: center; gap: 10px; direction: rtl; }
        .search-box input[type="text"] { padding: 8px 12px; width: 300px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="manager-container">
        <h1>דף ניהול מערכת</h1>
        <p>להלן ריכוז של כל פרטי המשתמשים הקיימים במסד הנתונים:</p>
        
        <div class="search-box">
            <%-- תיבת החיפוש - הפונקציה filterTable מופעלת בכל הקלדת מקש (onkeyup) --%>
            <input type="text" id="searchTerm" placeholder="הקלד שם לסינון הטבלה..." onkeyup="filterTable()" />
        </div>
        
        <div style="overflow-x:auto;">
            <%-- הצגת המשתנה usersTable שמכיל כעת את הטבלה עם ה-ID והכותרות המובנות --%>
            <%= usersTable %>
        </div>
    </div>

    <script>
        // פונקציית JavaScript לחיפוש וסינון חי בטבלה
        function filterTable() {
            // קליטת הערך מתיבת הטקסט והפיכתו לאותיות גדולות לצורך השוואה תקינה
            var input = document.getElementById("searchTerm");
            var filter = input.value.toUpperCase();

            // מציאת הטבלה לפי ה-ID שלה, או לפי מיקומה הכללי במידה וה-ID לא זוהה
            var table = document.getElementById("usersTable") || document.querySelector(".manager-container table");
            if (!table) return; // אם לא נמצאה טבלה בדף, הפונקציה נעצרת

            // שליפת רשימת כל השורות הקיימות בטבלה
            var tr = table.getElementsByTagName("tr");

            // לולאה שעוברת על השורות (i=1 מתחיל מהשורה השנייה כדי לדלג על שורת שמות השדות ולא להסתיר אותה)
            for (var i = 1; i < tr.length; i++) {
                // שליפת הטקסט הקיים בתוך השורה הנוכחית
                var rowText = tr[i].innerText || tr[i].textContent;

                // בדיקה: האם שורת המידע מכילה את מה שהוקלד בתיבת החיפוש?
                if (rowText.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = ""; // אם יש התאמה - מציגים את השורה
                } else {
                    tr[i].style.display = "none"; // אם אין התאמה - מסתירים את השורה
                }
            }
        }
    </script>
</asp:Content>