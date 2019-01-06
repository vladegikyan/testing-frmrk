/**
 * @author Vladimir Gorelik
 * Part of ObjectFactory framework.
 * Implements by IsObjectCreator interface that has four createSO() methods with different signatures 
 * HOWTO.
 * For each object that you want to create instance of create two apex classes.
 * <ObjectApiName>Creator extends ObjectCreatorBase and contains constructor that calls super(Schema.SObjectType), 
 * optionally overrides methods in this class - for custom object ommit __c suffix in the api name
 * <ObjectApiName>Helper that contains static variable of IsObjectCreator type and static methods for creating objects.
 * These methods have to use ObjectCreatorBase (IsObjectCreator) methods. Refer to AccountCreator/AccountHelper for example
 * of basic usage
 **/
public virtual class ObjectCreatorBase implements IsObjectCreator {
	
	public Schema.SObjectType soType; // the SobjectType token of the object to create
	public String obj_name;

	//constructor - initialize soType
	public ObjectCreatorBase(String objectName) {
		this.obj_name = objectName;
		this.soType = Schema.getGlobalDescribe().get(objectName);
	}
	
	/**
	 * Implements IsObjectCreator method. Method can be overriden
	 * Creates instance of SObjectType using Schema.SObjectType.newSobject() method
	 * @param none
	 * @return SObject instance with no fields defined
	 */
	public virtual sObject createSO() {
		SObject so = this.soType.newSobject();
		return so;
	}

	/**
	 * Implements IsObjectCreator method. Method can be overriden
	 * Creates list of instances of SObjectType using Schema.SObjectType.newSobject() method
	 * @param Integer num - number of instances to create
	 * @return List<sObject> list of sObject instances with no fields defined
	 */
	public virtual List<sObject> createSO(Integer num) {
		List<SObject> lst_so = new List<sObject>();

		for(Integer i = 0; i < num; i++) {
			lst_so.add(this.createSO());
		}

		return lst_so;
	}
}