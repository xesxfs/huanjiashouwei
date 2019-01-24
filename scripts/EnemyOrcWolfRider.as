package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemyOrcWolfRider extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var effect_burn:MovieClip;
      
      public var effect_stun:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemyOrcWolfRider(param1:int, param2:Array)
      {
         addFrameScript(9,this.frame10,19,this.frame20,29,this.frame30,30,this.frame31,44,this.frame45,63,this.frame64,67,this.frame68,85,this.frame86,96,this.frame97);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.isFlying = this.cRoot.gameSettings.enemies.orcWolfRider.isFlying;
         this.level = 1;
         this.deadTime = 15;
         this.canSkeleton = false;
         this.size = this.cRoot.gameSettings.enemies.orcWolfRider.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.orcWolfRider.health;
         this.speed = this.cRoot.gameSettings.enemies.orcWolfRider.speed;
         this.armor = this.cRoot.gameSettings.enemies.orcWolfRider.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.orcWolfRider.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.orcWolfRider.dodge;
         this.gold = this.cRoot.gameSettings.enemies.orcWolfRider.gold;
         this.cost = this.cRoot.gameSettings.enemies.orcWolfRider.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.orcWolfRider.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.orcWolfRider.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.orcWolfRider.attackReloadTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.orcWolfRider.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.orcWolfRider.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.orcWolfRider.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.orcWolfRider.speed + 0.1;
         this.§_-Jc§ = new §_-Ov§(new Point(0,-42),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 14;
         this.§_-C-§ = 18;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "orcrider";
         param1.eName = Locale.loadStringEx("ENEMY_ORC_WOLF_RIDER_NAME",Locale.getDefaultLang());
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
            this.health = 0;
            this.spawnOrcArmored();
            this.toGraveyard();
            this.setDeadBasicStatus(true);
            return;
         }
         this.§_-Jc§.updateProgress(this.health);
         if(param3 != null)
         {
            this.addDebuff(param3);
         }
      }
      
      private function spawnOrcArmored() : void
      {
         var _loc1_:Enemy = new EnemyOrcArmored(this.roadIndex,this.road,this.currentNode,new Point(this.x,this.y - 2));
         this.cRoot.entities.addChild(_loc1_);
         this.cRoot.enemies[_loc1_] = _loc1_;
      }
      
      override public function explode() : void
      {
         this.spawnOrcArmored();
         this.toGraveyard();
         this.setDeadBasicStatus(true);
         this.addBlood();
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.wolfAttack();
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyPuffDead();
      }
      
      override public function addBlood() : void
      {
      }
      
      function frame10() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame20() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame30() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame31() : *
      {
         stop();
      }
      
      function frame45() : *
      {
         stop();
      }
      
      function frame64() : *
      {
         stop();
      }
      
      function frame68() : *
      {
         stop();
      }
      
      function frame86() : *
      {
         stop();
      }
      
      function frame97() : *
      {
         stop();
      }
   }
}
