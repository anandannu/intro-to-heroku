public class ApexMap {
    public Map<String, String> inputFields { get; set; }

    public ApexMap() {
        inputFields = new Map<String, String> { 
            'firstName' => 'Jonny', 'lastName' => 'Appleseed', 'age' => '42' };
    }

    public PageReference submitFieldData() {
        inputFields.put('age', (Integer.valueOf(inputFields.get('age')) + 10).format());
        return null;
    }
    
    public void doSomethingInterestingWithInput() {
      
    }
}