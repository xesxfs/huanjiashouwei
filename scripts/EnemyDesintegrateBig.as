package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemyDesintegrateBig extends MovieClip
   {
       
      
      private var durationTime:int = 14;
      
      private var durationTimeCounter:int = 0;
      
      private var cRoot:Level;
      
      public function EnemyDesintegrateBig(param1:Point, param2:Level, param3:Boolean = true)
      {
         super();
         addFrameScript(14,this.frame15);
         this.cRoot = param2;
         if(param3)
         {
            this.cRoot.game.gameAchievement.desintegrateEnemy(this.cRoot);
         }
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return;
         }
         this.cRoot.addToDecal(new §_-0l§(new Point(this.x,this.y)));
         this.destroyThis();
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "desintegrateEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame15() : *
      {
         stop();
      }
   }
}
