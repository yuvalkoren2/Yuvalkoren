using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class form : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי שיכיל את הודעת ההצלחה ויוצג ב-HTML
    public string msg = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקת אבטחה: הגנה על הדף מפני אורחים
        if (Session["user"] != "ok" && Session["nihul"] != "ok")
        {
            Response.Redirect("login.aspx");
        }

        // בדיקה האם הדף עבר רענון כתוצאה מלחיצה על כפתור השליחה (PostBack)
        if (Page.IsPostBack)
        {
            // שליפת הנתונים שהמשתמש הקליד בטופס באמצעות ה-name של השדות
            string mName = Request.Form["movieName"];
            string mPoster = Request.Form["moviePoster"];
            string mGenre = Request.Form["movieGenre"];

            // בדיקה בסיסית שהמשתמש לא שלח טופס ריק
            if (!string.IsNullOrEmpty(mName))
            {
                // בניית הודעת הצלחה מעוצבת שתקפוץ למשתמש על המסך
                msg = "<div style='margin-top:20px; padding:15px; background-color:#d4edda; color:#155724; border:1px solid #c3e6cb; border-radius:4px; font-weight:bold;'>" +
                      "הסרט \"" + mName + "\" מסוג (" + mGenre + ") הוסף לרשימה בהצלחה!" +
                      "</div>";
            }
            else
            {
                // הודעת שגיאה במידה ושם הסרט הושאר ריק
                msg = "<div style='margin-top:20px; padding:15px; background-color:#f8d7da; color:#721c24; border:1px solid #f5c6cb; border-radius:4px; font-weight:bold;'>\n" +
                      "נא להזין את שם הסרט!\n" +
                      "</div>";
            }
        }
    }
}