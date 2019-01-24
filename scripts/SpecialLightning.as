package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class SpecialLightning extends MovieClip
   {
       
      
      protected var target:Enemy;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var durationTime:int = 14;
      
      protected var durationTimeCounter:int;
      
      protected var cRoot:Level;
      
      public function SpecialLightning(param1:Point, param2:Level, param3:Enemy)
      {
         super();
         addFrameScript(10,this.frame11);
         this.x = param1.x;
         this.y = param1.y;
         this.cRoot = param2;
         this.cRoot.game.gameSounds.§_-Eh§();
         this.minDamage = this.cRoot.gameSettings.powers.lightning.minDamage;
         this.maxDamage = this.cRoot.gameSettings.powers.lightning.maxDamage;
         this.target = param3;
         if(this.target != null && this.target.isActive)
         {
            EnemyCommon(this.target).§_-F1§(this.getDamage());
         }
      }
      
      public function onFrameUpdate() : void
      {
         this.durationTimeCounter++;
         if(this.durationTimeCounter == this.durationTime)
         {
            this.destroyThis();
            return;
         }
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
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.target = null;
         this.parent.removeChild(this);
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}
