using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // מייבא את מחלקות הנתונים כמו DataTable ו-DataRow כדי שנוכל לעבוד עם טבלאות מהמסד
using System.Text; // מייבא את המחלקה StringBuilder המאפשרת בנייה יעילה ומהירה של מחרוזות ארוכות בזיכרון

public partial class gallery : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי (מוגן) שיכיל את כל קוד ה-HTML של כרטיסי הסרטים ויוזרק ישירות לדף ה-aspx
    protected string dynamicMovies = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // 1. הגדרת שאילתת SQL פשוטה שמבקשת לשלוף את כל העמודות והשורות מתוך טבלת הסרטים (tMovies)
        string sqlSelect = "SELECT * FROM tMovies";

        // 2. הרצת השאילתה בעזרת פונקציית העזר של הפרויקט ושמירת הנתונים שחזרו בתוך טבלה וירטואלית בזיכרון (DataTable)
        DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

        // 3. יצירת מופע (אובייקט) חדש מסוג StringBuilder שמיועד לשרשור וחיבור קטעי ה-HTML של הסרטים בצורה מהירה
        StringBuilder sb = new StringBuilder();

        // בדיקה ביטחונית: מוודאים שהטבלה שחזרה אינה ריקה ומכילה לפחות שורת נתונים אחת (לפחות סרט אחד)
        if (dt != null && dt.Rows.Count > 0)
        {
            // 4. לולאת foreach שעוברת שורה-שורה (סרט-סרט) על כל השורות שקיימות בתוך אוסף השורות של הטבלה (dt.Rows)
            foreach (DataRow row in dt.Rows)
            {
                // פתיחת תגית ה-div של כרטיס הסרט הבודד, ושימוש ב-class המעוצב מה-CSS שלך (.movie-card)
                sb.Append("<div class='movie-card'>");

                // שליפת כתובת ה-URL של הפוסטר מתוך עמודת [posterURL] והגדרת שם הסרט בתוך מאפיין ה-alt (עבור נגישות)
                sb.Append("<img src='" + row["posterURL"].ToString() + "' alt='" + row["movieName"].ToString() + "' />");

                // שליפת שם הסרט מתוך עמודת [movieName] והצגתו בתוך כותרת מסוג h3, בדיוק כמו בעיצוב הקשיח המקורי
                sb.Append("<h3>" + row["movieName"].ToString() + "</h3>");

                // סגירת תגית ה-div של כרטיס הסרט הנוכחי
                sb.Append("</div>");
            }
        }

        // 5. המרת כל המידע שצברנו בתוך ה-StringBuilder למחרוזת רגילה (String) ושמירתו בתוך המשתנה הגלובלי dynamicMovies
        dynamicMovies = sb.ToString();
    }
}