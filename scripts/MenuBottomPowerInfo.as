package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MenuBottomPowerInfo extends MovieClip
   {
       
      
      public var info_name:TextField;
      
      private var type:String;
      
      private var power:§_-5g§;
      
      private var §_-AM§:Boolean;
      
      private var §_-P8§:Tween;
      
      private var ytweenOut:Tween;
      
      public function MenuBottomPowerInfo(param1:Point, param2:§_-5g§)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.power = param2;
         this.type = "power";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.updateData();
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function §_-JN§(param1:§_-5g§) : void
      {
         this.power = param1;
         this.§_-8F§();
      }
      
      public function updateData() : void
      {
         this.§_-8F§();
      }
      
      public function §_-8F§() : void
      {
         var _loc1_:String = Locale.getDefaultLang();
         var _loc2_:Object = this.power.getInfo();
         this.info_name.text = _loc2_.pName;
      }
      
      public function hide() : void
      {
         if(this.§_-AM§)
         {
            return;
         }
         this.§_-AM§ = true;
         MenuBottom(this.parent.parent).§_-Qd§(this);
         this.ytweenOut = new Tween(this,"y",Strong.easeOut,this.y,56,0.25,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      public function getType() : String
      {
         return this.type;
      }
      
      public function destroyThis() : void
      {
         this.power = null;
         this.§_-P8§ = null;
         this.ytweenOut = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
