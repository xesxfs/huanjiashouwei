package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-ST§ extends MovieClip
   {
       
      
      protected var lifeTime:int;
      
      protected var §_-PB§:int;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var rangeWidth:int;
      
      protected var rangeHeight:int;
      
      protected var cRoot:Level;
      
      public function §_-ST§(param1:Point, param2:int, param3:Level)
      {
         super();
         addFrameScript(17,this.frame18);
         this.cRoot = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.minDamage = this.cRoot.gameSettings.heroes.heroMage.thunderMinDamage + this.cRoot.gameSettings.heroes.heroMage.thunderDamageIncrement * param2;
         this.maxDamage = this.cRoot.gameSettings.heroes.heroMage.thunderMaxDamage + this.cRoot.gameSettings.heroes.heroMage.thunderDamageIncrement * param2;
         this.rangeWidth = this.cRoot.gameSettings.heroes.heroMage.thunderRangeWidth;
         this.rangeHeight = this.rangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.lifeTime = 17;
         this.cRoot.game.gameSounds.§_-RE§();
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-PB§++;
         if(this.lifeTime == this.§_-PB§)
         {
            this.hitEnemies();
            this.destroyThis();
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
      
      protected function hitEnemies() : void
      {
         var _loc1_:EnemyCommon = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.getDamage(),this.cRoot.gameSettings.I_ARMOR,null,0,false);
            }
         }
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      private function onRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeWidth / 2,this.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame18() : *
      {
         stop();
      }
   }
}
