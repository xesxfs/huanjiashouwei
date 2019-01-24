package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyOgre extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyOgre(param1:int, param2:Array)
      {
         addFrameScript(25,this.frame26,51,this.frame52,77,this.frame78,78,this.frame79,102,this.frame103,121,this.frame122,125,this.frame126,144,this.frame145,155,this.frame156);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.level = 1;
         this.attackChargeTime = 27;
         this.isFlying = this.cRoot.gameSettings.enemies.ogre.isFlying;
         if(this.isFlying)
         {
            this.canBeBlocked = false;
         }
         this.size = this.cRoot.gameSettings.enemies.ogre.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.ogre.health;
         this.speed = this.cRoot.gameSettings.enemies.ogre.speed;
         this.armor = this.cRoot.gameSettings.enemies.ogre.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.ogre.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.ogre.dodge;
         this.gold = this.cRoot.gameSettings.enemies.ogre.gold;
         this.cost = this.cRoot.gameSettings.enemies.ogre.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.ogre.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.ogre.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.ogre.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.ogre.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.ogre.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.ogre.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.ogre.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-39),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 30;
         this.§_-C-§ = 51;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "ogre";
         param1.eName = Locale.loadStringEx("ENEMY_OGRE_NAME",Locale.getDefaultLang());
      }
      
      override public function explode() : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus();
         this.addBlood();
      }
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.toGraveyard();
         this.setDeadBasicStatus(true);
         this.cRoot.entities.addChild(new EnemyDesintegrateBig(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
      }
      
      override public function addPolymorph(param1:Enemy) : void
      {
         this.cRoot.entities.addChild(new EnemyPolymorphBig(new Point(this.x,this.y),this.cRoot,param1));
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyBigDead();
      }
      
      function frame26() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame52() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame78() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame79() : *
      {
         stop();
      }
      
      function frame103() : *
      {
         stop();
      }
      
      function frame122() : *
      {
         stop();
      }
      
      function frame126() : *
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
