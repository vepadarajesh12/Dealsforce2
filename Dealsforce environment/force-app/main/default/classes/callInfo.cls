public class callInfo {
    public void callInfoTech(){
        FetchInfo info = new Fetchinfo();

//info.doTask();

 Integer addedNumber = info.add(50,55);
system.debug('addNUmber##'+addedNumber);//system.debug('addNum###'+info.add(50,55));
String concatenatedNum  = info.concatenate('RAjesh','kumar');
system.debug('conNum####'+concatenatedNum);
    }

}