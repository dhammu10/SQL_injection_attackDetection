package beans;

import java.sql.*;
import beans.GetConnection;
import models.JavaFuns;

import java.util.*;

public class DataSanitization {
	
public boolean checkSQLData(String input)
{ 
	boolean result=false;
	try
	{
	System.out.println("in datasanti");
	JavaFuns jf=new JavaFuns();
	Vector vector=jf.getValue("select keyw from sqlkeywords",1);
	String[] array = new String[vector.size()];
	for(int i=0;i<vector.size();i++)
	{
		array[i]=vector.elementAt(i).toString().trim();
	}
	result=containsWords(input,array);
	
	}
	catch(Exception ex)
	{
		System.out.println("err="+ex.getMessage());
	}
	return result;
}
public  boolean containsWords(String inputString, String[] items) {
    boolean found = false;
    for (String item : items) {
        if (inputString.contains(item)) {
            found = true;
            break;
        }
    }
    return found;
}
public boolean containsSQLLoginBypassWords(String inputString) {
    boolean found = false;
	System.out.println("in datasanti");
    String[] items=new String[6];
    items[0]="'or1=1-+";
    items[1]="' or 1=1-+";
    items[2]="' or ''='";
    items[3]="' OR ''='";
    items[4]="' or 1=1--";
    items[5]="' OR 1=1";
    for (String item : items) {
        if (inputString.contains(item)) {
            found = true;
            break;
        }
    }
    System.out.println("out="+found);
    return found;
}
}
