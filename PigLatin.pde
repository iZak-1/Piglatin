public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public boolean isVowel(char input) {
  boolean output = false;
  if(input=='a'||input=='e'||input=='i'||input=='o'||input=='u') {
    output = true;
  }
  return output;
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  int output = -1;
  for (int vowI=0; vowI<sWord.length(); vowI++) {
    if(isVowel(sWord.charAt(vowI))) {
      output = vowI;
      break;
    }
  }
  return output;
}

public String consToEnd(String sWord) {
  String output = sWord;
  char firstChar = sWord.charAt(0);
  if(firstChar=='a'||firstChar=='e'||firstChar=='i'||firstChar=='o'||firstChar=='u') {
    output = sWord;
  } else {
      output=consToEnd(output.substring(1,sWord.length())+output.substring(0,1));
  }
  return output;
}




public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	} else if(findFirstVowel(sWord)==0){
    return sWord+"way";
  } else if(sWord.charAt(0)=='q'&&sWord.charAt(1)=='u'){
    return sWord.substring(2) + "quay";
  } else if (findFirstVowel(sWord)>0) {
    //return sWord.substring(findFirstVowel(sWord),sWord.length())+sWord.substring(0,findFirstVowel(sWord))+"ay";
    return consToEnd(sWord)+"ay";
  } else
	{
		return "ERROR!";
	}
}
