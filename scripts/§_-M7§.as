package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-M7§ extends Soldier
   {
       
      
      public var lifes:int;
      
      private var §_-S0§:Point;
      
      private var arrowTarget:Enemy;
      
      private var § else§:Boolean;
      
      private var arrowRangeWidth:int;
      
      private var arrowRangeHeight:int;
      
      private var arrowMinRange:int;
      
      private var arrowChargeTime:int = 15;
      
      private var arrowChargeTimeCounter:int;
      
      private var arrowReloadTime:int;
      
      private var arrowReloadTimeCounter:int;
      
      public function §_-M7§(param1:Point, param2:Point, param3:Tower)
      {
         this.§_-S0§ = new Point();
         addFrameScript(0,this.frame1,23,this.frame24,38,this.frame39,46,this.frame47);
         super(param1,param2,param3,10);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.maxSize = this.cRoot.gameSettings.specials.elves.maxSize;
         this.maxLevel = this.cRoot.gameSettings.specials.elves.maxLevel;
         this.rangeWidth = this.cRoot.gameSettings.specials.elves.range;
         this.rangeHeight = this.cRoot.gameSettings.specials.elves.range * this.cRoot.gameSettings.rangeRatio;
         this.health = this.initHealth = this.cRoot.gameSettings.specials.elves.health;
         this.§_-Rd§ = this.cRoot.gameSettings.specials.elves.regen;
         this.regenerateTime = this.cRoot.gameSettings.specials.elves.regenReload;
         this.armor = this.cRoot.gameSettings.specials.elves.armor;
         this.minDamage = this.cRoot.gameSettings.specials.elves.minDamage;
         this.maxDamage = this.cRoot.gameSettings.specials.elves.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.specials.elves.reload;
         this.arrowReloadTime = this.cRoot.gameSettings.specials.elves.arrowCoolDown;
         this.arrowRangeWidth = this.cRoot.gameSettings.specials.elves.arrowRange;
         this.arrowRangeHeight = this.arrowRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.arrowMinRange = this.cRoot.gameSettings.specials.elves.arrowMinRange;
         this.lifes = 1;
         this.respawnTime = 1;
         this.attackChargeTime = 18;
         this.attackChargeDamageTime = 10;
         this.speed = 2;
         this.idleTime = 30;
         this.§_-Jc§ = new §_-H8§(new Point(0,-20),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.visible = false;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.sIconName = "elf";
         param1.sName = Locale.loadStringEx("SOLDIER_ELVES_RANDOM_" + this.nameIndex + "_NAME",Locale.getDefaultLang());
         param1.sRespawn = "-";
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
            case "arrowEnd":
               break;
            case "attackEnd":
               break;
            case "deadEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.§_-MJ§();
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            if(this.lifes == 1)
            {
               §_-Go§(this.tower).removeSoldier(this);
               this.destroyThis();
               return false;
            }
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.lifes++;
            return true;
         }
         return false;
      }
      
      override protected function runSpecial() : Boolean
      {
         if(!this.isActive)
         {
            return false;
         }
         if(this.§_-6-§())
         {
            return true;
         }
         return false;
      }
      
      override protected function stopSpecial() : void
      {
         if(this.§ else§)
         {
            this.§ else§ = false;
         }
      }
      
      private function §_-6-§() : Boolean
      {
         var _loc1_:Point = null;
         var _loc2_:Arrow = null;
         if(!this.§ else§)
         {
            if(this.arrowReloadTimeCounter < this.arrowReloadTime)
            {
               this.arrowReloadTimeCounter++;
               return false;
            }
            if(!this.isIdle)
            {
               return false;
            }
            if(!this.getArrowTarget())
            {
               return false;
            }
            if(this.arrowTarget.x >= this.x)
            {
               this.scaleX = 1;
               this.§_-Jc§.flip(1);
            }
            else
            {
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
            }
            this.§_-S0§ = new Point(this.arrowTarget.x + this.arrowTarget.xAdjust,this.arrowTarget.y + this.arrowTarget.yAdjust);
            this.§ else§ = true;
            this.arrowChargeTimeCounter = 0;
            this.gotoAndPlay("arrow");
            return true;
         }
         if(this.arrowChargeTimeCounter < this.arrowChargeTime)
         {
            this.arrowChargeTimeCounter++;
            if(this.arrowChargeTimeCounter == 7)
            {
               _loc1_ = null;
               if(this.arrowTarget == null || !this.arrowTarget.isActive)
               {
                  if(!this.getArrowTarget())
                  {
                     _loc1_ = this.§_-S0§;
                  }
               }
               _loc2_ = new Arrow(5,this.arrowTarget,_loc1_,null,12);
               _loc2_.x = this.x + 4;
               _loc2_.y = this.y - 12.5;
               this.cRoot.bullets.addChild(_loc2_);
            }
            return true;
         }
         this.§ else§ = false;
         this.arrowReloadTimeCounter = 0;
         this.§_-J9§();
         return false;
      }
      
      private function getArrowTarget() : Boolean
      {
         var _loc1_:Enemy = null;
         this.arrowTarget = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.arrowOnRange(_loc1_) && this.§_-x§(_loc1_))
            {
               this.arrowTarget = _loc1_;
               break;
            }
         }
         if(this.arrowTarget != null)
         {
            return true;
         }
         return false;
      }
      
      private function arrowOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.arrowRangeWidth / 2,this.y - this.arrowRangeHeight / 2,this.arrowRangeWidth,this.arrowRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function §_-x§(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.arrowMinRange)
         {
            return true;
         }
         return false;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame24() : *
      {
         stop();
      }
      
      function frame39() : *
      {
         stop();
      }
      
      function frame47() : *
      {
         stop();
      }
   }
}
