package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerArcher extends Tower
   {
      
      public static const §_-5C§:int = 0;
      
      public static const §_-KC§:int = 1;
      
      public static const §_-S§:int = 2;
      
      public static const §_-AC§:int = 3;
      
      public static const §class§:int = 4;
      
      public static const §_-HK§:int = 5;
       
      
      public var charging:Boolean = false;
      
      public var §_-7L§:int = 8;
      
      public var §_-Ce§:int = 6;
      
      public var §_-BL§:int = 0;
      
      public var arrowCount:int = 0;
      
      public var idleTime:int;
      
      public var idleTimeCounter:int;
      
      public var onPause:Boolean;
      
      public var arrowDestiny:Point;
      
      public function TowerArcher(param1:int, param2:int, param3:Point, param4:String = "")
      {
         this.arrowDestiny = new Point();
         super(param1,param2,param3,param4);
         this.§_-3F§ = "archer";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.§_-Ce§ = 7;
         if(this.preMadeLevel == "")
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.level1.cost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.archers.level1.cost);
            this.building = true;
            this.buildingTime = this.cRoot.gameSettings.buildingTime;
            this.§_-2I§ = 0;
            this.§_-GI§(new §_-Hr§());
            this.§_-FH§ = new §_-NQ§(-17,-41,this.buildingTime);
            this.getGraphic().addChild(this.§_-FH§);
         }
         else
         {
            this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
            this.building = false;
            this.upgradeTower(this.preMadeLevel);
         }
         this.§_-IP§ = new Point(this.x + 5,this.y - 45);
         this.§_-Fl§ = new Point(this.x - 9,this.y - 45);
         this.§_-RT§(new §_-Dz§());
         this.addEventListener(MouseEvent.ROLL_OVER,rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,rollOutEvents,false,0,true);
      }
      
      override public function onFrameUpdate() : void
      {
         if(this.isDisabled)
         {
            return;
         }
         if(this.§_-OW§())
         {
            return;
         }
         this.§ if§();
         this.runSpecialTimers();
         if(this.charging)
         {
            this.§_-BL§++;
            if(this.§_-BL§ == this.§_-7L§)
            {
               this.§_-BL§ = 0;
               this.charging = false;
            }
            if(this.§_-BL§ == this.§_-Ce§)
            {
               this.shoot();
            }
         }
         else
         {
            this.§_-Ac§();
            if(this.§_-Nw§)
            {
               if(this.runSpecial())
               {
                  return;
               }
               if(this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
               {
                  this.§_-3g§();
               }
               else
               {
                  this.playIdle();
               }
            }
         }
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         if(this.arrowCount % 2)
         {
            if(MovieClip(this.getGraphic().shooterRight).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().shooterRight).currentFrameLabel != "idleDown")
            {
               this.getGraphic().shooterRight.stop();
            }
         }
         else if(MovieClip(this.getGraphic().shooterLeft).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().shooterLeft).currentFrameLabel != "idleDown")
         {
            this.getGraphic().shooterLeft.stop();
         }
         this.§_-f§();
         this.pauseSpecial();
      }
      
      public function pauseSpecial() : void
      {
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(this.arrowCount % 2)
         {
            if(MovieClip(this.getGraphic().shooterRight).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().shooterRight).currentFrameLabel != "idleDown")
            {
               this.getGraphic().shooterRight.play();
            }
         }
         else if(MovieClip(this.getGraphic().shooterLeft).currentFrameLabel != "idleUp" && MovieClip(this.getGraphic().shooterLeft).currentFrameLabel != "idleDown")
         {
            this.getGraphic().shooterLeft.play();
         }
         this.§_-MJ§();
         this.unPauseSpecial();
      }
      
      public function unPauseSpecial() : void
      {
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_ARCHERS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         this.getDamageInfo(_loc1_);
         return _loc1_;
      }
      
      public function runSpecial() : Boolean
      {
         return false;
      }
      
      public function runSpecialTimers() : void
      {
      }
      
      override public function shoot() : void
      {
         var _loc1_:MovieClip = this.createBullet();
         _loc1_ = this.getBulletInit(_loc1_);
         this.cRoot.bullets.addChild(_loc1_);
         _loc1_ = null;
         this.shootsTotal++;
      }
      
      public function getBulletInit(param1:MovieClip) : MovieClip
      {
         if(this.arrowCount % 2)
         {
            param1.x = this.§_-IP§.x;
            param1.y = this.§_-IP§.y;
         }
         else
         {
            param1.x = this.§_-Fl§.x;
            param1.y = this.§_-Fl§.y;
         }
         return param1;
      }
      
      public function §_-EJ§(param1:Point) : void
      {
      }
      
      public function §_-3g§() : void
      {
         var _loc1_:MovieClip = null;
         this.arrowCount++;
         if(this.arrowCount % 2)
         {
            _loc1_ = this.getGraphic().shooterRight;
         }
         else
         {
            _loc1_ = this.getGraphic().shooterLeft;
         }
         if(this.target.x >= this.x)
         {
            _loc1_.scaleX = 1;
         }
         else
         {
            _loc1_.scaleX = -1;
         }
         if(this.target.y >= this.y)
         {
            _loc1_.gotoAndStop("shootDown");
         }
         else
         {
            _loc1_.gotoAndStop("shootUp");
         }
         _loc1_.play();
         this.§_-Nw§ = false;
         this.charging = true;
         this.idleTimeCounter = 0;
         this.arrowDestiny.x = target.x;
         this.arrowDestiny.y = target.y;
      }
      
      public function createBullet() : MovieClip
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
         return new Arrow(this.level,this.target,_loc1_,null,0,_loc2_,_loc3_);
      }
      
      public function playIdle() : void
      {
         this.idleTimeCounter++;
         if(this.idleTimeCounter == this.idleTime)
         {
            MovieClip(this.getGraphic().shooterLeft).gotoAndStop("idleDown");
            MovieClip(this.getGraphic().shooterRight).gotoAndStop("idleDown");
         }
      }
      
      override public function checkMenuRollOverAction(param1:String) : void
      {
         switch(param1)
         {
            case "level_1":
               this.showRangeNew(this.cRoot.gameSettings.archers.level1.range,this.cRoot.gameSettings.archers.level1.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_2":
               this.showRangeNew(this.cRoot.gameSettings.archers.level2.range,this.cRoot.gameSettings.archers.level2.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_3":
               this.showRangeNew(this.cRoot.gameSettings.archers.level3.range,this.cRoot.gameSettings.archers.level3.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_musketeer":
               this.showRangeNew(this.cRoot.gameSettings.archers.musketeer.range,this.cRoot.gameSettings.archers.musketeer.range * this.cRoot.gameSettings.rangeRatio);
               break;
            case "level_ranger":
               this.showRangeNew(this.cRoot.gameSettings.archers.ranger.range,this.cRoot.gameSettings.archers.ranger.range * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         var _loc1_:String = Locale.getDefaultLang();
         switch(this.level)
         {
            case §_-KC§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.cRoot.gameSettings.archers.level2.cost,this.cRoot.isTowerLocked(GameSettings.§_-U§,2),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.archers.level2.minDamage + "-" + this.cRoot.gameSettings.archers.level2.maxDamage,this.getColor(this.cRoot.gameSettings.archers.level1.maxDamage,this.cRoot.gameSettings.archers.level2.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.archers.level2.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.archers.level1.reload,this.cRoot.gameSettings.archers.level2.reload,true)]]
               })));
               break;
            case §_-S§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.cRoot.gameSettings.archers.level3.cost,this.cRoot.isTowerLocked(GameSettings.§_-U§,3),0,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.archers.level3.minDamage + "-" + this.cRoot.gameSettings.archers.level3.maxDamage,this.getColor(this.cRoot.gameSettings.archers.level2.maxDamage,this.cRoot.gameSettings.archers.level3.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.archers.level3.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.archers.level2.reload,this.cRoot.gameSettings.archers.level3.reload,true)]]
               })));
               break;
            case §_-AC§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_musketeer","tw_riflemen",this.cRoot.gameSettings.archers.musketeer.cost,this.cRoot.isTowerLocked(GameSettings.§_-U§,5),0,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_MUSKETEERS_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_MUSKETEERS_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.archers.musketeer.minDamage + "-" + this.cRoot.gameSettings.archers.musketeer.maxDamage,this.getColor(this.cRoot.gameSettings.archers.level3.maxDamage,this.cRoot.gameSettings.archers.musketeer.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.archers.musketeer.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.archers.level3.reload,this.cRoot.gameSettings.archers.musketeer.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_MUSKETEERS_SNIPER_NAME",_loc1_),Locale.loadStringEx("TOWER_MUSKETEERS_SHRAPNEL_NAME",_loc1_)]
               }),new Array("level_ranger","tw_sharpshooter",this.cRoot.gameSettings.archers.ranger.cost,this.cRoot.isTowerLocked(GameSettings.§_-U§,4),0,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_RANGERS_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_RANGERS_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.archers.ranger.minDamage + "-" + this.cRoot.gameSettings.archers.ranger.maxDamage,this.getColor(this.cRoot.gameSettings.archers.level3.maxDamage,this.cRoot.gameSettings.archers.ranger.maxDamage)],[Locale.loadStringEx("C_RELOAD",_loc1_),this.cRoot.gameSettings.getReloadString(this.cRoot.gameSettings.archers.ranger.reload / this.cRoot.gameSettings.framesRate),this.getColor(this.cRoot.gameSettings.archers.level3.reload,this.cRoot.gameSettings.archers.ranger.reload,true)]],
                  "extras":[Locale.loadStringEx("TOWER_RANGERS_POISON_NAME",_loc1_),Locale.loadStringEx("TOWER_RANGERS_THORNS_NAME",_loc1_)]
               })));
         }
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         if(this.isDisabled)
         {
            return;
         }
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.menu.showTowerInfo(this);
         this.displayTowerMenu();
      }
      
      override public function upgradeTower(param1:String) : void
      {
         var _loc2_:Tower = null;
         var _loc3_:Tower = null;
         switch(param1)
         {
            case "level_1":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playArcherTaunt();
                  this.§_-PA§(new GTowerArcherStandar1());
                  this.cRoot.game.gameAchievement.buildTower(this.cRoot,"archer");
                  this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               }
               else
               {
                  this.§_-GI§(new GTowerArcherStandar1());
               }
               this.setBaseSettings(§_-KC§);
               this.reloadTime = this.cRoot.gameSettings.archers.level1.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.archers.level1.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.archers.level1.range;
               this.preMadeLevel = "";
               break;
            case "sell":
               this.§_-FS§();
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis();
               break;
            case "level_2":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playArcherTaunt();
                  this.§_-HP§();
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.level2.cost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.level2.cost);
                  this.§_-PA§(new GTowerArcherStandar2());
               }
               else
               {
                  this.§_-GI§(new GTowerArcherStandar2());
               }
               this.setBaseSettings(§_-S§);
               this.reloadTime = this.cRoot.gameSettings.archers.level2.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.archers.level2.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.archers.level2.range;
               this.cRoot.menu.showTowerInfo(this);
               this.preMadeLevel = "";
               break;
            case "level_3":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playArcherTaunt();
                  this.§_-HP§();
                  this.cRoot.game.gameAchievement.upgradeTowerLevel3(this.cRoot,"archer");
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.archers.level3.cost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.archers.level3.cost);
                  this.§_-IP§ = new Point(this.x + 8,this.y - 50);
                  this.§_-Fl§ = new Point(this.x - 7,this.y - 50);
                  this.§_-PA§(new GTowerArcherStandar3());
               }
               else
               {
                  this.§_-GI§(new GTowerArcherStandar3());
               }
               this.setBaseSettings(§_-AC§);
               this.reloadTime = this.cRoot.gameSettings.archers.level3.reload - this.§_-7L§;
               this.rangeHeight = this.cRoot.gameSettings.archers.level3.range * this.cRoot.gameSettings.rangeRatio;
               this.rangeWidth = this.cRoot.gameSettings.archers.level3.range;
               if(this.preMadeLevel == "")
               {
                  this.cRoot.menu.showTowerInfo(this);
               }
               this.preMadeLevel = "";
               break;
            case "level_musketeer":
               this.§_-HP§();
               _loc2_ = new TowerArcherMusketeer(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis();
               break;
            case "level_ranger":
               this.§_-HP§();
               _loc3_ = new TowerArcherRanger(this.x,this.y,this.soldierRallyPoint,this.§_-6p§);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis();
         }
      }
      
      override public function getSellValue() : int
      {
         if(this.cRoot.game.gameUpgrades.archersUpSalvage == true)
         {
            return this.§_-6p§ * 0.9;
         }
         return this.§_-6p§ * this.cRoot.gameSettings.sellPercent;
      }
      
      public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
      }
      
      private function getDamageInfo(param1:Object) : void
      {
         switch(this.level)
         {
            case 1:
               param1.tDamageMin = this.cRoot.gameSettings.archers.level1.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.archers.level1.maxDamage;
               break;
            case 2:
               param1.tDamageMin = this.cRoot.gameSettings.archers.level2.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.archers.level2.maxDamage;
               break;
            case 3:
               param1.tDamageMin = this.cRoot.gameSettings.archers.level3.minDamage;
               param1.tDamageMax = this.cRoot.gameSettings.archers.level3.maxDamage;
         }
      }
      
      public function destroyThis() : void
      {
         this.§_-BN§();
         this.unSelect();
         this.target = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§_-6Q§();
         this.cRoot.removeTower(this);
      }
   }
}
