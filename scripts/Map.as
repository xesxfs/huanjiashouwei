package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Map extends Sprite
   {
      
      private static const §_-21§:int = 0;
      
      private static const §_-Dn§:int = 1;
      
      private static const §_-NO§:int = 2;
      
      private static const §_-1G§:int = 3;
      
      private static const §_-Fy§:int = 4;
      
      private static const §_-9O§:int = 5;
       
      
      public var game:Game;
      
      public var §_-5r§:MapBlock;
      
      private var ship1:MapShip1;
      
      private var ship2:MapShip2;
      
      private var ship3:MapShipKraken;
      
      private var §_-Az§:Array;
      
      private var §_-Rq§:§_-0t§;
      
      private var terrain:Sprite;
      
      private var §_-TA§:Sprite;
      
      private var road:Sprite;
      
      private var §_-Ba§:Sprite;
      
      private var socialScreen:MenuSocial;
      
      private var btnUpgrades:ButUpgrades;
      
      private var §_-Lk§:§_-9W§;
      
      private var §case §:§_-By§;
      
      private var §_-3N§:§_-1y§;
      
      private var §_-47§:§_-KT§;
      
      private var §false§:§_-4y§;
      
      private var upgradeStarsAlert:§_-TT§;
      
      private var §_-Lf§:§_-Lz§;
      
      private var §_-IE§:MapStarProgress;
      
      private var mode:int;
      
      private var modeFlags:int;
      
      private var §_-4p§:Boolean;
      
      private var loadingTime:int = 30;
      
      private var loadingTimeCounter:int;
      
      private var §_-TO§:int;
      
      private var §_-II§:int;
      
      private var §_-42§:Array;
      
      private var §_-6N§:int;
      
      private var flagNew:int;
      
      private var signAlertUpgrades:SignAlertUpgrades;
      
      private var §_-Kb§:MovieClip;
      
      private var §_-CJ§:§_-SO§;
      
      private var §_-F7§:int = 60;
      
      private var §_-7Z§:int = 20;
      
      private var §_-CM§:int = 59;
      
      private var § do§:int = 0;
      
      private var §_-GP§:int;
      
      private var progressCurrentStarsUpgrades:int;
      
      private var §_-AU§:int = 30;
      
      private var §_-6R§:int = 0;
      
      private var §_-8g§:int;
      
      private var §_-6Z§:int;
      
      private var §_-MU§:int = 30;
      
      private var §_-EY§:int = 0;
      
      private var §_-FV§:§_-7x§;
      
      private var §_-N§:§_-F6§;
      
      public var itemsLocked:Boolean;
      
      private var §_-Bi§:Tween;
      
      private var §_-Er§:Tween;
      
      private var alphaTweenMenuBack:Tween;
      
      private var §_-B1§:Tween;
      
      private var alphaTweenEncyclopedia:Tween;
      
      private var yTweenUpgrades:Tween;
      
      private var alphaTweenUpgrades:Tween;
      
      private var §_-S6§:Tween;
      
      private var alphaTweenAchievements:Tween;
      
      private var §_-3V§:Tween;
      
      private var alphaTweenPremium:Tween;
      
      private var §_-7z§:Tween;
      
      private var alphaTweenHeroRoom:Tween;
      
      private var §_-Hu§:MapErrorWarning;
      
      public function Map(param1:Game)
      {
         this.§_-5r§ = new MapBlock();
         this.§_-Az§ = [];
         this.terrain = new Sprite();
         this.§_-TA§ = new Sprite();
         this.road = new Sprite();
         this.§_-Ba§ = new Sprite();
         this.§_-IE§ = new MapStarProgress();
         this.§_-42§ = [];
         super();
         this.game = param1;
         if(!this.game.§_-Pd§)
         {
            this.game.gameEncyclopedia.saveData();
            this.game.gameAchievement.saveData();
         }
         else
         {
            this.§_-4z§();
         }
         this.mode = §_-NO§;
         this.modeFlags = §_-21§;
         this.§_-TO§ = 70;
         this.§_-II§ = 0;
         this.addChild(this.terrain);
         this.addChild(this.§_-TA§);
         this.addChild(this.road);
         this.addChild(this.§_-Ba§);
         this.§_-N§ = new §_-F6§(this.game.main,new Point(60,18));
         this.addChild(this.§_-N§);
         this.§_-FV§ = new §_-7x§(this.game.main,new Point(96,18));
         this.addChild(this.§_-FV§);
         this.§_-Lf§ = new §_-Lz§();
         this.terrain.addChild(this.§_-Lf§);
         this.ship1 = new MapShip1(new Point(88,498));
         this.terrain.addChild(this.ship1);
         this.ship2 = new MapShip2(new Point(147,491));
         this.terrain.addChild(this.ship2);
         this.ship3 = new MapShipKraken(new Point(114,437));
         this.terrain.addChild(this.ship3);
         this.socialScreen = new MenuSocial(this.game);
         this.upgradeStarsAlert = new §_-TT§();
         this.§_-3D§();
         this.§_-o§();
         this.§_-GS§();
         this.game.gameSounds.stopAllMusics();
         this.game.gameSounds.§_-7C§();
         this.§_-Hu§ = new MapErrorWarning(this.game);
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function endSession() : void
      {
         this.game.main.showMainMenu();
         this.destroyThis();
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         this.ship1.onFrameUpdate();
         this.ship2.onFrameUpdate();
         this.ship3.onFrameUpdate();
         if(this.mode == §_-NO§)
         {
            if(this.loadingTimeCounter < this.loadingTime)
            {
               this.loadingTimeCounter++;
               return;
            }
            this.loadButtons();
            this.mode = this.modeFlags;
         }
         if(this.mode == §_-9O§)
         {
            if(this.§ do§ < this.§_-F7§)
            {
               this.§ do§++;
               if(this.§ do§ == this.§_-7Z§ - 10)
               {
                  this.game.gameSounds.§_-4w§();
               }
               if(this.§ do§ == this.§_-7Z§)
               {
                  this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[0],SaveDataLevel(this.game.§_-6l§[0])));
               }
               if(this.§ do§ == this.§_-CM§)
               {
                  this.§_-CJ§ = new §_-SO§(new Point(106,436));
                  this.§_-Ba§.addChild(this.§_-CJ§);
               }
               return;
            }
            this.mode = §_-21§;
         }
         if(this.mode == §_-Dn§)
         {
            if(!this.§_-Sw§())
            {
               return;
            }
         }
         if(this.mode == §_-1G§)
         {
            if(this.§_-6R§ < this.§_-AU§)
            {
               this.§_-6R§++;
               return;
            }
            this.game.gameSounds.§_-Pr§("");
            this.§_-IE§.progress.text = this.game.starsWon.toString() + "/" + this.game.§_-Hj§;
            this.upgradeStarsAlert.item.txt.text = this.game.stars.toString();
            this.§_-IE§.gotoAndPlay("addStar");
            this.mode = §_-21§;
         }
         if(this.mode == §_-Fy§)
         {
            if(this.§_-EY§ < this.§_-MU§)
            {
               if(this.§_-EY§ == 8)
               {
                  this.game.gameSounds.§_-Pr§("");
               }
               if(this.§_-EY§ == 18)
               {
                  if(this.§_-6Z§ >= 2)
                  {
                     if(this.§_-8g§ == 2)
                     {
                        this.§_-IE§.gotoAndPlay("addStar");
                        this.§_-IE§.progress.text = this.§_-GP§ + 1 + "/" + this.game.§_-Hj§;
                        this.upgradeStarsAlert.item.txt.text = (this.progressCurrentStarsUpgrades + 1).toString();
                        this.§_-GP§++;
                        this.progressCurrentStarsUpgrades++;
                     }
                     this.game.gameSounds.§_-Pr§("2");
                  }
               }
               if(this.§_-EY§ == 28)
               {
                  if(this.§_-6Z§ == 3)
                  {
                     this.§_-IE§.gotoAndPlay("addStar");
                     this.§_-IE§.progress.text = this.§_-GP§ + 1 + "/" + this.game.§_-Hj§;
                     this.upgradeStarsAlert.item.txt.text = (this.progressCurrentStarsUpgrades + 1).toString();
                     this.§_-GP§++;
                     this.progressCurrentStarsUpgrades++;
                     this.game.gameSounds.§_-Pr§("3");
                  }
               }
               this.§_-EY§++;
               return;
            }
            this.mode = §_-21§;
         }
      }
      
      public function §_-RD§(param1:MouseEvent) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.addMapBlock();
         this.game.gameSounds.playGUIButtonCommon();
         this.addChild(new MenuEncyclopedia(this.game));
         this.itemsLocked = true;
      }
      
      public function §_-GA§(param1:MouseEvent) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.addMapBlock();
         this.game.gameSounds.playGUIButtonCommon();
         this.addChild(new MenuAchievements(this.game));
         this.itemsLocked = true;
      }
      
      public function clickUpgrades(param1:MouseEvent) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.addMapBlock();
         this.game.gameSounds.playGUIButtonCommon();
         this.addChild(new MenuUpgrades(this.game));
         this.itemsLocked = true;
      }
      
      public function §_-7w§(param1:MouseEvent) : void
      {
         this.§_-0Q§("MANUAL");
      }
      
      public function §_-4T§(param1:MouseEvent) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.addMapBlock();
         this.game.gameSounds.playGUIButtonCommon();
         this.addChild(new §_-11§(this.game));
         this.itemsLocked = true;
      }
      
      public function §_-0Q§(param1:String) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.addMapBlock();
         this.game.gameSounds.playGUIButtonCommon();
         if(this.game.pc)
         {
            this.addChild(new MenuPremium(this.game));
            this.itemsLocked = true;
         }
         else
         {
            this.addChild(new MenuPremiumWindow(this.game,null,false,param1));
         }
      }
      
      public function §_-1D§(param1:MouseEvent) : void
      {
         if(this.itemsLocked)
         {
            return;
         }
         this.game.main.showTransition(null,null,null,this);
         this.itemsLocked = true;
      }
      
      protected function loadButtons() : void
      {
         this.socialScreen.initMe();
         this.addChild(this.socialScreen);
         this.§_-IE§.x = 525;
         this.§_-IE§.y = 32;
         if(this.modeFlags == §_-21§ || this.modeFlags == §_-9O§)
         {
            this.§_-IE§.progress.text = this.game.starsWon + "/" + this.game.§_-Hj§;
         }
         this.terrain.addChild(this.§_-IE§);
         this.§case § = new §_-By§();
         this.§case §.x = 536;
         this.§case §.y = 499;
         this.btnUpgrades = new ButUpgrades();
         this.btnUpgrades.x = 351;
         this.btnUpgrades.y = 500;
         this.§_-Lk§ = new §_-9W§();
         this.§_-Lk§.x = 436;
         this.§_-Lk§.y = 499;
         this.§_-47§ = new §_-KT§();
         this.§_-47§.x = 260;
         this.§_-47§.y = 492;
         this.§_-Oq§();
         this.§_-3N§ = new §_-1y§();
         this.§_-3N§.x = 163;
         this.§_-3N§.y = 499;
         if(this.game.pc)
         {
            this.§_-3N§.gotoAndStop("idleActive");
         }
         else
         {
            this.§_-3N§.gotoAndStop("idle");
         }
         this.§false§ = new §_-4y§();
         this.§false§.x = 52;
         this.§false§.y = 518;
         this.§_-TA§.addChild(this.§false§);
         this.§_-TA§.addChild(this.btnUpgrades);
         this.§_-TA§.addChild(this.§_-Lk§);
         this.§_-TA§.addChild(this.§case §);
         this.§_-TA§.addChild(this.§_-3N§);
         this.§_-TA§.addChild(this.§_-47§);
         this.upgradeStarsAlert.x = 77;
         this.upgradeStarsAlert.y = 14;
         if(this.modeFlags == §_-21§ || this.modeFlags == §_-9O§)
         {
            this.upgradeStarsAlert.item.txt.text = this.game.stars.toString();
         }
         this.btnUpgrades.addChild(this.upgradeStarsAlert);
         this.§_-Ib§();
         this.§_-Bi§ = new Tween(this.§_-IE§,"y",Strong.easeOut,-49,this.§_-IE§.y,0.7,true);
         this.§_-Er§ = new Tween(this.§false§,"y",Strong.easeOut,469,this.§false§.y,0.7,true);
         this.yTweenUpgrades = new Tween(this.btnUpgrades,"y",Strong.easeOut,469,this.btnUpgrades.y,0.7,true);
         this.§_-B1§ = new Tween(this.§_-Lk§,"y",Strong.easeOut,469,this.§_-Lk§.y,0.7,true);
         this.§_-S6§ = new Tween(this.§case §,"y",Strong.easeOut,468,this.§case §.y,0.7,true);
         this.§_-3V§ = new Tween(this.§_-3N§,"y",Strong.easeOut,468,this.§_-3N§.y,0.7,true);
         this.§_-7z§ = new Tween(this.§_-47§,"y",Strong.easeOut,468,this.§_-47§.y,0.7,true);
         this.alphaTweenMenuBack = new Tween(this.§false§,"alpha",Strong.easeOut,0,1,0.7,true);
         this.alphaTweenUpgrades = new Tween(this.btnUpgrades,"alpha",Strong.easeOut,0,1,0.7,true);
         this.alphaTweenEncyclopedia = new Tween(this.§_-Lk§,"alpha",Strong.easeOut,0,1,0.7,true);
         this.alphaTweenAchievements = new Tween(this.§case §,"alpha",Strong.easeOut,0,1,0.7,true);
         this.alphaTweenPremium = new Tween(this.§_-3N§,"alpha",Strong.easeOut,0,1,0.7,true);
         this.alphaTweenHeroRoom = new Tween(this.§_-47§,"alpha",Strong.easeOut,0,1,0.7,true);
         this.§false§.addEventListener(MouseEvent.CLICK,this.§_-1D§,false,0,true);
         this.§false§.addEventListener(MouseEvent.ROLL_OVER,this.§_-4e§,false,0,true);
         this.§false§.addEventListener(MouseEvent.ROLL_OUT,this.§_-GC§,false,0,true);
         this.§false§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Qe§,false,0,true);
         this.§false§.addEventListener(MouseEvent.MOUSE_UP,this.§_-1x§,false,0,true);
         this.btnUpgrades.addEventListener(MouseEvent.CLICK,this.clickUpgrades,false,0,true);
         this.btnUpgrades.addEventListener(MouseEvent.ROLL_OVER,this.rollOverUpgrades,false,0,true);
         this.btnUpgrades.addEventListener(MouseEvent.ROLL_OUT,this.rollOutUpgrades,false,0,true);
         this.btnUpgrades.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownUpgrades,false,0,true);
         this.btnUpgrades.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpUpgrades,false,0,true);
         this.§_-Lk§.addEventListener(MouseEvent.CLICK,this.§_-RD§,false,0,true);
         this.§_-Lk§.addEventListener(MouseEvent.ROLL_OVER,this.§_-3Z§,false,0,true);
         this.§_-Lk§.addEventListener(MouseEvent.ROLL_OUT,this.§_-CY§,false,0,true);
         this.§_-Lk§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-1k§,false,0,true);
         this.§_-Lk§.addEventListener(MouseEvent.MOUSE_UP,this.§_-So§,false,0,true);
         this.§case §.addEventListener(MouseEvent.CLICK,this.§_-GA§,false,0,true);
         this.§case §.addEventListener(MouseEvent.ROLL_OVER,this.§_-SI§,false,0,true);
         this.§case §.addEventListener(MouseEvent.ROLL_OUT,this.§_-AJ§,false,0,true);
         this.§case §.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Nv§,false,0,true);
         this.§case §.addEventListener(MouseEvent.MOUSE_UP,this.§_-Je§,false,0,true);
         this.§_-3N§.addEventListener(MouseEvent.CLICK,this.§_-7w§,false,0,true);
         this.§_-3N§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Fm§,false,0,true);
         this.§_-3N§.addEventListener(MouseEvent.ROLL_OUT,this.§_-5i§,false,0,true);
         this.§_-3N§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-AO§,false,0,true);
         this.§_-3N§.addEventListener(MouseEvent.MOUSE_UP,this.§_-BJ§,false,0,true);
         this.§_-47§.addEventListener(MouseEvent.CLICK,this.§_-4T§,false,0,true);
         this.§_-47§.addEventListener(MouseEvent.ROLL_OVER,this.§_-2u§,false,0,true);
         this.§_-47§.addEventListener(MouseEvent.ROLL_OUT,this.§_-5B§,false,0,true);
         this.§_-47§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Tc§,false,0,true);
         this.§_-47§.addEventListener(MouseEvent.MOUSE_UP,this.§_-4C§,false,0,true);
      }
      
      protected function §_-4e§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§false§.buttonMode = true;
         this.§false§.mouseChildren = false;
         this.§false§.useHandCursor = true;
         this.§false§.gotoAndStop("over");
      }
      
      protected function §_-GC§(param1:MouseEvent) : void
      {
         this.§false§.useHandCursor = false;
         this.§false§.gotoAndStop("idle");
      }
      
      protected function §_-Qe§(param1:MouseEvent) : void
      {
         this.§false§.gotoAndStop("press");
      }
      
      protected function §_-1x§(param1:MouseEvent) : void
      {
         this.§false§.gotoAndStop("idle");
      }
      
      protected function §_-2u§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-47§.buttonMode = true;
         this.§_-47§.mouseChildren = false;
         this.§_-47§.useHandCursor = true;
         this.§_-47§.gotoAndStop("over");
      }
      
      protected function §_-5B§(param1:MouseEvent) : void
      {
         this.§_-47§.useHandCursor = false;
         this.§_-47§.gotoAndStop("idle");
      }
      
      protected function §_-Tc§(param1:MouseEvent) : void
      {
         this.§_-47§.gotoAndStop("press");
      }
      
      protected function §_-4C§(param1:MouseEvent) : void
      {
         this.§_-47§.gotoAndStop("idle");
      }
      
      public function §_-Oq§() : void
      {
         if(this.game.gameUpgrades.heroRoomEnabled && this.game.gameUpgrades.selectedHero != 0)
         {
            MovieClip(this.§_-47§.hero_icon).gotoAndStop(this.game.gameUpgrades.selectedHero);
         }
         else
         {
            MovieClip(this.§_-47§.hero_icon).gotoAndStop("off");
         }
      }
      
      public function §_-No§() : void
      {
         this.§_-3N§.gotoAndStop("idleActive");
      }
      
      protected function §_-Fm§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-3N§.buttonMode = true;
         this.§_-3N§.mouseChildren = false;
         this.§_-3N§.useHandCursor = true;
         if(this.game.pc)
         {
            this.§_-3N§.gotoAndStop("overActive");
         }
         else
         {
            this.§_-3N§.gotoAndStop("over");
         }
      }
      
      protected function §_-5i§(param1:MouseEvent) : void
      {
         this.§_-3N§.useHandCursor = false;
         if(this.game.pc)
         {
            this.§_-3N§.gotoAndStop("idleActive");
         }
         else
         {
            this.§_-3N§.gotoAndStop("idle");
         }
      }
      
      protected function §_-AO§(param1:MouseEvent) : void
      {
         if(this.game.pc)
         {
            this.§_-3N§.gotoAndStop("pressActive");
         }
         else
         {
            this.§_-3N§.gotoAndStop("press");
         }
      }
      
      protected function §_-BJ§(param1:MouseEvent) : void
      {
         if(this.game.pc)
         {
            this.§_-3N§.gotoAndStop("idleActive");
         }
         else
         {
            this.§_-3N§.gotoAndStop("idle");
         }
      }
      
      protected function rollOverUpgrades(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.btnUpgrades.buttonMode = true;
         this.btnUpgrades.mouseChildren = false;
         this.btnUpgrades.useHandCursor = true;
         this.btnUpgrades.gotoAndStop("over");
      }
      
      protected function rollOutUpgrades(param1:MouseEvent) : void
      {
         this.btnUpgrades.useHandCursor = false;
         this.btnUpgrades.gotoAndStop("idle");
      }
      
      protected function mouseDownUpgrades(param1:MouseEvent) : void
      {
         this.btnUpgrades.gotoAndStop("press");
      }
      
      protected function mouseUpUpgrades(param1:MouseEvent) : void
      {
         this.btnUpgrades.gotoAndStop("idle");
      }
      
      protected function §_-3Z§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-Lk§.buttonMode = true;
         this.§_-Lk§.mouseChildren = false;
         this.§_-Lk§.useHandCursor = true;
         this.§_-Lk§.gotoAndStop("over");
      }
      
      protected function §_-CY§(param1:MouseEvent) : void
      {
         this.§_-Lk§.useHandCursor = false;
         this.§_-Lk§.gotoAndStop("idle");
      }
      
      protected function §_-1k§(param1:MouseEvent) : void
      {
         this.§_-Lk§.gotoAndStop("press");
      }
      
      protected function §_-So§(param1:MouseEvent) : void
      {
         this.§_-Lk§.gotoAndStop("idle");
      }
      
      protected function §_-SI§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§case §.buttonMode = true;
         this.§case §.mouseChildren = false;
         this.§case §.useHandCursor = true;
         this.§case §.gotoAndStop("over");
      }
      
      protected function §_-AJ§(param1:MouseEvent) : void
      {
         this.§case §.useHandCursor = false;
         this.§case §.gotoAndStop("idle");
      }
      
      protected function §_-Nv§(param1:MouseEvent) : void
      {
         this.§case §.gotoAndStop("press");
      }
      
      protected function §_-Je§(param1:MouseEvent) : void
      {
         this.§case §.gotoAndStop("idle");
      }
      
      public function startLevel(param1:int, param2:int) : void
      {
         this.game.startLevel(param1,param2);
         this.game.§_-Tu§();
      }
      
      public function §_-Ib§() : void
      {
         this.upgradeStarsAlert.item.txt.text = this.game.stars.toString();
         if(this.game.stars == 0 || this.game.gameUpgrades.hasAllUpgrades())
         {
            this.upgradeStarsAlert.visible = false;
         }
         else
         {
            this.upgradeStarsAlert.visible = true;
         }
      }
      
      private function §_-3D§() : void
      {
         this.§_-Az§ = [new Point(104,482),new Point(87,422),new Point(144,398),new Point(206,373),new Point(152,290),new Point(141,186),new Point(278,123),new Point(359,118),new Point(437,151),new Point(530,206),new Point(526,301),new Point(557,393),new Point(222,85),new Point(323,316),new Point(613,176),new Point(201,191),new Point(260,205)];
      }
      
      private function §_-o§() : void
      {
         this.§_-42§ = [18,16,19,28,30,39,13,16,25,25,22];
      }
      
      private function §_-GS§() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:String = Locale.getDefaultLang();
         while(_loc3_ < this.game.§_-6l§.length)
         {
            if(SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus != SaveDataLevel.LEVEL_DISABLED)
            {
               if(SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
               {
                  this.§_-Ba§.addChild(new LevelThumbCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  if(SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW)
                  {
                     this.flagNew = _loc3_ + 1;
                     this.§_-IE§.progress.text = this.game.starsWon - SaveDataLevel(this.game.§_-6l§[_loc3_]).stars + "/" + this.game.§_-Hj§;
                     this.upgradeStarsAlert.item.txt.text = (this.game.stars - SaveDataLevel(this.game.§_-6l§[_loc3_]).stars).toString();
                     this.§_-GP§ = this.game.starsWon - SaveDataLevel(this.game.§_-6l§[_loc3_]).stars;
                     this.progressCurrentStarsUpgrades = this.game.stars - SaveDataLevel(this.game.§_-6l§[_loc3_]).stars;
                     this.modeFlags = §_-Dn§;
                  }
                  else
                  {
                     _loc1_ = _loc3_ + 1;
                  }
                  if(SaveDataLevel(this.game.§_-6l§[_loc3_]).heroicModeRecently || SaveDataLevel(this.game.§_-6l§[_loc3_]).ironModeRecently)
                  {
                     this.§_-IE§.progress.text = this.game.starsWon - 1 + "/" + this.game.§_-Hj§;
                     this.upgradeStarsAlert.item.txt.text = (this.game.stars - 1).toString();
                     this.modeFlags = §_-1G§;
                  }
                  if(SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
                  {
                     this.§_-IE§.progress.text = this.game.starsWon - SaveDataLevel(this.game.§_-6l§[_loc3_]).starsBetter + "/" + this.game.§_-Hj§;
                     this.upgradeStarsAlert.item.txt.text = (this.game.stars - SaveDataLevel(this.game.§_-6l§[_loc3_]).starsBetter).toString();
                     this.§_-GP§ = this.game.starsWon - SaveDataLevel(this.game.§_-6l§[_loc3_]).starsBetter;
                     this.progressCurrentStarsUpgrades = this.game.stars - SaveDataLevel(this.game.§_-6l§[_loc3_]).starsBetter;
                     this.§_-6Z§ = SaveDataLevel(this.game.§_-6l§[_loc3_]).stars;
                     this.§_-8g§ = SaveDataLevel(this.game.§_-6l§[_loc3_]).starsBetter;
                     this.modeFlags = §_-Fy§;
                  }
               }
               else if(_loc3_ != 0)
               {
                  if(_loc3_ < 12)
                  {
                     this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  }
                  else if(this.game.pc)
                  {
                     if(SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
                     {
                        if(_loc3_ != 16 || (SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER))
                        {
                           SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED;
                           this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                        }
                        else
                        {
                           SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED;
                           this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                        }
                     }
                     else
                     {
                        this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                     }
                  }
                  else if(SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED;
                     this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  }
                  else
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_DISABLED;
                  }
               }
               else
               {
                  this.modeFlags = §_-9O§;
               }
            }
            else if(_loc3_ >= 12)
            {
               if(!this.game.pc)
               {
                  if(SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED;
                     this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  }
                  else
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_DISABLED;
                  }
               }
               else if(SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[11]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER)
               {
                  if(_loc3_ != 16 || (SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED || SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW || SaveDataLevel(this.game.§_-6l§[15]).levelStatus == SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER))
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED;
                     this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  }
                  else
                  {
                     SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED;
                     this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
                  }
               }
               else
               {
                  SaveDataLevel(this.game.§_-6l§[_loc3_]).levelStatus = SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED;
                  this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[_loc3_],SaveDataLevel(this.game.§_-6l§[_loc3_])));
               }
            }
            _loc3_++;
         }
         if(_loc1_ > 0)
         {
            this.§_-Rq§ = new §_-0t§();
            this.road.addChild(this.§_-Rq§);
            if(_loc1_ >= 12)
            {
               _loc1_ = 11;
            }
            this.§_-Rq§.gotoAndStop(_loc1_ + "to" + (_loc1_ + 1) + "End");
         }
      }
      
      private function §_-Sw§() : Boolean
      {
         if(this.§_-II§ < this.§_-TO§)
         {
            this.§_-II§++;
            if(this.§_-II§ == 5)
            {
               this.§_-IE§.gotoAndPlay("addStar");
               this.§_-IE§.progress.text = this.§_-GP§ + 1 + "/" + this.game.§_-Hj§;
               this.upgradeStarsAlert.item.txt.text = (this.progressCurrentStarsUpgrades + 1).toString();
               this.§_-GP§++;
               this.progressCurrentStarsUpgrades++;
               this.game.gameSounds.§_-Pr§("");
            }
            if(this.§_-II§ == 15)
            {
               if(SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).stars >= 2)
               {
                  this.§_-IE§.gotoAndPlay("addStar");
                  this.§_-IE§.progress.text = this.§_-GP§ + 1 + "/" + this.game.§_-Hj§;
                  this.upgradeStarsAlert.item.txt.text = (this.progressCurrentStarsUpgrades + 1).toString();
                  this.§_-GP§++;
                  this.progressCurrentStarsUpgrades++;
                  this.game.gameSounds.§_-Pr§("2");
               }
            }
            if(this.§_-II§ == 25)
            {
               if(SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).stars == 3)
               {
                  this.§_-IE§.gotoAndPlay("addStar");
                  this.§_-IE§.progress.text = this.§_-GP§ + 1 + "/" + this.game.§_-Hj§;
                  this.upgradeStarsAlert.item.txt.text = (this.progressCurrentStarsUpgrades + 1).toString();
                  this.§_-GP§++;
                  this.progressCurrentStarsUpgrades++;
                  this.game.gameSounds.§_-Pr§("3");
               }
            }
            if(this.§_-II§ == 26)
            {
               if(SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).levelIndex == 0 || SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).levelIndex > 0 && this.game.stars == this.game.starsWon)
               {
                  this.signAlertUpgrades = new SignAlertUpgrades(new Point(356,366),SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).stars);
                  this.§_-TA§.addChild(this.signAlertUpgrades);
               }
            }
            return false;
         }
         if(!this.§_-4p§)
         {
            if(this.flagNew >= 12)
            {
               this.§_-Rq§ = new §_-0t§();
               this.road.addChild(this.§_-Rq§);
               this.§_-Rq§.gotoAndStop("11to12End");
            }
            else
            {
               if(this.flagNew == 1)
               {
                  this.§_-Rq§ = new §_-0t§();
                  this.road.addChild(this.§_-Rq§);
               }
               this.§_-Rq§.gotoAndPlay(this.flagNew + "to" + (this.flagNew + 1));
               this.§_-4p§ = true;
               this.§_-6N§ = 0;
            }
         }
         if(this.§_-6N§ < this.§_-42§[this.flagNew - 1])
         {
            this.§_-6N§++;
            if(this.§_-6N§ == 1 || this.§_-6N§ % 4 == 0)
            {
               this.game.gameSounds.§_-5q§();
            }
            if(this.§_-6N§ == this.§_-42§[this.flagNew - 1] - 10)
            {
               this.game.gameSounds.§_-4w§();
            }
            return false;
         }
         SaveDataLevel(this.game.§_-6l§[this.flagNew - 1]).§_-RH§(SaveDataLevel.LEVEL_ENABLED_COMPLETED);
         this.mode = §_-21§;
         if(this.flagNew < 12)
         {
            SaveDataLevel(this.game.§_-6l§[this.flagNew]).§_-RH§(SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW);
            this.§_-Ba§.addChild(new LevelThumbInCompleted(this,this.§_-Az§[this.flagNew],SaveDataLevel(this.game.§_-6l§[this.flagNew])));
            this.§_-4p§ = false;
            if(!this.§_-68§())
            {
               if(this.flagNew == 4 && this.game.earnTwitterStar == false)
               {
                  if(this.contains(this.socialScreen))
                  {
                     this.socialScreen.showMe();
                  }
               }
               if(this.flagNew == 6 && !this.game.pc)
               {
                  this.§_-0Q§("AUTOMATIC");
               }
            }
         }
         else if(this.flagNew == 12)
         {
            this.addMapBlock();
            this.addChild(new MenuCongratz(this.game));
         }
         return true;
      }
      
      public function addMapBlock() : void
      {
         if(!this.contains(this.§_-5r§))
         {
            this.addChild(this.§_-5r§);
         }
         this.§_-5r§.show();
      }
      
      public function §_-68§() : Boolean
      {
         return this.contains(this.§_-5r§);
      }
      
      public function §_-Gg§() : void
      {
         if(this.contains(this.§_-5r§))
         {
            this.§_-5r§.hide();
         }
      }
      
      public function earnFacebookSocial() : void
      {
         this.updateStars();
         this.game.gameAchievement.§_-49§(this.game.starsWon);
      }
      
      public function earnTwitterSocial() : void
      {
         this.updateStars();
         this.game.gameAchievement.§_-49§(this.game.starsWon);
      }
      
      public function destroySign() : void
      {
         if(this.§_-CJ§ != null)
         {
            this.§_-CJ§.destroyThis();
         }
         this.§_-CJ§ = null;
      }
      
      public function destroySignUpgrades() : void
      {
         if(this.signAlertUpgrades != null)
         {
            this.signAlertUpgrades.destroyThis();
         }
         this.signAlertUpgrades = null;
      }
      
      public function updateStars() : void
      {
         this.§_-IE§.progress.text = this.game.starsWon.toString() + "/" + this.game.§_-Hj§;
         this.upgradeStarsAlert.item.txt.text = this.game.stars.toString();
         this.§_-Ib§();
      }
      
      public function §_-4z§() : void
      {
         this.game.main.agi.submitUserData("slot" + this.game.onlineSelectedSlot.toString(),this.game.getOnlineFullSaveObject(),this.§_-AH§);
      }
      
      public function §_-AH§(param1:Object) : void
      {
         if(this.game == null)
         {
            return;
         }
         if(param1.success)
         {
            if(this.contains(this.§_-Hu§))
            {
               this.§_-Gg§();
               this.§_-Hu§.destroyThis();
            }
            this.addChild(new GameSaved());
         }
         else if(this.contains(this.§_-Hu§))
         {
            this.§_-Hu§.§_-HR§();
         }
         else
         {
            this.addMapBlock();
            this.addChild(this.§_-Hu§);
            this.itemsLocked = true;
         }
      }
      
      public function addStageWarning(param1:int) : void
      {
         if(this.§_-Kb§ != null)
         {
            if(this.contains(this.§_-Kb§))
            {
               this.removeChild(this.§_-Kb§);
            }
            this.§_-Kb§ = null;
         }
         if(this.§_-Kb§ == null || !this.contains(this.§_-Kb§))
         {
            if(this.§_-Kb§ == null)
            {
               if(param1 == 12)
               {
                  this.§_-Kb§ = new SignAlertSarelgazLocked(new Point(172,95));
               }
               else if(param1 == 13)
               {
                  this.§_-Kb§ = new SignAlertRuinsLocked(new Point(275,326));
               }
               else if(param1 == 14)
               {
                  this.§_-Kb§ = new SignAlertRottenLocked(new Point(578,190));
               }
               else if(param1 == 15)
               {
                  this.§_-Kb§ = new §_-P4§(new Point(282,202));
               }
               else if(param1 == 16)
               {
                  this.§_-Kb§ = new SignAlertBanditLair(new Point(338,214));
               }
            }
            this.§_-Kb§.setPC(this.game.pc);
            this.addChild(this.§_-Kb§);
         }
      }
      
      public function removeStageWarning() : void
      {
         if(this.contains(this.§_-Kb§))
         {
            this.removeChild(this.§_-Kb§);
         }
      }
      
      public function destroyThis() : void
      {
         if(this.socialScreen != null)
         {
            this.socialScreen.destroyThis();
         }
         this.§_-Hu§.destroyThis();
         if(this.ship1 != null)
         {
            this.ship1.destroyThis();
         }
         if(this.ship2 != null)
         {
            this.ship2.destroyThis();
         }
         if(this.ship3 != null)
         {
            this.ship3.destroyThis();
         }
         this.ship1 = null;
         this.ship2 = null;
         this.ship3 = null;
         this.destroySign();
         this.§_-FV§.destroyThis();
         this.§_-FV§ = null;
         this.§_-N§.destroyThis();
         this.§_-N§ = null;
         this.§_-Bi§ = null;
         this.§_-Er§ = null;
         this.yTweenUpgrades = null;
         this.§_-B1§ = null;
         this.§_-S6§ = null;
         this.§_-3V§ = null;
         this.§_-7z§ = null;
         this.alphaTweenMenuBack = null;
         this.alphaTweenUpgrades = null;
         this.alphaTweenEncyclopedia = null;
         this.alphaTweenAchievements = null;
         this.alphaTweenPremium = null;
         this.alphaTweenHeroRoom = null;
         this.§false§.removeEventListener(MouseEvent.CLICK,this.§_-1D§);
         this.§false§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-4e§);
         this.§false§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-GC§);
         this.§false§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Qe§);
         this.§false§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-1x§);
         this.btnUpgrades.removeEventListener(MouseEvent.CLICK,this.clickUpgrades);
         this.btnUpgrades.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverUpgrades);
         this.btnUpgrades.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutUpgrades);
         this.btnUpgrades.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownUpgrades);
         this.btnUpgrades.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpUpgrades);
         this.§_-Lk§.removeEventListener(MouseEvent.CLICK,this.§_-RD§);
         this.§_-Lk§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-3Z§);
         this.§_-Lk§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-CY§);
         this.§_-Lk§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-1k§);
         this.§_-Lk§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-So§);
         this.§case §.removeEventListener(MouseEvent.CLICK,this.§_-GA§);
         this.§case §.removeEventListener(MouseEvent.ROLL_OVER,this.§_-SI§);
         this.§case §.removeEventListener(MouseEvent.ROLL_OUT,this.§_-AJ§);
         this.§case §.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Nv§);
         this.§case §.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Je§);
         this.§_-3N§.removeEventListener(MouseEvent.CLICK,this.§_-7w§);
         this.§_-3N§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Fm§);
         this.§_-3N§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-5i§);
         this.§_-3N§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-AO§);
         this.§_-3N§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-BJ§);
         this.§_-47§.removeEventListener(MouseEvent.CLICK,this.§_-4T§);
         this.§_-47§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-2u§);
         this.§_-47§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-5B§);
         this.§_-47§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Tc§);
         this.§_-47§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-4C§);
         this.§_-TA§.removeChild(this.btnUpgrades);
         this.§_-TA§.removeChild(this.§_-Lk§);
         this.§_-TA§.removeChild(this.§case §);
         this.§_-TA§.removeChild(this.§false§);
         this.§_-TA§.removeChild(this.§_-3N§);
         this.§_-TA§.removeChild(this.§_-47§);
         this.btnUpgrades = null;
         this.§_-Lk§ = null;
         this.§case § = null;
         this.§false§ = null;
         this.§_-3N§ = null;
         this.§_-47§ = null;
         this.upgradeStarsAlert = null;
         this.§_-42§ = null;
         this.terrain = null;
         this.§_-TA§ = null;
         this.road = null;
         this.§_-Ba§ = null;
         this.§_-Az§ = null;
         this.game = null;
         this.§_-Gg§();
         this.§_-5r§ = null;
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
   }
}
