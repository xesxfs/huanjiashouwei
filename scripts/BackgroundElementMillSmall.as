package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class BackgroundElementMillSmall extends §_-Bx§
   {
       
      
      private var onPause:Boolean;
      
      public function BackgroundElementMillSmall(param1:Point)
      {
         super(param1);
         this.§_-TZ§ = true;
         this.onPause = false;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         if(this.onPause)
         {
            this.play();
            this.onPause = false;
         }
         else
         {
            this.stop();
            this.onPause = true;
         }
      }
      
      override protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,init);
         this.parent.removeChild(this);
      }
   }
}
