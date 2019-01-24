package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemyPolymorph extends MovieClip
   {
       
      
      private var durationTime:int = 11;
      
      private var durationSheepTime:int = 0;
      
      private var durationTimeCounter:int = 0;
      
      private var sheep:Enemy;
      
      private var cRoot:Level;
      
      public function EnemyPolymorph(param1:Point, param2:Level, param3:Enemy)
      {
         super();
         this.cRoot = param2;
         this.cRoot.game.gameAchievement.polymorphEnemy(this.cRoot);
         this.sheep = param3;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            if(this.durationTimeCounter == this.durationSheepTime)
            {
               this.cRoot.entities.addChild(this.sheep);
               this.cRoot.enemies[this.sheep] = this.sheep;
            }
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
         if(this.currentFrameLabel != "polymorphEnd")
         {
            this.play();
         }
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.sheep = null;
         this.parent.removeChild(this);
      }
   }
}
