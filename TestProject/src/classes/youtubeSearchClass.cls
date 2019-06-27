public class youtubeSearchClass {
    public String searchText {get;set;}
    public String body {get;set;}
    public superItemList[] dataset {get;set;}
    
    Public void Search() {
        Http http = new Http();
        searchText= searchText.replaceAll(' ', '+');
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.googleapis.com/youtube/v3/search?part=snippet&q='+searchText+'&key=AIzaSyCtZTIXHJY7GDxuqUOQ4y85oqcr-J7suRY');
        req.setMethod('GET');
        req.setHeader('content-type','application/json');
        HttpResponse res = http.send(req);
        body = res.getBody();     
        fromJSON n = (fromJSON)JSON.deserialize(body,fromJSON.class);
        system.debug('First'+n.kind);
        system.debug('sec'+n.etag);
        system.debug('third'+n.items[0].snippet.thumbnails.medium.url);
        system.debug('four'+n.items[0].snippet.description);
       
        dataset =  new superItemList[]{};
        for(Integer i=0; i<n.items.size(); i++) {      
        dataset.add(new superItemList (n.kind,n.etag,n.items[i].snippet.description,n.items[i].snippet.thumbnails.medium.url));
          }
        }
    
    public class superItemList {
        
        public String f1 {get;set;}
        public String f2 {get;set;}
        public String f3 {get;set;}
        public String f4 {get;set;}
        
        public superItemList(String cf1,String cf2,String cf3, String cf4){
            f1 = cf1;
            f2 = cf2;
            f3 = cf3;
            f4 = cf4;
        }
    }
    public class fromJSON{
        public String kind;	//youtube#searchListResponse
        public String etag;	//"XpPGQXPnxQJhLgs6enD_n8JR4Qk/HtXftx_1BPdPk7y_UeWsxvhRw5s"
        public String nextPageToken;	//CAUQAA
        public String regionCode;	//IN
        public cls_pageInfo pageInfo;
        public cls_items[] items;
        
    }
    class cls_pageInfo {
        public Integer totalResults;	//1000000
        public Integer resultsPerPage;	//5
    }
    class cls_items {
        public String kind;	//youtube#searchResult
        public String etag;	//"XpPGQXPnxQJhLgs6enD_n8JR4Qk/EtD3vqzicuEJRlmocnWksCcIMLw"
        public cls_id id;
        public cls_snippet snippet;
    }
    class cls_id {
        public String kind;	//youtube#video
        public String videoId;	//2LpNKtJlAkc
    }
    class cls_snippet {
        public String publishedAt;	//2011-02-03T07:53:36.000Z
        public String channelId;	//UCF1JIbMUs6uqoZEY1Haw0GQ
        public String title;	//Anand {HD} - Rajesh Khanna | Amitabh Bachchan - Superhit Hindi Movie - (With Eng Subtitles)
        public String description;	//Anand Saigal Rajesh Khanna an unusual interesting man who lived what remained of his life fully completely. Treating every living moment as magic every ...
        public cls_thumbnails thumbnails;
        public String channelTitle;	//Shemaroo
        public String liveBroadcastContent;	//none
    }
    class cls_thumbnails {
        public cls_default defaultcustom;
        public cls_medium medium;
        public cls_high high;
    }
    class cls_default {
        public String url;	//https://i.ytimg.com/vi/2LpNKtJlAkc/default.jpg
        public Integer width;	//120
        public Integer height;	//90
    }
    class cls_medium {
        public String url;	//https://i.ytimg.com/vi/2LpNKtJlAkc/mqdefault.jpg
        public Integer width;	//320
        public Integer height;	//180
    }
    class cls_high {
        public String url;	//https://i.ytimg.com/vi/2LpNKtJlAkc/hqdefault.jpg
        public Integer width;	//480
        public Integer height;	//360
    }
}