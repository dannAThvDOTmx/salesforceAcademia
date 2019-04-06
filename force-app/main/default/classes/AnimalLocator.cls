public class AnimalLocator {
    
    public static String getAnimalNameById(Integer animalId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
           	Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            return String.valueOf(animal.get('name'));
        }else {
            return null;
        }
    }
    
}