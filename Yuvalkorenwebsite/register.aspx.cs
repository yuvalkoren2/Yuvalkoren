using System;
using System.Web.UI;

// זוהי המחלקה הראשית של הדף. היא משתמשת ב-MyAdoHelper שנמצא ב-App_Code באופן אוטומטי.
public partial class register : System.Web.UI.Page
{
    // המשתנה שמציג את התוצאה בדף ה-aspx
    protected string stResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // קוד זה רץ רק כאשר המשתמש לוחץ על כפתור השליחה (PostBack)
        if (Page.IsPostBack)
        {
            // שליפת הנתונים משדות הקלט של ה-HTML
            string firstName = Request.Form["firstname"];
            string lastName = Request.Form["lastname"];
            string email = Request.Form["Email"];
            string password = Request.Form["Password"];

            // שליפת תיבות הסימון של ז'אנר הסרטים (name="genre")
            // אם המשתמש לא בחר כלום, נכניס מחרוזת ריקה כדי שזה לא יהיה NULL
            string userGenres = Request.Form["genre"] ?? "";

            // בדיקה מול מסד הנתונים האם האימייל כבר קיים
            string checkQuery = string.Format("SELECT * FROM tUsers WHERE gmail = '{0}'", email);

            // הבדיקה מול מחלקת העזר שמגיעה מ-App_Code
            if (MyAdoHelper.IsExist(checkQuery))
            {
                stResult = "<p style='color: red;'>כתובת האימייל הזו כבר רשומה במערכת.</p>";
            }
            else
            {
                // תיקון השגיאה: הוספת העמודה [checkbox] לשאילתה והזרקת הערך של ה-userGenres לתוכה
                string insertQuery = string.Format(
                    "INSERT INTO tUsers (firstname, lastname, gmail, [password], [checkbox]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')",
                    firstName, lastName, email, password, userGenres
                );

                // הרצת השאילתה ב-App_Code לשמירת הנתונים
                MyAdoHelper.DoQuery(insertQuery);
                Response.Redirect("login.aspx");

                // הצגת הודעת הצלחה למשתמש
                stResult = string.Format("<p style='color: green;'>ברוך הבא {0}! ההרשמה בוצעה ונשמרה בהצלחה.</p>", firstName);
            }
        }
    }
}