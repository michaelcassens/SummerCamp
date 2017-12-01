using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            addProjectTypes();
            addCurrentDate();
            fillExistingCamperInformation();
        }
        fillTotalTime();
        fillDetailedTime();
        fillInLeaderBoard();

        if (Request.QueryString["message"] != null)
        {
            //clearControls();
            lblMessage.Text = "<h2><font color='red'>" + Request.QueryString["message"] + "</font></h2>";
            btnEnterTime.Enabled = true;
        }





    }
    private void fillInLeaderBoard()
    {
        List<Camper> myList = new List<Camper>();

        Projects myProject = new Projects();
        DataSet ds = myProject.getLeaderBoardScores();

        String previousLastName = "";
        String previousFirstName = "";
        String currentLastName = "";
        String currentFirstName = "";
        Camper myCamper = null;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            String firstName = ds.Tables[0].Rows[i]["FirstName"].ToString();
            String lastName = ds.Tables[0].Rows[i]["LastName"].ToString();
            int score = Int16.Parse(ds.Tables[0].Rows[i]["Score"].ToString());
            currentFirstName = firstName;
            currentLastName = lastName;
            if (!currentLastName.Equals(previousLastName) || (!currentFirstName.Equals(previousFirstName) && currentLastName.Equals(previousLastName)))
            {
                myCamper = new Camper(firstName, lastName);
                myCamper.setScore(score);
                myList.Add(myCamper);
            }
            else
            {
                myCamper.setScore(myCamper.getScore() + score);
            }
            previousFirstName = currentFirstName;
            previousLastName = currentLastName;

        }

        myList.Sort();
        int count = 1;
        String finalOutput = "<table class='table'><tr><td><strong>Ranking</strong></td><td><strong>First Name</strong></td><td><strong>Last Name</strong></td><td><strong>Current Score</strong></td></tr>";
        foreach (Camper camp in myList)
        {
            finalOutput += "<tr><td>" + count + "</td><td>" + camp.getFirstName() + "</td><td>" + camp.getLastName() + "</td><td>" + camp.getScore().ToString("N0") + "</td></tr>";
            count++;
        }
        lblLeaders.Text = finalOutput + "</table>";

    }
    private void fillExistingCamperInformation()
    {

        HttpCookie myCookie = Request.Cookies.Get("camperID");

        if (myCookie != null && !myCookie.Value.Equals("null"))
        {


            int camperID = Int16.Parse(myCookie.Value.ToString());

            Users myUser = new Users();

            DataSet myDS = myUser.getCamperByCamperID(camperID);

            if (myDS.Tables[0].Rows.Count > 0)
            {
                lblMessage.Text = "Hi there " + myDS.Tables[0].Rows[0]["FirstName"] + " " + myDS.Tables[0].Rows[0]["LastName"];
               
                fillTotalTime();
                fillDetailedTime();
                fillInLeaderBoard();

            }

        }
    }
    private void fillTotalTime()
    {
        HttpCookie myCookie = Request.Cookies.Get("camperID");
        int totalTime = 0;
        int totalScore = 0;

        if (myCookie != null)
        {

           
            int camperID = Int16.Parse(myCookie.Value.ToString());
            Projects myProject = new Projects();
            DataSet ds = myProject.getTotalTimeSpentByCamperID(camperID);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                totalTime += Int16.Parse(ds.Tables[0].Rows[i]["MinutesSpent"].ToString());
                totalScore += Int16.Parse(ds.Tables[0].Rows[i]["Score"].ToString());
            }


            lblTimeSpent.Text = "Total Time Spent: " +  totalTime.ToString("N0");
            lblTotalScore.Text = "Total Score: " + totalScore.ToString("N0");
        }
        else
        {
            lblTimeSpent.Text = "Total Time Spent: 0";
            lblTotalScore.Text = "Total Score: 0";
        }
        if(totalScore >= 100 && totalScore < 200)
        {
            imgCurrentBadge.ImageUrl = "images/Bronze3.png";
        }
        else if(totalScore >= 200 && totalScore < 300)
        {
            imgCurrentBadge.ImageUrl = "images/Bronze2.png";
        }
        else if (totalScore >= 300 && totalScore < 400)
        {
            imgCurrentBadge.ImageUrl = "images/Bronze3.png";
        }
        else if(totalScore >= 400 && totalScore < 600)
        {
            imgCurrentBadge.ImageUrl = "images/Silver3.png";
        }
        else if (totalScore >= 600 && totalScore < 800)
        {
            imgCurrentBadge.ImageUrl = "images/Silver2.png";
        }
        else if (totalScore >= 800 && totalScore < 1000)
        {
            imgCurrentBadge.ImageUrl = "images/Silver1.png";
        }
        else if (totalScore >= 1000 && totalScore < 1300)
        {
            imgCurrentBadge.ImageUrl = "images/Gold3.png";
        }
        else if (totalScore >= 1300 && totalScore < 1600)
        {
            imgCurrentBadge.ImageUrl = "images/Gold2.png";
        }
        else if (totalScore > 1600)
        {
            imgCurrentBadge.ImageUrl = "images/Gold1.png";
        }
    }
    private void fillDetailedTime()
    {
        HttpCookie myCookie = Request.Cookies.Get("camperID");

        if (myCookie != null)
        {


            int camperID = Int16.Parse(myCookie.Value.ToString());
            Projects myProject = new Projects();
            DataSet ds = myProject.getTotalTimeSpentByCamperID(camperID);
            dgTimeSpent.DataSource = ds.Tables[0];
            dgTimeSpent.DataBind();
        }
    }
    private void addCurrentDate()
    {
        txtDate.Text = DateTime.Today.ToShortDateString();
    }
    private void addProjectTypes()
    {
        Projects myProjects = new Projects();
        DataSet myDS = myProjects.getAllProjects();

        ddlProjectType.DataSource = myDS.Tables[0];
        ddlProjectType.DataTextField = "ProjectType";
        ddlProjectType.DataValueField = "ProjectTypeID";
        ddlProjectType.DataBind();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String userName = txtUserName.Text;
        String pwd = txtPWD.Text;

        Users myUser = new Users();

        DataSet myDS = myUser.checkUser(userName, pwd);

        if(myDS.Tables[0].Rows.Count > 0)
        {
           lblMessage.Text = "<h2>Hi there " + myDS.Tables[0].Rows[0]["FirstName"] + " " + myDS.Tables[0].Rows[0]["LastName"] + "</h2>";
            HttpCookie myCookie = new HttpCookie("camperID");
            myCookie.Value = myDS.Tables[0].Rows[0]["CamperID"].ToString();
            myCookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(myCookie);
            fillTotalTime();
            fillDetailedTime();
            fillInLeaderBoard();
        }
        else
        {
            lblMessage.Text = "<font color='red'><h3>There was a problem with your login. Please try again.</h3></font>";
        }


    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        String firstName = txtFirstName.Text;
        String lastName = txtLastName.Text;
        String userName = txtUser.Text;
        String pwd = txtPassword.Text;

        Users myUser = new Users();

        DataSet myDS = myUser.checkUser(userName, pwd);
        
        if(myDS.Tables[0].Rows.Count  == 0)
        {

        
            int count = myUser.insertNewUser(firstName, lastName, userName, pwd);
            lblMessage.Text = "<font color='red'><h2>Welcome " + firstName + " " + lastName + "<p>Please login to enter time.</p></h2></font>";
           

        }
        else
        {
            lblMessage.Text = "<font color='red'<h2>This user name is already been taken. Please try again.";
        }

    }
    protected void btnEnterTime_Click(object sender, EventArgs e)
    {
        String message = "";
        HttpCookie myCookie = Request.Cookies.Get("camperID");
        if (myCookie != null)
        {
            int camperID = Int16.Parse(myCookie.Value.ToString());
            String currentDate = txtDate.Text;
            int time = 0;
            try
            {
                time = Int32.Parse(txtTimeSpent.Text.Trim());

            }
            catch (Exception ex)
            {
                Response.Write(txtTimeSpent.Text);

            }
            int projectTypeID = Int32.Parse(ddlProjectType.SelectedValue);
            String description = txtDescription.Text;
            String authorizedBy = txtAuthorizedBy.Text;
            String pwd = txtAdminPWD.Text;
            Projects myProjects = new Projects();

            if (pwd == ConfigurationManager.AppSettings["adminPassword"].ToString())
            {
                btnEnterTime.Enabled = false;
                myProjects.insertNewProjectTime(camperID, currentDate, time, projectTypeID, description, authorizedBy);
                message = "Time inserted!";
                clearControls();
            }
            else
            {
                message = "Your time was not inserted. Please ask for help. Make sure you are logged in.";
            }

            fillTotalTime();
            fillDetailedTime();
            fillInLeaderBoard();
        }
        else
        {
            message = "Your time was not inserted. Please ask for help. Make sure you are logged in.";

        }


       // Response.Buffer = true;
        //Response.ExiresAbsolute = DateTime.Now.AddDays(-1);
        //Response.Expires = -1500;
        //Response.CacheControl = "no-cache";
        //Response.Cache.SetNotStore();
        //Session.Abandon();
          Response.Redirect("Default.aspx?message=" + message);
    }

    private void clearControls()
    {
        txtDate.Text = "";
        txtTimeSpent.Text = "";
        txtDescription.Text = "";
        txtAuthorizedBy.Text = "";
        ddlProjectType.SelectedIndex = 0;
    }
}