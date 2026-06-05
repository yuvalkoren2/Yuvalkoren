using System;
using System.Data;

public partial class form : System.Web.UI.Page
{
    // משתנה מחרוזת גלובלי המשמש להעברת הודעות טקסט ישירות אל דף ה-HTML
    public string msg = "";

    // אירוע הטעינה של הדף שמתרחש בכל פעם שנכנסים לכתובת זו
    protected void Page_Load(object sender, EventArgs e)
    {
        // אבטחת הדף: אם המשתמש אינו מחובר, הוא מועבר באופן אוטומטי חזרה לדף הלוגין
        if (Session["user"] == null && Session["nihul"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    // אירוע הלחיצה על כפתור השמירה
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // שליפת הערכים שהוקלדו וניקוי רווחים מיותרים מהקצוות באמצעות Trim
        string name = movieName.Text.Trim();
        string poster = moviePoster.Text.Trim();
        string genre = movieGenre.SelectedValue;
        string rating = movieRating.SelectedValue;
        string description = movieDescription.Text.Trim();

        // בדיקת חובה: מוודאת שהשדות החיוניים לשמירה במסד הנתונים אינם ריקים
        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(genre) || string.IsNullOrEmpty(poster))
        {
            msg = "נא למלא את כל שדות החובה המסומנים בכוכבית (*)!";
            return;
        }

        // אימות הקישור: מוודא שכתובת הפוסטר היא אכן URL חוקי שמתחיל בפרוטוקול אינטרנט תקין
        if (!poster.StartsWith("http://") && !poster.StartsWith("https://"))
        {
            msg = "שגיאה: כתובת הפוסטר אינה תקינה! הקישור חייב להתחיל ב-http:// או https://";
            return;
        }

        try
        {
            // בניית שאילתת ה-INSERT עבור העמודות הקיימות בטבלה שלך (tMovies)
            // שימוש ב-Replace מונע שגיאות סינטקס ובעיות אבטחה במקרה שהמשתמש הקליד גרש בודד
            string sqlInsert = string.Format(
                "INSERT INTO tMovies (movieName, posterURL, genre) VALUES (N'{0}', N'{1}', N'{2}')",
                name.Replace("'", "''"),
                poster.Replace("'", "''"),
                genre
            );

            // הרצת פקודת ההוספה מול מסד הנתונים באמצעות מחלקת העזר שנמצאת בתוך App_Code
            MyAdoHelper.DoQuery(sqlInsert);

            // עדכון הודעת הצלחה שתוצג על המסך
            msg = "הסרט נוסף בהצלחה לאתר!";

            // איפוס וניקוי כל שדות הקלט בטופס על מנת להכין אותו להזנה הבאה
            movieName.Text = "";
            moviePoster.Text = "";
            movieDescription.Text = "";
            movieRating.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            // תפיסת שגיאות לא צפויות (כמו בעיות תקשורת מול המסד) והצגתן על המסך לצורך ניפוי באגים
            msg = "שגיאה בחיבור למסד הנתונים: " + ex.Message;
        }
    }
}