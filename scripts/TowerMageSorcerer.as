package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerMageSorcerer extends TowerMage
   {
       
      
      public var §_-0f§:Boolean = false;
      
      public var polymorphMaxLevel:int;
      
      public var polymorphCurrentLevel:int = 0;
      
      public var § case§:Boolean = false;
      
      public var §_-Bq§:int;
      
      public var §_-MP§:int;
      
      public var §_-7N§:int = 25;
      
      public var §_-3O§:int;
      
      public var elementalMaxLevel:int;
      
      public var elementalCurrentLevel:int = 0;
      
      public var elemental:SoldierElemental;
      
      public var §_-M0§:Boolean = false;
      
      public function TowerMageSorcerer(param1:int, param2:int, param3:Point, param4:int)
      {
         super(param1,param2,param3);
         this.§_-3F§ = "sorcerer";
         this.§_-6p§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playSorcererTaunt();
         this.building = false;
         this.§_-6p§ = this.§_-6p§ + this.getCost(this.cRoot.gameSettings.mages.sorcerer.cost);
         this.cRoot.updateCash(-this.getCost(this.cRoot.gameSettings.mages.sorcerer.cost));
         this.charging = false;
         this.§_-7L§ = 25;
         this.§_-Ce§ = 11;
         this.§_-BL§ = 0;
         this.idleTime = 90;
         this.idleTimeCounter = 0;
         this.setBaseSettings(§_-RM§);
         this.§_-GI§(new §_-8L§());
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-RT§(new §_-TM§());
         this.§_-IP§ = new Point(this.x + 8,this.y - 44);
         this.§_-Fl§ = new Point(this.x - 8,this.y - 44);
         this.cRoot.game.gameAchievement.buildTowerSorcerer(this.cRoot);
         this.cRoot.menu.showTowerInfo(this);
         this.unSelect();
         this.addEventListener(MouseEvent.CLICK,clickEvent,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
      }
      
      override public function rollOverEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         if(!this.§_-P9§())
         {
            this.cRoot.game.gameSounds.playGUIMouseOverCommon();
            this.addGlow();
            if(this.elemental != null)
            {
               this.§_-Fp§();
            }
         }
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function §_-Fp§() : void
      {
         this.elemental.selectMe();
      }
      
      override public function rollOutEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         if(!this.§_-P9§())
         {
            this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
            this.§_-9H§();
            if(this.elemental != null)
            {
               this.elemental.include();
            }
         }
         this.useHandCursor = false;
      }
      
      override public function unSelect() : void
      {
         this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
         this.cRoot.towerRange.visible = false;
         this.cRoot.towerRangeNew.visible = false;
         this.§_-9H§();
         if(this.elemental != null && this.cRoot.towerRangeRallyPoint.visible == false)
         {
            this.elemental.include();
         }
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_SORCERER_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         _loc1_.tRangeHeight = this.rangeHeight;
         _loc1_.tRangeWidth = this.rangeWidth;
         _loc1_.tReload = this.reloadTime + this.§_-7L§;
         _loc1_.tDamageMin = this.cRoot.gameSettings.mages.sorcerer.minDamage;
         _loc1_.tDamageMax = this.cRoot.gameSettings.mages.sorcerer.maxDamage;
         _loc1_.tAttackDamage = 2;
         return _loc1_;
      }
      
      override public function pauseSpecial() : void
      {
         if(this.elemental != null)
         {
            this.elemental.pause();
         }
      }
      
      override public function unPauseSpecial() : void
      {
         if(this.elemental != null)
         {
            this.elemental.unPause();
         }
      }
      
      override public function shoot() : void
      {
         if((this.target.hasDebuff("DebuffCurse") || !this.target.isActive) && !this.findNewTarget(this.cRoot.gameSettings.enemyMaxLevel))
         {
            return;
         }
         this.shootsTotal++;
         this.cRoot.bullets.addChild(new BoltSorcerer(this.§_-Cc§,this.target,1));
      }
      
      override public function runSpecialTimers() : void
      {
         if(this.§_-0f§)
         {
            this.§_-MP§++;
         }
      }
      
      override public function runSpecial() : Boolean
      {
         if(this.§_-0f§ && this.§_-97§())
         {
            return true;
         }
         return false;
      }
      
      public function getTooltipParams(param1:String) : Object
      {
         var _loc2_:String = Locale.getDefaultLang();
         switch(param1)
         {
            case "special_elemental":
               return {
                  "title":Locale.loadStringEx("TOWER_SORCERER_ELEMENTAL_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_SORCERER_ELEMENTAL_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_LIFE",_loc2_),this.cRoot.gameSettings.mages.sorcerer.elementalHealth + this.cRoot.gameSettings.mages.sorcerer.elementalExtraHealth * this.getNextLevel(this.elementalCurrentLevel,this.elementalMaxLevel),this.getColorByLevel(this.elementalCurrentLevel,this.elementalMaxLevel)],[Locale.loadStringEx("C_DAMAGE",_loc2_),this.cRoot.gameSettings.mages.sorcerer.elementalMinDamage + this.cRoot.gameSettings.mages.sorcerer.elementalDamageExtra * this.getNextLevel(this.elementalCurrentLevel,this.elementalMaxLevel) + "-" + (this.cRoot.gameSettings.mages.sorcerer.elementalMaxDamage + this.cRoot.gameSettings.mages.sorcerer.elementalDamageExtra * this.getNextLevel(this.elementalCurrentLevel,this.elementalMaxLevel)),this.getColorByLevel(this.elementalCurrentLevel,this.elementalMaxLevel)],[Locale.loadStringEx("C_ARMOR",_loc2_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.mages.sorcerer.elementalArmor + this.cRoot.gameSettings.mages.sorcerer.elementalArmorExtra * this.getNextLevel(this.elementalCurrentLevel,this.elementalMaxLevel)),this.getColorByLevel(this.elementalCurrentLevel,this.elementalMaxLevel)],[Locale.loadStringEx("C_RESPAWN",_loc2_),this.cRoot.gameSettings.mages.sorcerer.elementalRespawnTime / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),"white"]],
                  "notes":Locale.loadStringEx("TOWER_SORCERER_ELEMENTAL_NOTE",_loc2_)
               };
            case "special_polymorph":
               return {
                  "title":Locale.loadStringEx("TOWER_SORCERER_POLIMORPH_NAME",_loc2_),
                  "text":Locale.loadStringEx("TOWER_SORCERER_POLIMORPH_DESCRIPTION",_loc2_),
                  "atts":[[Locale.loadStringEx("C_RELOAD",_loc2_),(this.cRoot.gameSettings.mages.sorcerer.polymorphCoolDown - this.cRoot.gameSettings.mages.sorcerer.polymorphLessCoolDown * this.getNextLevel(this.polymorphCurrentLevel,this.polymorphMaxLevel)) / this.cRoot.gameSettings.framesRate + Locale.loadStringEx("C_SEC",_loc2_),this.getColorByLevel(this.polymorphCurrentLevel,this.polymorphMaxLevel)]],
                  "notes":Locale.loadStringEx("TOWER_SORCERER_POLIMORPH_NOTE",_loc2_)
               };
            default:
               return null;
         }
      }
      
      public function checkDisableCondition(param1:String) : Boolean
      {
         if(this.elementalCurrentLevel == 0)
         {
            return false;
         }
         return true;
      }
      
      override public function displayTowerMenu() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
            return;
         }
         MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,180,false,new Array(new Array("special_elemental","sp_elemental",this.cRoot.gameSettings.mages.sorcerer.elementalCost,false,this.elementalCurrentLevel,this.elementalMaxLevel,this.cRoot.gameSettings.mages.sorcerer.elementalCostLevel,1,"TooltipBasic",this.getTooltipParams("special_elemental")),new Array("special_polymorph","sp_polymorph",this.cRoot.gameSettings.mages.sorcerer.polymorphCost,false,this.polymorphCurrentLevel,this.polymorphMaxLevel,this.cRoot.gameSettings.mages.sorcerer.polymorphCostLevel,2,"TooltipBasic",this.getTooltipParams("special_polymorph")),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",{
            "title":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT",Locale.getDefaultLang()),
            "text":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT_DESCRIPTION",Locale.getDefaultLang())
         },"has_elemental")));
         this.cRoot.quickMenu.show(this.cRoot.gui);
         this.§_-JV§(this.rangeWidth,this.rangeHeight);
      }
      
      override public function upgradeTower(param1:String) : void
      {
         switch(param1)
         {
            case "sell":
               this.cRoot.updateCash(this.getSellValue());
               if(this.elemental != null)
               {
                  this.elemental.destroyThis();
                  this.elemental = null;
               }
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis();
               break;
            case "special_elemental":
               this.elementalCurrentLevel++;
               if(this.elemental == null)
               {
                  this.§_-OZ§();
               }
               else
               {
                  this.elemental.upgrade(this.elementalCurrentLevel);
               }
               if(this.elementalCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.sorcerer.elementalCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.sorcerer.elementalCost);
                  this.cRoot.addElementalAchievement();
                  break;
               }
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.sorcerer.elementalCostLevel;
               this.cRoot.updateCash(-this.cRoot.gameSettings.mages.sorcerer.elementalCostLevel);
               break;
            case "special_polymorph":
               this.cRoot.game.gameSounds.playSorcererSheep();
               this.§_-0f§ = true;
               this.polymorphCurrentLevel++;
               this.§ case§ = false;
               this.§_-MP§ = 0;
               this.§_-3O§;
               this.§_-Bq§ = this.cRoot.gameSettings.mages.sorcerer.polymorphCoolDown - this.cRoot.gameSettings.mages.sorcerer.polymorphLessCoolDown * this.polymorphCurrentLevel;
               if(this.polymorphCurrentLevel == 1)
               {
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.sorcerer.polymorphCost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.mages.sorcerer.polymorphCost);
                  break;
               }
               this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.mages.sorcerer.polymorphCostLevel;
               this.cRoot.updateCash(-this.cRoot.gameSettings.mages.sorcerer.polymorphCostLevel);
               break;
            case "rally":
               this.cRoot.disableLevelElements();
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this,true));
               this.showRangeRallyPoint(this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange,this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange * this.cRoot.gameSettings.rangeRatio);
         }
      }
      
      public function gotoIdle(param1:Point) : void
      {
         this.soldierRallyPoint.x = param1.x;
         this.soldierRallyPoint.y = param1.y;
         this.elemental.changeRallyPoint(this.soldierRallyPoint);
         this.cRoot.game.gameSounds.playElementalRally();
      }
      
      public function showRangeRallyPoint(param1:int, param2:int) : void
      {
         this.cRoot.towerRangeRallyPoint.width = param1;
         this.cRoot.towerRangeRallyPoint.height = param2;
         this.cRoot.towerRangeRallyPoint.x = this.x;
         this.cRoot.towerRangeRallyPoint.y = this.y - 10;
         this.cRoot.towerRangeRallyPoint.visible = true;
      }
      
      public function §_-4A§() : void
      {
         this.cRoot.towerRangeRallyPoint.visible = false;
         if(this.elemental != null)
         {
            this.elemental.include();
         }
      }
      
      private function §_-97§() : Boolean
      {
         if(this.§ case§)
         {
            if(this.§_-3O§ < this.§_-7N§)
            {
               if(this.§_-3O§ == 9)
               {
                  if(!this.target.isActive && !this.findNewPolymorphTarget(this.cRoot.gameSettings.enemyMaxLevel))
                  {
                     this.§ case§ = false;
                     return false;
                  }
                  this.cRoot.bullets.addChild(new RayPolymorph(new Point(this.x - 1.5,this.y - 62.7),this.target,this.polymorphCurrentLevel));
               }
               this.§_-3O§++;
               return true;
            }
            this.reloadTimeCounter = 0;
            this.§_-3O§ = 0;
            this.§_-MP§ = 0;
            this.§ case§ = false;
            return false;
         }
         if(this.§_-MP§ < this.§_-Bq§)
         {
            this.§_-MP§++;
            return false;
         }
         if(this.findNewPolymorphTarget(this.cRoot.gameSettings.enemyMaxLevel))
         {
            this.§ case§ = true;
            this.getGraphic().gotoAndPlay("shoot");
            if(this.target.y >= this.y)
            {
               this.getGraphic().mage.gotoAndPlay("polymorph_down");
            }
            else
            {
               this.getGraphic().mage.gotoAndPlay("polymorph_up");
            }
            return true;
         }
         return false;
      }
      
      override public function setBaseSettings(param1:int) : void
      {
         this.level = param1;
         this.reloadTime = this.cRoot.gameSettings.mages.sorcerer.reload - this.§_-7L§;
         this.rangeHeight = this.cRoot.gameSettings.mages.sorcerer.range * this.cRoot.gameSettings.rangeRatio;
         this.rangeWidth = this.cRoot.gameSettings.mages.sorcerer.range;
         this.polymorphMaxLevel = this.cRoot.gameSettings.mages.sorcerer.polymorphLevels;
         this.polymorphMaxLevel = this.cRoot.gameSettings.mages.sorcerer.polymorphLevels;
         this.polymorphMaxLevel = this.cRoot.gameSettings.mages.sorcerer.polymorphLevels;
         this.elementalMaxLevel = this.cRoot.gameSettings.mages.sorcerer.elementalLevels;
      }
      
      override public function findNewTarget(param1:int, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         var _loc6_:Enemy = null;
         var _loc4_:Enemy = null;
         var _loc5_:Enemy = null;
         this.target = null;
         for each(_loc6_ in this.cRoot.enemies)
         {
            if(_loc6_.isActive && _loc6_.level <= param1 && this.onRange(_loc6_))
            {
               if(!_loc6_.hasDebuff("DebuffCurse"))
               {
                  if(_loc4_ == null || this.§_-ET§(_loc4_,_loc6_))
                  {
                     _loc4_ = Enemy(_loc6_);
                  }
               }
               else if(_loc5_ == null || this.§_-ET§(_loc5_,_loc6_))
               {
                  _loc5_ = Enemy(_loc6_);
               }
            }
         }
         if(_loc4_ != null)
         {
            this.target = _loc4_;
            return true;
         }
         if(_loc5_ != null)
         {
            this.target = _loc5_;
            return true;
         }
         return false;
      }
      
      private function findNewPolymorphTarget(param1:int) : Boolean
      {
         var _loc3_:Enemy = null;
         var _loc2_:Enemy = null;
         this.target = null;
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && !_loc3_.isBoss && _loc3_.§_-0f§ && _loc3_.level <= param1 && this.onRange(_loc3_))
            {
               if(_loc2_ == null || this.§_-ET§(_loc2_,_loc3_))
               {
                  _loc2_ = Enemy(_loc3_);
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
      
      private function §_-OZ§() : void
      {
         this.elemental = new SoldierElemental(this.soldierRallyPoint,this.soldierRallyPoint,this);
         this.cRoot.addSoldier(this.elemental);
         this.cRoot.entities.addChild(this.elemental);
      }
   }
}
