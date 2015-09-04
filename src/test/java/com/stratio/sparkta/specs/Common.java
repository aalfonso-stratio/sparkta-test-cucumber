package com.stratio.sparkta.specs;

import com.stratio.specs.CommonG;

public class Common extends CommonG {

    String previousFragmentID = "";
    
    public void setPreviousElement(String element, String value) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
	super.setPreviousElement(element, value);
    }
    
}
