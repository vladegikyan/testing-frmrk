public with sharing class ObjectFactory {

	public static IsObjectCreator init(String objectName) {
		
		//If the Object is custom, ommit __c suffix
		objectName = objectName.substringBefore('__c');
		
		//Get Type of the creator class
		Type t = Type.forName(objectName + 'Creator');
		
		return (IsObjectCreator) t.newInstance();
	}
}