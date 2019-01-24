package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class EnemyExplodeNormal extends MovieClip
   {
       
      
      private var durationTime:int = 25;
      
      private var durationTimeCounter:int = 0;
      
      private var cRoot:Level;
      
      public function EnemyExplodeNormal(param1:Point, param2:Level)
      {
         super();
         addFrameScript(11,this.frame12);
         this.cRoot = param2;
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot.addToDecal(new BloodDecal(new Point(this.x,this.y)));
         this.cRoot.game.gameSounds.playEnemyExploteSound();
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
         if(this.currentFrameLabel != "explotionEnd")
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
      
      function frame12() : *
      {
         stop();
      }
   }
}
