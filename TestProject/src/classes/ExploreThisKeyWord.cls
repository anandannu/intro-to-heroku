public class ExploreThisKeyWord {

// First constructor for the class. It requires a string parameter.
   public ExploreThisKeyWord(string s2, String s3) {
       String es = s2;
       String se = s3;
      system.debug(es+' '+ se);
   }

// Second constructor for the class. It does not require a parameter.
// This constructor calls the first constructor using the this keyword.
   public ExploreThisKeyWord() {
       this('None','All');
   }
}