package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Qf§ extends §_-Bx§
   {
       
      
      public function §_-Qf§(param1:Point)
      {
         super(param1);
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function rollOver(param1:MouseEvent) : void
      {
      }
      
      override public function rollOut(param1:MouseEvent) : void
      {
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
      }
      
      override protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,init);
         this.parent.removeChild(this);
      }
   }
}
