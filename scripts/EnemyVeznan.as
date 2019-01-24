package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyVeznan extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var §_-IS§:Boolean;
      
      private var §_-Ed§:Boolean;
      
      private var isDemon:Boolean;
      
      private var wasDemon:Boolean;
      
      private var §_-h§:Boolean;
      
      private var startTime:int = 1000;
      
      private var §_-t§:int;
      
      private var §_-N4§:Boolean;
      
      private var portalTimers:Array;
      
      private var §_-Ll§:int;
      
      private var §_-0K§:int = 0;
      
      private var §_-Jd§:int = 44;
      
      private var §_-X§:int = 0;
      
      private var §_-Kj§:int;
      
      private var §_-7i§:int;
      
      private var §_-Pz§:Point;
      
      private var §_-12§:Point;
      
      private var §_-8q§:Point;
      
      private var §_-Cu§:Boolean;
      
      private var holdTimers:Array;
      
      private var holdReloadTime:int;
      
      private var holdReloadTimeCounter:int = 0;
      
      private var holdAnimationTime:int = 44;
      
      private var holdAnimationTimeCounter:int = 0;
      
      private var isGoingDemon:Boolean;
      
      private var §_-Br§:int = 34;
      
      private var §_-Hq§:int = 0;
      
      private var §_-PN§:Boolean;
      
      private var §_-Fb§:int = 19;
      
      private var §_-7J§:int = 0;
      
      private var areaAttackAnimation:int;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var §_-GB§:int;
      
      private var §_-LE§:Boolean;
      
      private var tsungRangeWidth:int;
      
      private var §_-Qr§:int;
      
      private var tsungMinRange:int;
      
      private var tsungMaxEnemies:int;
      
      private var §_-CO§:int = 12;
      
      private var §_-R8§:int;
      
      private var §_-G1§:int = 25;
      
      private var §_-DK§:int;
      
      private var tsungReloadTime:int;
      
      private var §_-4L§:int;
      
      private var demonFire:DemonFire;
      
      private var §_-G6§:Boolean;
      
      private var downstairsTime:int = 150;
      
      private var downstairsTimeCounter:int;
      
      private var §_-1d§:Boolean;
      
      private var §_-AN§:VeznanTaunt;
      
      private var §_-DD§:int = 120;
      
      private var §_-Sm§:int;
      
      private var §_-LW§:int = 400;
      
      private var §_-01§:int;
      
      private var §_-8§:int = 300;
      
      private var §_-IT§:int;
      
      public function EnemyVeznan(param1:int, param2:Array, param3:Point)
      {
         addFrameScript(27,this.frame28,55,this.frame56,83,this.frame84,84,this.frame85,85,this.frame86,123,this.frame124,168,this.frame169,214,this.frame215,240,this.frame241,275,this.frame276,299,this.frame300,323,this.frame324,324,this.frame325,372,this.frame373,409,this.frame410,416,this.frame417);
         super(param1,param2);
         this.x = param3.x;
         this.y = param3.y;
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameEncyclopedia.notificationEnemyVeznan = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isBoss = true;
         this.§_-IS§ = true;
         this.level = 1;
         this.isActive = false;
         this.canPoison = true;
         this.deadTime = 340;
         this.attackChargeTime = 37;
         this.areaAttackAnimation = 16;
         this.countNodesActive = 12;
         this.isFlying = this.cRoot.gameSettings.enemies.veznan.isFlying;
         this.size = this.cRoot.gameSettings.enemies.veznan.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.veznan.health;
         this.speed = this.cRoot.gameSettings.enemies.veznan.speed;
         this.armor = this.cRoot.gameSettings.enemies.veznan.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.veznan.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.veznan.dodge;
         this.gold = this.cRoot.gameSettings.enemies.veznan.gold;
         this.cost = this.cRoot.gameSettings.enemies.veznan.cost;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.veznan.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.veznan.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.veznan.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.veznan.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.veznan.speed + 0.1;
         this.portalTimers = this.cRoot.gameSettings.enemies.veznan.portalTimers;
         this.holdTimers = this.cRoot.gameSettings.enemies.veznan.holdTimers;
         this.minDamage = this.cRoot.gameSettings.enemies.veznan.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.veznan.maxDamage;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.veznan.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.veznan.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.§_-GB§ = this.cRoot.gameSettings.enemies.veznan.areaAttackMaxEnemies;
         this.tsungReloadTime = this.cRoot.gameSettings.enemies.veznan.tsungReloadTime;
         this.tsungRangeWidth = this.cRoot.gameSettings.enemies.veznan.tsungRangeWidth;
         this.§_-Qr§ = this.cRoot.gameSettings.enemies.veznan.tsungRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.tsungMaxEnemies = this.cRoot.gameSettings.enemies.veznan.tsungMaxEnemies;
         this.tsungMinRange = this.cRoot.gameSettings.enemies.veznan.tsungMinRange;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-37),this.health,this.initHealth);
         this.addChild(this.§_-Jc§);
         this.§_-Jc§.hide();
         this.start();
         this.§_-NA§ = 24;
         this.§_-C-§ = 38;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "veznan";
         param1.eName = Locale.loadStringEx("ENEMY_VEZNAN_NAME",Locale.getDefaultLang());
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "walkingEnd":
               this.gotoAndPlay("walking");
               break;
            case "walkingUpEnd":
               this.gotoAndPlay("walkingUp");
               break;
            case "walkingDownEnd":
               this.gotoAndPlay("walkingDown");
               break;
            case "fightingEnd":
               break;
            case "walkingDemonEnd":
               this.gotoAndPlay("walkingDemon");
               break;
            case "walkingUpDemonEnd":
               this.gotoAndPlay("walkingUpDemon");
               break;
            case "walkingDownDemonEnd":
               this.gotoAndPlay("walkingDownDemon");
               break;
            case "fightingDemonEnd":
               break;
            case "idle":
               break;
            case "idleDemon":
               break;
            case "idleDown":
               break;
            case "spellEnd":
               break;
            case "spellDownEnd":
               break;
            case "rangedLoopEnd":
               break;
            case "rangedAttackEnd":
               break;
            case "toDemonEnd":
               break;
            case "toVeznanEnd":
               break;
            case "fadeEnd":
               break;
            case "deathloopEnd":
               break;
            default:
               this.play();
         }
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
            if(MovieClip(this).effect_HolyStrike.currentFrameLabel != "off")
            {
               MovieClip(this).effect_HolyStrike.play();
            }
         }
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.isDead)
         {
            if(this.deadTimeCounter == 0)
            {
               this.cRoot.game.gameSounds.stopAllMusics();
               this.cRoot.game.gameSounds.playVeznanDeath();
               this.gotoAndPlay("dead");
            }
            this.deadTimeCounter++;
            if(this.currentLabel == "deathloopEnd")
            {
               this.gotoAndPlay("deathloop");
            }
            if(this.deadTimeCounter == 148)
            {
               this.cRoot.bullets.addChild(new VeznanSoulController(new Point(this.x - 2,this.y - 13)));
            }
            if(this.deadTimeCounter == 240)
            {
               this.cRoot.addChild(new VeznanExplosion(new Point(this.x,this.y)));
            }
            if(this.deadTimeCounter == 313)
            {
               this.cRoot.game.main.showEndGame(this.cRoot);
            }
            if(this.deadTimeCounter >= this.deadTime)
            {
               this.destroyThis();
            }
            return;
         }
         this.§ if§();
         if(this.isDead)
         {
            return;
         }
         if((this.§_-IS§ || this.isActive && !this.isCharging) && this.specialPower())
         {
            return;
         }
         if(this.isBlocked)
         {
            if(!this.isCharging && (this.soldier == null || !this.soldier.isActive || !this.soldier.isFighting))
            {
               this.stopFighting();
            }
         }
         if(this.isFighting)
         {
            if(this.isCharging)
            {
               if(!this.readyToDamage())
               {
                  return;
               }
               this.isCharging = false;
               if(this.isDemon)
               {
                  this.gotoAndStop("idleDemon");
               }
               else
               {
                  this.gotoAndStop("idle");
               }
               if(this.soldier != null && this.soldier.isDead)
               {
                  this.stopFighting();
               }
            }
            else
            {
               this.readyToAttack();
            }
         }
         else
         {
            this.walk();
         }
      }
      
      override public function setDamage(param1:int, param2:int = 3, param3:§_-27§ = null, param4:int = 0, param5:Boolean = false) : void
      {
         if(this.§_-PN§ || this.isGoingDemon)
         {
            return;
         }
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
            if(!this.isDemon)
            {
               if(this.wasDemon)
               {
                  this.setDeadBasicStatus(true);
                  this.addBlood();
               }
               else
               {
                  this.gotoDemon();
               }
            }
            else
            {
               if(this.demonFire != null)
               {
                  this.cRoot.game.gameSounds.stopVeznanDemonFire();
                  this.demonFire.destroyThis();
                  this.demonFire = null;
               }
               this.setDeadBasicStatus(true);
               this.addBlood();
            }
            return;
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            this.addDebuff(param3);
         }
      }
      
      override public function setDeadBasicStatus(param1:Boolean = false) : void
      {
         var _loc2_:Enemy = null;
         this.isActive = false;
         this.isDead = true;
         this.§_-Jc§.hide();
         this.cRoot.updateCash(this.gold);
         this.cRoot.data.currentEnemiesDefeated = this.cRoot.data.currentEnemiesDefeated + 1;
         this.cRoot.game.gameAchievement.killEnemie(this.cRoot,getQualifiedClassName(this));
         this.cRoot.game.gameAchievement.defeatEndBoss(this.cRoot);
         this.cRoot.graveyard.destroyThis();
         this.cRoot.graveyard = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_ != this)
            {
               _loc2_.setDeadBasicStatus();
               _loc2_.addBlood();
            }
         }
      }
      
      public function §_-Hn§() : void
      {
         if(!this.§_-IS§)
         {
            return;
         }
         if(this.§_-IS§ && !this.§_-G6§)
         {
            this.cRoot.game.gameSounds.stopAllMusics();
            this.cRoot.game.gameSounds.playMusicBossFight();
            this.stopSpecialPower();
            this.§_-Ed§ = true;
            this.§_-G6§ = true;
            this.downstairsTimeCounter = 0;
            this.§_-Kj§ = 0;
            this.§_-Ll§ = 10 * this.cRoot.gameSettings.framesRate;
            this.§_-7i§ = 40;
         }
      }
      
      public function updateTimers() : void
      {
         if(this.cRoot.currentWave == 1)
         {
            this.§_-h§ = false;
         }
         this.holdReloadTime = this.holdTimers[this.cRoot.currentWave - 1][0] * this.cRoot.gameSettings.framesRate;
         this.holdReloadTimeCounter = 0;
         this.§_-Ll§ = this.portalTimers[this.cRoot.currentWave - 1][0] * this.cRoot.gameSettings.framesRate;
         this.§_-7i§ = this.portalTimers[this.cRoot.currentWave - 1][4];
         this.§_-0K§ = 0;
         this.§_-Kj§ = 0;
         this.§_-Q§();
      }
      
      private function §_-Q§() : void
      {
         if(this.§_-RO§())
         {
            switch(this.cRoot.currentWave)
            {
               case 1:
                  this.§_-G0§(5,false);
                  break;
               case 5:
                  this.§_-G0§(6,false);
                  break;
               case 9:
                  this.§_-G0§(7,false);
            }
         }
      }
      
      public function §_-4s§() : void
      {
         if(this.§_-RO§())
         {
            this.§_-G0§(this.getRandom(36,40),false);
         }
      }
      
      override protected function stopSpecialPower() : void
      {
         this.§_-Cu§ = false;
         this.§_-N4§ = false;
         this.isGoingDemon = false;
         this.§_-PN§ = false;
         this.§_-LE§ = false;
         this.§_-1d§ = false;
         this.§_-G6§ = false;
         if(this.§_-AN§ != null)
         {
            this.§_-AN§.destroyThis();
            this.§_-AN§ = null;
         }
      }
      
      override public function block(param1:Soldier) : void
      {
         this.soldier = param1;
         this.isBlocked = true;
         if(!this.§_-Cu§ && !this.§_-N4§ && !this.§_-PN§ && !this.isGoingDemon && !this.§_-LE§)
         {
            if(this.isDemon)
            {
               this.gotoAndStop("idleDemon");
            }
            else
            {
               this.gotoAndStop("idle");
            }
         }
      }
      
      override public function startFighting() : void
      {
         this.isFighting = true;
         if(!this.§_-N4§ && !this.§_-Cu§ && !this.isGoingDemon && !this.§_-PN§ && !this.§_-LE§)
         {
            this.§_-R2§ = "";
            this.y = this.y + 0.1;
            this.chargeAttack();
         }
      }
      
      override public function specialPower() : Boolean
      {
         this.holdReloadTimeCounter++;
         this.§_-0K§++;
         this.§_-4L§++;
         this.§_-01§++;
         this.§_-IT§++;
         if(this.§_-h§)
         {
            this.§_-t§++;
         }
         if(this.§_-G6§)
         {
            this.downstairsTimeCounter++;
         }
         this.§_-Is§();
         if(this.§_-Dq§())
         {
            return true;
         }
         if(this.§_-Kq§())
         {
            return true;
         }
         if(this.§_-h§ && this.§_-RU§())
         {
            return true;
         }
         if(!this.isDemon && this.§_-IJ§())
         {
            return true;
         }
         if(!this.isDemon && this.§_-5w§())
         {
            return true;
         }
         if(!this.isDemon && this.§_-4x§())
         {
            return true;
         }
         if(this.specialGoingDemon())
         {
            return true;
         }
         return this.§_-IS§;
      }
      
      private function start() : void
      {
         this.§_-h§ = true;
         this.gotoAndStop("idleDown");
      }
      
      private function §_-RU§() : Boolean
      {
         if(!this.§_-IS§)
         {
            return false;
         }
         if(this.§_-Ed§ && !this.§_-h§)
         {
            return false;
         }
         if(this.§_-t§ < this.startTime)
         {
            if(this.§_-t§ == 60)
            {
               this.§_-G0§(1,false);
            }
            if(this.§_-t§ == 200)
            {
               this.§_-G0§(2,false);
            }
            if(this.§_-t§ == 650)
            {
               this.§_-G0§(3,false);
            }
            if(this.§_-t§ == 900)
            {
               this.§_-G0§(4,false);
            }
            return true;
         }
         this.§_-h§ = false;
         this.§_-t§ = 0;
         this.gotoAndStop("idleDown");
         return false;
      }
      
      private function §_-Is§() : void
      {
         if(this.cRoot.currentWave == 0)
         {
            return;
         }
         if(!this.§_-IS§)
         {
            return;
         }
         if(this.§_-h§ || this.§_-G6§)
         {
            return;
         }
         if(this.§_-Ed§ || this.§_-1d§)
         {
            return;
         }
         if(this.§_-01§ < this.§_-LW§)
         {
            return;
         }
         if(this.§_-IT§ < this.§_-8§)
         {
            return;
         }
         this.§_-G0§(this.getRandom(8,35),true);
      }
      
      private function §_-Dq§() : Boolean
      {
         if(!this.§_-IS§)
         {
            return false;
         }
         if(this.§_-Ed§ && !this.§_-1d§)
         {
            return false;
         }
         if(!this.§_-1d§)
         {
            return false;
         }
         if(this.currentFrameLabel == "laughEnd")
         {
            this.gotoAndPlay("laugh");
         }
         if(this.§_-Sm§ < this.§_-DD§)
         {
            this.§_-Sm§++;
            return true;
         }
         if(this.§_-AN§ != null)
         {
            this.§_-AN§.destroyThis();
            this.§_-AN§ = null;
         }
         this.§_-1d§ = false;
         this.isBlocked = false;
         this.§_-01§ = 0;
         this.§_-IT§ = 0;
         this.gotoAndStop("idleDown");
         return false;
      }
      
      public function §_-RO§() : Boolean
      {
         if(!this.§_-IS§)
         {
            return false;
         }
         if(this.§_-IS§ && this.§_-G6§)
         {
            return false;
         }
         if(this.isBlocked)
         {
            return false;
         }
         if(this.§_-IT§ < this.§_-8§)
         {
            return false;
         }
         return true;
      }
      
      public function §_-G0§(param1:int, param2:Boolean = false) : void
      {
         this.§_-1d§ = true;
         this.isBlocked = true;
         this.§_-Sm§ = 0;
         this.gotoAndPlay("laugh");
         this.§_-AN§ = new VeznanTaunt(new Point(this.x,this.y),param1);
         this.cRoot.bullets.addChild(this.§_-AN§);
      }
      
      private function §_-Kq§() : Boolean
      {
         if(this.§_-Ed§ && !this.§_-G6§)
         {
            return false;
         }
         if(!this.§_-G6§)
         {
            return false;
         }
         if(this.downstairsTimeCounter < this.downstairsTime)
         {
            if(this.downstairsTimeCounter == 24)
            {
               if(this.§_-1d§)
               {
                  this.downstairsTimeCounter--;
                  return true;
               }
               this.§_-G0§(40,false);
            }
            if(this.downstairsTimeCounter == 115)
            {
               this.gotoAndPlay("fade");
            }
            return true;
         }
         this.§_-Ed§ = false;
         this.§_-G6§ = false;
         this.§_-IS§ = false;
         this.§_-4Y§ = false;
         this.downstairsTimeCounter = 0;
         this.§_-0K§ = 0;
         this.holdReloadTimeCounter = 0;
         this.§_-Jc§.show();
         this.§_-9I§(1);
         this.§_-R2§ = "";
         this.getFacing();
         if(this.scaleX == -1)
         {
            this.§_-Jc§.flip(-1);
         }
         return false;
      }
      
      private function §_-IJ§() : Boolean
      {
         if(this.holdReloadTime == 0 || this.§_-Ed§ && !this.§_-Cu§)
         {
            return false;
         }
         if(!this.§_-Cu§)
         {
            if(this.holdReloadTimeCounter < this.holdReloadTime)
            {
               return false;
            }
            this.§_-Cu§ = true;
            this.§_-Ed§ = true;
            this.§_-4Y§ = true;
            this.holdAnimationTimeCounter = 0;
            if(this.§_-IS§ || this.§_-R2§ == "down")
            {
               this.gotoAndPlay("spellDown");
            }
            else
            {
               this.gotoAndPlay("spell");
            }
            return true;
         }
         if(this.holdAnimationTimeCounter < this.holdAnimationTime)
         {
            this.holdAnimationTimeCounter++;
            if(this.holdAnimationTimeCounter == 14)
            {
               this.holdTowers();
            }
            return true;
         }
         this.§_-Ed§ = false;
         this.§_-Cu§ = false;
         this.§_-4Y§ = false;
         this.holdReloadTimeCounter = 0;
         if(this.§_-IS§)
         {
            this.gotoAndStop("idleDown");
         }
         else
         {
            this.§_-R2§ = "";
            if(!this.isBlocked)
            {
               this.getFacing();
            }
         }
         return false;
      }
      
      private function holdTowers() : void
      {
         var _loc3_:Tower = null;
         var _loc5_:Tower = null;
         var _loc6_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:Dictionary = new Dictionary(true);
         for each(_loc3_ in this.cRoot.towers)
         {
            if(!_loc3_.building && !_loc3_.isDisabled)
            {
               _loc2_[_loc3_] = _loc3_;
               _loc1_++;
            }
         }
         if(_loc1_ == 0)
         {
            return;
         }
         this.cRoot.game.gameSounds.playVeznanHoldCast();
         var _loc4_:int = this.holdTimers[this.cRoot.currentWave - 1][1];
         if(_loc1_ < _loc4_)
         {
            for each(_loc5_ in _loc2_)
            {
               _loc5_.veznanBlockTower();
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               this.blockRandomTower(_loc2_,_loc1_);
               _loc1_--;
               _loc6_++;
            }
         }
         _loc2_ = null;
      }
      
      function blockRandomTower(param1:Dictionary, param2:int) : void
      {
         var _loc5_:Tower = null;
         var _loc3_:int = 0;
         var _loc4_:int = this.getRandom(0,param2 - 1);
         for each(_loc5_ in param1)
         {
            if(_loc3_ == _loc4_)
            {
               _loc5_.veznanBlockTower();
               delete param1[_loc5_];
               return;
            }
            _loc3_++;
         }
      }
      
      private function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      private function §_-5w§() : Boolean
      {
         if(this.§_-Ll§ == 0 || this.§_-Ed§ && !this.§_-N4§)
         {
            return false;
         }
         if(!this.§_-N4§ && this.§_-Kj§ == this.§_-7i§)
         {
            return false;
         }
         if(!this.§_-N4§)
         {
            if(this.§_-0K§ < this.§_-Ll§)
            {
               return false;
            }
            this.§_-N4§ = true;
            this.§_-Ed§ = true;
            this.§_-4Y§ = true;
            this.§_-X§ = 0;
            if(this.§_-IS§ || this.§_-R2§ == "down")
            {
               this.gotoAndPlay("spellDown");
            }
            else
            {
               this.gotoAndPlay("spell");
            }
            return true;
         }
         if(this.§_-X§ < this.§_-Jd§)
         {
            this.§_-X§++;
            if(this.§_-X§ == 14)
            {
               this.§_-0e§();
            }
            return true;
         }
         this.§_-Ed§ = false;
         this.§_-N4§ = false;
         this.§_-4Y§ = false;
         this.§_-0K§ = 0;
         if(this.§_-IS§)
         {
            this.gotoAndStop("idleDown");
         }
         else
         {
            this.§_-R2§ = "";
            if(!this.isBlocked)
            {
               this.getFacing();
            }
         }
         return false;
      }
      
      private function §_-0e§() : void
      {
         this.§_-Kj§++;
         this.cRoot.game.gameSounds.playVeznanPortalSummon();
         if(this.portalTimers[this.cRoot.currentWave - 1][1] == 1)
         {
            this.cRoot.decals.addChild(new PortalOne(new Point(362,243),0,103,this));
         }
         if(this.portalTimers[this.cRoot.currentWave - 1][2] == 1)
         {
            this.cRoot.decals.addChild(new PortalTwo(new Point(362,365),0,148,this));
         }
         if(this.portalTimers[this.cRoot.currentWave - 1][3] == 1)
         {
            this.cRoot.decals.addChild(new PortalThree(new Point(362,493),0,228,this));
         }
      }
      
      private function §_-4x§() : Boolean
      {
         if(this.§_-Ed§ && !this.§_-LE§)
         {
            return false;
         }
         if(!this.§_-LE§)
         {
            if(this.§_-4L§ < this.tsungReloadTime)
            {
               return false;
            }
            if(!this.§_-L0§())
            {
               return false;
            }
            this.§_-LE§ = true;
            this.§_-Ed§ = true;
            this.§_-4Y§ = true;
            this.§_-DK§ = 0;
            this.§_-R8§ = 0;
            this.gotoAndPlay("rangedAttack");
            return true;
         }
         if(this.§_-DK§ < this.§_-G1§)
         {
            this.§_-DK§++;
            if(this.§_-DK§ == 12)
            {
               this.§_-Tf§();
            }
            if(this.§_-DK§ > 12)
            {
               this.§_-R8§++;
               if(this.currentFrameLabel == "rangedLoopEnd")
               {
                  if(this.§_-3§())
                  {
                     this.gotoAndPlay("rangedLoop");
                     this.§_-DK§ = this.§_-DK§ - this.§_-CO§;
                     this.§_-R8§ = 0;
                  }
               }
            }
            return true;
         }
         this.§_-LE§ = false;
         this.§_-Ed§ = false;
         this.§_-4Y§ = false;
         this.§_-4L§ = 0;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         return false;
      }
      
      private function §_-3§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.cRoot.bullets.numChildren)
         {
            if(getQualifiedClassName(this.cRoot.bullets.getChildAt(_loc1_)) == "Soul")
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function §_-L0§() : Boolean
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && _loc1_.§_-R0§ && this.onTsungRange(_loc1_) && this.§_-QH§(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-Tf§() : void
      {
         var _loc2_:Point = null;
         var _loc3_:Soldier = null;
         var _loc1_:int = 0;
         if(this.scaleX == -1)
         {
            _loc2_ = new Point(this.x - 13,this.y - 15);
         }
         else
         {
            _loc2_ = new Point(this.x + 13,this.y - 15);
         }
         for each(_loc3_ in this.cRoot.soldiers)
         {
            if(_loc3_.isActive && _loc3_.§_-R0§ && this.onTsungRange(_loc3_) && this.§_-QH§(_loc3_))
            {
               _loc3_.tsung(_loc2_);
               _loc1_++;
               if(_loc1_ == this.tsungMaxEnemies)
               {
                  return;
               }
            }
         }
         if(_loc1_ > 0)
         {
            this.cRoot.game.gameSounds.playVeznanTsung();
         }
      }
      
      private function §_-QH§(param1:Soldier) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:Number = NaN;
         _loc3_ = param1.x - this.x;
         _loc4_ = param1.y - this.y;
         _loc2_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc2_ > this.tsungMinRange)
         {
            return true;
         }
         return false;
      }
      
      private function onTsungRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.tsungRangeWidth / 2,this.y - this.§_-Qr§ / 2,this.tsungRangeWidth,this.§_-Qr§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function gotoDemon() : void
      {
         this.§_-BN§(true);
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.veznan.demonHealth;
         this.speed = this.cRoot.gameSettings.enemies.veznan.demonSpeed;
         this.attackChargeTime = 53;
         this.attackChargeTimeCounter = 0;
         this.areaAttackAnimation = 19;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.veznan.demonAttackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.veznan.demonXSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.veznan.demonXAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.veznan.demonYAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.veznan.demonSpeed + 0.1;
         this.§_-LE§ = false;
         this.§_-Cu§ = false;
         this.§_-N4§ = false;
         this.§_-Ed§ = false;
         this.isDemon = true;
         this.isCharging = false;
         this.§_-Jc§.hide();
         this.removeChild(this.§_-Jc§);
         this.§_-Jc§ = null;
         this.stopSpecialPower();
         this.isGoingDemon = true;
         this.§_-Hq§ = 0;
         this.gotoAndPlay("toDemon");
         this.cRoot.game.gameSounds.playVeznanToDemon();
      }
      
      private function specialGoingDemon() : Boolean
      {
         if(!this.isGoingDemon)
         {
            return false;
         }
         if(this.§_-Hq§ < this.§_-Br§)
         {
            this.§_-Hq§++;
            return true;
         }
         this.§_-Jc§ = new §_-Pb§(new Point(0,-106),this.health,this.initHealth);
         this.addChild(this.§_-Jc§);
         this.isGoingDemon = false;
         this.§_-4Y§ = false;
         this.wasDemon = true;
         this.§_-Hq§ = 0;
         this.drawBitmapHitArea();
         this.§_-NA§ = 55;
         this.§_-C-§ = 92;
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         if(this.scaleX == -1)
         {
            this.§_-Jc§.flip(-1);
         }
         return false;
      }
      
      private function gotoVeznan() : void
      {
         this.§_-BN§(true);
         this.health = 100;
         this.initHealth = this.cRoot.gameSettings.enemies.veznan.health;
         this.speed = this.cRoot.gameSettings.enemies.veznan.speed;
         this.attackChargeTime = 34;
         this.attackChargeTimeCounter = 0;
         this.areaAttackAnimation = 16;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.veznan.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.veznan.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.veznan.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.veznan.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.veznan.speed + 0.1;
         this.§_-LE§ = false;
         this.§_-Cu§ = false;
         this.§_-N4§ = false;
         this.§_-Ed§ = false;
         this.isCharging = false;
         this.§_-Jc§.hide();
         this.removeChild(this.§_-Jc§);
         this.§_-Jc§ = null;
         this.stopSpecialPower();
         this.§_-PN§ = true;
         this.§_-7J§ = 0;
         this.gotoAndPlay("toVeznan");
      }
      
      private function §_-4n§() : Boolean
      {
         if(!this.§_-PN§)
         {
            return false;
         }
         if(this.§_-7J§ < this.§_-Br§)
         {
            this.§_-7J§++;
            return true;
         }
         this.§_-PN§ = false;
         this.§_-4Y§ = false;
         this.isDemon = false;
         this.§_-7J§ = 0;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-37),this.health,this.initHealth);
         this.addChild(this.§_-Jc§);
         this.drawBitmapHitArea();
         this.§_-R2§ = "";
         if(!this.isBlocked)
         {
            this.getFacing();
         }
         if(this.scaleX == -1)
         {
            this.§_-Jc§.flip(-1);
         }
         return false;
      }
      
      private function getAttackPoint() : Point
      {
         if(this.isDemon)
         {
            if(this.scaleX == 1)
            {
               return new Point(this.x + 30,this.y);
            }
            return new Point(this.x - 30,this.y);
         }
         return new Point(this.x,this.y);
      }
      
      override public function attack() : void
      {
         var _loc2_:Soldier = null;
         this.§_-NY§ = this.getAttackPoint();
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && this.onRange(_loc2_))
            {
               _loc2_.setDamage(this.getDamage());
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      override protected function readyToDamage() : Boolean
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter >= this.attackChargeTime)
         {
            this.attackChargeTimeCounter = 0;
            this.demonFire = null;
            return true;
         }
         if(this.attackChargeTimeCounter == this.areaAttackAnimation)
         {
            this.§_-NY§ = this.getAttackPoint();
            if(this.isDemon)
            {
               this.demonFire = new DemonFire(new Point(this.x,this.y),this.scaleX);
               this.cRoot.bullets.addChild(this.demonFire);
            }
            else
            {
               this.attack();
               this.cRoot.game.gameSounds.playVeznanAreaAttack();
               this.cRoot.decals.addChild(new HolyStrikeVeznan(new Point(this.x,this.y),this.cRoot));
            }
         }
         if(this.isDemon && this.demonFire != null)
         {
            if(this.attackChargeTimeCounter <= 44)
            {
               this.attackDemon();
            }
         }
         return false;
      }
      
      public function attackDemon() : void
      {
         var _loc2_:Soldier = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.soldiers)
         {
            if(_loc2_.isActive && this.onRange(_loc2_))
            {
               _loc2_.burn(this.getDamage() / 22);
               _loc1_++;
               if(_loc1_ != this.§_-GB§)
               {
                  continue;
               }
               break;
            }
         }
      }
      
      private function onRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function chargeAttack() : void
      {
         if(this.isDemon)
         {
            this.cRoot.game.gameSounds.playVeznanDemonFire();
            this.gotoAndPlay("fightingDemon");
         }
         else
         {
            this.gotoAndPlay("fighting");
         }
         this.isCharging = true;
      }
      
      override public function getFacing() : void
      {
         if(this.isFighting)
         {
            this.attackChargeTimeCounter = 0;
            if(this.isDemon)
            {
               this.gotoAndStop("idleDemon");
            }
            else
            {
               this.gotoAndStop("idle");
            }
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
               if(this.isDemon)
               {
                  this.gotoAndPlay("walkingUpDemon");
               }
               else
               {
                  this.gotoAndPlay("walkingUp");
               }
               this.§_-R2§ = "up";
            }
         }
         else if(_loc3_ >= 135 && _loc3_ <= 240)
         {
            if(this.§_-R2§ != "left")
            {
               if(this.isDemon)
               {
                  this.gotoAndPlay("walkingDemon");
               }
               else
               {
                  this.gotoAndPlay("walking");
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
               if(this.isDemon)
               {
                  this.gotoAndPlay("walkingDownDemon");
               }
               else
               {
                  this.gotoAndPlay("walkingDown");
               }
               this.§_-R2§ = "down";
            }
         }
         else if(this.§_-R2§ != "right")
         {
            if(this.isDemon)
            {
               this.gotoAndPlay("walkingDemon");
            }
            else
            {
               this.gotoAndPlay("walking");
            }
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
            this.§_-R2§ = "right";
         }
      }
      
      override public function bombHit(param1:int) : void
      {
         this.setDamage(param1,this.cRoot.gameSettings.E_ARMOR);
      }
      
      override public function destroyThis() : void
      {
         Level12(this.cRoot).veznan = null;
         this.§_-BN§(false);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,clickEvents);
         this.removeFromList();
         if(this.§_-Jc§ != null && this.contains(this.§_-Jc§))
         {
            this.removeChild(this.§_-Jc§);
         }
         this.§_-Jc§ = null;
         this.soldier = null;
         this.road = null;
         this.§_-GF§ = null;
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame28() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame56() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame84() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame85() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame124() : *
      {
         stop();
      }
      
      function frame169() : *
      {
         stop();
      }
      
      function frame215() : *
      {
         stop();
      }
      
      function frame241() : *
      {
         stop();
      }
      
      function frame276() : *
      {
         stop();
      }
      
      function frame300() : *
      {
         gotoAndPlay("walkingDemon");
      }
      
      function frame324() : *
      {
         gotoAndPlay("walkingDownDemon");
      }
      
      function frame325() : *
      {
         stop();
      }
      
      function frame373() : *
      {
         stop();
      }
      
      function frame410() : *
      {
         stop();
      }
      
      function frame417() : *
      {
         stop();
      }
   }
}
