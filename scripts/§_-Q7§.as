package
{
   import com.mosesSupposes.bitmap.InteractivePNG;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-Q7§ extends InteractivePNG
   {
       
      
      protected var cRoot:Level;
      
      public function §_-Q7§(param1:Point)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
