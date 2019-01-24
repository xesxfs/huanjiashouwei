package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class EnemyCommon extends Enemy
   {
       
      
      public var §_-Lq§:Boolean = false;
      
      public var regenerateTime:int;
      
      public var §_-AD§:int;
      
      public var regenerateHealPoints:int;
      
      public var §_-6c§:Boolean = false;
      
      public var §_-An§:Boolean = false;
      
      public var teleportingTime:int = 9;
      
      public var teleportingTimeCounter:int = 0;
      
      public var teleportedTimes:int = 0;
      
      public var §_-BZ§:Boolean = false;
      
      public var §_-RW§:Boolean = false;
      
      public var thorningDamageHP:int;
      
      public var thorningDurationTime:int;
      
      public var thorningDurationTimeCounter:int;
      
      public var thorningDamageTime:int;
      
      public var thorningDamageTimeCounter:int;
      
      public var thorningChargeTime:int = 18;
      
      public var thorningChargeTimeCounter:int = 0;
      
      public var thornedTimes:int = 0;
      
      public var respawnTime:int;
      
      public var respawnTimeCounter:int = 0;
      
      public function EnemyCommon(param1:int, param2:Array)
      {
         super(param1,param2);
         this.isBoss = false;
      }
      
      override public function specialMove() : Boolean
      {
         if(this.isRespawning && this.§_-T1§())
         {
            return true;
         }
         if(this.§_-6c§ && this.§_-Il§())
         {
            return true;
         }
         if(this.§_-BZ§ && this.§_-C9§())
         {
            return true;
         }
         if(this.§_-Lq§)
         {
            this.§_-2W§();
         }
         return false;
      }
      
      override public function specialPower() : Boolean
      {
         return false;
      }
      
      public function §_-T1§() : Boolean
      {
         if(this.respawnTimeCounter < this.respawnTime)
         {
            this.respawnTimeCounter++;
            return true;
         }
         this.isRespawning = false;
         this.isActive = true;
         this.addChild(this.§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         return true;
      }
      
      public function holyStrike(param1:int) : void
      {
         MovieClip(this).effect_HolyStrike.play();
         this.setDamage(param1);
      }
      
      public function §_-2W§() : void
      {
         if(this.§_-AD§ < this.regenerateTime)
         {
            this.§_-AD§++;
            return;
         }
         this.health = this.health + this.regenerateHealPoints;
         if(this.health > this.initHealth)
         {
            this.health = this.initHealth;
         }
         this.§_-Jc§.updateProgress(this.health);
         this.§_-AD§ = 0;
      }
      
      public function heal(param1:int) : void
      {
         this.health = this.health + param1;
         if(this.health > this.initHealth)
         {
            this.health = this.initHealth;
         }
         this.§_-Jc§.updateProgress(this.health);
         MovieClip(this).effect_Healing.play();
      }
      
      public function polymorph(param1:int) : void
      {
         var _loc3_:Class = null;
         var _loc2_:int = this.gold;
         this.gold = 0;
         this.setDeadBasicStatus();
         if(!this.isFlying)
         {
            _loc3_ = getDefinitionByName("EnemySheepGround") as Class;
         }
         else
         {
            _loc3_ = getDefinitionByName("EnemySheepFlying") as Class;
         }
         var _loc4_:Enemy = new _loc3_(this.roadIndex,this.road,this.x,this.y,this.currentNode,this.cRoot.gameSettings.mages.sorcerer.polymorphDamage * this.health / 100,this.cRoot.gameSettings.mages.sorcerer.polymorphDamage * this.initHealth / 100,_loc2_,this.cost,this.speed * this.cRoot.gameSettings.mages.sorcerer.polymorphSpeedMultiplier);
         this.addPolymorph(_loc4_);
         this.destroyThis();
      }
      
      public function addPolymorph(param1:Enemy) : void
      {
         this.cRoot.entities.addChild(new EnemyPolymorphNormal(new Point(this.x,this.y),this.cRoot,param1));
      }
      
      public function teleportMe(param1:int) : void
      {
         if(this.currentNode - param1 < 0)
         {
            param1 = this.currentNode;
         }
         this.isActive = false;
         this.§_-6c§ = true;
         this.currentNode = this.currentNode - param1;
         if(this.cRoot.hasTunnels && this.cRoot.tunnels[this.roadIndex][0])
         {
            if(this.currentNode >= this.cRoot.tunnels[this.roadIndex][1] && this.currentNode <= this.cRoot.tunnels[this.roadIndex][4])
            {
               this.currentNode = this.cRoot.tunnels[this.roadIndex][4] + 1;
            }
         }
         if(this.currentNode <= 10)
         {
            this.currentNode = 10;
         }
         this.stopSpecialPower();
         this.§_-Jc§.hide();
         this.§_-R2§ = "";
         this.teleportingTimeCounter = 0;
         this.teleportedTimes++;
         if(this.teleportedTimes >= this.cRoot.gameSettings.mages.arcane.teleportMaxTimes)
         {
            this.§_-3Y§ = false;
         }
         this.gotoAndPlay("teleport");
      }
      
      protected function stopSpecialPower() : void
      {
      }
      
      private function §_-Il§() : Boolean
      {
         if(!this.§_-An§)
         {
            if(this.teleportingTimeCounter == this.teleportingTime)
            {
               this.x = this.road[this.currentNode].x;
               this.y = this.road[this.currentNode].y;
               this.§_-An§ = true;
               this.teleportingTimeCounter = 0;
               this.gotoAndPlay("teleport");
               return true;
            }
         }
         else if(this.teleportingTimeCounter == this.teleportingTime)
         {
            this.isActive = true;
            this.isFighting = false;
            this.isBlocked = false;
            this.§_-6c§ = false;
            this.§_-An§ = false;
            this.§_-BZ§ = false;
            this.§_-Jc§.show();
            this.getFacing();
            this.showAllDebuff();
            return true;
         }
         this.teleportingTimeCounter++;
         return true;
      }
      
      public function thorn(param1:int, param2:int, param3:int) : void
      {
         this.cRoot.game.gameAchievement.thornEnemy(this.cRoot);
         this.§_-BZ§ = true;
         this.§_-4Y§ = true;
         this.§_-RW§ = false;
         this.thorningDamageHP = param1;
         this.thorningChargeTimeCounter = 0;
         this.thorningDurationTimeCounter = 0;
         this.thorningDamageTimeCounter = 0;
         this.thorningDurationTime = param2;
         this.thorningDamageTime = param3;
         this.attackChargeTimeCounter = 0;
         this.stopSpecialPower();
         this.§_-R2§ = "";
         this.thornedTimes++;
         if(this.thornedTimes >= this.cRoot.gameSettings.archers.ranger.thornMaxTimes)
         {
            this.§_-8e§ = false;
         }
         this.gotoAndPlay("thorn");
      }
      
      private function §_-C9§() : Boolean
      {
         if(this.§_-RW§)
         {
            if(this.thorningChargeTimeCounter < this.thorningChargeTime)
            {
               this.thorningChargeTimeCounter++;
               return true;
            }
            this.§_-RW§ = true;
            this.thorningDurationTimeCounter = 0;
            this.thorningDamageTimeCounter = 0;
         }
         if(this.thorningDurationTimeCounter < this.thorningDurationTime)
         {
            this.thorningDurationTimeCounter++;
            this.thorningDamageTimeCounter++;
            if(this.thorningDamageTimeCounter == this.thorningDamageTime)
            {
               this.setDamage(this.thorningDamageHP,this.cRoot.gameSettings.P_ARMOR);
               this.thorningDamageTimeCounter = 0;
            }
            if(this.thorningDurationTimeCounter == this.thorningDurationTime - 4)
            {
               this.gotoAndPlay("thornFree");
            }
            return true;
         }
         this.§_-BZ§ = false;
         this.§_-4Y§ = false;
         this.§_-RW§ = false;
         if(!this.isDead)
         {
            this.getFacing();
         }
         return false;
      }
      
      public function desintegrate(param1:Boolean = true) : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyDesintegrateNormal(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
      }
      
      public function snipe(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.cRoot.gameSettings.archers.musketeer.sniperDamagePercent * param2;
         if(this.§_-30§(_loc3_ / 100))
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.x + this.xAdjust,this.y + this.yAdjust),"headshot"));
            this.cRoot.game.gameAchievement.sniperEnemy(this.cRoot);
            this.explode();
            return;
         }
         var _loc4_:int = param1 + _loc3_ * this.initHealth / 100;
         if(this.health < _loc4_)
         {
            this.explode();
         }
         else
         {
            this.setDamage(_loc4_,this.cRoot.gameSettings.P_ARMOR);
         }
      }
      
      public function bombHit(param1:int) : void
      {
         var _loc2_:int = this.health - this.getArmorDamage(this.cRoot.gameSettings.E_ARMOR,param1);
         if(_loc2_ <= 0)
         {
            this.explode();
         }
         else
         {
            this.setDamage(param1,this.cRoot.gameSettings.E_ARMOR);
         }
      }
      
      public function templeHit(param1:int) : void
      {
         var _loc2_:int = this.health - this.getArmorDamage(this.cRoot.gameSettings.M_ARMOR,param1);
         if(_loc2_ <= 0 && !this.isBoss)
         {
            this.desintegrate(false);
         }
         else
         {
            this.setDamage(param1,this.cRoot.gameSettings.M_ARMOR);
         }
      }
      
      public function §_-F1§(param1:int) : void
      {
         var _loc2_:int = this.health - this.getArmorDamage(this.cRoot.gameSettings.I_ARMOR,param1);
         if(_loc2_ <= 0 && !this.isBoss)
         {
            this.desintegrate(false);
         }
         else
         {
            this.setDamage(param1,this.cRoot.gameSettings.I_ARMOR);
         }
      }
      
      public function §_-7q§() : void
      {
         this.§_-0H§ = true;
         this.isCharging = false;
         this.stopSpecialPower();
         this.gotoAndStop("idle");
      }
      
      public function endStun() : void
      {
         this.§_-0H§ = false;
         this.§_-R2§ = "";
         if(!this.isBlocked && this.isActive)
         {
            this.getFacing();
         }
      }
      
      public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyExplodeNormal(new Point(this.x,this.y),this.cRoot));
         this.destroyThis();
      }
      
      private function §_-30§(param1:Number) : Boolean
      {
         if(Math.random() >= param1)
         {
            return false;
         }
         return true;
      }
      
      public function overcharge(param1:int) : void
      {
         MovieClip(this).effect_TeslaHit.play();
         this.setDamage(param1,this.cRoot.gameSettings.I_ARMOR);
      }
      
      public function burnDamage(param1:int) : void
      {
         MovieClip(this).effect_burn.play();
         this.setDamage(param1,this.cRoot.gameSettings.E_ARMOR);
      }
      
      override public function pause() : void
      {
         this.stop();
         if(MovieClip(this).debuff_Cursed != null)
         {
            MovieClip(this).debuff_Cursed.stop();
            MovieClip(this).debuff_Poison.stop();
            MovieClip(this).effect_TeslaHit.stop();
            MovieClip(this).effect_HolyStrike.stop();
            MovieClip(this).effect_Sniper.stop();
            MovieClip(this).effect_Healing.stop();
            MovieClip(this).effect_stun.stop();
            MovieClip(this).effect_burn.stop();
         }
      }
      
      override public function unPauseEffects() : void
      {
         if(MovieClip(this).debuff_Cursed != null)
         {
            if(MovieClip(this).debuff_Cursed.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_Cursed.play();
            }
            else if(MovieClip(this).debuff_Cursed.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_Cursed.gotoAndPlay("on");
            }
            if(MovieClip(this).debuff_Poison.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_Poison.play();
            }
            else if(MovieClip(this).debuff_Poison.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_Poison.gotoAndPlay("on");
            }
            if(MovieClip(this).effect_TeslaHit.currentFrameLabel != "off")
            {
               MovieClip(this).effect_TeslaHit.play();
            }
            if(MovieClip(this).effect_burn.currentFrameLabel != "off")
            {
               MovieClip(this).effect_burn.play();
            }
            if(MovieClip(this).effect_HolyStrike.currentFrameLabel != "off")
            {
               MovieClip(this).effect_HolyStrike.play();
            }
            if(MovieClip(this).effect_Sniper.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Sniper.play();
            }
            if(MovieClip(this).effect_Healing.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Healing.play();
            }
            if(MovieClip(this).effect_stun.currentFrameLabel != "off")
            {
               MovieClip(this).effect_stun.play();
            }
            else if(MovieClip(this).effect_stun.currentFrameLabel == "onEnd")
            {
               MovieClip(this).effect_stun.gotoAndPlay("on");
            }
            if(MovieClip(this).effect_stun.currentFrameLabel != "off")
            {
               MovieClip(this).effect_stun.play();
            }
            else if(MovieClip(this).effect_stun.currentFrameLabel == "onEnd")
            {
               MovieClip(this).effect_stun.gotoAndPlay("on");
            }
         }
      }
   }
}
