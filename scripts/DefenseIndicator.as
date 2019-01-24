package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class DefenseIndicator extends MovieClip
   {
       
      
      public var cRoot:Level;
      
      public function DefenseIndicator(param1:Point)
      {
         super();
         addFrameScript(69,this.frame70);
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
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
         if(this.currentFrameLabel != "defenseIndicatorEnd")
         {
            this.play();
         }
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame70() : *
      {
         stop();
      }
   }
}
