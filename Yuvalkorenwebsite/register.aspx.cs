using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי להצגת הודעות שגיאה או הצלחה למשתמש ב-HTML
    public string stResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקה האם הדף נטען כתוצאה משליחת הטופס (PostBack)
        if (Page.IsPostBack)
        {
            // שליפת הנתונים מהשדות הקיימים בטופס ה-HTML שלך
            string fn = Request.Form["firstname"];
            string ln = Request.Form["lastname"];
            string email = Request.Form["Email"];
            string password = Request.Form["Password"];
            string genres = Request.Form["genre"]; // מקבל את הז'אנר שנבחר (או כמות סרטים אם שינית ב-HTML)

            // שלב 1: בדיקה האם המשתמש כבר קיים במערכת לפי עמודת gmail בטבלת tUsers
            string sqlCheck = "SELECT * FROM tUsers WHERE gmail = N'" + email + "'";

            // בדיקה מול מסד הנתונים האמיתי שלך: MyDB.mdf
            bool exists = MyAdoHelper.IsExist(sqlCheck);

            // אם המשתמש כבר קיים - נציג הודעת שגיאה ונפסיק את התהליך
            if (exists)
            {
                stResult = "מייל שהוכנס קיים במערכת, הכנס אימייל חדש";
            }
            else
            {
                // שלב 2: בניית שאילתת INSERT עם שמות העמודות המדויקים של טבלת tUsers שלך
                string sqlInsert = "INSERT INTO tUsers (firstname, lastname, gmail, password, checkbox) VALUES (" +
                                   "N'" + fn + "', " +
                                   "N'" + ln + "', " +
                                   "N'" + email + "', " +
                                   "N'" + password + "', " +
                                   "N'" + genres + "'" +
                                   ")";

                // הרצת שאילתת ההרשמה מול מסד הנתונים האמיתי שלך: MyDB.mdf
                MyAdoHelper.DoQuery("MyDB.mdf", sqlInsert);

                // שלב 3: יצירת משתני Session כדי לחבר את המשתמש אוטומטית ולעדכן את תפריט הניווט למעלה
                Session["user"] = "ok";
                Session["name"] = fn; // שומר את השם הפרטי בשביל הודעת ה"שלום יובל" בתפריט

                // הפניית המשתמש המחובר באופן אוטומטי חזרה לדף הבית
                Response.Redirect("about.aspx");
            }
        }
    }
}