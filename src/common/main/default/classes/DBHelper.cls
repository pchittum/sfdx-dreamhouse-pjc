public with sharing class DBHelper {

    public static String getAllAccessibleFieldStr(){
      List<String> fieldList = new List<String>();
      Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Property__c.fields.getMap();

      for (Schema.SObjectField fieldToken : fieldMap.values()){
        Schema.DescribeFieldResult dfr = fieldToken.getDescribe();

        if (dfr.isAccessible()){
          fieldList.add(dfr.getName());
        }

      }

      return String.join(fieldList, ',');
    }

    public static String getAllAccessibleFieldStr(Schema.SObjectType type){
      Map<String, Schema.SObjectField> fieldMap = type.getDescribe().fields.getMap();

      return getAccessibleFieldsStr(fieldMap.values());
    }    

    public static String getAccessibleFieldsStr(List<Schema.SObjectField> allFields){
      List<String> fieldList = new List<String>();

      for (Schema.SObjectField fieldToken : allFields){
        Schema.DescribeFieldResult dfr = fieldToken.getDescribe();

        if (dfr.isAccessible()){
          fieldList.add(dfr.getName());
        }

      }


      return String.join(fieldList, ',');
    }

}
