package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyDemonImp extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_Net:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyDemonImp(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(13,this.frame14,27,this.frame28,41,this.frame42,54,this.frame55,65,this.frame66);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-6c§ = param5;
            this.§_-9I§(param3 + 2);
            this.x = param4.x;
            this.y = param4.y;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.level = 1;
         this.canSkeleton = false;
         this.isFlying = this.cRoot.gameSettings.enemies.demonImp.isFlying;
         if(this.isFlying)
         {
            this.canBeBlocked = false;
         }
         this.size = this.cRoot.gameSettings.enemies.demonImp.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.demonImp.health;
         this.speed = this.cRoot.gameSettings.enemies.demonImp.speed;
         this.armor = this.cRoot.gameSettings.enemies.demonImp.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.demonImp.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.demonImp.dodge;
         this.gold = this.cRoot.gameSettings.enemies.demonImp.gold;
         this.cost = this.cRoot.gameSettings.enemies.demonImp.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.demonImp.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.demonImp.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.demonImp.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.demonImp.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.demonImp.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.demonImp.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.demonImp.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(3,-60),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         if(!this.§_-6c§)
         {
            this.getFacing();
         }
         else
         {
            this.§_-Jc§.hide();
            this.isActive = false;
            this.§_-An§ = true;
            this.teleportingTimeCounter = 0;
            this.gotoAndPlay("teleport");
            this.cRoot.game.gameSounds.playVeznanPortalTeleportIn();
         }
         this.§_-NA§ = 23;
         this.§_-C-§ = 78;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "demonimp";
         param1.eName = Locale.loadStringEx("ENEMY_DEMON_IMP_NAME",Locale.getDefaultLang());
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
         this.setDeadBasicStatus(true);
         this.addBlood();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyPuffDead();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame14() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame28() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame42() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame55() : *
      {
         stop();
      }
      
      function frame66() : *
      {
         stop();
      }
   }
}
