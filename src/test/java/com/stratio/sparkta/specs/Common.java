package com.stratio.sparkta.specs;

import java.lang.reflect.InvocationTargetException;

import com.stratio.specs.CommonG;

public class Common extends CommonG {

    public static String previousFragmentID = "";
    
    public void setPreviousElement(String value) throws ClassNotFoundException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException {
	this.getLogger().info("SETTING VALUE TO: {}", value);
	previousFragmentID = value;
    }
    
}
