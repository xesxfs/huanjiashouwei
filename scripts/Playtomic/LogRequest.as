package Playtomic
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public final class LogRequest
   {
      
      private static var Failed:int = 0;
      
      private static var Pool:Array = new Array();
       
      
      private var Sender:URLLoader;
      
      private var Target:URLRequest;
      
      private var Data:String = "";
      
      private var BaseUrl:String;
      
      public var Ready:Boolean = false;
      
      public function LogRequest()
      {
         super();
         this.Sender = new URLLoader();
         this.Sender.addEventListener(Event.COMPLETE,this.Complete);
         this.Sender.addEventListener(IOErrorEvent.IO_ERROR,this.IOErrorHandler);
         this.Sender.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.StatusChange);
         this.Sender.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandler);
         this.Target = new URLRequest();
         this.BaseUrl = "http://g" + Log.GUID + ".api.playtomic.com/tracker/q.aspx?swfid=" + Log.SWFID;
      }
      
      public static function Create() : LogRequest
      {
         var _loc1_:LogRequest = Pool.length > 0?Pool.pop() as LogRequest:new LogRequest();
         _loc1_.Data = "";
         _loc1_.Ready = false;
         return _loc1_;
      }
      
      public function MassQueue(param1:Array) : void
      {
         var _loc3_:LogRequest = null;
         if(Failed > 3)
         {
            return;
         }
         var _loc2_:int = param1.length - 1;
         while(_loc2_ > -1)
         {
            this.Data = this.Data + ((this.Data == ""?"":"~") + param1[_loc2_]);
            param1.splice(_loc2_,1);
            if(this.Data.length > 300)
            {
               _loc3_ = Create();
               _loc3_.MassQueue(param1);
               this.Ready = true;
               this.Send();
               return;
            }
            _loc2_--;
         }
         Log.Request = this;
      }
      
      public function Queue(param1:String) : void
      {
         if(Failed > 3)
         {
            return;
         }
         this.Data = this.Data + ((this.Data == ""?"":"~") + param1);
         if(this.Data.length > 300)
         {
            this.Ready = true;
         }
      }
      
      public function Send() : void
      {
         if(this.Data == "")
         {
            return;
         }
         this.Target.url = this.BaseUrl + "&q=" + this.Data + "&url=" + Log.SourceUrl + "&" + Math.random() + "z";
         try
         {
            this.Sender.load(this.Target);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function Complete(param1:Event = null) : void
      {
         if(this.Data.indexOf("v/") == 0 || this.Data.indexOf("~v/") > -1)
         {
            Log.IncreaseViews();
         }
         if(this.Data.indexOf("p/") == 0 || this.Data.indexOf("~p/") > -1)
         {
            Log.IncreasePlays();
         }
         Pool.push(this);
      }
      
      private function IOErrorHandler(param1:IOErrorEvent) : void
      {
         Failed++;
      }
      
      private function SecurityErrorHandler(param1:SecurityErrorEvent) : void
      {
      }
      
      private function StatusChange(param1:HTTPStatusEvent) : void
      {
      }
   }
}
