package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class Missile extends MovieClip
   {
       
      
      protected var level:int;
      
      protected var target:Enemy;
      
      protected var airHit:Boolean;
      
      protected var isActive:Boolean = true;
      
      protected var §_-8t§:Boolean = true;
      
      protected var §_-96§:Ellipse;
      
      protected var destination:Point;
      
      protected var lastTargetDestination:Point;
      
      protected var §_-J7§:int = 20;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 5;
      
      protected var maxAceleration:Number;
      
      protected var area:int;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var §_-5l§:int;
      
      protected var §_-5I§:int;
      
      protected var follow:Boolean = false;
      
      protected var §_-Rm§:Number = 0.2;
      
      protected var §_-7n§:Boolean;
      
      protected var §_-2Q§:Number;
      
      private var cRoot:MovieClip;
      
      private var game:Game;
      
      public function Missile(param1:int, param2:Point, param3:Enemy)
      {
         super();
         addFrameScript(5,this.frame6,26,this.frame27,45,this.frame46);
         this.level = param1;
         this.x = param2.x;
         this.y = param2.y;
         this.target = param3;
         this.airHit = param3.isFlying;
         this.destination = new Point(param2.x + 10,param2.y - 80);
         this.lastTargetDestination = new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust);
         this.§_-7n§ = false;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = MovieClip(this.parent.parent);
         this.game = Game(this.parent.parent.parent);
         this.game.gameSounds.§_-FD§();
         this.aceleration = 8;
         this.maxAceleration = 13;
         this.moveMe(true);
         this.§_-Jy§ = Math.cos(90 * Math.PI / 180) * this.aceleration;
         this.§_-IR§ = Math.sin(90 * Math.PI / 180) * this.aceleration;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         if(!this.§_-8t§ && (this.target == null || !this.target.isActive))
         {
            this.findNewTarget();
         }
         this.moveMe(false);
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "travelEnd":
               this.gotoAndPlay("travel");
               break;
            case "hitEnd":
               break;
            default:
               this.play();
         }
      }
      
      public function findNewTarget() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         this.target = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_.isActive && _loc2_.level <= this.level && this.onRangeReTarget(_loc2_))
            {
               if(_loc1_ == null || _loc1_.currentNode <= _loc2_.currentNode)
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.target = _loc1_;
            this.airHit = this.target.isFlying;
            this.follow = false;
            this.§_-7n§ = false;
         }
      }
      
      protected function moveMe(param1:Boolean) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc7_:Number = 0;
         if(!this.§_-8t§)
         {
            if(this.target != null)
            {
               this.destination.x = this.target.x + this.target.xAdjust;
               this.destination.y = this.target.y + this.target.yAdjust;
               this.lastTargetDestination.x = this.target.x + this.target.xAdjust;
               this.lastTargetDestination.y = this.target.y + this.target.yAdjust;
            }
         }
         _loc3_ = this.destination.x - this.x;
         _loc2_ = this.destination.y - this.y;
         _loc4_ = _loc5_ = Math.atan2(_loc2_,_loc3_);
         if(!this.§_-8t§)
         {
            if(!this.follow)
            {
               if(!this.§_-7n§)
               {
                  if(this.x > this.destination.x)
                  {
                     this.§_-2Q§ = 10;
                  }
                  else
                  {
                     this.§_-2Q§ = -10;
                  }
                  this.§_-7n§ = true;
               }
               _loc7_ = this.§_-6X§(180 / Math.PI * Math.atan2(this.§_-IR§,this.§_-Jy§)) + this.§_-2Q§;
               _loc4_ = _loc7_ * Math.PI / 180;
               if(this.§_-AX§(this.§_-6X§(_loc5_ * 180 / Math.PI),this.§_-6X§(_loc7_)) < 11)
               {
                  this.follow = true;
               }
            }
            else
            {
               _loc4_ = (_loc4_ * 180 / Math.PI + this.§_-Rm§) * Math.PI / 180;
               if(this.aceleration < this.maxAceleration)
               {
                  this.aceleration = this.aceleration + this.aceleration * 0.1;
                  if(this.aceleration >= this.maxAceleration)
                  {
                     this.aceleration = this.maxAceleration;
                  }
               }
            }
         }
         this.§_-Jy§ = Math.cos(_loc4_) * this.aceleration;
         this.§_-IR§ = Math.sin(_loc4_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         this.freeParticles();
         if(Math.sqrt(Math.pow(this.destination.y - this.y,2) + Math.pow(this.destination.x - this.x,2)) < this.aceleration)
         {
            if(this.§_-8t§)
            {
               this.§_-8t§ = false;
               if(this.target == null || !this.target.isActive)
               {
                  this.destination.x = this.lastTargetDestination.x;
                  this.destination.y = this.lastTargetDestination.y;
               }
               else
               {
                  this.destination = new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust);
               }
            }
            else
            {
               this.hit();
            }
         }
      }
      
      protected function §_-6X§(param1:Number) : Number
      {
         var _loc2_:Number = param1;
         while(_loc2_ >= 360)
         {
            _loc2_ = _loc2_ - 360;
         }
         while(_loc2_ < 0)
         {
            _loc2_ = _loc2_ + 360;
         }
         return _loc2_;
      }
      
      protected function §_-AX§(param1:Number, param2:Number) : Number
      {
         return Math.abs((param1 + 180 - param2) % 360 - 180);
      }
      
      protected function hit() : void
      {
         var _loc1_:MovieClip = null;
         this.isActive = false;
         this.aceleration = 0;
         this.area = this.cRoot.gameSettings.engineers.bfg.missileArea;
         this.§_-96§ = new Ellipse(this.x - this.area * 1.5 / 2,this.y - this.area / 2,this.area * 1.5,this.area);
         this.minDamage = this.cRoot.gameSettings.engineers.bfg.missileMinDamage + this.cRoot.gameSettings.engineers.bfg.missileIncrementDamage * this.level;
         this.maxDamage = this.cRoot.gameSettings.engineers.bfg.missileMaxDamage + this.cRoot.gameSettings.engineers.bfg.missileIncrementDamage * this.level;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRangeHit(Enemy(_loc1_)))
            {
               _loc1_.bombHit(this.getDamage(_loc1_));
            }
         }
         this.rotation = 0;
         if(this.airHit)
         {
            this.gotoAndPlay("airHit");
         }
         else
         {
            this.gotoAndPlay("hit");
         }
         this.game.gameSounds.playBombSound();
      }
      
      protected function getDamage(param1:*) : int
      {
         var _loc2_:Number = Math.atan2(param1.x - this.x,param1.y - this.y) * 180 / Math.PI;
         var _loc3_:Point = this.getDestinationPoint(_loc2_);
         var _loc4_:Number = Math.sqrt((_loc3_.x - this.x) * (_loc3_.x - this.x) + (_loc3_.y - this.y) * (_loc3_.y - this.y));
         var _loc5_:Number = Math.sqrt((param1.x - this.x) * (param1.x - this.x) + (param1.y - this.y) * (param1.y - this.y));
         var _loc6_:Number = this.maxDamage - this.minDamage;
         var _loc7_:int = _loc6_ - _loc5_ * _loc6_ / _loc4_ + this.minDamage;
         return _loc7_;
      }
      
      protected function onRangeHit(param1:Enemy) : Boolean
      {
         return this.§_-96§.containsPoint(new Point(param1.x + param1.xAdjust,param1.y + param1.yAdjust));
      }
      
      protected function onRangeReTarget(param1:Enemy) : Boolean
      {
         return true;
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
      
      private function freeParticles() : void
      {
         this.§_-A8§(new Point(this.x,this.y));
         this.§_-A8§(new Point(this.x + this.§_-Jy§ / 2,this.y + this.§_-IR§ / 2));
      }
      
      protected function §_-A8§(param1:Point) : void
      {
         var _loc3_:MissileParticle = null;
         var _loc2_:MissileParticle = null;
         for each(_loc3_ in this.game.main.missileParticlesPool)
         {
            if(!_loc3_.isActive)
            {
               _loc3_.§_-Rt§(param1,this.cRoot.bulletsDecals);
               return;
            }
            if(_loc2_ == null || _loc2_.§_-My§ < _loc3_.§_-My§)
            {
               _loc2_ = _loc3_;
            }
         }
         _loc2_.§_-Rt§(param1,this.cRoot.bulletsDecals);
      }
      
      protected function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame6() : *
      {
         gotoAndPlay(1);
      }
      
      function frame27() : *
      {
         stop();
      }
      
      function frame46() : *
      {
         stop();
      }
   }
}
