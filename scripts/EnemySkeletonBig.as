package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySkeletonBig extends EnemyCommon
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
      
      public function EnemySkeletonBig(param1:int, param2:Array, param3:int, param4:Point, param5:Boolean = false)
      {
         addFrameScript(15,this.frame16,31,this.frame32,47,this.frame48,48,this.frame49,67,this.frame68,86,this.frame87,91,this.frame92,124,this.frame125,144,this.frame145,155,this.frame156);
         super(param1,param2);
         this.§_-9I§(param3);
         this.x = param4.x;
         this.y = param4.y;
         this.§_-5Z§ = param5;
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isActive = true;
         this.isFlying = this.cRoot.gameSettings.enemies.skeletonBig.isFlying;
         this.level = 1;
         this.canSkeleton = false;
         this.§_-0f§ = false;
         this.canPoison = false;
         this.attackChargeTime = 20;
         this.isActive = false;
         this.isRespawning = true;
         this.respawnTime = 32;
         this.§_-4q§ = "BloodGrey";
         this.size = this.cRoot.gameSettings.enemies.skeletonBig.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.skeletonBig.health;
         this.speed = this.cRoot.gameSettings.enemies.skeletonBig.speed;
         this.armor = this.cRoot.gameSettings.enemies.skeletonBig.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.skeletonBig.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.skeletonBig.dodge;
         if(this.§_-5Z§)
         {
            this.gold = 0;
            this.cRoot.currentSkeletons++;
         }
         else
         {
            this.gold = this.cRoot.gameSettings.enemies.skeletonBig.gold;
         }
         this.cost = this.cRoot.gameSettings.enemies.skeletonBig.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.skeletonBig.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.skeletonBig.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.skeletonBig.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.skeletonBig.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.skeletonBig.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.skeletonBig.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.skeletonBig.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-32),this.health,this.initHealth);
         this.gotoAndPlay("respawning");
         this.§_-NA§ = 23;
         this.§_-C-§ = 29;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "skeletonbig";
         param1.eName = Locale.loadStringEx("ENEMY_SKELETON_BIG_NAME",Locale.getDefaultLang());
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
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyDesintegrateBig(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
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
         if(this.gold == 0)
         {
            this.cRoot.currentSkeletons--;
         }
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
      
      function frame16() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame32() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame48() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame49() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         stop();
      }
      
      function frame87() : *
      {
         stop();
      }
      
      function frame92() : *
      {
         stop();
      }
      
      function frame125() : *
      {
         stop();
      }
      
      function frame145() : *
      {
         stop();
      }
      
      function frame156() : *
      {
         stop();
      }
   }
}
