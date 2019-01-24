package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-5N§ extends §_-Bx§
   {
       
      
      public function §_-5N§(param1:Point, param2:Boolean = false)
      {
         super(param1);
         if(param2)
         {
            this.scaleX = -1;
         }
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
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
