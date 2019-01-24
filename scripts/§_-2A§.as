package
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-2A§ extends §_-Ol§
   {
       
      
      public var level:int;
      
      public var §_-IH§:int;
      
      protected var xpMultiplier:Number;
      
      protected var §_-9h§:Number;
      
      protected var §_-LI§:Number;
      
      protected var §_-La§:Boolean;
      
      protected var §_-EZ§:int;
      
      protected var §_-Hk§:int;
      
      protected var §_-L3§:int;
      
      public var portrait:§_-Jx§;
      
      public var §_-Gv§:String;
      
      public var path:Array;
      
      public var §_-Js§:int;
      
      public function §_-2A§(param1:Point, param2:Point, param3:Tower, param4:Point, param5:int = 0)
      {
         this.path = [];
         super(param1,param2,param3,param4,param5);
         this.§_-Na§ = true;
      }
      
      protected function §_-DH§() : void
      {
         this.portrait = new §_-Jx§(this,this.cRoot);
         this.cRoot.heroPortrait = this.portrait;
         this.cRoot.hud.addChild(this.portrait);
      }
      
      override protected function respawn() : *
      {
         this.isActive = true;
         this.isDead = false;
         this.isRespawning = false;
         this.isWalking = true;
         this.isCharging = false;
         this.isBlocking = false;
         this.isFighting = false;
         this.isIdle = false;
         this.canBeCourage = false;
         if(this.lifes == 2)
         {
            this.destinationPoint.x = this.rallyPoint.x;
            this.destinationPoint.y = this.rallyPoint.y;
         }
         this.health = this.initHealth;
         this.§_-Jc§.show();
         this.updateLifebarProgress();
         this.deadTimeCounter = 0;
         this.respawnTimeCounter = 0;
         this.respawnCustom();
         this.animationRun();
      }
      
      override protected function readyToRespawn() : Boolean
      {
         this.deadTimeCounter++;
         if(this.deadTimeCounter >= this.deadTime)
         {
            this.isDead = false;
            this.doorQueed = false;
            this.isRespawning = true;
            this.visible = true;
            this.gotoAndPlay("respawning");
            this.§_-l§();
            this.lifes++;
            this.portrait.endLoading();
            return true;
         }
         this.portrait.updateLoading(this.deadTime,this.deadTimeCounter);
         return false;
      }
      
      override public function changeRallyPoint(param1:Point) : void
      {
         this.rallyPoint = param1;
         this.rangePoint = param1;
         if(this.isDead || this.isRespawning)
         {
            return;
         }
         this.isActive = false;
         this.§_-Mw§();
         this.setGoToIdleStatus();
         this.stopSpecial();
         this.getMyPath();
         this.playTaunt();
      }
      
      override protected function clickEvents(param1:MouseEvent) : void
      {
         if(this.cRoot.soldierSelection.soldier == this)
         {
            return;
         }
         this.§_-48§();
      }
      
      public function §_-48§() : void
      {
         this.cRoot.freeMenues();
         this.cRoot.soldierSelection.setSoldier(this);
         this.cRoot.menu.showSoldierInfo(this);
         this.cRoot.heroRallyPoint = new §_-9c§(this.cRoot,this);
         this.cRoot.bullets.addChild(this.cRoot.heroRallyPoint);
         this.portrait.§_-48§();
      }
      
      protected function §_-l§() : void
      {
         this.cRoot.game.gameSounds.playHeroLevelUp();
      }
      
      protected function playTaunt() : void
      {
      }
      
      override public function updateLifebarProgress() : void
      {
         this.§_-Jc§.updateProgress(this.health);
         this.portrait.updateHealth();
      }
      
      public function §_-BF§(param1:int) : void
      {
         this.§_-IH§ = this.§_-IH§ + param1;
         this.portrait.updateXp();
         if(this.level == 10)
         {
            return;
         }
         var _loc2_:int = this.cRoot.gameSettings.heroes.masterTable.masterXp[this.level];
         if(this.§_-IH§ >= _loc2_)
         {
            this.level = this.level + 1;
            this.levelUpWithAnimation(true);
            this.portrait.updateLevel();
            if(this.level == 5)
            {
               this.cRoot.game.gameAchievement.heroReachMedium(this.cRoot);
            }
            else if(this.level == 10)
            {
               this.cRoot.game.gameAchievement.heroReachHard(this.cRoot);
            }
            this.§_-BF§(0);
         }
      }
      
      override protected function hitEnemy() : void
      {
         var _loc1_:int = 0;
         if(this.enemy == null || !this.enemy.isActive)
         {
            this.§_-Mw§();
            this.setGoToIdleStatus();
            return;
         }
         if(!this.enemy.dodgeAttack())
         {
            if(Math.random() < 0.3)
            {
               if(Math.random() > 0.5)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y + this.enemy.yAdjust),"pow"));
               }
               else
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.enemy.x,this.enemy.y + this.enemy.yAdjust),"sok"));
               }
            }
            _loc1_ = this.getDamage();
            this.gainXpByDamage(this.enemy.getArmorDamage(this.cRoot.gameSettings.P_ARMOR,_loc1_,0));
            this.enemy.setDamage(_loc1_,this.cRoot.gameSettings.P_ARMOR);
            if(!this.enemy.isActive)
            {
               if(this.enemy.isDead)
               {
                  this.§_-Mm§(this.enemy.initHealth);
               }
               this.§_-Mw§();
            }
         }
      }
      
      protected function gainXpByDamage(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         this.§_-BF§(param1 * this.xpMultiplier);
      }
      
      protected function §_-Mm§(param1:int) : void
      {
         var _loc2_:int = param1 * 20 / 100;
         if(_loc2_ < 1)
         {
            _loc2_ = 1;
         }
         this.§_-BF§(_loc2_);
      }
      
      protected function §_-7U§(param1:int, param2:int) : void
      {
         if(param1 == 1)
         {
            this.§_-BF§(50 * param2 * this.§_-9h§);
         }
         else
         {
            this.§_-BF§(50 * param2 * this.§_-LI§);
         }
      }
      
      override protected function runSpecial() : Boolean
      {
         if(this.§_-La§)
         {
            this.§_-AF§();
            return true;
         }
         return false;
      }
      
      protected function §_-AF§() : Boolean
      {
         if(this.§_-Hk§ < this.§_-EZ§)
         {
            this.§_-Hk§++;
            if(this.§_-Hk§ == this.§_-L3§)
            {
               this.cRoot.game.gameSounds.playHeroLevelUp();
            }
            return true;
         }
         this.§_-La§ = false;
         this.§_-Hk§ = 0;
         this.§_-J9§();
         return true;
      }
      
      protected function levelUpWithAnimation(param1:Boolean) : void
      {
         this.stopSpecial();
         this.gotoAndPlay("lvlUp");
         this.§_-La§ = true;
         this.§_-Hk§ = 0;
         this.portrait.addChild(new MenuUpgradeItemBuyAnim(new Point(0,2)));
      }
      
      override public function afterDamage() : void
      {
         this.portrait.updateHealth();
      }
      
      override public function stopOnDead() : void
      {
         this.portrait.§_-1t§();
         this.stopSpecial();
         this.portrait.§_-HS§();
      }
      
      override protected function walk() : Boolean
      {
         if(this.path == null || this.path.length == 0)
         {
            return super.walk();
         }
         if(this.§_-IW§(this.path[this.§_-Js§ - 1].getNodeRealPosition()))
         {
            this.§_-Js§--;
            if(this.§_-Js§ - 1 == 0)
            {
               this.path = [];
               this.path = null;
               this.§_-Js§ = 0;
               return super.walk();
            }
         }
         var _loc1_:§_-Ts§ = this.path[this.§_-Js§ - 1];
         var _loc2_:Point = _loc1_.getNodeRealPosition();
         var _loc3_:Number = Math.atan2(_loc2_.y - this.y,_loc2_.x - this.x);
         if(_loc2_.x >= this.x)
         {
            this.scaleX = 1;
            this.§_-Jc§.flip(1);
         }
         else
         {
            this.scaleX = -1;
            this.§_-Jc§.flip(-1);
         }
         this.x = this.x + Math.cos(_loc3_) * this.speed;
         this.y = this.y + Math.sin(_loc3_) * this.speed;
         this.evalRunningEnd();
         return false;
      }
      
      protected function §_-IW§(param1:Point) : Boolean
      {
         if(Math.sqrt(Math.pow(param1.y - this.y,2) + Math.pow(param1.x - this.x,2)) <= this.speed)
         {
            return true;
         }
         return false;
      }
      
      protected function getMyPath() : void
      {
         var _loc1_:§_-Ts§ = null;
         var _loc2_:§_-Ts§ = null;
         _loc1_ = this.cRoot.pathFinder.grid.getNodeAtPosition(new Point(Math.round(this.x / 12.5),Math.round(this.y / 12.5)));
         _loc2_ = this.cRoot.pathFinder.grid.getNodeAtPosition(new Point(Math.round(this.rangePoint.x / 12.5),Math.round(this.rangePoint.y / 12.5)));
         if(_loc1_ == null || _loc2_ == null)
         {
            return;
         }
         this.cRoot.pathFinder.grid.startNode = _loc1_;
         this.cRoot.pathFinder.grid.endNode = _loc2_;
         if(this.cRoot.pathFinder.findPath())
         {
            if(this.cRoot.pathFinder.path.length > 2)
            {
               this.path = this.cRoot.pathFinder.path;
               this.§_-Js§ = this.path.length - 1;
            }
         }
         else
         {
            this.path = null;
            this.§_-Js§ = 0;
         }
      }
      
      override public function eat() : void
      {
         super.eat();
         this.stopOnDead();
      }
      
      override public function toSwamp() : void
      {
      }
      
      override public function tsung(param1:Point) : void
      {
         super.tsung(param1);
         this.stopOnDead();
      }
   }
}
