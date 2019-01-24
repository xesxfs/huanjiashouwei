package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyTroll extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_rage:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyTroll(param1:int, param2:Array)
      {
         addFrameScript(21,this.frame22,43,this.frame44,65,this.frame66,66,this.frame67,78,this.frame79,97,this.frame98,101,this.frame102,115,this.frame116,126,this.frame127);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.troll.isFlying;
         this.level = 1;
         this.attackChargeTime = 12;
         this.size = this.cRoot.gameSettings.enemies.troll.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.troll.health;
         this.speed = this.cRoot.gameSettings.enemies.troll.speed;
         this.armor = this.cRoot.gameSettings.enemies.troll.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.troll.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.troll.dodge;
         this.gold = this.cRoot.gameSettings.enemies.troll.gold;
         this.cost = this.cRoot.gameSettings.enemies.troll.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.troll.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.troll.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.troll.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.troll.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.troll.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.troll.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.troll.speed + 0.1;
         this.§_-KS§ = true;
         this.§_-Lq§ = true;
         this.§_-AD§ = 0;
         this.regenerateTime = this.cRoot.gameSettings.enemies.troll.regenerateTime;
         this.regenerateHealPoints = this.cRoot.gameSettings.enemies.troll.regenerateHealPoints;
         this.§_-Jc§ = new §_-H8§(new Point(0,-26),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 15;
         this.§_-C-§ = 26;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "troll";
         param1.eName = Locale.loadStringEx("ENEMY_TROLL_NAME",Locale.getDefaultLang());
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
            MovieClip(this).debuff_rage.stop();
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
            if(MovieClip(this).debuff_rage.currentFrameLabel != "off")
            {
               MovieClip(this).debuff_rage.play();
            }
            else if(MovieClip(this).debuff_rage.currentFrameLabel == "onEnd")
            {
               MovieClip(this).debuff_rage.gotoAndPlay("on");
            }
         }
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyTrollDeadSound();
      }
      
      function frame22() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame44() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame66() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame67() : *
      {
         stop();
      }
      
      function frame79() : *
      {
         stop();
      }
      
      function frame98() : *
      {
         stop();
      }
      
      function frame102() : *
      {
         stop();
      }
      
      function frame116() : *
      {
         stop();
      }
      
      function frame127() : *
      {
         stop();
      }
   }
}
