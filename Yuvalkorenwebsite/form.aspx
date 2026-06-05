<%@ Page Title="Add Movie" Language="C#" MasterPageFile="~/MasterPage.master" 
    AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* עיצוב מיכל הטופס: מרכז אותו על המסך ומוסיף צל קל מאחור */
        .form-container { max-width: 450px; margin: 0 auto; padding: 20px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        /* מרווח תחתון ויישור לשמאל עבור קבוצות השדות */
        .form-group { margin-bottom: 15px; text-align: left; }
        /* הגדרת רווח מלא ועיצוב אחיד לכל פקדי הקלט, התפריטים ותיבות הטקסט */
        .form-group input[type="text"], .form-group select, .form-group textarea { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; margin-top: 5px; font-family: Arial, sans-serif; }
        /* עיצוב כפתור השליחה הירוק כולל הגדרת גודל הגופן ומרווח עליון */
        .submit-btn { background-color: #2ecc71; color: white; border: none; padding: 10px 20px; cursor: pointer; width: 100%; border-radius: 4px; font-size: 16px; margin-top: 10px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- טופס שרת ראשי הנדרש לצורך הרצה ותפקוד תקין של פקדי ASP.NET --%>
    <form runat="server">
        <div class="form-container">
            <h1>Add a New Movie</h1>
            
            <%-- שדה קלט רגיל לקבלת שם הסרט --%>
            <div class="form-group">
                <label>Movie Name *:</label>
                <asp:TextBox ID="movieName" runat="server"></asp:TextBox>
            </div>

            <%-- שדה קלט לקבלת קישור התמונה, יעבור אימות בקוד השרת --%>
            <div class="form-group">
                <label>Poster URL *:</label>
                <asp:TextBox ID="moviePoster" runat="server"></asp:TextBox>
            </div>

            <%-- תפריט בחירה נפתח (DropDownList) המציג את דירוגי הגיל השונים --%>
            <div class="form-group">
                <label>Maturity Rating (DropDownList):</label>
                <asp:DropDownList ID="movieRating" runat="server">
                    <asp:ListItem Text="G (General Audience)" Value="G" />
                    <asp:ListItem Text="PG (Parental Guidance)" Value="PG" />
                    <asp:ListItem Text="PG-13" Value="PG-13" />
                    <asp:ListItem Text="R (Restricted)" Value="R" />
                </asp:DropDownList>
            </div>

            <%-- תיבת טקסט מרובת שורות (TextArea) המיועדת להזנת תקציר או תיאור הסרט --%>
            <div class="form-group">
                <label>Movie Description (TextArea):</label>
                <asp:TextBox ID="movieDescription" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>

            <%-- כפתורי רדיו לבחירת ז'אנר בודד מתוך הרשימה --%>
            <div class="form-group">
                <label>Choose Genre *:</label>
                <asp:RadioButtonList ID="movieGenre" runat="server">
                    <asp:ListItem Text="Action" Value="Action" />
                    <asp:ListItem Text="Sci-Fi" Value="Science fiction" />
                    <asp:ListItem Text="Romance" Value="Romance" />
                </asp:RadioButtonList>
            </div>

            <%-- כפתור שרת המפעיל את פונקציית הלחיצה btnSubmit_Click בקוד ה-C# --%>
            <asp:Button ID="btnSubmit" runat="server" Text="Add Movie to Website" 
                        CssClass="submit-btn" OnClick="btnSubmit_Click" />

            <%-- אלמנט דינמי המשמש להצגת הודעות הצלחה או שגיאה למשתמש --%>
            <div style="margin-top:20px; color:red; text-align: center;">
                <%= msg %>
            </div>
        </div>
    </form> 
</asp:Content>