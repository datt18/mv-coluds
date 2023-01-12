
global class future_task1{
 
    @future
    Webservice static void  fetchFileFromExternalUrl(Id id){
        //extFileUrl='https://drive.google.com/file/d/0ByXILxflqQ2jWGpNVmI1WW9uYTQ/view?usp=sharing';
        System.debug(id);

        // String = extFileUrl;
        Http h = new Http(); 
        HttpRequest req = new HttpRequest(); 
        //Replace any spaces in extFileUrl with %20 
        // extFileUrl = extFileUrl.replace(' ', '%20'); 
        //Set the end point URL
        req.setEndpoint('https://source.unsplash.com/random'); 
        req.setMethod('GET'); 
        // req.setHeader('Content-Type', 'application/jpeg'); 
        req.setCompressed(true); 
        req.setTimeout(60000);  
        
        // System.debug(extFileUrl);
        //Now Send HTTP Request
        HttpResponse res  = h.send(req);  
        string hello = res.getBody();   
        system.debug('Response from Server: ' + res.getBody());
        string try1= hello.substring(hello.indexOf('https://'),hello.indexOf('1080'));
        System.debug(try1);
        // string try2= try1.substring(try1.indexOf('https://'),try1.indexOf('1080'));
        // System.debug(try2); 
       
        //getBodyAsBlob method was will convert the response into Blob 
        // blob retFile = res.getBodyAsBlob();
        // Http ag = new Http();
        // HttpResponse res12  =  
        // String yes = res12.getBody(); 
        // System.debug('yes'+yes);


        

        Http f1 = new Http();
        HttpRequest clouds  =  new HttpRequest();
        clouds.setEndpoint(try1); 
        System.debug('try1 final'+clouds);
       
        // System.debug('try2'+try2);
        clouds.setmethod('GET'); 
       System.debug('hello'+clouds);
    //    System.debug(clouds.getBodyAsBlob());
        HttpResponse res2  =  f1.send(clouds);
        System.debug(res2);
        blob retFile = res2.getBodyAsBlob();
        System.debug(retFile);


        // string boat = clouds.getBody(); 
        // System.debug(boat);

System.debug(clouds);
       
        Attachment attach = new Attachment();
        System.debug(attach);
          attach.ParentId = id; 
          System.debug(attach);
         attach.Name = 'frist.png'; 
         
        attach.Body = retFile;
        // attach.Body = clouds.getBodyAsBlob();
        
        // System.debug(attach.Body);
         attach.ContentType = 'image/png';
         System.debug(attach);
           insert attach; 


        // System.debug('hello'+retFile);
        // return retFile;
    }
}




// Public class FileDownLoadUtility{

//     public static blob fetchFileFromExternalUrl(String extFileUrl){
//         //extFileUrl='https://drive.google.com/file/d/0ByXILxflqQ2jWGpNVmI1WW9uYTQ/view?usp=sharing';
//         Http h = new Http(); 
//         HttpRequest req = new HttpRequest(); 
//         //Replace any spaces in extFileUrl with %20 
//         extFileUrl = extFileUrl.replace(' ', '%20'); 
//         //Set the end point URL
//         req.setEndpoint(extFileUrl); 
//         req.setMethod('GET'); 
//         req.setHeader('Content-Type', 'application/pdf'); 
//         req.setCompressed(true); 
//         req.setTimeout(60000); 
//         //Now Send HTTP Request
//         HttpResponse res  = h.send(req); 
//         system.debug('Response from Server: ' + res.getBody()); 
//         //getBodyAsBlob method was will convert the response into Blob 
//         blob retFile = res.getBodyAsBlob();
//         return retFile;
//     }
    
//     public static Id createAttachment(blob fileContent, String recordId, String fileType){
//         //for pdf files content type should be pdf
//         //for jpeg file content type should be image/jpeg
//         Attachment attach = new Attachment(); 
//         attach.ParentId = recordId; 
//         attach.Name = 'FileFromExtenalSource.pdf'; 
//         attach.Body = fileContent; 
//         attach.contentType = fileType; 
//         insert attach; 
//         return attach.id;
//     }
// }

// https://source.unsplash.com/random










