package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-J§ extends MovieClip
   {
       
      
      protected var §_-A5§:Boolean;
      
      protected var §_-J7§:int = 35;
      
      protected var §_-Rn§:int = 0;
      
      protected var lifeTime:int;
      
      protected var §_-PB§:int;
      
      protected var level:int;
      
      protected var rangeActivateWidth:int;
      
      protected var rangeActivateHeight:int;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var cRoot:Level;
      
      public function §_-J§(param1:Point, param2:int, param3:Level)
      {
         super();
         addFrameScript(29,this.frame30,48,this.frame49);
         this.x = param1.x;
         this.y = param1.y;
         this.level = param2;
         this.cRoot = param3;
         this.rangeActivateWidth = this.cRoot.gameSettings.heroes.heroDwarf.mineActiveRangeWidth;
         this.rangeActivateHeight = this.rangeActivateWidth * this.cRoot.gameSettings.rangeRatio;
         this.minDamage = this.cRoot.gameSettings.heroes.heroDwarf.mineMinDamage + this.cRoot.gameSettings.heroes.heroDwarf.mineDamageIncrement * this.level;
         this.maxDamage = this.cRoot.gameSettings.heroes.heroDwarf.mineMaxDamage + this.cRoot.gameSettings.heroes.heroDwarf.mineDamageIncrement * this.level;
         this.lifeTime = this.cRoot.gameSettings.heroes.heroDwarf.mineDuration * this.cRoot.gameSettings.framesRate;
         this.§_-PB§ = 0;
         this.§_-A5§ = false;
         this.§_-J7§ = 19;
         this.§_-Rn§ = 0;
      }
      
      public function onFrameUpdate() : void
      {
         var _loc1_:EnemyCommon = null;
         if(this.§_-A5§)
         {
            this.§_-Rn§++;
            if(this.§_-J7§ == this.§_-Rn§)
            {
               this.destroyThis();
            }
            return;
         }
         this.§_-PB§++;
         if(this.§_-PB§ >= this.lifeTime)
         {
            this.destroyThis();
            return;
         }
         if(!this.§_-67§())
         {
            return;
         }
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isFlying && this.onRange(_loc1_))
            {
               _loc1_.bombHit(this.getDamage());
            }
         }
         this.cRoot.game.gameSounds.playBombSound();
         this.cRoot.addToDecal(new BombDecal(new Point(this.x,this.y)));
         this.cRoot.decals.removeChild(this);
         this.cRoot.bullets.addChild(this);
         this.gotoAndPlay("hit");
         this.§_-A5§ = true;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "hitEnd":
               break;
            case "mineEnd":
               this.gotoAndPlay("mine");
               break;
            default:
               this.play();
         }
      }
      
      protected function §_-67§() : Boolean
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isFlying && this.onRange(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      private function onRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeActivateWidth / 2,this.y - this.rangeActivateHeight / 2,this.rangeActivateWidth,this.rangeActivateHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame30() : *
      {
         gotoAndPlay("mine");
      }
      
      function frame49() : *
      {
         stop();
      }
   }
}
