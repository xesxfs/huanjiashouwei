package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class VeznanExplosion extends MovieClip
   {
       
      
      private var §_-Bk§:int;
      
      private var §_-Td§:int;
      
      public function VeznanExplosion(param1:Point)
      {
         super();
         addFrameScript(71,this.frame72);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Bk§ = 75;
         this.§_-Td§ = 0;
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.§_-Td§ < this.§_-Bk§)
         {
            this.§_-Td§++;
            return;
         }
         this.stop();
         this.destroyThis();
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
      
      function frame72() : *
      {
         stop();
      }
   }
}
