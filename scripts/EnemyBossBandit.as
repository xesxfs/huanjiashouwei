package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class EnemyBossBandit extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var areaReloadTime:int;
      
      private var §_-S2§:int;
      
      private var §_-1o§:Boolean;
      
      private var §_-02§:String;
      
      private var §_-2-§:int;
      
      private var §_-9R§:int;
      
      private var §_-94§:int;
      
      private var §_-Cn§:int;
      
      private var §_-NY§:Point;
      
      private var areaAttackRangeWidth:int;
      
      private var §package§:int;
      
      private var healingMePoints:int;
      
      private var healingRangeWidth:int;
      
      private var healingRangeHeight:int;
      
      private var healingPoints:int;
      
      public function EnemyBossBandit(param1:int, param2:Array)
      {
         addFrameScript(23,this.frame24,108,this.frame109,198,this.frame199,215,this.frame216);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemyBossBandit = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isFlying = this.cRoot.gameSettings.enemies.bossBandit.isFlying;
         this.level = 1;
         this.isBoss = true;
         this.attackChargeTime = 23;
         this.canBeBlocked = false;
         this.size = this.cRoot.gameSettings.enemies.bossBandit.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.bossBandit.health;
         this.speed = this.cRoot.gameSettings.enemies.bossBandit.speed;
         this.armor = this.cRoot.gameSettings.enemies.bossBandit.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.bossBandit.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.bossBandit.dodge;
         this.gold = this.cRoot.gameSettings.enemies.bossBandit.gold;
         this.cost = this.cRoot.gameSettings.enemies.bossBandit.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.bossBandit.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.bossBandit.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.bossBandit.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.bossBandit.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.bossBandit.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.bossBandit.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.bossBandit.speed + 0.1;
         this.§_-1o§ = false;
         this.§_-2-§ = this.cRoot.gameSettings.enemies.bossBandit.stopReloadTime;
         this.§_-9R§ = 0;
         this.§_-94§ = this.cRoot.gameSettings.enemies.bossBandit.stopDurationTime;
         this.§_-Cn§ = 0;
         this.areaReloadTime = this.cRoot.gameSettings.enemies.bossBandit.areaReloadTime;
         this.§_-S2§ = 0;
         this.areaAttackRangeWidth = this.cRoot.gameSettings.enemies.bossBandit.areaAttackRangeWidth;
         this.§package§ = this.cRoot.gameSettings.enemies.bossBandit.areaAttackRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.healingMePoints = this.cRoot.gameSettings.enemies.bossBandit.stopHealPoints;
         this.healingRangeWidth = this.cRoot.gameSettings.enemies.bossBandit.stopHealRangeWidth;
         this.healingRangeHeight = this.healingRangeWidth * this.cRoot.gameSettings.rangeRatio;
         this.healingPoints = this.cRoot.gameSettings.enemies.bossBandit.stopHealAlliesPoints;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-104),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 120;
         this.§_-C-§ = 92;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "bossbandit";
         param1.eName = Locale.loadStringEx("ENEMY_BANDIT_BOSS_NAME",Locale.getDefaultLang());
      }
      
      override public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "walkingEnd":
               this.gotoAndPlay("walking");
               break;
            case "biteEnd":
               break;
            case "moneyEnd":
               break;
            case "deadEnd":
               break;
            case "idle":
               break;
            default:
               this.play();
         }
         this.unPauseEffects();
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
      
      override public function specialPower() : Boolean
      {
         if(this.§_-S2§ < this.areaReloadTime)
         {
            this.§_-S2§++;
         }
         else
         {
            this.checkBarricades();
            this.attack();
            this.§_-S2§ = 0;
         }
         if(this.§_-1o§)
         {
            this.§_-Cn§++;
            if(this.§_-Cn§ < this.§_-94§)
            {
               if(this.§_-Cn§ == 15)
               {
                  if(this.§_-02§ == "money")
                  {
                     this.healTargets();
                  }
                  else
                  {
                     this.heal(this.healingMePoints);
                  }
               }
               return true;
            }
            this.§_-1o§ = false;
            this.§_-9R§ = 0;
            this.§_-R2§ = "";
            if(!this.isBlocked)
            {
               this.getFacing();
            }
            return false;
         }
         this.§_-9R§++;
         if(this.§_-9R§ < this.§_-2-§)
         {
            return false;
         }
         this.§_-1o§ = true;
         if(Math.random() < 0.5)
         {
            this.§_-02§ = "bite";
            this.gotoAndPlay("bite");
         }
         else
         {
            this.§_-02§ = "money";
            this.gotoAndPlay("money");
         }
         this.§_-Cn§ = 0;
         return true;
      }
      
      private function checkBarricades() : void
      {
         if(Level17(this.cRoot).§_-QF§.isActive)
         {
            if(this.onRangeBarricade(Level17(this.cRoot).§_-QF§))
            {
               Level17(this.cRoot).§_-QF§.goEnd();
            }
         }
         if(Level17(this.cRoot).§try §.isActive)
         {
            if(this.onRangeBarricade(Level17(this.cRoot).§try §))
            {
               Level17(this.cRoot).§try §.goEnd();
            }
         }
         if(Level17(this.cRoot).§_-Iq§.isActive)
         {
            if(this.onRangeBarricade(Level17(this.cRoot).§_-Iq§))
            {
               Level17(this.cRoot).§_-Iq§.goEnd();
            }
         }
      }
      
      private function onRangeBarricade(param1:§_-NE§) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.areaAttackRangeWidth / 2,this.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function attack() : void
      {
         var _loc1_:Soldier = null;
         this.§_-NY§ = this.getAttackPoint();
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.getDamage(),true);
            }
         }
      }
      
      private function onRange(param1:Soldier) : Boolean
      {
         var _loc2_:* = new Ellipse(this.§_-NY§.x - this.areaAttackRangeWidth / 2,this.§_-NY§.y - this.§package§ / 2,this.areaAttackRangeWidth,this.§package§);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function getAttackPoint() : Point
      {
         if(this.scaleX == 1)
         {
            return new Point(this.x,this.y);
         }
         return new Point(this.x,this.y);
      }
      
      private function healTargets() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && _loc1_ != this && this.§_-LD§(_loc1_) && this.healingOnRange(_loc1_))
            {
               EnemyCommon(_loc1_).heal(this.healingPoints);
            }
         }
      }
      
      private function §_-LD§(param1:Enemy) : Boolean
      {
         if(param1.health < param1.initHealth)
         {
            return true;
         }
         return false;
      }
      
      private function healingOnRange(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.healingRangeWidth / 2,this.y - this.healingRangeHeight / 2,this.healingRangeWidth,this.healingRangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame24() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame109() : *
      {
         stop();
      }
      
      function frame199() : *
      {
         stop();
      }
      
      function frame216() : *
      {
         stop();
      }
   }
}
