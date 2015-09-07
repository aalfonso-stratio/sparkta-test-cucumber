package com.stratio.sparkta.specs;

import java.lang.reflect.InvocationTargetException;

import com.stratio.specs.CommonG;

public class Common extends CommonG {

    public static String previousFragmentID = "";
    
//    public static void setpreviousFragmentID(String value) {
//	//this.getLogger().info("SETTING VALUE TO: {}", value);
//	setPreviousFragmentID(value);
//    }
//    
//    public String getpreviousFragmentID() {
//	this.getLogger().info("GETTING VALUE");
//	return this.getPreviousFragmentID();
//    }
    
    public void setPreviousElement(String value) throws ClassNotFoundException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException {
	this.getLogger().info("SETTING VALUE TO: {}", value);
	    //setPreviousFragmentID(value);
	previousFragmentID = value;
    }

//    public static String getPreviousFragmentID() {
//	return previousFragmentID;
//    }
//
//    public static void setPreviousFragmentID(String previousFragmentID) {
//	Common.previousFragmentID = previousFragmentID;
//    }
    
}
