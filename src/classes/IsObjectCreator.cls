/**
 * @author Vladimir Gorelik
 * Part of ObjectFactory framework.
 *              The interface is implemented by ObjectCreatorBase 
 * For details refer to https://www.tutorialspoint.com/design_pattern/factory_pattern.htm
 **/
public interface IsObjectCreator {

	sObject createSO();
	List<sObject> createSO(Integer num);
}