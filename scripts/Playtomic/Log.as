package Playtomic
{
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import flash.system.Security;
   import flash.utils.Timer;
   
   public final class Log
   {
      
      private static var cookieOk:Boolean = true;
      
      public static var Enabled:Boolean = false;
      
      public static var Queue:Boolean = true;
      
      public static var SWFID:int = 0;
      
      public static var GUID:String = "";
      
      public static var SourceUrl:String;
      
      public static var BaseUrl:String;
      
      public static var Cookie:SharedObject;
      
      public static var Request:LogRequest;
      
      private static const PingF:Timer = new Timer(60000);
      
      private static const PingR:Timer = new Timer(30000);
      
      private static var FirstPing:Boolean = true;
      
      private static var Pings:int = 0;
      
      private static var Plays:int = 0;
      
      private static var HighestGoal:int = 0;
      
      private static var Frozen:Boolean = false;
      
      private static var FrozenQueue:Array = new Array();
      
      private static var Customs:Array = new Array();
      
      private static var LevelCounters:Array = new Array();
      
      private static var LevelAverages:Array = new Array();
      
      private static var LevelRangeds:Array = new Array();
       
      
      public function Log()
      {
         super();
      }
      
      public static function View(param1:int = 0, param2:String = "", param3:String = "") : void
      {
         var swfid:int = param1;
         var guid:String = param2;
         var defaulturl:String = param3;
         if(SWFID > 0)
         {
            return;
         }
         SWFID = swfid;
         GUID = guid;
         Enabled = true;
         if(SWFID == 0 || GUID == "")
         {
            Enabled = false;
            return;
         }
         if(defaulturl.indexOf("http://") != 0 && Security.sandboxType != "localWithNetwork" && Security.sandboxType != "localTrusted")
         {
            Enabled = false;
            return;
         }
         SourceUrl = GetUrl(defaulturl);
         if(SourceUrl == null || SourceUrl == "" || SourceUrl.indexOf("https://") == 0)
         {
            Enabled = false;
            return;
         }
         Security.loadPolicyFile("http://g" + Log.GUID + ".api.playtomic.com/crossdomain.xml");
         Request = LogRequest.Create();
         try
         {
            Cookie = SharedObject.getLocal("playtomic");
            cookieOk = true;
         }
         catch(err:Error)
         {
            cookieOk = false;
         }
         var views:int = GetCookie("views");
         Send("v/" + (views + 1),true);
         PingF.addEventListener(TimerEvent.TIMER,PingServer);
         PingF.start();
      }
      
      public static function IncreaseViews() : void
      {
         var _loc1_:int = GetCookie("views");
         _loc1_++;
         SaveCookie("views",_loc1_);
      }
      
      public static function IncreasePlays() : void
      {
         Plays++;
      }
      
      public static function Play() : void
      {
         if(!Enabled)
         {
            return;
         }
         LevelCounters = new Array();
         LevelAverages = new Array();
         LevelRangeds = new Array();
         Send("p/" + (Plays + 1),true);
      }
      
      private static function PingServer(... rest) : void
      {
         if(!Enabled)
         {
            return;
         }
         Pings++;
         Send("t/" + (!!FirstPing?"y":"n") + "/" + Pings,true);
         if(FirstPing)
         {
            PingF.stop();
            PingR.addEventListener(TimerEvent.TIMER,PingServer);
            PingR.start();
            FirstPing = false;
         }
      }
      
      public static function CustomMetric(param1:String, param2:String = null, param3:Boolean = false) : void
      {
         if(!Enabled)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3)
         {
            if(Customs.indexOf(param1) > -1)
            {
               return;
            }
            Customs.push(param1);
         }
         Send("c/" + Clean(param1) + "/" + Clean(param2));
      }
      
      public static function LevelCounterMetric(param1:String, param2:*, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         if(!Enabled)
         {
            return;
         }
         if(param3)
         {
            _loc4_ = param1 + "." + param2.toString();
            if(LevelCounters.indexOf(_loc4_) > -1)
            {
               return;
            }
            LevelCounters.push(_loc4_);
         }
         Send("lc/" + Clean(param1) + "/" + Clean(param2));
      }
      
      public static function LevelRangedMetric(param1:String, param2:*, param3:int, param4:Boolean = false) : void
      {
         var _loc5_:String = null;
         if(!Enabled)
         {
            return;
         }
         if(param4)
         {
            _loc5_ = param1 + "." + param2.toString();
            if(LevelRangeds.indexOf(_loc5_) > -1)
            {
               return;
            }
            LevelRangeds.push(_loc5_);
         }
         Send("lr/" + Clean(param1) + "/" + Clean(param2) + "/" + param3);
      }
      
      public static function LevelAverageMetric(param1:String, param2:*, param3:int, param4:Boolean = false) : void
      {
         var _loc5_:String = null;
         if(!Enabled)
         {
            return;
         }
         if(param4)
         {
            _loc5_ = param1 + "." + param2.toString();
            if(LevelAverages.indexOf(_loc5_) > -1)
            {
               return;
            }
            LevelAverages.push(_loc5_);
         }
         Send("la/" + Clean(param1) + "/" + Clean(param2) + "/" + param3);
      }
      
      public static function Link(param1:String, param2:String, param3:String, param4:int, param5:int, param6:int) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("l/" + Clean(param2) + "/" + Clean(param3) + "/" + Clean(param1) + "/" + param4 + "/" + param5 + "/" + param6);
      }
      
      public static function Heatmap(param1:String, param2:String, param3:int, param4:int) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("h/" + Clean(param1) + "/" + Clean(param2) + "/" + param3 + "/" + param4);
      }
      
      public static function Funnel(param1:String, param2:String, param3:int) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("f/" + Clean(param1) + "/" + Clean(param2) + "/" + param3);
      }
      
      public static function PlayerLevelStart(param1:String) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("pls/" + param1);
      }
      
      public static function PlayerLevelWin(param1:String) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("plw/" + param1);
      }
      
      public static function PlayerLevelQuit(param1:String) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("plq/" + param1);
      }
      
      public static function PlayerLevelFlag(param1:String) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("plf/" + param1);
      }
      
      public static function PlayerLevelRetry(param1:String) : void
      {
         if(!Enabled)
         {
            return;
         }
         Send("plr/" + param1);
      }
      
      public static function Freeze() : void
      {
         Frozen = true;
      }
      
      public static function UnFreeze() : void
      {
         Frozen = false;
         Request.MassQueue(FrozenQueue);
      }
      
      public static function ForceSend() : void
      {
         if(!Enabled)
         {
            return;
         }
         if(Request == null)
         {
            Request = LogRequest.Create();
         }
         Request.Send();
         Request = LogRequest.Create();
         if(FrozenQueue.length > 0)
         {
            Request.MassQueue(FrozenQueue);
         }
      }
      
      private static function Send(param1:String, param2:Boolean = false) : void
      {
         if(Frozen)
         {
            FrozenQueue.push(param1);
            return;
         }
         Request.Queue(param1);
         if(Request.Ready || param2 || !Queue)
         {
            Request.Send();
            Request = LogRequest.Create();
         }
      }
      
      private static function Clean(param1:String) : String
      {
         while(param1.indexOf("/") > -1)
         {
            param1 = param1.replace("/","\\");
         }
         while(param1.indexOf("~") > -1)
         {
            param1 = param1.replace("~","-");
         }
         return escape(param1);
      }
      
      private static function GetCookie(param1:String) : int
      {
         if(!cookieOk)
         {
            return 0;
         }
         if(Cookie.data[param1] == undefined)
         {
            return 0;
         }
         return int(Cookie.data[param1]);
      }
      
      private static function SaveCookie(param1:String, param2:int) : void
      {
         if(!cookieOk)
         {
            return;
         }
         Cookie.data[param1] = param2.toString();
         Cookie.flush();
      }
      
      private static function GetUrl(param1:String) : String
      {
         var url:String = null;
         var defaulturl:String = param1;
         if(ExternalInterface.available)
         {
            try
            {
               url = String(ExternalInterface.call("window.location.href.toString"));
            }
            catch(s:Error)
            {
               url = defaulturl;
            }
         }
         else if(defaulturl.indexOf("http://") == 0 || defaulturl.indexOf("https://") == 0)
         {
            url = defaulturl;
         }
         if(url == null || url == "" || url == "null")
         {
            if(Security.sandboxType == "localWithNetwork" || Security.sandboxType == "localTrusted")
            {
               url = "http://local-testing/";
            }
            else
            {
               url = null;
            }
         }
         return escape(url);
      }
   }
}
