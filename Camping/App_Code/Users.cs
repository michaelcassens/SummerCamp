using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{
    public Users()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int insertNewUser(string firstName, string lastName, string userName,
       string pwd)
    {
        string myQuery = "spInsertNewUser";
        DataAccess myAccess = new DataAccess();
        SqlParameter[] myParameters = new SqlParameter[4];

        // encrypt password before testing..
     
        myParameters[0] = new SqlParameter("firstName", firstName);
        myParameters[1] = new SqlParameter("lastName", lastName);
        myParameters[2] = new SqlParameter("userName", userName);
        myParameters[3] = new SqlParameter("pwd", pwd);
        

        int rows = myAccess.nonQuery(myQuery, myParameters);

        return rows;

    }

    public DataSet checkUser(string userName, string pwd)
    {
        string myQuery = "spCheckUser";
        DataAccess myAccess = new DataAccess();
        SqlParameter[] myParameters = new SqlParameter[2];

        // encrypt password before testing..

        myParameters[0] = new SqlParameter("userName", userName);
        myParameters[1] = new SqlParameter("pwd", pwd);


        DataSet ds = myAccess.getQuery(myQuery, myParameters);

        return ds;

    }

    public DataSet getCamperByCamperID(int camperID)
    {
        string myQuery = "spGetCamperByCamperID";
        DataAccess myAccess = new DataAccess();
        SqlParameter[] myParameters = new SqlParameter[1];

        // encrypt password before testing..

        myParameters[0] = new SqlParameter("camperID", camperID);

        DataSet ds = myAccess.getQuery(myQuery, myParameters);

        return ds;

    }

    public DataSet getAllUsers()
    {
        DataSet myDataSet = new DataSet();
        string myQuery = "spGetAllUsers";
        DataAccess myAccess = new DataAccess();
        myDataSet = myAccess.getQuery(myQuery);

        return myDataSet;
    }



    /*
 * This method encrypts a string and returns the byte array using the md5 algorithm
 */
    private Byte[] encrypt(string unencryptedString)
    {
        // encrypt password before inserted..
        Byte[] hashedDataBytes = null;
        UTF8Encoding encoder = new UTF8Encoding();

        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

        hashedDataBytes = md5Hasher.ComputeHash(encoder.GetBytes(unencryptedString));

        return hashedDataBytes;
    }

}