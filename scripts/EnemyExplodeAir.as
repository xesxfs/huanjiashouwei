package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemyExplodeAir extends MovieClip
   {
       
      
      private var durationTime:int = 25;
      
      private var durationTimeCounter:int;
      
      private var cRoot:Level;
      
      public function EnemyExplodeAir(param1:Point, param2:Level)
      {
         super();
         addFrameScript(11,this.frame12);
         this.x = param1.x;
         this.y = param1.y;
         this.cRoot = param2;
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
         this.parent.removeChild(this);
      }
      
      function frame12() : *
      {
         stop();
      }
   }
}
