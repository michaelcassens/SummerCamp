using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LeaderBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
            if(!currentLastName.Equals(previousLastName) || (!currentFirstName.Equals(previousFirstName) && currentLastName.Equals(previousLastName)))
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
        foreach(Camper camp in myList)
        {
            finalOutput += "<tr><td>" + count + "</td><td>" + camp.getFirstName() + "</td><td>" + camp.getLastName() + "</td><td>" + camp.getScore().ToString("N0") + "</td></tr>";
            count++;
        }
        lblLeaders.Text = finalOutput + "</table>";
    }
}