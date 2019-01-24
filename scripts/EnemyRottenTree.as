package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyRottenTree extends EnemyCommon
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
      
      public function EnemyRottenTree(param1:int, param2:Array, param3:int = 0, param4:Point = null, param5:Boolean = false)
      {
         addFrameScript(15,this.frame16,31,this.frame32,47,this.frame48,48,this.frame49,69,this.frame70,85,this.frame86,90,this.frame91,126,this.frame127,136,this.frame137,147,this.frame148);
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
         this.isFlying = this.cRoot.gameSettings.enemies.rottenTree.isFlying;
         this.level = 1;
         this.attackChargeTime = 21;
         this.§_-4q§ = "BloodGrey";
         this.size = this.cRoot.gameSettings.enemies.rottenTree.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.rottenTree.health;
         this.speed = this.cRoot.gameSettings.enemies.rottenTree.speed;
         this.armor = this.cRoot.gameSettings.enemies.rottenTree.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.rottenTree.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.rottenTree.dodge;
         if(this.§_-5Z§)
         {
            this.gold = 0;
         }
         else
         {
            this.gold = this.cRoot.gameSettings.enemies.rottenTree.gold;
         }
         this.cost = this.cRoot.gameSettings.enemies.skeleton.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.rottenTree.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.rottenTree.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.rottenTree.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.rottenTree.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.rottenTree.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.rottenTree.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.rottenTree.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-48),this.health,this.initHealth);
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
         this.§_-NA§ = 32;
         this.§_-C-§ = 48;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "rottentree";
         param1.eName = Locale.loadStringEx("ENEMY_ROTTEN_TREE_NAME",Locale.getDefaultLang());
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
      
      function frame70() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame91() : *
      {
         stop();
      }
      
      function frame127() : *
      {
         stop();
      }
      
      function frame137() : *
      {
         stop();
      }
      
      function frame148() : *
      {
         stop();
      }
   }
}
