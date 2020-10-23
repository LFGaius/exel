public class ExelFile {

    public static void generate(Map<string,List<string>>myMap){
        
         String str = JSON.serialize(myMap); 
         String str64String = EncodingUtil.base64Encode(Blob.valueof(str));
         PageReference pageRef = new PageReference('/apex/ContentMap?MapContact='+str64String);
		// pageRef.getParameters().put('MapContact', myMap);
		  //pageRef.setRedirect(false);
		  
        System.debug(pageRef.getContent().toString());
        //send mail
        //file name 
        Blob b = pageRef.getContent();
        Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.setTargetObjectId(UserInfo.getUserId());
        Messaging.EmailFileAttachment a = new Messaging.EmailFileAttachment();
        a.setBody(b);
        a.setContentType('application/vnd.ms-excel');
        a.setFileName('some-file.xls');
        a.setInline(false);
        m.setFileAttachments(new Messaging.EmailFileAttachment[] { a } );
        m.setSubject('Test');
        m.setPlainTextBody('See attachment');
        m.setSaveAsActivity(false);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { m } ); 
         
        
        
        
    }
}