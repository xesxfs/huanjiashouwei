package
{
   import com.adobe.utils.StringUtil;
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import ironhide.utils.tooltip.Tooltip;
   import org.casalib.math.geom.Ellipse;
   
   public class Level extends MovieClip
   {
      
      public static const LEVEL_NORMAL:int = 0;
      
      public static const LEVEL_PAUSED:int = 1;
      
      public static const LEVEL_WIN:int = 2;
      
      public static const LEVEL_OVER:int = 3;
      
      public static const LEVEL_STARTING:int = 4;
      
      public static const LEVEL_PRE_WIN:int = 5;
       
      
      public var mode:int;
      
      public var §_-D4§:int;
      
      public var §_-JX§:String = "forest";
      
      public var §_-6Y§:int;
      
      public var game:Game;
      
      public var data:SaveDataLevel;
      
      public var §_-8S§:§_-K6§;
      
      public var §_-0g§:int = 0;
      
      public var §_-4K§:PauseLayer;
      
      public var gameSettings:GameSettings;
      
      public var maxUpgradeLevel:int;
      
      public var maxWaves:int;
      
      public var currentWave:int;
      
      public var initLives:int;
      
      public var lives:int;
      
      public var cash:int;
      
      public var §_-Ip§:int = 0;
      
      public var tDamage:Number = 0;
      
      public var §_-4B§:Array;
      
      public var paths:Array;
      
      public var hasTunnels:Boolean;
      
      public var tunnels:Array;
      
      public var §_-Az§:Array;
      
      public var inactiveNodeDistance:int = 13;
      
      public var indexWaves:int = 0;
      
      public var intervalWaveCounter:int = 0;
      
      public var toolTip:Tooltip;
      
      public var menu:MenuBottom;
      
      public var hud:Hud;
      
      public var §_-FA§:§_-QD§;
      
      public var §_-7a§:§_-E4§;
      
      public var §_-39§:ButtonEncyclopedia;
      
      public var quickMenu:TowerMenu;
      
      public var notificationHolder:NotificationSecondLevelHolder;
      
      public var towerRange:§_-2K§;
      
      public var towerRangeNew:TowerCircleNew;
      
      public var towerRangeRallyPoint:§_-8Y§;
      
      public var waves:Array;
      
      public var activeWaves:Dictionary;
      
      public var §_-4R§:Boolean;
      
      public var §_-65§:FirstWaveSign;
      
      public var terrain:Sprite;
      
      public var ellipses:Sprite;
      
      public var background:Sprite;
      
      public var decals:Sprite;
      
      public var entities:Sprite;
      
      public var frontEntities:Sprite;
      
      public var bulletsDecals:Sprite;
      
      public var bullets:Sprite;
      
      public var gui:Sprite;
      
      public var towers:Dictionary;
      
      public var enemies:Dictionary;
      
      public var soldiers:Dictionary;
      
      public var §_-Ba§:Dictionary;
      
      public var menuPause:§_-Pg§;
      
      public var staticEnemies:Dictionary;
      
      public var staticAreas:Array;
      
      public var rallyPoint:TowerRallyPoint;
      
      public var powerPointer:§_-Tm§;
      
      public var enableElements:Boolean = true;
      
      public var heroPortrait:§_-Jx§;
      
      public var enemySelection:EnemySelection;
      
      public var soldierSelection:SoldierSelection;
      
      public var clips:int = 0;
      
      public var §_-NX§:AchievementItem;
      
      public var gTerrain:MovieClip;
      
      public var initTime:int = 30;
      
      public var initTimeCounter:int = 0;
      
      public var §_-Qy§:int = 30;
      
      public var §_-On§:int = 0;
      
      public var power1:Boolean;
      
      public var power2:Boolean;
      
      public var unlockMaxArchers:int;
      
      public var unlockMaxMages:int;
      
      public var unlockMaxEngineers:int;
      
      public var unlockMaxBarracks:int;
      
      public var unlockMaxArchersLevel:int;
      
      public var unlockMaxMagesLevel:int;
      
      public var unlockMaxEngineersLevel:int;
      
      public var unlockMaxBarracksLevel:int;
      
      public var §_-1s§:Boolean = false;
      
      public var isReadyToWin:Boolean;
      
      public var readyToWinTime:int = 30;
      
      public var readyToWinTimeCounter:int = 0;
      
      public var fearless:Boolean = true;
      
      private var fireballCounter:int;
      
      private var sellTowersCounter:int;
      
      private var elementals:int = 0;
      
      private var teslas:int = 0;
      
      public var graveyard:Graveyard;
      
      public var swamp:Swamp;
      
      public var currentSkeletons:int = 0;
      
      public var §_-r§:Boolean;
      
      public var heroRallyPoint:§_-9c§;
      
      public var pathFinder:§_-7§;
      
      public var §_-GQ§:Boolean = false;
      
      public function Level(param1:Array, param2:Array, param3:int = 0)
      {
         this.§_-8S§ = new §_-K6§();
         this.§_-4K§ = new PauseLayer();
         this.paths = [];
         this.towerRange = new §_-2K§();
         this.towerRangeNew = new TowerCircleNew();
         this.towerRangeRallyPoint = new §_-8Y§();
         this.activeWaves = new Dictionary(true);
         this.terrain = new Sprite();
         this.ellipses = new Sprite();
         this.background = new Sprite();
         this.decals = new Sprite();
         this.entities = new Sprite();
         this.frontEntities = new Sprite();
         this.bulletsDecals = new Sprite();
         this.bullets = new Sprite();
         this.gui = new Sprite();
         this.towers = new Dictionary(true);
         this.enemies = new Dictionary(true);
         this.soldiers = new Dictionary(true);
         this.§_-Ba§ = new Dictionary(true);
         this.staticEnemies = new Dictionary(true);
         this.staticAreas = [];
         this.enemySelection = new EnemySelection();
         this.soldierSelection = new SoldierSelection();
         super();
         this.mode = param3;
         this.§_-6Y§ = this.cash;
         this.isReadyToWin = false;
         this.game.gameSounds.setLevel(this);
         this.addChild(this.terrain);
         this.addChild(this.decals);
         this.addChild(this.ellipses);
         this.addChild(this.background);
         this.addChild(this.entities);
         this.addChild(this.frontEntities);
         this.addChild(this.bulletsDecals);
         this.addChild(this.bullets);
         this.addChild(this.gui);
         this.getNumberOfWaves();
         this.menuPause = new §_-Pg§(this);
         this.lives = this.initLives;
         this.§_-D4§ = LEVEL_STARTING;
         this.initTowers(param1);
         this.paths = param2;
         this.gameSettings = new GameSettings(this.game,true,this.maxUpgradeLevel);
         this.ellipses.addChild(this.towerRange);
         this.ellipses.addChild(this.towerRangeNew);
         this.ellipses.addChild(this.towerRangeRallyPoint);
         this.towerRange.visible = false;
         this.towerRangeNew.visible = false;
         this.towerRangeRallyPoint.visible = false;
         this.towerRange.addEventListener(MouseEvent.MOUSE_DOWN,this.towerRangeClick,false,0,true);
         this.towerRangeNew.addEventListener(MouseEvent.MOUSE_DOWN,this.towerRangeNewClick,false,0,true);
         this.gui.addChild(this.§_-4K§);
         this.§_-4K§.start();
         this.§_-7m§();
         this.game.gameSounds.stopAllMusics();
         this.game.gameSounds.§_-84§();
         this.menu = new MenuBottom(new Point(0,543),this);
         this.§_-65§ = new FirstWaveSign(new Point(652,543));
         this.bullets.addChild(this.§_-65§);
         this.loadGrid();
         this.addEventListener(Event.DEACTIVATE,this.onDeactivate,false,0,true);
      }
      
      public function loadGrid() : void
      {
      }
      
      public function loadCampaign() : void
      {
      }
      
      public function loadHeroic() : void
      {
      }
      
      public function loadIron() : void
      {
      }
      
      private function onDeactivate(param1:Event) : void
      {
         if(this.game.§_-3q§ && this.§_-D4§ == LEVEL_NORMAL)
         {
            this.§_-RZ§(true);
         }
      }
      
      public function §_-2E§() : void
      {
         
      }
      
      public function §_-Bc§(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
               this.cancelAllOnKeyPress();
               break;
            case Keyboard.ESCAPE:
               this.cancelAllOnKeyPress();
               break;
            case 112:
               if(this.§_-D4§ == LEVEL_NORMAL)
               {
                  this.§_-RZ§();
                  break;
               }
               this.§_-9P§();
               break;
            case 80:
               if(this.§_-D4§ == LEVEL_NORMAL)
               {
                  this.§_-RZ§();
                  break;
               }
               this.§_-9P§();
               break;
            case Keyboard.NUMPAD_1:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerFireball(this.menu.powersHolder.getChildAt(0)).§_-6f§();
                     break;
                  }
                  if(getQualifiedClassName(this.powerPointer) == "PowerPointerFireball")
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerFireball(this.menu.powersHolder.getChildAt(0)).§_-6f§();
                  break;
               }
               break;
            case 49:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerFireball(this.menu.powersHolder.getChildAt(0)).§_-6f§();
                     break;
                  }
                  if(getQualifiedClassName(this.powerPointer) == "PowerPointerFireball")
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerFireball(this.menu.powersHolder.getChildAt(0)).§_-6f§();
                  break;
               }
               break;
            case Keyboard.NUMPAD_2:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerReinforcement(this.menu.powersHolder.getChildAt(1)).§_-6f§();
                     break;
                  }
                  if(StringUtil.beginsWith(getQualifiedClassName(this.powerPointer),"PowerPointerReinforcement") || StringUtil.beginsWith(getQualifiedClassName(this.powerPointer),"PowerPointerFarmer"))
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerReinforcement(this.menu.powersHolder.getChildAt(1)).§_-6f§();
                  break;
               }
               break;
            case 50:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerReinforcement(this.menu.powersHolder.getChildAt(1)).§_-6f§();
                     break;
                  }
                  if(StringUtil.beginsWith(getQualifiedClassName(this.powerPointer),"PowerPointerReinforcement") || StringUtil.beginsWith(getQualifiedClassName(this.powerPointer),"PowerPointerFarmer"))
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerReinforcement(this.menu.powersHolder.getChildAt(1)).§_-6f§();
                  break;
               }
               break;
            case Keyboard.NUMPAD_3:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.game.pc && this.game.pcLightning && this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerLightning(this.menu.powersHolder.getChildAt(2)).§_-6f§();
                     break;
                  }
                  if(getQualifiedClassName(this.powerPointer) == "PowerPointerLightning")
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerLightning(this.menu.powersHolder.getChildAt(2)).§_-6f§();
                  break;
               }
               break;
            case 51:
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
               }
               if(this.game.pc && this.game.pcLightning && this.§_-D4§ == LEVEL_NORMAL && this.menu != null && this.menu.powersHolder.numChildren != 0)
               {
                  this.cancelExtraPowers();
                  if(this.powerPointer == null)
                  {
                     PowerLightning(this.menu.powersHolder.getChildAt(2)).§_-6f§();
                     break;
                  }
                  if(getQualifiedClassName(this.powerPointer) == "PowerPointerLightning")
                  {
                     this.powerPointer.cancelPower();
                     break;
                  }
                  this.powerPointer.cancelPower();
                  PowerLightning(this.menu.powersHolder.getChildAt(2)).§_-6f§();
                  break;
               }
               break;
            case 192:
               if(this.powerPointer != null)
               {
                  this.powerPointer.cancelPower();
               }
               if(this.heroRallyPoint != null)
               {
                  this.heroRallyPoint.cancelRallyPoint();
                  break;
               }
               this.heroPortrait.click();
               break;
         }
         this.extraKeyPress(param1.keyCode);
      }
      
      public function §_-RZ§(param1:Boolean = false) : void
      {
         if(this.menuPause != null && !this.gui.contains(this.menuPause))
         {
            this.pause();
            if(param1)
            {
               this.menuPause.§_-St§();
            }
            else
            {
               this.menuPause.§_-62§();
            }
            this.gui.addChild(this.menuPause);
         }
      }
      
      public function §_-9P§() : void
      {
         if(this.menuPause != null && this.gui.contains(this.menuPause))
         {
            this.pause();
            this.gui.removeChild(this.menuPause);
         }
      }
      
      public function extraKeyPress(param1:uint) : void
      {
      }
      
      public function cancelExtraPowers() : void
      {
      }
      
      public function cancelAllOnKeyPress() : void
      {
         if(this.powerPointer != null)
         {
            this.powerPointer.cancelPower();
            this.menu.forceHideInfo();
         }
         if(this.rallyPoint != null)
         {
            this.rallyPoint.cancelRallyPoint();
         }
         if(this.heroRallyPoint != null)
         {
            this.heroRallyPoint.cancelRallyPoint();
         }
         this.keyPressCheckExtra();
      }
      
      public function keyPressCheckExtra() : void
      {
      }
      
      public function loadGUI() : void
      {
         this.game.main.resetSounds();
         this.§_-8S§.x = 370;
         this.§_-8S§.y = 5;
         this.hud = new Hud(10,10,this.cash,this.initLives,this.maxWaves,this);
         this.notificationHolder = new NotificationSecondLevelHolder(this);
         this.gui.addChild(this.notificationHolder);
         this.§_-FA§ = new §_-QD§(this);
         this.gui.addChild(this.§_-FA§);
         this.§_-7a§ = new §_-E4§(this);
         this.gui.addChild(this.§_-7a§);
         this.§_-39§ = new ButtonEncyclopedia(this);
         this.gui.addChild(this.§_-39§);
         this.gui.addChild(this.hud);
         this.quickMenu = new TowerMenu(this);
         this.gui.addChild(this.menu);
         this.decals.addChild(this.enemySelection);
         this.decals.addChild(this.soldierSelection);
      }
      
      public function onPause() : Boolean
      {
         if(this.§_-D4§ == LEVEL_PAUSED)
         {
            return true;
         }
         return false;
      }
      
      public function pause(param1:Boolean = false, param2:Boolean = true) : void
      {
         if(!this.onPause())
         {
            if(param1)
            {
               this.block();
            }
            if(this.§_-D4§ != LEVEL_PRE_WIN)
            {
               this.§_-D4§ = LEVEL_PAUSED;
            }
            if(param2)
            {
               SoundManager.getInstance().stopAllFxSounds();
            }
            this.§_-4H§();
            this.pauseEntities();
            this.pauseBackground();
            this.§_-6I§();
            this.§_-9w§();
         }
         else
         {
            if(param1)
            {
               this.§_-Mw§();
            }
            this.§_-D4§ = LEVEL_NORMAL;
            this.§_-Pn§();
            this.unPauseEntities();
            this.§_-SR§();
            this.unPauseBackground();
            this.§_-P-§();
         }
      }
      
      public function block() : void
      {
         this.gui.addChild(this.§_-4K§);
         this.§_-4K§.show();
      }
      
      public function §_-Mw§() : void
      {
         this.§_-4K§.hide();
      }
      
      public function unPause() : void
      {
         this.§_-D4§ = LEVEL_NORMAL;
      }
      
      public function setPowerPointer(param1:§_-Tm§) : void
      {
         this.powerPointer = param1;
         this.disableLevelElements();
      }
      
      public function §_-QR§() : void
      {
         this.powerPointer = null;
         this.§_-Fe§();
      }
      
      public function §_-Fe§() : void
      {
         this.enableElements = true;
      }
      
      public function disableLevelElements() : void
      {
         this.enableElements = false;
      }
      
      public function freeMenues() : void
      {
         if(this.quickMenu != null && this.quickMenu.cTower != null && this.gui.contains(this.quickMenu))
         {
            this.quickMenu.hide();
         }
      }
      
      public function intro(param1:MouseEvent) : void
      {
         if(!this.enableElements)
         {
            return;
         }
         this.menu.forceHideInfo();
         this.freeMenues();
         this.removeToopTip();
      }
      
      public function towerRangeClick(param1:MouseEvent) : void
      {
         this.forceFreeQuickMenu();
      }
      
      public function towerRangeNewClick(param1:MouseEvent) : void
      {
         this.forceFreeQuickMenu();
      }
      
      public function forceFreeQuickMenu() : void
      {
         if(this.quickMenu.cTower == null)
         {
            return;
         }
         if(this.gui.contains(this.quickMenu))
         {
            this.quickMenu.hide();
         }
      }
      
      public function init(param1:Event) : void
      {
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.§_-D4§ == LEVEL_STARTING)
         {
            if(this.initTimeCounter < this.initTime)
            {
               this.initTimeCounter++;
               if(this.initTimeCounter + 3 == this.initTime)
               {
                  this.loadGUI();
               }
               return;
            }
            this.§_-D4§ = LEVEL_NORMAL;
            if(this.data.levelIndex == 0 && this.mode == GameSettings.§_-OS§)
            {
               this.pause(true);
               this.gui.addChild(new TutorialIntro(new Point(0,0),this));
            }
            if(!this.game.challengeShow && this.mode != GameSettings.§_-OS§)
            {
               this.forceFreeQuickMenu();
               this.sendPauseNotification("NotificationTipChallenges");
               this.game.challengeShow = true;
               this.game.§const§();
            }
            if(!this.game.heroShow && !this.§_-GQ§ && this.game.gameUpgrades.heroRoomEnabled && this.game.gameUpgrades.selectedHero != 0)
            {
               this.forceFreeQuickMenu();
               this.sendSecondLevelNotification("NotificationTipHeroes");
               this.§_-GQ§ = true;
            }
         }
         if(this.§_-D4§ == LEVEL_NORMAL || this.§_-D4§ == LEVEL_PRE_WIN)
         {
            this.clips = 0;
            if(this.§_-D4§ == LEVEL_NORMAL)
            {
               this.§_-DR§();
            }
            if(this.§_-D4§ == LEVEL_NORMAL || this.§_-D4§ == LEVEL_PRE_WIN)
            {
               if(this.stage.focus != this.stage)
               {
                  this.stage.focus = this.stage;
               }
               this.game.gameSounds.onFrameUpdate();
               this.updateEntities();
               this.updateBullets();
               this.updateBulletsDecals();
               this.updateDecals();
               this.updateBackground();
               this.§_-5e§();
               this.menu.updateMenu();
               this.notificationHolder.update();
               this.updatePointers();
            }
            if(this.§_-D4§ == LEVEL_PRE_WIN)
            {
               if(this.§_-On§ < this.§_-Qy§)
               {
                  this.§_-On§++;
                  return;
               }
               if(this.data.levelIndex < 11 || this.data.levelIndex == 11 && this.mode != GameSettings.§_-OS§)
               {
                  this.pause(true);
               }
               this.§_-D4§ = LEVEL_WIN;
               this.addMenuVictory();
            }
         }
      }
      
      public function onPreWin() : void
      {
      }
      
      public function addMenuVictory() : void
      {
         switch(this.mode)
         {
            case GameSettings.§_-OS§:
               this.addChild(new MenuVictory(this));
               break;
            case GameSettings.§_-R6§:
               this.addChild(new MenuVictoryHeroic(this));
               break;
            case GameSettings.§_-AQ§:
               this.addChild(new MenuVictoryIron(this));
         }
      }
      
      public function updatePointers() : void
      {
         if(this.powerPointer)
         {
            this.powerPointer.onFrameUpdate();
         }
      }
      
      public function updateEntities() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.entities.numChildren)
         {
            _loc1_[this.entities.getChildAt(_loc2_)] = this.entities.getChildAt(_loc2_);
            this.clips++;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.onFrameUpdate();
         }
         _loc1_ = null;
      }
      
      public function updateDecals() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).onFrameUpdate();
            this.clips++;
            _loc1_++;
         }
      }
      
      public function updateBackground() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.background.numChildren)
         {
            §_-Bx§(this.background.getChildAt(_loc1_)).onFrameUpdate();
            this.clips++;
            _loc1_++;
         }
      }
      
      public function updateBullets() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.bullets.numChildren)
         {
            _loc1_[this.bullets.getChildAt(_loc2_)] = this.bullets.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.onFrameUpdate();
         }
         _loc1_ = null;
      }
      
      public function updateBulletsDecals() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).onFrameUpdate();
            this.clips++;
            _loc1_++;
         }
      }
      
      public function pauseEntities() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.entities.numChildren)
         {
            _loc1_[this.entities.getChildAt(_loc2_)] = this.entities.getChildAt(_loc2_);
            this.clips++;
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.pause();
         }
         _loc1_ = null;
      }
      
      public function unPauseEntities() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.entities.numChildren)
         {
            MovieClip(this.entities.getChildAt(_loc1_)).unPause();
            this.clips++;
            _loc1_++;
         }
      }
      
      public function pauseEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.enemies)
         {
            _loc1_.pause();
         }
      }
      
      public function unPauseEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.enemies)
         {
            _loc1_.unPause();
         }
      }
      
      public function §_-Hb§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.pause();
         }
      }
      
      public function §_-GX§() : void
      {
         var _loc1_:Soldier = null;
         for each(_loc1_ in this.soldiers)
         {
            _loc1_.unPause();
         }
      }
      
      public function pauseBackground() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.background.numChildren)
         {
            §_-Bx§(this.background.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function unPauseBackground() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.background.numChildren)
         {
            §_-Bx§(this.background.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function §_-R7§() : void
      {
         var _loc1_:Tower = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.pause();
         }
      }
      
      public function §_-0L§() : void
      {
         var _loc1_:Tower = null;
         for each(_loc1_ in this.towers)
         {
            _loc1_.unPause();
         }
      }
      
      public function §_-9w§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §_-P-§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bulletsDecals.numChildren)
         {
            MovieClip(this.bulletsDecals.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function §_-6I§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bullets.numChildren)
         {
            MovieClip(this.bullets.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §_-SR§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.bullets.numChildren)
         {
            MovieClip(this.bullets.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function §_-4H§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).pause();
            _loc1_++;
         }
      }
      
      public function §_-Pn§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.decals.numChildren)
         {
            MovieClip(this.decals.getChildAt(_loc1_)).unPause();
            _loc1_++;
         }
      }
      
      public function initTowers(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.entities.addChild(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function removeTower(param1:Tower) : void
      {
         delete this.towers[param1];
      }
      
      public function removeEnemy(param1:Enemy) : void
      {
         delete this.enemies[param1];
      }
      
      public function removeEnemyStatic(param1:Enemy) : void
      {
         delete this.staticEnemies[param1];
      }
      
      public function addSoldier(param1:Soldier) : void
      {
         this.soldiers[param1] = param1;
      }
      
      public function removeSoldier(param1:Soldier) : void
      {
         delete this.soldiers[param1];
      }
      
      public function addBackground(param1:§_-Bx§) : void
      {
         this.background.addChild(param1);
      }
      
      public function removeBackground(param1:§_-Bx§) : void
      {
         this.background.removeChild(param1);
      }
      
      public function §_-74§(param1:MovieClip) : void
      {
         this.bullets.removeChild(param1);
         this.addToDecal(param1);
      }
      
      public function addToDecal(param1:MovieClip) : void
      {
         this.decals.addChild(param1);
      }
      
      public function updateCash(param1:int) : void
      {
         if(param1 > 0)
         {
            this.§_-Ip§ = this.§_-Ip§ + param1;
         }
         this.cash = this.cash + param1;
         this.hud.updateCash(this.cash);
      }
      
      public function onRangeStaticArea(param1:Array, param2:Point) : Boolean
      {
         if(Math.sqrt(Math.pow(param1[0] - param2.y,2) + Math.pow(param1[1] - param2.x,2)) < param1[2])
         {
            return true;
         }
         return false;
      }
      
      public function looseLive(param1:int) : void
      {
         this.game.gameSounds.playGUILooseLife();
         this.lives = this.lives - param1;
         if(this.lives <= 0)
         {
            this.lives = 0;
         }
         this.hud.updateLives(this.lives);
         if(this.lives == 0)
         {
            this.§_-Hv§();
         }
      }
      
      public function getTip() : String
      {
         return this.game.getTip();
      }
      
      public function §_-Hv§() : void
      {
         this.pause(true);
         this.§_-D4§ = LEVEL_OVER;
         this.addChild(new §_-Dw§(this));
      }
      
      protected function getNumberOfWaves() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.waves.length)
         {
            _loc1_++;
            while(_loc2_ + 1 < this.waves.length && this.waves[_loc2_ + 1].interval == 0)
            {
               _loc2_++;
            }
            _loc2_++;
         }
         this.maxWaves = _loc1_;
         this.currentWave = 0;
      }
      
      private function §_-DR§() : void
      {
         var _loc2_:Wave = null;
         var _loc3_:Wave = null;
         var _loc4_:int = 0;
         if(!this.§_-r§)
         {
            if(this.game.gameUpgrades.heroRoomEnabled && this.game.gameUpgrades.selectedHero != 0)
            {
               if(this.mode == GameSettings.§_-OS§ || this.§_-1s§)
               {
                  switch(this.game.gameUpgrades.selectedHero)
                  {
                     case GameSettings.§_-99§:
                        this.entities.addChild(new §_-Ep§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.§_-PW§:
                        this.entities.addChild(new §_-Qw§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.§_-Od§:
                        this.entities.addChild(new SoldierHeroBolin(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.HERO_DENAS:
                        this.entities.addChild(new §_-IC§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.§_-98§:
                        this.entities.addChild(new §_-HZ§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.§_-7H§:
                        this.entities.addChild(new §_-3l§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                        break;
                     case GameSettings.§_-6P§:
                        this.entities.addChild(new §_-Mg§(new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),new Point(this.§_-4B§[0].x,this.§_-4B§[0].y),null,new Point(this.§_-4B§[0].x,this.§_-4B§[0].y)));
                  }
               }
            }
            this.§_-r§ = true;
         }
         var _loc1_:int = 0;
         if(this.currentWave == 0 && this.§_-4R§)
         {
            return;
         }
         for each(_loc2_ in this.activeWaves)
         {
            _loc1_++;
         }
         if(_loc1_ == 0)
         {
            if(this.indexWaves < this.waves.length)
            {
               if(this.waves[this.indexWaves].interval == this.intervalWaveCounter)
               {
                  if(this.indexWaves != 0 && this.waves[this.indexWaves].notification != "")
                  {
                     this.forceFreeQuickMenu();
                     this.sendPauseNotification(this.waves[this.indexWaves].notification);
                  }
                  this.currentWave++;
                  this.activeWaves[this.waves[this.indexWaves]] = this.waves[this.indexWaves];
                  this.intervalWaveCounter = 0;
                  this.indexWaves++;
                  this.hud.updateWaves(this.currentWave,this.maxWaves);
                  this.afterNextWaveStart();
                  while(this.indexWaves < this.waves.length && this.waves[this.indexWaves].interval == 0)
                  {
                     this.activeWaves[this.waves[this.indexWaves]] = this.waves[this.indexWaves];
                     this.indexWaves++;
                  }
                  this.menu.§_-Ej§();
               }
               else
               {
                  if(this.indexWaves == 0 && this.waves[this.indexWaves].notification != "")
                  {
                     this.forceFreeQuickMenu();
                     this.sendPauseNotification(this.waves[this.indexWaves].notification);
                  }
                  if(this.intervalWaveCounter == 50 && this.waves[this.indexWaves].interval != 0 || this.indexWaves == 0)
                  {
                     this.waves[this.indexWaves].showWaveFlag(this,this.waves[this.indexWaves].interval - 50,this.indexWaves);
                     if(this.§_-65§ != null)
                     {
                        this.game.gameSounds.§_-Aw§();
                     }
                     _loc4_ = this.indexWaves + 1;
                     while(_loc4_ < this.waves.length && this.waves[_loc4_].interval == 0)
                     {
                        this.waves[_loc4_].showWaveFlag(this,this.waves[this.indexWaves].interval - 50,this.indexWaves);
                        _loc4_++;
                     }
                     this.afterNextWaveFlagShow();
                  }
                  if(this.indexWaves == 0)
                  {
                     this.§_-4R§ = true;
                  }
                  else
                  {
                     this.intervalWaveCounter++;
                  }
               }
            }
            else if(!this.hasEnemies())
            {
               this.§_-D4§ = LEVEL_PRE_WIN;
               this.onPreWin();
               this.§_-9-§();
            }
         }
         for each(_loc3_ in this.activeWaves)
         {
            _loc3_.spawnEnemies(this);
         }
      }
      
      public function afterNextWaveFlagShow() : void
      {
      }
      
      public function afterNextWaveStart() : void
      {
      }
      
      public function §_-9-§() : void
      {
         if(this.fearless && this.maxWaves > 1)
         {
            this.game.gameAchievement.§_-NI§(this);
         }
         this.§_-RI§();
         this.checkLevelSpecialAchievements();
      }
      
      public function §_-RI§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.mode == GameSettings.§_-OS§ && this.game.gameAchievement.greatDefender)
         {
            return;
         }
         if(this.mode == GameSettings.§_-R6§ && this.game.gameAchievement.greatDefenderHeroic)
         {
            return;
         }
         if(this.mode == GameSettings.§_-AQ§ && this.game.gameAchievement.greatDefenderIron)
         {
            return;
         }
         var _loc1_:Boolean = true;
         if(this.mode == GameSettings.§_-OS§)
         {
            _loc2_ = 0;
            while(_loc2_ < 12)
            {
               if(SaveDataLevel(this.game.§_-6l§[_loc2_]).campaignDifficulty != GameSettings.DIFFICULTY_NORMAL)
               {
                  if(this.data.levelIndex != _loc2_ || this.data.levelIndex == _loc2_ && this.game.difficulty != GameSettings.DIFFICULTY_NORMAL)
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc2_++;
            }
            if(_loc1_)
            {
               this.game.gameAchievement.§_-19§(this);
            }
            return;
         }
         if(this.mode == GameSettings.§_-R6§)
         {
            _loc3_ = 0;
            while(_loc3_ < 12)
            {
               if(!SaveDataLevel(this.game.§_-6l§[_loc3_]).heroicModeWin || SaveDataLevel(this.game.§_-6l§[_loc3_]).heroicDifficulty != GameSettings.DIFFICULTY_NORMAL)
               {
                  if(this.data.levelIndex != _loc3_ || this.data.levelIndex == _loc3_ && this.game.difficulty != GameSettings.DIFFICULTY_NORMAL)
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc3_++;
            }
            if(_loc1_)
            {
               this.game.gameAchievement.§_-Iu§(this);
            }
            return;
         }
         if(this.mode == GameSettings.§_-AQ§)
         {
            _loc4_ = 0;
            while(_loc4_ < 12)
            {
               if(!SaveDataLevel(this.game.§_-6l§[_loc4_]).ironModeWin || SaveDataLevel(this.game.§_-6l§[_loc4_]).ironDifficulty != GameSettings.DIFFICULTY_NORMAL)
               {
                  if(this.data.levelIndex != _loc4_ || this.data.levelIndex == _loc4_ && this.game.difficulty != GameSettings.DIFFICULTY_NORMAL)
                  {
                     _loc1_ = false;
                     break;
                  }
               }
               _loc4_++;
            }
            if(_loc1_)
            {
               this.game.gameAchievement.chkGreatDefenderIron(this);
            }
            return;
         }
      }
      
      public function checkLevelSpecialAchievements() : void
      {
      }
      
      public function sendPauseNotification(param1:String) : void
      {
         var _loc2_:Class = getDefinitionByName(param1) as Class;
         this.pause(true);
         this.gui.addChild(new _loc2_(this,true));
      }
      
      public function sendSecondLevelNotification(param1:String) : void
      {
         this.notificationHolder.addNotification(param1);
      }
      
      public function §_-P6§(param1:Point) : void
      {
         var _loc2_:int = 0;
         if(this.§_-4R§)
         {
            if(this.power2)
            {
               this.unlockPowerFireball();
            }
            if(this.power1)
            {
               this.unlockPowerReinforcement();
            }
            this.unlockPowerLightning();
            this.§_-4R§ = false;
            if(this.§_-65§ != null && this.bullets.contains(this.§_-65§))
            {
               this.bullets.removeChild(this.§_-65§);
            }
            this.playLevelMusic();
         }
         else
         {
            if(this.intervalWaveCounter / 30 <= 3)
            {
               this.game.gameAchievement.§_-15§(this);
            }
            this.game.gameAchievement.§_-Qs§(this);
         }
         if(this.indexWaves != 0)
         {
            this.menu.§_-3v§(this.waves[this.indexWaves].interval - this.intervalWaveCounter);
            _loc2_ = Math.round((this.waves[this.indexWaves].interval - this.intervalWaveCounter) / this.gameSettings.framesRate);
            if(_loc2_ >= 1)
            {
               this.bullets.addChild(new WaveFlagReward(param1,Math.round(_loc2_ * 1)));
               this.game.gameSounds.§_-Bv§();
               this.updateCash(Math.round(_loc2_ * 1));
            }
         }
         this.intervalWaveCounter = this.waves[this.indexWaves].interval;
         this.§_-2i§();
      }
      
      public function playLevelMusic() : void
      {
         this.game.gameSounds.stopAllMusics();
         this.game.gameSounds.playMusicBattle();
      }
      
      public function §_-Ga§(param1:WaveFlag) : void
      {
         var _loc3_:WaveFlag = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-Ba§)
         {
            _loc2_++;
         }
         if(_loc2_ == 0)
         {
            this.menu.§_-Id§();
         }
         this.§_-Ba§[param1] = param1;
      }
      
      public function §_-Ri§(param1:WaveFlag, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:WaveFlag = null;
         param1.§_-L5§();
         delete this.§_-Ba§[param1];
         if(!param2)
         {
            _loc3_ = 0;
            for each(_loc4_ in this.§_-Ba§)
            {
               _loc3_++;
            }
            if(_loc3_ == 0)
            {
               this.menu.§_-Ej§();
            }
         }
      }
      
      public function §_-5t§(param1:WaveFlag) : void
      {
         var _loc3_:WaveFlag = null;
         delete this.§_-Ba§[param1];
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-Ba§)
         {
            _loc2_++;
         }
         if(_loc2_ == 0)
         {
            this.menu.§_-Ej§();
         }
      }
      
      public function §_-2i§() : void
      {
         var _loc1_:WaveFlag = null;
         for each(_loc1_ in this.§_-Ba§)
         {
            this.§_-Ri§(_loc1_,true);
         }
         this.menu.§_-Ej§();
      }
      
      public function unlockPowerFireball() : void
      {
         this.menu.unlockPower(0);
      }
      
      public function unlockPowerReinforcement() : void
      {
         this.menu.unlockPower(1);
      }
      
      public function unlockPowerLightning() : void
      {
         if(this.game.pc && this.game.pcLightning)
         {
            this.menu.unlockPower(2);
         }
      }
      
      public function §for §() : void
      {
         this.fireballCounter++;
         if(this.fireballCounter == 5)
         {
            this.game.gameAchievement.checkArmaggedon(this);
         }
      }
      
      public function addElementalAchievement() : void
      {
         this.elementals++;
         if(this.elementals == 5)
         {
            this.game.gameAchievement.§_-D1§(this);
         }
      }
      
      public function addTeslaAchievement() : void
      {
         this.teslas++;
         if(this.teslas == 4)
         {
            this.game.gameAchievement.§_-Q4§(this);
         }
      }
      
      public function addSellTowerAchievement() : void
      {
         this.sellTowersCounter++;
         if(this.sellTowersCounter == 5)
         {
            this.game.gameAchievement.§_-H4§(this);
         }
         this.game.gameAchievement.sellTower(this);
      }
      
      protected function hasEnemies() : Boolean
      {
         var _loc1_:Enemy = null;
         var _loc2_:Enemy = null;
         if(this.isReadyToWin)
         {
            if(this.readyToWinTimeCounter < this.readyToWinTime)
            {
               this.readyToWinTimeCounter++;
               if(this.readyToWinTimeCounter % 10 == 0)
               {
                  for each(_loc2_ in this.enemies)
                  {
                     if(!_loc2_.isBoss || _loc2_.isBoss && !_loc2_.isDead)
                     {
                        this.isReadyToWin = false;
                     }
                  }
               }
               return true;
            }
            return false;
         }
         for each(_loc1_ in this.enemies)
         {
            if(!_loc1_.isBoss || _loc1_.isBoss && !_loc1_.isDead)
            {
               return true;
            }
         }
         this.isReadyToWin = true;
         this.readyToWinTimeCounter = 0;
         return true;
      }
      
      private function traceEnemies() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.enemies)
         {
            _loc1_++;
            if(!_loc2_.onTunnel)
            {
            }
         }
      }
      
      private function §_-5e§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.entities.numChildren - 1;
         while(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this.entities.getChildAt(_loc2_).y > this.entities.getChildAt(_loc2_ + 1).y)
               {
                  this.entities.swapChildrenAt(_loc2_,_loc2_ + 1);
               }
               _loc2_++;
            }
            _loc1_--;
         }
      }
      
      protected function getDestinationPoint(param1:Ellipse, param2:int) : Point
      {
         return param1.getPointOfDegreeAux(param2);
      }
      
      public function getRandomPath(param1:int) : Array
      {
         var _loc2_:int = Math.ceil(Math.random() * this.paths[param1].length) - 1;
         return this.paths[param1][_loc2_];
      }
      
      public function §_-HV§(param1:Number, param2:Number) : Number
      {
         return Math.ceil(Math.random() * (param2 - param1) + param1) - 1;
      }
      
      public function addToopTip(param1:Tooltip) : void
      {
         this.removeToopTip();
         this.toolTip = param1;
         this.gui.addChild(this.toolTip);
         param1 = null;
      }
      
      public function removeToopTip() : void
      {
         if(this.toolTip != null)
         {
            this.toolTip.destroyThis();
            this.toolTip = null;
         }
      }
      
      public function §_-7m§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-4B§.length)
         {
            this.decals.addChild(new DefenseIndicator(this.§_-4B§[_loc1_]));
            _loc1_++;
         }
      }
      
      public function getStars() : int
      {
         if(this.mode != GameSettings.§_-OS§)
         {
            return 3;
         }
         if(this.lives >= 18)
         {
            return 3;
         }
         if(this.lives > 5 && this.lives < 18)
         {
            return 2;
         }
         return 1;
      }
      
      public function changeTunneStatus(param1:int, param2:Boolean) : void
      {
      }
      
      public function isTowerLocked(param1:*, param2:*) : Boolean
      {
         switch(param1)
         {
            case GameSettings.§_-U§:
               if(this.unlockMaxArchers >= param2 || this.unlockMaxArchers == 0 && param2 != 1 && this.unlockMaxArchersLevel >= param2)
               {
                  return false;
               }
               break;
            case GameSettings.§_-5d§:
               if(this.unlockMaxMages >= param2 || this.unlockMaxMages == 0 && param2 != 1 && this.unlockMaxMagesLevel >= param2)
               {
                  return false;
               }
               break;
            case GameSettings.§_-Ko§:
               if(this.unlockMaxEngineers >= param2 || this.unlockMaxEngineers == 0 && param2 != 1 && this.unlockMaxEngineersLevel >= param2)
               {
                  return false;
               }
               break;
            case GameSettings.§_-5z§:
               if(this.unlockMaxBarracks >= param2 || this.unlockMaxBarracks == 0 && param2 != 1 && this.unlockMaxBarracksLevel >= param2)
               {
                  return false;
               }
               break;
         }
         return true;
      }
      
      function loadXML(param1:Event) : void
      {
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:XML = new XML(param1.target.data);
         _loc5_ = "this.waves = [ \n ";
         this.cash = int(_loc4_.cash);
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.wave.length())
         {
            _loc2_ = new Array();
            _loc5_ = _loc5_ + "new Wave(\t [ \n";
            _loc8_ = 0;
            while(_loc8_ < _loc4_.wave[_loc6_].spawns.spawn.length())
            {
               _loc2_.push(new WaveSpawn(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].creep,_loc4_.wave[_loc6_].spawns.spawn[_loc8_].creep_aux,int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].max_same),int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].max),int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].interval),int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].interval_next),Boolean(int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].fixed_sub_path)),int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].path)));
               _loc5_ = _loc5_ + ("new WaveSpawn(\"" + _loc4_.wave[_loc6_].spawns.spawn[_loc8_].creep + "\", \"" + _loc4_.wave[_loc6_].spawns.spawn[_loc8_].creep_aux + "\"," + int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].max_same) + ", " + int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].max) + ", " + int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].interval) + ", " + int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].interval_next) + ", " + Boolean(int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].fixed_sub_path)).toString() + ", " + int(_loc4_.wave[_loc6_].spawns.spawn[_loc8_].path) + ")");
               if(_loc8_ + 1 < _loc4_.wave[_loc6_].spawns.spawn.length())
               {
                  _loc5_ = _loc5_ + ",\n";
               }
               else
               {
                  _loc5_ = _loc5_ + "]";
               }
               _loc8_++;
            }
            _loc3_.push(new Wave(_loc2_,int(_loc4_.wave[_loc6_].interval),int(_loc4_.wave[_loc6_].path_index),_loc4_.wave[_loc6_].notification,_loc4_.wave[_loc6_].notification_second_level));
            _loc5_ = _loc5_ + (", " + int(_loc4_.wave[_loc6_].interval) + "," + int(_loc4_.wave[_loc6_].path_index) + ",\"" + _loc4_.wave[_loc6_].notification + "\",\"" + _loc4_.wave[_loc6_].notification_second_level + "\" ),\n\n\n");
            _loc6_++;
         }
         this.waves = _loc3_;
         var _loc7_:int = 0;
         while(_loc7_ < this.waves.length)
         {
            _loc9_ = 0;
            while(_loc9_ < Wave(this.waves[_loc7_]).spawns.length)
            {
               _loc9_++;
            }
            _loc7_++;
         }
         _loc5_ = _loc5_ + "];";
         this.getNumberOfWaves();
      }
      
      public function destroyLevelSpecific() : void
      {
      }
      
      public function destroyThis() : void
      {
         var _loc1_:WaveFlag = null;
         var _loc2_:Wave = null;
         this.§_-9P§();
         this.menuPause = null;
         this.destroyLevelSpecific();
         if(this.graveyard != null)
         {
            this.graveyard.destroyThis();
         }
         if(this.swamp != null)
         {
            this.swamp.destroyThis();
         }
         this.removeEventListener(Event.DEACTIVATE,this.onDeactivate);
         this.towerRange.removeEventListener(MouseEvent.MOUSE_DOWN,this.towerRangeClick);
         this.towerRangeNew.removeEventListener(MouseEvent.MOUSE_DOWN,this.towerRangeNewClick);
         this.gTerrain.removeEventListener(MouseEvent.MOUSE_DOWN,this.intro);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-Bc§);
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.game.gameSounds.unSetLevel();
         for each(_loc1_ in this.§_-Ba§)
         {
            _loc1_.destroyThis(false);
         }
         this.quickMenu.destroyThis();
         this.quickMenu = null;
         for each(_loc2_ in this.activeWaves)
         {
            _loc2_.destroyThis();
         }
         if(this.§_-65§ != null)
         {
            this.§_-65§.destroyThis();
         }
         this.§_-65§ = null;
         this.data = null;
         this.§_-8S§ = null;
         this.§_-4K§ = null;
         this.gameSettings.destroyThis();
         this.gameSettings = null;
         this.§_-4B§ = null;
         this.paths = null;
         this.tunnels = null;
         this.§_-Az§ = null;
         if(this.toolTip != null)
         {
            this.gui.removeChild(this.toolTip);
            this.toolTip = null;
         }
         this.menu = null;
         this.hud = null;
         this.notificationHolder = null;
         this.§_-FA§.destroyThis();
         this.§_-FA§ = null;
         this.§_-7a§.destroyThis();
         this.§_-7a§ = null;
         this.§_-39§.destroyThis();
         this.§_-39§ = null;
         this.ellipses.removeChild(this.towerRange);
         this.ellipses.removeChild(this.towerRangeNew);
         this.ellipses.removeChild(this.towerRangeRallyPoint);
         this.towerRange = null;
         this.towerRangeNew = null;
         this.towerRangeRallyPoint = null;
         this.waves = null;
         this.activeWaves = null;
         this.terrain.removeChild(this.gTerrain);
         this.gTerrain = null;
         this.removeChild(this.terrain);
         this.terrain = null;
         this.removeChild(this.ellipses);
         this.ellipses = null;
         this.removeChild(this.background);
         this.background = null;
         this.removeChild(this.decals);
         this.decals = null;
         this.removeChild(this.entities);
         this.entities = null;
         this.removeChild(this.frontEntities);
         this.frontEntities = null;
         this.removeChild(this.bulletsDecals);
         this.bulletsDecals = null;
         this.removeChild(this.bullets);
         this.bullets = null;
         this.removeChild(this.gui);
         this.gui = null;
         this.towers = null;
         this.enemies = null;
         this.soldiers = null;
         this.§_-Ba§ = null;
         this.staticEnemies = null;
         this.staticAreas = null;
         this.rallyPoint = null;
         this.powerPointer = null;
         this.heroPortrait = null;
         this.enemySelection = null;
         this.soldierSelection = null;
         this.§_-NX§ = null;
         this.game = null;
         this.parent.removeChild(this);
      }
   }
}
