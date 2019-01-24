package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class TowerArcherMusketeer extends TowerArcher
   {
       
      
      private var sniperMaxLevel:int;
      
      private var sniperCurrentLevel:int = 0;
      
      private var §_-5P§:Boolean;
      
      private var §_-Dr§:Boolean;
      
      private var §_-0G§:Boolean;
      
      private var sniperRangeHeight:int;
      
      private var sniperRangeWidth:int;
      
      private var sniperReloadTime:int;
      
      private var sniperReloadTimeCounter:int;
      
      private var sniperChargeSeekTime:int = 5;
      
      private var sniperChargeSeekTimeCounter:int;
      
      private var sniperChargeCrossTime:int = 18;
      
      private var sniperChargeCrossTimeCounter:int;
      
      private var sniperShootTime:int = 18;
      
      private var sniperShootTimeCounter:int;
      
      private var shrapnelMaxLevel:int;
      
      private var shrapnelCurrentLevel:int = 0;
      
      private var §_-2j§:Boolean;
      
      private var §_-Dl§:int;
      
      private var §_-KH§:int;
      
      private var §_-0z§:int;
      
      private var §_-Fq§:int;
      
      private var §_-L2§:int = 26;
      
      private var §_-QJ§:int;
      
      private var §_-NW§:Point;
      
      private var §_-Am§:Point;
      
      private var §_-1O§:Point;
      
      private var §_-Eu§:Point;
      
      public function TowerArcherMusketeer(param1:int, param2:int, param3:Point, param4:int)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "musketeer";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playMusketeerTaunt();
         this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.musketeer.cost;
         this.cRoot.updateCash(-this.cRoot.gameSettings.archers.musketeer.cost);
         this.building = false;
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.§_-7L§ = 24;
         this.§_-Ce§ = 7;
         this.setBaseSettings(§_-HK§);
         this.§_-GI§(new §_-Nn§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-PX§());
         this.§_-IP§ = new Point(this.x + 6,this.y - 45);
         this.§_-Fl§ = new Point(this.x - 10,this.y - 45);
         this.§_-1O§ = new Point(this.x - 10,this.y - 45);
         this.§_-Eu§ = new Point(this.x - 10,this.y - 45);
         this.cRoot.game.gameAchievement.buildTowerMusketeer(this.cRoot);
         this.cRoot.menu.showTowerInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function pause() : void
      {
         this.getGraphic().shooterRight.stop();
         this.getGraphic().shooterLeft.stop();
         this.§_-f§();
         this.pauseSpecial();
      }
      
      override public function unPause() : void
      {
         if(this.arrowCount % 2)
         {
            this.§_-2z§(MovieClip(this.getGraphic().shooterRight));
         }
         else
         {
            this.§_-2z§(MovieClip(this.getGraphic().shooterLeft));
         }
         this.§_-MJ§();
         this.unPauseSpecial();
      }
      
      private function §_-2z§(param1:MovieClip) : void
      {
         switch(param1.currentFrameLabel)
         {
            case "idleUp":
               break;
            case "idleDown":
               break;
            case "sniperAimDownEnd":
               break;
            case "sniperAimUpEnd":
               break;
            case "sniperSeekDownEnd":
               break;
            case "sniperSeekUpEnd":
               break;
            case "shootDownEnd":
               param1.gotoAndStop("idleDown");
               break;
            case "sniperShootDownEnd":
               param1.gotoAndStop("idleDown");
               break;
            case "sniperSeekHideDownEnd":
               param1.gotoAndStop("idleDown");
               break;
            case "canonFuseDownEnd":
               param1.gotoAndStop("idleDown");
               break;
            case "canonShooterDownEnd":
               param1.gotoAndStop("idleDown");
               break;
            case "shootUpEnd":
               param1.gotoAndStop("idleUp");
               break;
            case "sniperShootUpEnd":
               param1.gotoAndStop("idleUp");
               break;
            case "sniperSeekHideUpEnd":
               param1.gotoAndStop("idleUp");
               break;
            case "canonFuseUpEnd":
               param1.gotoAndStop("idleUp");
               break;
            case "canonShooterUpEnd":
               param1.gotoAndStop("idleUp");
               break;
            default:
               param1.play();
         }
      }
      
      override public function createBullet() : MovieClip
      {
         var _loc1_:Point = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(this.target == null || !this.target.isActive)
         {
            if(!this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
            {
               _loc1_ = new Point(this.arrowDestiny.x,this.arrowDestiny.y);
            }
         }
         if(this.cRoot.game.gameUpgrades.archersUpPrecision && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            if(Math.random() <= 0.1)
            {
               _loc2_ = true;
            }
         }
         if(this.cRoot.game.gameUpgrades.archersUpPiercing && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 3))
         {
            _loc3_ = 10;
         }
         return new Bullet(this.target,_loc1_,this.§_-5P§,this.sniperCurrentLevel,_loc2_,_loc3_);
      }
      
      override public function getBulletInit(param1:MovieClip) : MovieClip
      {
         if(this.arrowCount % 2 == 0 || this.§_-5P§)
         {
            param1.x = this.§_-Fl§.x;
            param1.y = this.§_-Fl§.y;
         }
         else
         {
            param1.x = this.§_-IP§.x;
            param1.y = this.§_-IP§.y;
         }
         return param1;
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_MUSKETEERS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.archers.musketeer.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.archers.musketeer.maxDamage;
         return _loc1_;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_sniper":
               return {
                  "title":Locale.loadStringEx("TOWER_MUSKETEERS_SNIPER_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_MUSKETEERS_SNIPER_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_CHANCE",_loc2_),this.cRoot.gameSettings.archers.musketeer.sniperDamagePercent * this.getNextLevel(this.sniperCurrentLevel,this.sniperMaxLevel) + "%",this.getColorByLevel(this.sniperCurrentLevel,this.sniperMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.archers.musketeer.sniperCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_MUSKETEERS_SNIPER_NOTE",_loc2_)
               };
            case "special_shrapnel":
               return {
                  "title":Locale.loadStringEx("TOWER_MUSKETEERS_SHRAPNEL_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_MUSKETEERS_SHRAPNEL_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.archers.musketeer.shrapnelMinDamage * this.getNextLevel(this.shrapnelCurrentLevel,this.shrapnelMaxLevel) * 5 + "-" + this.cRoot.gameSettings.archers.musketeer.shrapnelMaxDamage * this.getNextLevel(this.shrapnelCurrentLevel,this.shrapnelMaxLevel) * 5,this.getColorByLevel(this.shrapnelCurrentLevel,this.shrapnelMaxLevel)],[Locale.loadStringEx("C_RELOAD",_loc2_),this.cRoot.gameSettings.archers.musketeer.shrapnelCoolDown / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_MUSKETEERS_SHRAPNEL_NOTE",_loc2_)
               };
            default:
               return null;
         }
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_sniper","sp_sniper",this.cRoot.gameSettings.archers.musketeer.sniperCost,false,this.sniperCurrentLevel,this.sniperMaxLevel,this.cRoot.gameSettings.archers.musketeer.sniperCostLevel,1,"TooltipBasic",this.getTooltipParams("special_sniper")),new Array("special_shrapnel","sp_shrapnel",this.cRoot.gameSettings.archers.musketeer.shrapnelCost,false,this.shrapnelCurrentLevel,this.shrapnelMaxLevel,this.cRoot.gameSettings.archers.musketeer.shrapnelCostLevel,2,"TooltipBasic",this.getTooltipParams("special_shrapnel"))));
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "sell":
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis();
               break;
            case "special_sniper":
               this.cRoot.game.gameSounds.playMusketeerSniperTaunt();
               this.sniperCurrentLevel++;
               if(this.sniperCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.musketeer.sniperCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.musketeer.sniperCost);
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.musketeer.sniperCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.musketeer.sniperCostLevel);
               }
               this.§_-5P§ = false;
               this.§_-Dr§ = false;
               this.§_-0G§ = false;
               this.sniperReloadTimeCounter = 0;
               this.sniperChargeSeekTimeCounter = 0;
               this.sniperChargeCrossTimeCounter = 0;
               this.sniperShootTimeCounter = 0;
               break;
            case "special_shrapnel":
               this.cRoot.game.gameSounds.playMusketeerShrapnelTaunt();
               this.shrapnelCurrentLevel++;
               if(this.shrapnelCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.musketeer.shrapnelCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.musketeer.shrapnelCost);
               }
               else
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.musketeer.shrapnelCostLevel;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.musketeer.shrapnelCostLevel);
               }
               this.§_-2j§ = false;
               this.§_-Fq§ = 0;
               this.§_-QJ§ = 0;
         }
      }
      
      override public function runSpecial() : Boolean
      {
         if(this.sniperCurrentLevel != 0 && this.§_-Ok§())
         {
            return true;
         }
         if(this.shrapnelCurrentLevel != 0 && this.§_-3a§())
         {
            return true;
         }
         return false;
      }
      
      override public function runSpecialTimers() : void
      {
         if(this.sniperCurrentLevel != 0)
         {
            this.sniperReloadTimeCounter++;
         }
         if(this.shrapnelCurrentLevel != 0)
         {
            this.§_-Fq§++;
         }
      }
      
      private function §_-Ok§() : Boolean
      {
         if(this.§_-2j§)
         {
            return false;
         }
         if(!this.§_-5P§)
         {
            if(this.sniperReloadTimeCounter < this.sniperReloadTime)
            {
               return false;
            }
            if(!this.findNewSniperTarget(this.cRoot.gameSettings.enemyMaxLevel))
            {
               return false;
            }
            this.§_-5P§ = true;
            this.§_-Ms§();
            if(this.target.y >= this.y)
            {
               this.getGraphic().shooterRight.gotoAndPlay("sniperSeekDown");
            }
            else
            {
               this.getGraphic().shooterRight.gotoAndPlay("sniperSeekUp");
            }
         }
         if(!this.§_-Dr§)
         {
            if(this.sniperChargeSeekTimeCounter < this.sniperChargeSeekTime)
            {
               this.sniperChargeSeekTimeCounter++;
               return true;
            }
            if(this.target != null && this.target.isActive)
            {
               MovieClip(this.target).effect_Sniper.play();
               this.§_-Dr§ = true;
            }
            else
            {
               if(!this.findNewSniperTarget(this.cRoot.gameSettings.enemyMaxLevel))
               {
                  this.sniperChargeSeekTimeCounter = 0;
                  this.§_-Dr§ = false;
                  this.§_-5P§ = false;
                  this.§_-Nw§ = false;
                  return true;
               }
               this.§_-Dr§ = true;
               this.§_-Ms§();
               this.sniperChargeSeekTimeCounter = 0;
            }
         }
         if(!this.§_-0G§)
         {
            if(this.sniperChargeCrossTimeCounter < this.sniperChargeCrossTime)
            {
               this.sniperChargeCrossTimeCounter++;
               this.§_-Ms§();
               return true;
            }
            if(this.target == null || !this.target.isActive)
            {
               this.findNewSniperTarget(this.cRoot.gameSettings.enemyMaxLevel);
            }
            this.sniperShootTimeCounter = 0;
            this.§_-0G§ = true;
            if(this.target != null && this.target.isActive)
            {
               this.§_-Ms§();
               this.shoot();
               if(this.target.y >= this.y)
               {
                  this.getGraphic().shooterLeft.gotoAndPlay("sniperShootDown");
                  this.getGraphic().shooterRight.gotoAndPlay("sniperSeekHideDown");
               }
               else
               {
                  this.getGraphic().shooterLeft.gotoAndPlay("sniperShootUp");
                  this.getGraphic().shooterRight.gotoAndPlay("sniperSeekHideUp");
               }
            }
         }
         if(this.sniperShootTimeCounter < this.sniperShootTime)
         {
            this.sniperShootTimeCounter++;
            return true;
         }
         this.§_-5P§ = false;
         this.§_-Nw§ = false;
         this.§_-Dr§ = false;
         this.§_-0G§ = false;
         this.reloadTimeCounter = 0;
         this.sniperReloadTimeCounter = 0;
         this.sniperChargeSeekTimeCounter = 0;
         this.sniperChargeCrossTimeCounter = 0;
         this.sniperShootTimeCounter = 0;
         this.arrowCount++;
         return true;
      }
      
      private function §_-Ms§() : void
      {
         if(this.target.y >= this.y)
         {
            this.getGraphic().shooterLeft.gotoAndPlay("sniperAimDown");
         }
         else
         {
            this.getGraphic().shooterLeft.gotoAndPlay("sniperAimUp");
         }
         if(this.target.x >= this.x)
         {
            this.getGraphic().shooterLeft.scaleX = 1;
            this.getGraphic().shooterRight.scaleX = 1;
         }
         else
         {
            this.getGraphic().shooterLeft.scaleX = -1;
            this.getGraphic().shooterRight.scaleX = -1;
         }
      }
      
      private function §_-3a§() : Boolean
      {
         if(this.§_-5P§)
         {
            return false;
         }
         if(!this.§_-2j§)
         {
            if(this.§_-Fq§ < this.§_-0z§)
            {
               return false;
            }
            if(!this.findNewShrapnelTarget(this.cRoot.gameSettings.enemyMaxLevel))
            {
               return false;
            }
            this.§_-2j§ = true;
            this.§_-Nw§ = true;
            if(this.§_-NW§.y >= this.y)
            {
               this.getGraphic().shooterLeft.gotoAndPlay("canonShooterDown");
               this.getGraphic().shooterRight.gotoAndPlay("canonFuseDown");
               this.§_-Am§ = this.§_-1O§;
            }
            else
            {
               this.getGraphic().shooterLeft.gotoAndPlay("canonShooterUp");
               this.getGraphic().shooterRight.gotoAndPlay("canonFuseUp");
               this.§_-Am§ = this.§_-Eu§;
            }
            if(this.§_-NW§.x >= this.x)
            {
               this.getGraphic().shooterLeft.scaleX = 1;
            }
            else
            {
               this.getGraphic().shooterLeft.scaleX = -1;
            }
            this.getGraphic().shooterRight.scaleX = 1;
         }
         if(this.§_-QJ§ < this.§_-L2§)
         {
            this.§_-QJ§++;
            if(this.§_-QJ§ == 16)
            {
               this.§_-NG§();
            }
            return true;
         }
         this.§_-2j§ = false;
         this.§_-Nw§ = false;
         this.reloadTimeCounter = 0;
         this.§_-Fq§ = 0;
         this.§_-QJ§ = 0;
         this.arrowCount++;
         return true;
      }
      
      private function §_-NG§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.cRoot.bullets.addChild(new TowerArcherMusketeerShrapnelSmoke(this.§_-Am§,this.§_-NW§,this.cRoot));
         while(_loc1_ <= 360)
         {
            _loc2_ = Math.random() * 40 + 25;
            _loc3_ = _loc2_ * 0.7;
            this.cRoot.bullets.addChild(new BombShrapnel(this.shrapnelCurrentLevel,this.§_-Am§,this.getDestinationPoint(_loc1_,_loc2_,_loc3_)));
            _loc1_ = _loc1_ + 70;
         }
      }
      
      private function findNewSniperTarget(param1:int) : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc2_:Enemy = null;
         this.target = null;
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && !_loc3_.isBoss && _loc3_.level <= param1 && this.§_-Pv§(_loc3_,this.sniperRangeWidth,this.sniperRangeHeight))
            {
               if(_loc2_ == null || this.§_-ET§(_loc2_,_loc3_))
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         if(_loc2_ != null)
         {
            this.target = _loc2_;
            return true;
         }
         return false;
      }
      
      private function findNewShrapnelTarget(param1:int) : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc2_:Enemy = null;
         this.target = null;
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && _loc3_.level <= param1 && !_loc3_.isFlying && this.§_-Pv§(_loc3_,this.§_-KH§,this.§_-Dl§))
            {
               if(_loc2_ == null || this.§_-ET§(_loc2_,_loc3_))
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         if(_loc2_ != null)
         {
            this.§_-NW§ = _loc2_.road[_loc2_.currentNode + 2];
            return true;
         }
         return false;
      }
      
      protected function getDestinationPoint(param1:int, param2:int, param3:int) : Point
      {
         var _loc4_:* = new Ellipse(this.§_-NW§.x - param2 / 2,this.§_-NW§.y - param3 / 2,param2,param3);
         return _loc4_.getPointOfDegree(param1);
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.archers.musketeer.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.archers.musketeer.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.archers.musketeer.range;
         this.§_-0z§ = this.cRoot.gameSettings.archers.musketeer.shrapnelCoolDown;
         this.shrapnelMaxLevel = this.cRoot.gameSettings.archers.musketeer.shrapnelLevels;
         this.§_-Dl§ = this.rangeHeight * this.cRoot.gameSettings.archers.musketeer.shrapnelRange;
         this.§_-KH§ = this.rangeWidth * this.cRoot.gameSettings.archers.musketeer.shrapnelRange;
         this.sniperReloadTime = this.cRoot.gameSettings.archers.musketeer.sniperCoolDown;
         this.sniperMaxLevel = this.cRoot.gameSettings.archers.musketeer.sniperLevels;
         this.sniperRangeHeight = this.rangeHeight * this.cRoot.gameSettings.archers.musketeer.sniperRange;
         this.sniperRangeWidth = this.rangeWidth * this.cRoot.gameSettings.archers.musketeer.sniperRange;
      }
   }
}
