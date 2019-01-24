package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyZombie extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var §_-5Z§:Boolean;
      
      public function EnemyZombie(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(22,this.frame23,46,this.frame47,70,this.frame71,71,this.frame72,92,this.frame93,110,this.frame111,115,this.frame116,148,this.frame149,169,this.frame170,180,this.frame181);
         super(param1,param2);
         if(param4 != null)
         {
            this.§_-9I§(param3);
            this.x = param4.x;
            this.y = param4.y;
            this.§_-5Z§ = param5;
            this.isActive = false;
            this.isRespawning = true;
            this.respawnTime = 32;
         }
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.zombie.isFlying;
         this.level = 1;
         this.attackChargeTime = 20;
         this.§_-4q§ = "BloodGrey";
         this.size = this.cRoot.gameSettings.enemies.zombie.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.zombie.health;
         this.speed = this.cRoot.gameSettings.enemies.zombie.speed;
         this.armor = this.cRoot.gameSettings.enemies.zombie.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.zombie.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.zombie.dodge;
         if(this.§_-5Z§)
         {
            this.gold = 0;
         }
         else
         {
            this.gold = this.cRoot.gameSettings.enemies.zombie.gold;
         }
         this.cost = this.cRoot.gameSettings.enemies.zombie.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.zombie.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.zombie.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.skeleton.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.zombie.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.zombie.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.zombie.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.zombie.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(new Point(0,-28),this.health,this.initHealth);
         if(this.isRespawning)
         {
            this.§_-HB§();
            this.gotoAndPlay("respawning");
         }
         else
         {
            this.addChild(§_-Jc§);
            this.§_-R2§ = "";
            this.getFacing();
         }
         this.§_-NA§ = 16;
         this.§_-C-§ = 28;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "rottenzombie";
         param1.eName = Locale.loadStringEx("ENEMY_ZOMBIE_NAME",Locale.getDefaultLang());
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
            case "respawningEnd":
               break;
            case "thorEnd":
               break;
            case "thorFreeEnd":
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
      
      override public function explode() : void
      {
         this.setDeadBasicStatus(true);
      }
      
      override public function addBlood() : void
      {
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playSkeletonDeadSound();
      }
      
      override public function destroyThis() : void
      {
         this.§_-BN§(false);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,clickEvents);
         this.removeFromList();
         if(this.contains(this.§_-Jc§))
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
      
      function frame23() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame47() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame71() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame72() : *
      {
         stop();
      }
      
      function frame93() : *
      {
         stop();
      }
      
      function frame111() : *
      {
         stop();
      }
      
      function frame116() : *
      {
         stop();
      }
      
      function frame149() : *
      {
         stop();
      }
      
      function frame170() : *
      {
         stop();
      }
      
      function frame181() : *
      {
         stop();
      }
   }
}
