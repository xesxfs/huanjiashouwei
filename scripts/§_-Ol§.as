package
{
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Ol§ extends Soldier
   {
       
      
      protected var lifes:int;
      
      protected var rangePoint:Point;
      
      public function §_-Ol§(param1:Point, param2:Point, param3:Tower, param4:Point, param5:int = 0)
      {
         super(param1,param2,param3,param5);
         this.rangePoint = param4;
      }
      
      override public function pause() : void
      {
         this.stop();
         this.§_-f§();
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "runningEnd":
               this.gotoAndPlay("running");
               break;
            case "fightingEnd":
               break;
            case "deadEnd":
               break;
            case "respawningEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      override protected function respawn() : *
      {
         this.isActive = true;
         this.isDead = false;
         this.isRespawning = false;
         this.isWalking = true;
         this.isCharging = false;
         this.isBlocking = false;
         this.isFighting = false;
         this.isIdle = false;
         this.destinationPoint.x = this.rallyPoint.x;
         this.destinationPoint.y = this.rallyPoint.y;
         this.health = this.initHealth;
         this.§_-Jc§.show();
         this.§_-Jc§.updateProgress(this.health);
         this.deadTimeCounter = 0;
         this.respawnTimeCounter = 0;
         this.respawnCustom();
         this.animationRun();
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            if(this.lifes != 1)
            {
               this.destroyThis();
               this.cRoot.removeSoldier(this);
               return false;
            }
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.gotoAndPlay("respawning");
            this.lifes++;
            return true;
         }
         return false;
      }
      
      override protected function readyToLive() : Boolean
      {
         this.respawnTimeCounter++;
         if(this.respawnTimeCounter >= this.respawnTime)
         {
            this.respawn();
            return true;
         }
         return false;
      }
      
      override protected function findEnemyStatic() : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc1_:Enemy = null;
         var _loc2_:Enemy = null;
         if(this.isBlocking)
         {
            return false;
         }
         for each(_loc3_ in this.cRoot.staticEnemies)
         {
            if(_loc3_.isActive && _loc3_.canBeBlocked && this.onRange(_loc3_))
            {
               if(!_loc3_.isBlocked)
               {
                  _loc1_ = _loc3_;
                  break;
               }
               if(!this.isFighting && _loc2_ == null)
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.§_-1M§(_loc1_);
            return true;
         }
         if(_loc2_ != null)
         {
            this.§_-Md§(_loc2_);
            return true;
         }
         return false;
      }
      
      override protected function onRange(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.rangePoint.x - this.rangeWidth / 2,this.rangePoint.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
   }
}
