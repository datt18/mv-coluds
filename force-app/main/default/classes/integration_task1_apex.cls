public without sharing class integration_task1_apex {
  @AuraEnabled
  public static List<Contact> getemail(List<ID> recordId){
  try {
  return [SELECT Email FROM Contact WHERE ID =: recordId];
  } catch (Exception e) {
  throw new AuraHandledException(e.getMessage());
  }
  }
  @AuraEnabled(cacheable=true)
  public static void sendEmailToController(String toSend, String subject, String body, String filename, string cv){
  try{

  HttpRequest req = new HttpRequest();
  String toAddress = toSend;
  System.debug(toAddress);
  String e_subject = subject;
System.debug(body);
 // String mailBody = body;
 System.debug(e_subject);
  // String name = filename;
  System.debug(cv);
  List<ContentVersion> conVer = [Select 
 id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where Id =: cv];
 System.debug('conver');
System.debug(conVer);
  System.debug('address : '+toAddress);
  System.debug('subject : '+e_subject);
  System.debug('body : '+body);
  String mimeBody = '';
  String nl = '\n';
  String boundary = 'foo_bar_baz';
  
  mimeBody += 'MIME-Version: 1.0\n';
  mimeBody += 'To: '+toAddress+'\n';
  
  mimeBody += 'Subject: '+e_subject+' \n';
  mimeBody += body+'\n';
  mimeBody += 'Content-Type: multipart/mixed; boundary="'+boundary+'"\n\n';
  mimeBody += '--'+boundary+'\n';
  System.debug('new1');
    System.debug(mimeBody);
  
  mimeBody += 'Content-Type: text/html; charset=UTF-8\n';
  mimeBody += 'Content-Transfer-Encoding: base64\n\n';
  mimeBody += EncodingUtil.base64Encode(blob.valueOf(body))+'\n\n';
  System.debug('new');
  System.debug(Blob.valueOf(body));
  mimeBody += '--'+boundary+'\n'; 
  
  System.debug('new2');
    System.debug(mimeBody);
    
  mimeBody += 'Content-Type:image/pdf;\n';

  mimeBody += 'Content-Transfer-Encoding: base64\n\n';
  mimeBody += 'Content-Disposition: attachment; filename="'+conVer[0].Title+'"\n';
  mimeBody += EncodingUtil.base64Encode(conVer[0].VersionData)+'\n\n';
  mimeBody += '--'+boundary+'--';

  System.debug(mimeBody);
  req.setHeader('Content-Length', '-1'); 
  req.setHeader('Content-Type', 'message/rfc822');
  
 req.setEndpoint('callout:Gmail/upload/gmail/v1/users/pateldatt81@gmail.com/messages/send?uploadType=media');
  req.setMethod('POST');
  System.debug('try');
  System.debug(req);
 req.setBody('{"userId:"me","raw":"'+ mimeBody); 

  req.setTimeout(60 * 1000);
  
  System.debug(req);
    System.debug('http');
  //System.debug(h);
  
  // Send the request, and return a response
  Http h = new Http();
  System.debug('http'+h);
  HttpResponse res = h.send(req);
  System.debug(res.getBody());
  
  }catch(Exception ex){
  System.debug(ex.getLineNumber());
  }
  }
} 








// public without sharing class integration_task1_apex {
//   @AuraEnabled
//   public static List<Contact> getemail(List<ID> recordId){
//   try {
//   return [SELECT Email FROM Contact WHERE ID =: recordId];
//   } catch (Exception e) {
//   throw new AuraHandledException(e.getMessage());
//   }
//   }
//   @AuraEnabled(cacheable=true)
//   public static void sendEmailToController(String toSend, String subject, String body, String filename){
//   try{
//   HttpRequest req = new HttpRequest();
//   String toAddress = toSend;
//   String e_subject = subject;
//  // String mailBody = body;
//   String name = filename;
//   List<ContentVersion> conVer = [Select 
//  id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where title =: name];
//   System.debug('address : '+toAddress);
//   System.debug('subject : '+e_subject);
//   System.debug('body : '+body);
//   String mimeBody = '';
//   String nl = '\n';
//   String boundary = 'foo_bar_baz';
  
//   mimeBody += 'MIME-Version: 1.0\n';
//   mimeBody += 'To: '+toAddress+'\n';
  
//   mimeBody += 'Subject: '+e_subject+' \n';
//   mimeBody += body+'\n';
//   mimeBody += 'Content-Type: multipart/mixed; boundary="'+boundary+'"\n\n';
//   mimeBody += '--'+boundary+'\n';
//   System.debug('new1');
//   System.debug(mimeBody);
  
//   mimeBody += 'Content-Type: text/html; charset=UTF-8\n';
//   mimeBody += 'Content-Transfer-Encoding: base64\n\n';
//   mimeBody += EncodingUtil.base64Encode(blob.valueOf(body))+'\n\n';
//   mimeBody += '--'+boundary+'\n'; 
//   System.debug('new');
//   System.debug(mimeBody);
//   for(ContentVersion cv:conVer){
//   mimeBody += 'Content-Type:image/png;\n';
 
//   System.debug('mimeBody123');
//   System.debug(mimeBody);
//   mimeBody += 'Content-Disposition:attachment; filename="'+cv.PathOnClient+'"\n';
//   mimeBody += 'Content-Transfer-Encoding: base64\n\n';
//   mimeBody += EncodingUtil.base64Encode(cv.VersionData)+'\n\n';
//   }
//   mimeBody += '--'+boundary+'--';

//   System.debug('mimeBody1');
//   System.debug(mimeBody);
//   req.setHeader('Content-Length', '-1'); 
//   req.setHeader('Content-Type', 'message/rfc822');
  
//  req.setEndpoint('callout:Gmail/upload/gmail/v1/users/pateldatt81@gmail.com/messages/send?uploadType=media');
//   req.setMethod('POST');
//   System.debug('try');
//   System.debug(req);
//  req.setBody('{"userId:"me","raw":"'+ mimeBody); 

//   req.setTimeout(60 * 1000);
  
//   System.debug(req);
//     System.debug('http');
//   //System.debug(h);
  
//   // Send the request, and return a response
//   Http h = new Http();
//   System.debug('http'+h);
//   HttpResponse res = h.send(req);
//   System.debug(res.getBody());
  
//   }catch(Exception ex){
//     System.debug(ex);
//   System.debug(ex.getLineNumber()); 
//   }
//   }
// } 