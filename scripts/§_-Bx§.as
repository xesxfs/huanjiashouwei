package
{
   import com.mosesSupposes.bitmap.InteractivePNG;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Bx§ extends InteractivePNG
   {
       
      
      protected var §_-TZ§:Boolean;
      
      protected var cRoot:Level;
      
      public function §_-Bx§(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         if(this.§_-TZ§)
         {
            this.gotoAndPlay(Math.floor(this.getRandom(1,this.totalFrames)));
         }
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
      }
      
      public function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      protected function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
