package
{
   import com.reintroducing.sound.SoundManager;
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-Go§ extends Tower
   {
      
      public static const §_-82§:int = 0;
      
      public static const §_-DZ§:int = 1;
      
      public static const §_-50§:int = 2;
      
      public static const §_-BE§:int = 3;
      
      public static const §_-5C§:int = 0;
      
      public static const §_-KC§:int = 1;
      
      public static const §_-S§:int = 2;
      
      public static const §_-AC§:int = 3;
      
      public static const §_-NS§:int = 4;
      
      public static const §_-K8§:int = 5;
       
      
      public var soldiers:Dictionary;
      
      public var §_-2G§:int;
      
      public var soldierInit:Point;
      
      public var §_-Kk§:int;
      
      public var §_-Bl§:int = 25;
      
      public var §_-Cp§:int = 0;
      
      public var §_-1n§:int = 12;
      
      public var §_-MK§:int = 22;
      
      public var §_-Fj§:Boolean = false;
      
      public function §_-Go§(param1:int, param2:int, param3:Point, param4:String = "")
      {
         this.soldierInit = new Point();
         super(param1,param2,param3,param4);
         this.§_-3F§ = "barrack";
         this.§extends§ = false;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.§_-2G§ = 3;
         this.soldiers = new Dictionary(true);
         this.§_-Kk§ = §_-82§;
         this.soldierInit.x = this.x;
         this.soldierInit.y = this.y - 0.01;
         if(this.preMadeLevel == "")
         {
            this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.level1.cost;
            this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.level1.cost);
            this.building = true;
            this.buildingTime = this.cRoot.gameSettings.buildingTime;
            this.§_-2I§ = 0;
            this.§_-GI§(new §_-Df§());
            this.§_-FH§ = new §_-NQ§(-17,-41,this.buildingTime);
            this.getGraphic().addChild(this.§_-FH§);
         }
         else
         {
            this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
            this.building = false;
            this.upgradeTower(this.preMadeLevel);
         }
         this.§_-RT§(new §_-9i§());
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
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
         if(this.§_-Kk§ != §_-82§)
         {
            if(this.§_-Cp§ < this.§_-Bl§)
            {
               if(this.§_-Cp§ == this.§_-1n§)
               {
                  this.§_-Kk§ = §_-50§;
               }
               else if(this.§_-Cp§ > this.§_-MK§)
               {
                  this.§_-Kk§ = §_-BE§;
               }
               this.§_-Cp§++;
            }
            else
            {
               this.§_-Kk§ = §_-82§;
            }
         }
      }
      
      override public function pause() : void
      {
         if(this.building)
         {
            return;
         }
         this.getGraphic().stop();
      }
      
      override public function unPause() : void
      {
         if(this.building)
         {
            return;
         }
         if(MovieClip(this.getGraphic()).currentFrameLabel != "idle" && MovieClip(this.getGraphic()).currentFrameLabel != "door_closed")
         {
            this.getGraphic().play();
         }
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
            this.§finally§();
         }
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
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
            this.§_-GT§();
         }
         this.useHandCursor = false;
      }
      
      override public function unSelect() : void
      {
         this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
         this.cRoot.towerRange.visible = false;
         this.cRoot.towerRangeNew.visible = false;
         this.§_-9H§();
         if(this.cRoot.towerRangeRallyPoint.visible == false)
         {
            this.§_-GT§();
         }
      }
      
      public function §finally§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.selectMe();
         }
      }
      
      protected function §_-GT§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.include();
         }
      }
      
      override public function getInfo() : Object
      {
         var _loc1_:Object = {};
         _loc1_.tName = Locale.loadStringEx("TOWER_BARRACKS_NAME",Locale.getDefaultLang());
         _loc1_.tIconName = this.§_-3F§;
         switch(this.level)
         {
            case §_-KC§:
               _loc1_.tSoldierName = "standard1";
               _loc1_.tHealth = this.cRoot.gameSettings.soldiers.level1.health;
               _loc1_.tArmor = this.cRoot.gameSettings.soldiers.level1.armor;
               _loc1_.tDamageMin = this.cRoot.gameSettings.soldiers.level1.minDamage;
               _loc1_.tDamageMax = this.cRoot.gameSettings.soldiers.level1.maxDamage;
               _loc1_.tRespawn = this.cRoot.gameSettings.soldiers.level1.respawn;
               break;
            case §_-S§:
               _loc1_.tSoldierName = "standard2";
               _loc1_.tHealth = this.cRoot.gameSettings.soldiers.level2.health;
               _loc1_.tArmor = this.cRoot.gameSettings.soldiers.level2.armor;
               _loc1_.tDamageMin = this.cRoot.gameSettings.soldiers.level2.minDamage;
               _loc1_.tDamageMax = this.cRoot.gameSettings.soldiers.level2.maxDamage;
               _loc1_.tRespawn = this.cRoot.gameSettings.soldiers.level2.respawn;
               break;
            case §_-AC§:
               _loc1_.tSoldierName = "standard3";
               _loc1_.tHealth = this.cRoot.gameSettings.soldiers.level3.health;
               _loc1_.tArmor = this.cRoot.gameSettings.soldiers.level3.armor;
               _loc1_.tDamageMin = this.cRoot.gameSettings.soldiers.level3.minDamage;
               _loc1_.tDamageMax = this.cRoot.gameSettings.soldiers.level3.maxDamage;
               _loc1_.tRespawn = this.cRoot.gameSettings.soldiers.level3.respawn;
         }
         return _loc1_;
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
         this.cRoot.menu.showTowerBarracksInfo(this);
         this.displayTowerMenu();
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
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_2","lv_up",this.cRoot.gameSettings.soldiers.level2.cost,this.cRoot.isTowerLocked(GameSettings.§_-5z§,2),false,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL2_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_LIFE",_loc1_),this.cRoot.gameSettings.soldiers.level2.health,this.getColor(this.cRoot.gameSettings.soldiers.level1.health,this.cRoot.gameSettings.soldiers.level2.health)],[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.soldiers.level2.minDamage + "-" + this.cRoot.gameSettings.soldiers.level2.maxDamage,this.getColor(this.cRoot.gameSettings.soldiers.level1.maxDamage,this.cRoot.gameSettings.soldiers.level2.maxDamage)],[Locale.loadStringEx("C_ARMOR",_loc1_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.level2.armor),this.getColor(this.cRoot.gameSettings.soldiers.level1.armor,this.cRoot.gameSettings.soldiers.level2.armor)],[Locale.loadStringEx("C_RESPAWN",_loc1_),this.cRoot.gameSettings.soldiers.level2.respawn / this.cRoot.gameSettings.framesRate + "s",this.getColor(this.cRoot.gameSettings.soldiers.level1.respawn,this.cRoot.gameSettings.soldiers.level2.respawn,true)]]
               }),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT_DESCRIPTION",_loc1_)
               })));
               break;
            case §_-S§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_3","lv_up",this.cRoot.gameSettings.soldiers.level3.cost,this.cRoot.isTowerLocked(GameSettings.§_-5z§,3),false,0,0,7,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL3_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_LIFE",_loc1_),this.cRoot.gameSettings.soldiers.level3.health,this.getColor(this.cRoot.gameSettings.soldiers.level2.health,this.cRoot.gameSettings.soldiers.level3.health)],[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.soldiers.level3.minDamage + "-" + this.cRoot.gameSettings.soldiers.level3.maxDamage,this.getColor(this.cRoot.gameSettings.soldiers.level2.maxDamage,this.cRoot.gameSettings.soldiers.level3.maxDamage)],[Locale.loadStringEx("C_ARMOR",_loc1_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.level3.armor),this.getColor(this.cRoot.gameSettings.soldiers.level2.armor,this.cRoot.gameSettings.soldiers.level3.armor)],[Locale.loadStringEx("C_RESPAWN",_loc1_),this.cRoot.gameSettings.soldiers.level3.respawn / this.cRoot.gameSettings.framesRate + "s",this.getColor(this.cRoot.gameSettings.soldiers.level2.respawn,this.cRoot.gameSettings.soldiers.level3.respawn,true)]]
               }),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT_DESCRIPTION",_loc1_)
               })));
               break;
            case §_-AC§:
               MovieClip(this.cRoot).quickMenu.load(this.x,this.y - 10,this,true,50,true,new Array(new Array("level_paladin","tw_paladin",this.cRoot.gameSettings.soldiers.paladin.cost,this.cRoot.isTowerLocked(GameSettings.§_-5z§,4),false,0,0,1,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_PALADINS_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_PALADINS_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_LIFE",_loc1_),this.cRoot.gameSettings.soldiers.paladin.health,this.getColor(this.cRoot.gameSettings.soldiers.level3.health,this.cRoot.gameSettings.soldiers.paladin.health)],[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.soldiers.paladin.minDamage + "-" + this.cRoot.gameSettings.soldiers.paladin.maxDamage,this.getColor(this.cRoot.gameSettings.soldiers.level2.maxDamage,this.cRoot.gameSettings.soldiers.paladin.maxDamage)],[Locale.loadStringEx("C_ARMOR",_loc1_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.paladin.armor),this.getColor(this.cRoot.gameSettings.soldiers.level3.armor,this.cRoot.gameSettings.soldiers.paladin.armor)],[Locale.loadStringEx("C_RESPAWN",_loc1_),this.cRoot.gameSettings.soldiers.paladin.respawn / this.cRoot.gameSettings.framesRate + "s",this.getColor(this.cRoot.gameSettings.soldiers.level3.respawn,this.cRoot.gameSettings.soldiers.paladin.respawn,true)]],
                  "extras":[Locale.loadStringEx("TOWER_PALADINS_HEALING_NAME",_loc1_),Locale.loadStringEx("TOWER_PALADINS_HOLY_STRIKE_NAME",_loc1_),Locale.loadStringEx("TOWER_PALADINS_SHIELD_NAME",_loc1_)]
               }),new Array("level_berserk","tw_barbarian",this.cRoot.gameSettings.soldiers.barbarian.cost,this.cRoot.isTowerLocked(GameSettings.§_-5z§,5),false,0,0,2,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARBARIANS_NAME",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARBARIANS_DESCRIPTION",_loc1_),
                  "atts":[[Locale.loadStringEx("C_LIFE",_loc1_),this.cRoot.gameSettings.soldiers.barbarian.health,this.getColor(this.cRoot.gameSettings.soldiers.level3.health,this.cRoot.gameSettings.soldiers.barbarian.health)],[Locale.loadStringEx("C_DAMAGE",_loc1_),this.cRoot.gameSettings.soldiers.barbarian.minDamage + "-" + this.cRoot.gameSettings.soldiers.barbarian.maxDamage,this.getColor(this.cRoot.gameSettings.soldiers.level3.maxDamage,this.cRoot.gameSettings.soldiers.barbarian.maxDamage)],[Locale.loadStringEx("C_ARMOR",_loc1_),this.cRoot.gameSettings.getArmorString(this.cRoot.gameSettings.soldiers.barbarian.armor),this.getColor(this.cRoot.gameSettings.soldiers.level3.armor,this.cRoot.gameSettings.soldiers.barbarian.armor)],[Locale.loadStringEx("C_RESPAWN",_loc1_),this.cRoot.gameSettings.soldiers.barbarian.respawn / this.cRoot.gameSettings.framesRate + "s",this.getColor(this.cRoot.gameSettings.soldiers.level3.respawn,this.cRoot.gameSettings.soldiers.barbarian.respawn,true)]],
                  "extras":[Locale.loadStringEx("TOWER_BARBARIANS_THROWING_AXES_NAME",_loc1_),Locale.loadStringEx("TOWER_BARBARIANS_DOUBLE_AXE_NAME",_loc1_),Locale.loadStringEx("TOWER_BARBARIANS_HUNTER_NETS_NAME",_loc1_)]
               }),new Array("rally","tw_rally",0,false,0,0,0,9,"TooltipBasic",{
                  "title":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT",_loc1_),
                  "text":Locale.loadStringEx("TOWER_BARRACKS_RALLY_POINT_DESCRIPTION",_loc1_)
               })));
         }
         this.cRoot.quickMenu.show(this.cRoot.gui);
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
                  this.cRoot.game.gameSounds.playSoldierTaunt();
                  this.cRoot.game.gameAchievement.buildTower(this.cRoot,"soldier");
                  this.§_-PA§(new GTowerSoldierStandar1());
                  this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
               }
               else
               {
                  this.§_-GI§(new GTowerSoldierStandar1());
               }
               this.§_-TS§();
               this.level = §_-KC§;
               this.preMadeLevel = "";
               break;
            case "sell":
               this.§_-FS§();
               this.cRoot.updateCash(this.getSellValue());
               this.cRoot.entities.addChild(new TowerHolder(this.x,this.y,this.soldierRallyPoint));
               this.cRoot.entities.addChild(new TowerSellSmoke(new Point(this.x,this.y),this.getSellValue()));
               this.cRoot.addSellTowerAchievement();
               this.destroyThis(true);
               break;
            case "level_2":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playSoldierTaunt();
                  this.§_-HP§();
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.level2.cost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.level2.cost);
                  this.§_-PA§(new GTowerSoldierStandar2());
               }
               else
               {
                  this.§_-TS§();
                  this.§_-GI§(new GTowerSoldierStandar2());
               }
               this.upgradeSoldiers(SoldierStandarLevel2,false,true);
               this.level = §_-S§;
               if(this.preMadeLevel == "")
               {
                  this.cRoot.menu.showTowerBarracksInfo(this);
               }
               this.preMadeLevel = "";
               break;
            case "level_3":
               if(this.preMadeLevel == "")
               {
                  this.cRoot.game.gameSounds.playSoldierTaunt();
                  this.§_-HP§();
                  this.cRoot.game.gameAchievement.upgradeTowerLevel3(this.cRoot,"soldier");
                  this.§_-6p§ = this.§_-6p§ + this.cRoot.gameSettings.soldiers.level3.cost;
                  this.cRoot.updateCash(-this.cRoot.gameSettings.soldiers.level3.cost);
                  this.§_-PA§(new GTowerSoldierStandar3());
               }
               else
               {
                  this.§_-TS§();
                  this.§_-GI§(new GTowerSoldierStandar3());
               }
               this.upgradeSoldiers(SoldierStandarLevel3,false,true);
               this.level = §_-AC§;
               if(this.preMadeLevel == "")
               {
                  this.cRoot.menu.showTowerBarracksInfo(this);
               }
               this.preMadeLevel = "";
               break;
            case "level_paladin":
               this.§_-HP§();
               this.upgradeSoldiers(SoldierPaladin,true);
               _loc2_ = new TowerSoldierPaladin(this.x,this.y,this.soldierRallyPoint,this.soldiers,this.§_-6p§);
               this.cRoot.entities.addChild(_loc2_);
               this.cRoot.towers[_loc2_] = _loc2_;
               this.destroyThis(false);
               break;
            case "level_berserk":
               this.§_-HP§();
               this.upgradeSoldiers(§_-D7§,true);
               _loc3_ = new TowerSoldierBarbarian(this.x,this.y,this.soldierRallyPoint,this.soldiers,this.§_-6p§);
               this.cRoot.entities.addChild(_loc3_);
               this.cRoot.towers[_loc3_] = _loc3_;
               this.destroyThis(false);
               break;
            case "rally":
               this.cRoot.disableLevelElements();
               this.cRoot.bullets.addChild(new TowerRallyPoint(this.cRoot,this));
               this.showRangeRallyPoint(this.cRoot.gameSettings.soldiers.level1.rangeRally,this.cRoot.gameSettings.soldiers.level1.rangeRally * this.cRoot.gameSettings.rangeRatio);
         }
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
         this.§_-GT§();
      }
      
      private function §_-TS§() : void
      {
         var _loc3_:Soldier = null;
         var _loc1_:Number = this.soldierRallyPoint.y;
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-2G§)
         {
            _loc3_ = new §_-6V§(this.soldierInit,null,this);
            this.§_-Pp§(Soldier(_loc3_));
            _loc4_++;
         }
         var _loc5_:* = new Ellipse(this.soldierRallyPoint.x - 40 / 2,this.soldierRallyPoint.y + 10 - 28 / 2,40,28);
         var _loc6_:* = 180;
         for each(_loc3_ in this.soldiers)
         {
            _loc3_.changeRallyPoint(_loc5_.getPointOfDegree(_loc6_));
            _loc6_ = _loc6_ + 120;
            this.cRoot.entities.addChild(_loc3_);
         }
         this.cRoot.game.gameAchievement.trainSoldier(this.cRoot);
         this.cRoot.game.gameAchievement.trainSoldier(this.cRoot);
         this.cRoot.game.gameAchievement.trainSoldier(this.cRoot);
      }
      
      public function upgradeSoldiers(param1:Class, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Soldier = null;
         var _loc6_:Soldier = null;
         var _loc4_:* = new Dictionary(true);
         for each(_loc5_ in this.soldiers)
         {
            _loc5_.§_-B9§(param1,_loc4_,param2,param3);
         }
         this.§_-1W§();
         this.soldiers = _loc4_;
         for each(_loc6_ in this.soldiers)
         {
            this.cRoot.addSoldier(_loc6_);
         }
      }
      
      public function gotoIdle(param1:Point) : void
      {
         var _loc4_:Soldier = null;
         this.soldierRallyPoint.x = param1.x;
         this.soldierRallyPoint.y = param1.y;
         var _loc2_:* = new Ellipse(param1.x - 40 / 2,param1.y + 10 - 28 / 2,40,28);
         var _loc3_:* = 180;
         for each(_loc4_ in this.soldiers)
         {
            _loc4_.changeRallyPoint(_loc2_.getPointOfDegree(_loc3_));
            _loc3_ = _loc3_ + 120;
         }
         this.playSoldierTaunt();
      }
      
      public function playSoldierTaunt() : void
      {
         this.cRoot.game.gameSounds.playSoldierTaunt();
      }
      
      public function addSoldier(param1:Soldier) : void
      {
         this.§_-Pp§(param1);
         this.cRoot.entities.addChild(param1);
      }
      
      public function §_-Pp§(param1:Soldier) : void
      {
         this.soldiers[param1] = param1;
         this.cRoot.addSoldier(param1);
      }
      
      public function removeSoldier(param1:Soldier) : void
      {
         delete this.soldiers[param1];
         delete this[this.cRoot.removeSoldier(param1)];
      }
      
      public function §_-1W§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.soldiers)
         {
            this.removeSoldier(_loc1_);
            _loc1_.destroyThis();
         }
      }
      
      public function §_-Kg§() : Boolean
      {
         if(this.§_-Kk§ == §_-DZ§)
         {
            return true;
         }
         return false;
      }
      
      public function override() : Boolean
      {
         if(this.§_-Kk§ == §_-82§)
         {
            return true;
         }
         return false;
      }
      
      public function openDoor() : void
      {
         if(this.§_-Kk§ == §_-82§)
         {
            SoundManager.getInstance().playSound("tower_open_door",this.cRoot.game.gameSounds.V_FX_TOWER_OPEN_DOOR,0,0);
            this.§_-Kk§ = §_-DZ§;
            this.getGraphic().gotoAndPlay("open_door");
            this.§_-Cp§ = 0;
         }
      }
      
      public function destroyThis(param1:Boolean) : void
      {
         this.§_-BN§();
         this.unSelect();
         if(param1)
         {
            this.§_-1W§();
         }
         this.soldiers = null;
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.cRoot.entities.removeChild(this);
         this.§_-6Q§();
         this.cRoot.removeTower(this);
      }
   }
}
