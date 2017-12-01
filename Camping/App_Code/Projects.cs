using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Projects
/// </summary>
public class Projects
{
    public Projects()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataSet getAllProjects()
    {
        DataSet myDataSet = new DataSet();
        string myQuery = "spGetAllProjectTypes";
        DataAccess myAccess = new DataAccess();
        myDataSet = myAccess.getQuery(myQuery);

        return myDataSet;
    }

          public int insertNewProjectTime(int camperID, string currentDate, 
              int time, int projectTypeID, string description, string authorizedBy)
    {
        string myQuery = "spInsertNewProjectTime";
        DataAccess myAccess = new DataAccess();
        SqlParameter[] myParameters = new SqlParameter[6];

        // encrypt password before testing..

        myParameters[0] = new SqlParameter("camperID", camperID);
        myParameters[1] = new SqlParameter("currentDate", currentDate);
        myParameters[2] = new SqlParameter("time", time);
        myParameters[3] = new SqlParameter("projectTypeID", projectTypeID);
        myParameters[4] = new SqlParameter("description", description);
        myParameters[5] = new SqlParameter("authorizedBy", authorizedBy);




        int rows = myAccess.nonQuery(myQuery, myParameters);

        return rows;

    }

    public DataSet getTotalTimeSpentByCamperID(int camperID)
    {
        string myQuery = "spGetTotalMinutesSpentByCamper";
        DataAccess myAccess = new DataAccess();
        SqlParameter[] myParameters = new SqlParameter[1];

        // encrypt password before testing..

        myParameters[0] = new SqlParameter("camperID", camperID);

        DataSet myDS = myAccess.getQuery(myQuery, myParameters);

        return myDS;

    }

    public DataSet getLeaderBoardScores()
    {
        string myQuery = "spGetLeaderBoardScores";
        DataAccess myAccess = new DataAccess();
        
        DataSet myDS = myAccess.getQuery(myQuery);

        return myDS;

    }

}