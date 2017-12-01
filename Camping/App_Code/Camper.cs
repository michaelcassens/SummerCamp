using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Camper
/// </summary>
public class Camper : IComparable<Camper>
{
    private String firstName;
    private String lastName;
    private int score;
    public Camper(String firstName, String lastName)
    {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public void setScore(int score)
    {
        this.score = score;
    }

    public int getScore()
    {
        return score;
    }

    public String getFirstName()
    {
        return firstName;
    }
    public String getLastName()
    {
        return lastName;
    }
    
    public String toString()
    {
        return firstName + " " + lastName + " " + score;
    }

    public int CompareTo(Camper other)
    {
        if(this.score == other.score)
        {
            if(this.lastName.CompareTo(other.lastName) == 0)
            {
                return this.firstName.CompareTo(other.firstName);
            }
            else
            {
                return this.lastName.CompareTo(other.lastName);
            }
            
        }
        return other.score.CompareTo(score);

    }
}