package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class TowerArcherDruid extends MovieClip
   {
       
      
      public var tower:Tower;
      
      public var thornLevel:int;
      
      public var thornDamage:int;
      
      public var §_-BZ§:Boolean = false;
      
      public var thorningMinEnemies:int;
      
      public var thorningMaxEnemies:int;
      
      public var thorningDuration:int;
      
      public var thorningDamageTime:int;
      
      public var thorningReloadTime:int;
      
      public var thorningReloadTimeCounter:int = 0;
      
      public var thorningChargeTime:int = 34;
      
      public var thorningChargeTimeCounter:int = 0;
      
      public var thornSound:String;
      
      public var cRoot:Level;
      
      public function TowerArcherDruid(param1:Point, param2:Tower)
      {
         super();
         addFrameScript(0,this.frame1);
         this.tower = param2;
         this.x = param1.x;
         this.y = param1.y;
         this.thornSound = Math.random().toString();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent.parent);
         this.upgrade(1);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.thorningReloadTimeCounter < this.thorningReloadTime)
         {
            this.thorningReloadTimeCounter++;
            return;
         }
         if(!this.§_-BZ§)
         {
            if(this.§_-2f§())
            {
               this.play();
               this.§_-BZ§ = true;
            }
         }
         else if(this.thorningChargeTimeCounter < this.thorningChargeTime)
         {
            if(this.thorningChargeTimeCounter == 17)
            {
               if(this.freeThornsOnEnemies())
               {
                  this.cRoot.game.gameSounds.§_-Jn§(this.thornSound);
               }
            }
            this.thorningChargeTimeCounter++;
         }
         else
         {
            this.thorningReloadTimeCounter = 0;
            this.thorningChargeTimeCounter = 0;
            this.cRoot.game.gameSounds.removeSound(this.thornSound);
            this.§_-BZ§ = false;
         }
      }
      
      public function pause() : void
      {
         if(this.currentFrame != 1)
         {
            this.stop();
         }
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != 1)
         {
            this.play();
         }
      }
      
      private function freeThornsOnEnemies() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isBoss && _loc2_.§_-8e§ && !_loc2_.isFighting && !_loc2_.isFlying && this.onRange(_loc2_) && !_loc2_.dodgeAttack())
            {
               MovieClip(_loc2_).thorn(this.thornDamage,this.thorningDuration,this.thorningDamageTime);
               _loc1_++;
               if(_loc1_ != this.thorningMaxEnemies)
               {
                  continue;
               }
               break;
            }
         }
         if(_loc1_ > 0)
         {
            return true;
         }
         return false;
      }
      
      private function §_-2f§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && !_loc2_.isBoss && _loc2_.§_-8e§ && !_loc2_.isFighting && !_loc2_.isFlying && this.onRange(_loc2_))
            {
               _loc1_++;
               if(_loc1_ == this.thorningMinEnemies)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function removeDruid() : void
      {
         this.destroyThis();
      }
      
      public function upgrade(param1:int) : void
      {
         this.thornLevel = param1;
         this.thornDamage = this.cRoot.gameSettings.archers.ranger.thornDamage;
         this.thorningReloadTime = this.cRoot.gameSettings.archers.ranger.thornCoolDown;
         this.thorningReloadTimeCounter = 0;
         this.thorningDuration = this.cRoot.gameSettings.archers.ranger.thornDuration * this.thornLevel;
         this.thorningDamageTime = this.cRoot.gameSettings.archers.ranger.thornDamageTime;
         this.thorningChargeTimeCounter = 0;
         this.thorningMinEnemies = this.cRoot.gameSettings.archers.ranger.thornMinEnemies;
         this.thorningMaxEnemies = this.cRoot.gameSettings.archers.ranger.thornMaxEnemies + 2 * this.thornLevel;
      }
      
      private function onRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.tower.x - this.tower.rangeWidth / 2,this.tower.y - 10 - this.tower.rangeHeight / 2,this.tower.rangeWidth,this.tower.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x + param1.xAdjust,param1.y + param1.yAdjust));
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
