using System;
using System.Data;

public partial class form : System.Web.UI.Page
{
    public string msg = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null && Session["nihul"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = movieName.Text.Trim();
        string poster = moviePoster.Text.Trim();
        string genre = movieGenre.SelectedValue;

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(genre))
        {
            msg = "נא למלא את כל השדות!";
            return;
        }

        try
        {
            // שימוש בשיטת ה-Replace להגנה מפני SQL Injection
            string sqlInsert = string.Format("INSERT INTO tMovies (movieName, posterURL, genre) VALUES (N'{0}', N'{1}', N'{2}')",
                name.Replace("'", "''"), poster.Replace("'", "''"), genre);

            // כעת DoQuery תעבוד כי הוספנו אותה ל-MyAdoHelper
            MyAdoHelper.DoQuery(sqlInsert);

            msg = "הסרט נוסף בהצלחה!";

            // ניקוי שדות
            movieName.Text = "";
            moviePoster.Text = "";
        }
        catch (Exception ex)
        {
            msg = "שגיאה בחיבור למסד הנתונים: " + ex.Message;
        }
    }
}