public class ContentMapController{
    
   // public List<Contact>lstContact {set;get;}
    public List<String>keys {set;get;}
    public  List<List<String>> datas {set;get;}
    
    public ContentMapController(){
    	system.debug('ContentMap classe');
        string str64base =ApexPages.currentPage().getParameters().get('MapContact');
        system.debug('url64'+str64base);
        String str = EncodingUtil.base64Decode(str64base).toString();
        system.debug('data'+str);
       	Map<string, List<string>> MapContact = (Map<string, List<string>>)JSON.deserialize(str, Map<string, List<string>>.class);
        system.debug('datamap'+MapContact);
    	keys=new List<String>();
        
    	datas=new List<List<String>>();
                
       	system.debug(MapContact);
        

        for(string key:MapContact.keySet()){
            keys.add(key);   
            system.debug('KEYS '+keys);
        }
        
        
      	Integer n=MapContact.get(keys[0]).size();
       
        system.debug('SIZE '+MapContact.size());
	for(Integer j=0;j<n;j++){
           	List<String> line=new List<String>();
        	for(Integer i=0;i<MapContact.size();i++){
            		line.add(MapContact.get(keys[i])[j]);
               	}
            	datas.add(line);
            	system.debug('mapval'+datas);
        }
      
}
    
    
}
