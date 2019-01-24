package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class Bomb extends MovieClip
   {
       
      
      protected var level:int;
      
      protected var isActive:Boolean = true;
      
      protected var §_-J7§:int = 35;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Fi§:Number;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var §_-6v§:Number;
      
      protected var §_-5M§:Number;
      
      protected var §_-FC§:Number;
      
      protected var §_-Qu§:Number;
      
      protected var t0:Number;
      
      protected var t1:Number;
      
      protected var g:Number = 1;
      
      protected var §_-96§:Ellipse;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var tInvisibles:int;
      
      protected var cRoot:Level;
      
      public function Bomb(param1:int, param2:Point, param3:Point, param4:int = 0)
      {
         super();
         this.level = param1;
         this.§_-6v§ = param3.x;
         this.§_-5M§ = param3.y;
         this.x = this.§_-FC§ = param2.x;
         this.y = this.§_-Qu§ = param2.y;
         this.tInvisibles = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         if(this.tInvisibles != 0 && this.tInvisibles == this.t0)
         {
            this.alpha = 1;
         }
         this.x = this.§_-FC§ + this.t0 * this.§_-Jy§;
         this.y = this.§_-Qu§ + this.t0 * this.§_-IR§ + this.g * this.t0 * this.t0 / 2;
         this.rotateBomb();
         if(this.t0 == this.t1)
         {
            this.hit();
            return;
         }
         this.t0++;
      }
      
      public function pause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.stop();
         }
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.play();
         }
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function rotateBomb() : void
      {
         this.rotation = this.rotation + 20;
      }
      
      protected function hit() : void
      {
         var _loc1_:MovieClip = null;
         this.rotation = 0;
         this.cRoot.game.gameSounds.playBombSound();
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRange(Enemy(_loc1_)))
            {
               _loc1_.bombHit(this.getDamage(_loc1_));
            }
         }
         this.isActive = false;
         this.cRoot.addToDecal(new BombDecal(new Point(this.x,this.y)));
         this.playPop();
         this.gotoAndPlay("hit");
      }
      
      protected function playPop() : void
      {
      }
      
      protected function getDamage(param1:*) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         if(this.cRoot.game.gameUpgrades.engineersUpEfficiency == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            return this.maxDamage;
         }
         _loc2_ = Math.atan2(param1.x - this.§_-6v§,param1.y - this.§_-5M§) * 180 / Math.PI;
         _loc3_ = this.getDestinationPoint(_loc2_);
         _loc4_ = Math.sqrt((_loc3_.x - this.§_-6v§) * (_loc3_.x - this.§_-6v§) + (_loc3_.y - this.§_-5M§) * (_loc3_.y - this.§_-5M§));
         _loc5_ = Math.sqrt((param1.x - this.§_-6v§) * (param1.x - this.§_-6v§) + (param1.y - this.y) * (param1.y - this.y));
         _loc6_ = this.maxDamage - this.minDamage;
         _loc7_ = _loc6_ - _loc5_ * _loc6_ / _loc4_ + this.minDamage;
         return _loc7_;
      }
      
      protected function onRange(param1:Enemy) : Boolean
      {
         return this.§_-96§.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDestinationPoint(param1:int) : Point
      {
         return this.§_-96§.getPointOfDegree(param1);
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      protected function destroyThis() : void
      {
         this.§_-96§ = null;
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
