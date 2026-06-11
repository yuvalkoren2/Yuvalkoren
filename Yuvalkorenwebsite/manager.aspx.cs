using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // מרחב שמות דרוש לעבודה עם טבלאות נתונים (DataTable ו-DataColumn)
using System.Data.SqlClient; // מרחב שמות דרוש להתחברות ישירה למסד נתונים מסוג SQL Server (.mdf)
using System.Text; // מרחב שמות דרוש לשימוש ב-StringBuilder

public partial class manager : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי המיועד להכלת טבלת ה-HTML שתוצג למשתמש
    protected string usersTable = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // אבטחת דף הניהול - חסימת משתמשים רגילים או אורחים
        if (Session["nihul"] == null || Session["nihul"].ToString() != "ok")
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            string sqlSelect = "SELECT * FROM tUsers";

            // הגדרת מחרוזת התחברות קבועה וישירה לקובץ ה-mdf של הפרויקט בתיקיית App_Data
            string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\MyDB.mdf;Integrated Security=True";

            // יצירת אובייקט טבלה ריק בזיכרון שאליו נשפוך את הנתונים מהמסד
            DataTable dt = new DataTable();

            // פתיחת חיבור עצמאי ומאובטח למסד הנתונים לצורך שליפת המידע
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(sqlSelect, conn))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        // מילוי אובייקט ה-DataTable בנתונים שהתקבלו משאילתת ה-SQL
                        adapter.Fill(dt);
                    }
                }
            }

            // שימוש ב-StringBuilder לבנייה דינמית ויעילה של מחרוזת ה-HTML של הטבלה
            StringBuilder sb = new StringBuilder();

            // הוספת תגית הטבלה הראשית יחד עם ה-ID שקוד ה-JavaScript צריך עבור מנגנון החיפוש
            sb.Append("<table id='usersTable'>");

            // יצירת שורת הכותרות הכללית בראש הטבלה (שמות השדות כגון Username, Password וכדומה)
            sb.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                // הלולאה רצה על עמודות המסד ומציבה את שם השדה המקורי בתוך תגית כותרת <th>
                sb.Append("<th>" + column.ColumnName + "</th>");
            }
            sb.Append("</tr>");

            // מעבר על כל שורות הנתונים של המשתמשים והוספתן בצורה מסודרת מתחת לכותרות
            foreach (DataRow row in dt.Rows)
            {
                sb.Append("<tr>");
                foreach (var cell in row.ItemArray)
                {
                    // הוספת כל תא מידע (כמו הסיסמה או השם של המשתמש) תחת העמודה המתאימה לו
                    sb.Append("<td>" + cell.ToString() + "</td>");
                }
                sb.Append("</tr>");
            }

            sb.Append("</table>");

            // השמת מחרוזת ה-HTML המוכנה לתוך המשתנה הציבורי שמוצג בדף ה-aspx
            usersTable = sb.ToString();
        }
    }
}