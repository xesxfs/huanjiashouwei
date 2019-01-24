package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class HitGroundSmokeDecal extends MovieClip
   {
       
      
      private var durationTime:int;
      
      private var durationTimeCounter:int;
      
      public var cRoot:Level;
      
      public function HitGroundSmokeDecal(param1:Point, param2:int)
      {
         super();
         addFrameScript(12,this.frame13);
         this.x = param1.x;
         this.y = param1.y;
         this.durationTime = 13;
         this.scaleX = param2;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.§_-5o§();
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame13() : *
      {
         stop();
      }
   }
}
