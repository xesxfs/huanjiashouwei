package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class MenuUpgradeItemBuyAnim extends MovieClip
   {
       
      
      private var durationTime:int = 24;
      
      private var durationTimeCounter:int;
      
      public function MenuUpgradeItemBuyAnim(param1:Point)
      {
         super();
         addFrameScript(25,this.frame26);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTimeCounter = 0;
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.destroyThis();
      }
      
      private function destroyThis() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
      
      function frame26() : *
      {
         stop();
      }
   }
}
