package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   
   public class EnemyRocketeer extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_Net:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-D-§:Boolean = false;
      
      private var onRampage:Boolean = false;
      
      public function EnemyRocketeer(param1:int, param2:Array)
      {
         addFrameScript(7,this.frame8,15,this.frame16,23,this.frame24,31,this.frame32,39,this.frame40,47,this.frame48,66,this.frame67,77,this.frame78);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.level = 1;
         this.canSkeleton = false;
         this.isFlying = this.cRoot.gameSettings.enemies.rocketeer.isFlying;
         if(this.isFlying)
         {
            this.canBeBlocked = false;
         }
         this.size = this.cRoot.gameSettings.enemies.rocketeer.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.rocketeer.health;
         this.speed = this.cRoot.gameSettings.enemies.rocketeer.speed;
         this.armor = this.cRoot.gameSettings.enemies.rocketeer.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.rocketeer.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.rocketeer.dodge;
         this.gold = this.cRoot.gameSettings.enemies.rocketeer.gold;
         this.cost = this.cRoot.gameSettings.enemies.rocketeer.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.rocketeer.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.rocketeer.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.rocketeer.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.rocketeer.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.rocketeer.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.rocketeer.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.rocketeer.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(3,-68),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 24;
         this.§_-C-§ = 59;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "rocketeer";
         param1.eName = Locale.loadStringEx("ENEMY_ROCKETEER_NAME",Locale.getDefaultLang());
      }
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyDesintegrateAir(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
      }
      
      override public function addPolymorph(param1:Enemy) : void
      {
         this.cRoot.entities.addChild(new EnemyPolymorphAir(new Point(this.x,this.y),this.cRoot,param1));
      }
      
      override public function pause() : void
      {
         this.stop();
         if(MovieClip(this.debuff_Cursed) != null)
         {
            this.debuff_Cursed.stop();
            this.debuff_Poison.stop();
            this.effect_TeslaHit.stop();
            this.effect_Sniper.stop();
            this.effect_Healing.stop();
         }
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "walkingEnd":
               this.gotoAndPlay("walking");
               break;
            case "walkingFastEnd":
               this.gotoAndPlay("walkingFast");
               break;
            case "walkingUpEnd":
               this.gotoAndPlay("walkingUp");
               break;
            case "walkingUpFastEnd":
               this.gotoAndPlay("walkingUpFast");
               break;
            case "walkingDownEnd":
               this.gotoAndPlay("walkingDown");
               break;
            case "walkingDownFastEnd":
               this.gotoAndPlay("walkingDownFast");
               break;
            case "deadEnd":
               break;
            case "teleportEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.unPauseEffects();
      }
      
      override public function unPauseEffects() : void
      {
         if(MovieClip(this.debuff_Cursed) != null)
         {
            if(MovieClip(this.debuff_Cursed).currentFrameLabel != "off")
            {
               MovieClip(this.debuff_Cursed).play();
            }
            else if(MovieClip(this.debuff_Cursed).currentFrameLabel == "onEnd")
            {
               MovieClip(this.debuff_Cursed).gotoAndPlay("on");
            }
            if(MovieClip(this.debuff_Poison).currentFrameLabel != "off")
            {
               MovieClip(this.debuff_Poison).play();
            }
            else if(MovieClip(this.debuff_Poison).currentFrameLabel == "onEnd")
            {
               MovieClip(this.debuff_Poison).gotoAndPlay("on");
            }
            if(MovieClip(this.effect_TeslaHit).currentFrameLabel != "off")
            {
               MovieClip(this.effect_TeslaHit).play();
            }
            if(MovieClip(this.effect_Sniper).currentFrameLabel != "off")
            {
               MovieClip(this.effect_Sniper).play();
            }
            if(MovieClip(this).effect_Healing.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Healing.play();
            }
         }
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function addBlood() : void
      {
      }
      
      public function stopSpeedUp(param1:Number) : void
      {
         this.speed = param1;
         this.nodeMarginError = this.speed + 0.1;
         this.onRampage = false;
         this.§_-R2§ = "";
         this.getFacing();
      }
      
      override public function setDamage(param1:int, param2:int = 3, param3:§_-27§ = null, param4:int = 0, param5:Boolean = false) : void
      {
         if(param2 != this.cRoot.gameSettings.I_ARMOR)
         {
            this.health = this.health - this.getArmorDamage(param2,param1,param4);
         }
         else
         {
            this.health = this.health - param1;
         }
         if(this.health <= 0)
         {
            this.setDeadBasicStatus();
            this.addBlood();
            return;
         }
         if(!this.§_-D-§)
         {
            this.§_-D-§ = true;
            if(!(this.hasDebuff("DebuffNet") || this.hasDebuff("DebuffSlow") || §_-GF§ != null && getQualifiedClassName(param3) == "DebuffSlow"))
            {
               this.onRampage = true;
               this.§_-R2§ = "";
               this.getFacing();
               this.cRoot.game.gameSounds.rocketeerSpecial();
               this.addDebuff(new DebuffRocketeer(this.cRoot,1,this));
            }
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            if(getQualifiedClassName(param3) == "DebuffSlow" && this.hasDebuff("DebuffNet"))
            {
               return;
            }
            if(getQualifiedClassName(param3) == "DebuffNet" && this.hasDebuff("DebuffSlow"))
            {
               return;
            }
            this.addDebuff(param3);
         }
      }
      
      override public function getFacing() : void
      {
         if(this.isFighting)
         {
            this.attackChargeTimeCounter = 0;
            this.gotoAndStop("idle");
            return;
         }
         var _loc1_:* = this.road[this.currentNode + 1].y - this.road[this.currentNode].y;
         var _loc2_:* = this.road[this.currentNode + 1].x - this.road[this.currentNode].x;
         var _loc3_:* = Math.round(Math.atan2(-_loc1_,_loc2_) * 180 / Math.PI);
         if(_loc3_ < 0)
         {
            _loc3_ = _loc3_ + 360;
         }
         if(_loc3_ > 55 && _loc3_ < 135)
         {
            if(this.§_-R2§ != "up")
            {
               if(!this.onRampage)
               {
                  this.gotoAndPlay("walkingUp");
               }
               else
               {
                  this.gotoAndPlay("walkingUpFast");
               }
               this.§_-R2§ = "up";
            }
         }
         else if(_loc3_ >= 135 && _loc3_ <= 240)
         {
            if(this.§_-R2§ != "left")
            {
               if(!this.onRampage)
               {
                  this.gotoAndPlay("walking");
               }
               else
               {
                  this.gotoAndPlay("walkingFast");
               }
               this.scaleX = -1;
               this.§_-Jc§.flip(-1);
               this.§_-R2§ = "left";
            }
         }
         else if(_loc3_ > 240 && _loc3_ < 315)
         {
            if(this.§_-R2§ != "down")
            {
               if(!this.onRampage)
               {
                  this.gotoAndPlay("walkingDown");
               }
               else
               {
                  this.gotoAndPlay("walkingDownFast");
               }
               this.§_-R2§ = "down";
            }
         }
         else if(this.§_-R2§ != "right")
         {
            if(!this.onRampage)
            {
               this.gotoAndPlay("walking");
            }
            else
            {
               this.gotoAndPlay("walkingFast");
            }
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
            this.§_-R2§ = "right";
         }
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playBombSound();
      }
      
      function frame8() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame16() : *
      {
         gotoAndPlay("walkingFast");
      }
      
      function frame24() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame32() : *
      {
         gotoAndPlay("walkingUpFast");
      }
      
      function frame40() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame48() : *
      {
         gotoAndPlay("walkingDownFast");
      }
      
      function frame67() : *
      {
         stop();
      }
      
      function frame78() : *
      {
         stop();
      }
   }
}
