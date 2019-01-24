package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySarelgaz extends EnemyCommon
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var effect_HolyStrike:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      private var eating:Boolean;
      
      public function EnemySarelgaz(param1:int, param2:Array)
      {
         addFrameScript(20,this.frame21,40,this.frame41,41,this.frame42,66,this.frame67,94,this.frame95);
         super(param1,param2);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.playMusicBossFight();
         this.cRoot.game.gameEncyclopedia.notificationEnemySarelgaz = true;
         this.cRoot.game.gameEncyclopedia.saveData();
         this.isFlying = this.cRoot.gameSettings.enemies.sarelgaz.isFlying;
         this.isBoss = true;
         this.level = 1;
         this.attackChargeTime = 24;
         this.canPoison = false;
         this.canSkeleton = false;
         this.§_-4q§ = "BloodGreen";
         this.size = this.cRoot.gameSettings.enemies.sarelgaz.size;
         this.health = this.initHealth = this.cRoot.gameSettings.enemies.sarelgaz.health;
         this.speed = this.cRoot.gameSettings.enemies.sarelgaz.speed;
         this.armor = this.cRoot.gameSettings.enemies.sarelgaz.armor;
         this.magicArmor = this.cRoot.gameSettings.enemies.sarelgaz.magicArmor;
         this.dodge = this.cRoot.gameSettings.enemies.sarelgaz.dodge;
         this.gold = this.cRoot.gameSettings.enemies.sarelgaz.gold;
         this.cost = this.cRoot.gameSettings.enemies.sarelgaz.cost;
         this.minDamage = this.cRoot.gameSettings.enemies.sarelgaz.minDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.sarelgaz.maxDamage;
         this.attackReloadTime = this.cRoot.gameSettings.enemies.sarelgaz.attackReloadTime - this.attackChargeTime;
         this.xSoldierAdjust = this.cRoot.gameSettings.enemies.sarelgaz.xSoldierAdjust;
         this.xAdjust = this.cRoot.gameSettings.enemies.sarelgaz.xAdjust;
         this.yAdjust = this.cRoot.gameSettings.enemies.sarelgaz.yAdjust;
         this.nodeMarginError = this.cRoot.gameSettings.enemies.sarelgaz.speed + 0.1;
         this.§_-Jc§ = new §_-Pb§(new Point(0,-100),this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.§_-NA§ = 90;
         this.§_-C-§ = 108;
         this.addEventListener(MouseEvent.CLICK,clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "sarelgaz";
         param1.eName = Locale.loadStringEx("ENEMY_SARELGAZ_NAME",Locale.getDefaultLang());
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.isDead)
         {
            if(this.deadTimeCounter == 0)
            {
               this.gotoAndPlay("dead");
            }
            this.deadTimeCounter++;
            if(this.deadTime == this.deadTimeCounter)
            {
               this.destroyThis();
            }
            return;
         }
         if(this.specialMove())
         {
            return;
         }
         if(this.isDead)
         {
            return;
         }
         this.§ if§();
         if(this.isDead)
         {
            return;
         }
         if(this.isActive && !this.isCharging && this.specialPower())
         {
            return;
         }
         if(this.isBlocked)
         {
            if(!this.eating && (this.soldier == null || !this.soldier.isActive || !this.soldier.isFighting))
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
               this.attack();
               this.gotoAndStop("idle");
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
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyExplodeSpider(new Point(this.x,this.y),this.cRoot));
         this.destroyThis();
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      override public function playAttackSound() : void
      {
         this.cRoot.game.gameSounds.spiderAttack();
      }
      
      override public function chargeAttack() : void
      {
         this.gotoAndPlay("fighting");
         this.isCharging = true;
         this.eating = true;
      }
      
      override protected function readyToDamage() : Boolean
      {
         this.attackChargeTimeCounter++;
         if(this.attackChargeTimeCounter >= this.attackChargeTime)
         {
            this.attackChargeTimeCounter = 0;
            return true;
         }
         if(this.attackChargeTimeCounter == 11)
         {
            this.soldier.eat();
         }
         return false;
      }
      
      override public function attack() : void
      {
         if(Math.random() < 0.3)
         {
            if(this.size < GameSettings.§_-d§)
            {
               if(Math.random() > 0.5)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"sok"));
               }
            }
            else if(Math.random() > 0.5)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"whaam"));
            }
            else
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.soldier.x,this.soldier.y),"kapow"));
            }
         }
         this.eating = false;
         this.playAttackSound();
      }
      
      override public function addBlood() : void
      {
         this.cRoot.addToDecal(new §_-Oz§(new Point(this.x,this.y)));
      }
      
      function frame21() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame41() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame42() : *
      {
         stop();
      }
      
      function frame67() : *
      {
         stop();
      }
      
      function frame95() : *
      {
         stop();
      }
   }
}
