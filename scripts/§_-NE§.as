package
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-NE§ extends §_-Bx§
   {
       
      
      public var isActive:Boolean;
      
      public function §_-NE§(param1:Point, param2:Boolean = false)
      {
         addFrameScript(0,this.frame1,9,this.frame10);
         super(param1);
         this.isActive = true;
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
      }
      
      override public function rollOver(param1:MouseEvent) : void
      {
      }
      
      override public function rollOut(param1:MouseEvent) : void
      {
      }
      
      override public function pause() : void
      {
         this.stop();
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "idle":
               break;
            case "destroyEnd":
               break;
            default:
               this.play();
         }
      }
      
      public function destroyPublic() : void
      {
         this.destroyThis();
      }
      
      public function goEnd() : void
      {
         if(!this.isActive)
         {
            return;
         }
         this.gotoAndPlay("destroy");
         this.isActive = false;
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
      
      function frame1() : *
      {
         stop();
      }
      
      function frame10() : *
      {
         stop();
      }
   }
}
