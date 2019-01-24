package
{
   import Playtomic.Log;
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.net.trace;
   import flash.utils.Dictionary;
   import ironhide.utils.tooltip.TooltipUpgrade;
   import mochi.as3.MochiAd;
   
   public class MenuUpgrades extends MovieClip
   {
       
      
      public var §_-KI§:MovieClip;
      
      public var §_-3y§:MovieClip;
      
      public var §_-78§:MovieClip;
      
      public var §_-5O§:MovieClip;
      
      public var info_stars:MovieClip;
      
      public var §_-KD§:MovieClip;
      
      public var static:MovieClip;
      
      public var §_-8f§:MovieClip;
      
      public var progress_bar_mages:MovieClip;
      
      public var §_-9M§:MovieClip;
      
      public var §_-7l§:MovieClip;
      
      public var progress_bar_rain:MovieClip;
      
      public var butSubmit:MovieClip;
      
      public var butUndo:MovieClip;
      
      public var §_-H5§:Sprite;
      
      protected var resetEnabled:Boolean = false;
      
      protected var §_-9l§:Array;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      protected var tooltip:TooltipUpgrade;
      
      protected var closeAndShowMap:Boolean;
      
      protected var game:Game;
      
      public function MenuUpgrades(param1:Game)
      {
         this.§_-H5§ = new Sprite();
         this.§_-9l§ = [];
         super();
         this.game = param1;
         Log.CustomMetric("Open Upgrades","Upgrade");
         this.x = 350;
         this.addChild(this.§_-H5§);
         this.game.map.destroySignUpgrades();
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,-550,5,0.5,true);
         this.§_-78§.gotoAndStop("idle");
         this.butUndo.gotoAndStop("idle");
         this.butSubmit.gotoAndStop("idle");
         this.info_stars.gotoAndStop("idle");
         this.tooltip = new TooltipUpgrade(this,new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5));
         this.closeAndShowMap = false;
         this.§_-78§.addEventListener(MouseEvent.CLICK,this.reset,false,0,true);
         this.§_-78§.addEventListener(MouseEvent.ROLL_OVER,this.§_-1B§,false,0,true);
         this.§_-78§.addEventListener(MouseEvent.ROLL_OUT,this.§_-6S§,false,0,true);
         this.§_-78§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-8y§,false,0,true);
         this.§_-78§.addEventListener(MouseEvent.MOUSE_UP,this.§_-9d§,false,0,true);
         this.butUndo.addEventListener(MouseEvent.CLICK,this.§_-2Y§,false,0,true);
         this.butUndo.addEventListener(MouseEvent.ROLL_OVER,this.rollOverUndo,false,0,true);
         this.butUndo.addEventListener(MouseEvent.ROLL_OUT,this.rollOutUndo,false,0,true);
         this.butUndo.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownUndo,false,0,true);
         this.butUndo.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpUndo,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.CLICK,this.submit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.ROLL_OVER,this.rollOverSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.ROLL_OUT,this.rollOutSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpSubmit,false,0,true);
         this.§_-KI§.addEventListener(MouseEvent.CLICK,this.§_-91§,false,0,true);
         this.§_-KI§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Ax§,false,0,true);
         this.§_-KI§.addEventListener(MouseEvent.ROLL_OUT,this.§_-DM§,false,0,true);
         this.§_-KI§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-75§,false,0,true);
         this.§_-KI§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Hh§,false,0,true);
         this.§_-9M§.addEventListener(MouseEvent.CLICK,this.§_-E6§,false,0,true);
         this.§_-9M§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Eq§,false,0,true);
         this.§_-9M§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Sk§,false,0,true);
         this.§_-9M§.addEventListener(MouseEvent.MOUSE_DOWN,this.§for§,false,0,true);
         this.§_-9M§.addEventListener(MouseEvent.MOUSE_UP,this.§_-G3§,false,0,true);
         this.static.addEventListener(MouseEvent.CLICK,this.§_-M2§,false,0,true);
         this.static.addEventListener(MouseEvent.ROLL_OVER,this.§use §,false,0,true);
         this.static.addEventListener(MouseEvent.ROLL_OUT,this.§_-I5§,false,0,true);
         this.static.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-7R§,false,0,true);
         this.static.addEventListener(MouseEvent.MOUSE_UP,this.§_-RR§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.disableUndo();
         if(this.game.gameUpgrades.heroRoomEnabled)
         {
            if(this.game.stars == this.game.starsWon - this.game.gameUpgrades.§ true§)
            {
               this.§_-Bg§();
            }
            else
            {
               this.§_-Of§();
            }
         }
         else if(this.game.stars == this.game.starsWon)
         {
            this.§_-Bg§();
         }
         else
         {
            this.§_-Of§();
         }
         this.updateStars();
         this.loadItems();
         this.§_-Y§();
         MochiAd.showClickAwayAd({
            "clip":this.§_-8f§,
            "id":"bf76facdfccdd989"
         });
      }
      
      public function buyItem(param1:§_-Ay§) : void
      {
         this.enableUndo();
         this.§_-Of§();
         this.§_-9l§.push(param1.index);
         this.game.gameUpgrades.buyUpgrade(param1.§_-5K§);
         this.game.stars = this.game.stars - param1.stars;
         this.updateStars();
         this.§_-HF§();
         this.§_-Y§();
      }
      
      public function §_-HF§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-H5§.numChildren)
         {
            §_-Ay§(this.§_-H5§.getChildAt(_loc1_)).§_-09§();
            _loc1_++;
         }
      }
      
      public function showTooltip(param1:String, param2:int) : void
      {
         this.tooltip.loadTooltip(new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5),230,{
            "title":Locale.loadStringEx("UPGRADE_" + param1.toUpperCase() + "_NAME",Locale.getDefaultLang()),
            "text":Locale.loadStringEx("UPGRADE_" + param1.toUpperCase() + "_DESCRIPTION",Locale.getDefaultLang()),
            "stars":param2.toString(),
            "width":230
         });
         this.addChild(this.tooltip);
      }
      
      public function hideTooltip() : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.hideTooltip();
         }
      }
      
      public function moveTooltip(param1:int) : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.x = this.mouseX + 12 * param1;
            this.tooltip.y = this.mouseY - 8;
         }
      }
      
      protected function updateStars() : void
      {
         this.info_stars.gotoAndPlay("anim");
         this.info_stars.txt.text = this.game.stars.toString();
         this.game.map.§_-Ib§();
      }
      
      protected function loadItems() : void
      {
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,0,new Point(-323,356),"archersUpSalvage",1,true,this.game.gameUpgrades.archersUpSalvage));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,1,new Point(-323,292),"archersUpEagleEye",1,this.game.gameUpgrades.archersUpSalvage,this.game.gameUpgrades.archersUpEagleEye));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,2,new Point(-323,229),"archersUpPiercing",2,this.game.gameUpgrades.archersUpEagleEye,this.game.gameUpgrades.archersUpPiercing));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,3,new Point(-323,165),"archersUpFarShots",2,this.game.gameUpgrades.archersUpPiercing,this.game.gameUpgrades.archersUpFarShots));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,4,new Point(-323,102),"archersUpPrecision",3,this.game.gameUpgrades.archersUpFarShots,this.game.gameUpgrades.archersUpPrecision));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,5,new Point(-249,356),"barracksUpSurvival",1,true,this.game.gameUpgrades.barracksUpSurvival));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,6,new Point(-249,292),"barracksUpBetterArmor",1,this.game.gameUpgrades.barracksUpSurvival,this.game.gameUpgrades.barracksUpBetterArmor));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,7,new Point(-249,229),"barracksUpImprovedDeployment",2,this.game.gameUpgrades.barracksUpBetterArmor,this.game.gameUpgrades.barracksUpImprovedDeployment));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,8,new Point(-249,165),"barracksUpSurvival2",2,this.game.gameUpgrades.barracksUpImprovedDeployment,this.game.gameUpgrades.barracksUpSurvival2));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,9,new Point(-249,102),"barracksUpBarbedArmor",3,this.game.gameUpgrades.barracksUpSurvival2,this.game.gameUpgrades.barracksUpBarbedArmor));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,10,new Point(-174,356),"magesUpSpellReach",1,true,this.game.gameUpgrades.magesUpSpellReach));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,11,new Point(-174,292),"magesUpArcaneShatter",1,this.game.gameUpgrades.magesUpSpellReach,this.game.gameUpgrades.magesUpArcaneShatter));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,12,new Point(-174,229),"magesUpHermeticStudy",2,this.game.gameUpgrades.magesUpArcaneShatter,this.game.gameUpgrades.magesUpHermeticStudy));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,13,new Point(-174,165),"magesUpEmpoweredMagic",2,this.game.gameUpgrades.magesUpHermeticStudy,this.game.gameUpgrades.magesUpEmpoweredMagic));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,14,new Point(-174,102),"magesUpSlowCurse",3,this.game.gameUpgrades.magesUpEmpoweredMagic,this.game.gameUpgrades.magesUpSlowCurse));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,15,new Point(-100,356),"engineersUpConcentratedFire",1,true,this.game.gameUpgrades.engineersUpConcentratedFire));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,16,new Point(-100,292),"engineersUpRangeFinder",1,this.game.gameUpgrades.engineersUpConcentratedFire,this.game.gameUpgrades.engineersUpRangeFinder));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,17,new Point(-100,229),"engineersUpFieldLogistics",3,this.game.gameUpgrades.engineersUpRangeFinder,this.game.gameUpgrades.engineersUpFieldLogistics));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,18,new Point(-100,165),"engineersUpIndustrialization",3,this.game.gameUpgrades.engineersUpFieldLogistics,this.game.gameUpgrades.engineersUpIndustrialization));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,19,new Point(-100,102),"engineersUpEfficiency",3,this.game.gameUpgrades.engineersUpIndustrialization,this.game.gameUpgrades.engineersUpEfficiency));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,20,new Point(-26,356),"rainUpBlazingSkies",1,true,this.game.gameUpgrades.rainUpBlazingSkies));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,21,new Point(-26,292),"rainUpScorchedEarth",1,this.game.gameUpgrades.rainUpBlazingSkies,this.game.gameUpgrades.rainUpScorchedEarth));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,22,new Point(-26,229),"rainsUpBiggerAndMeaner",2,this.game.gameUpgrades.rainUpScorchedEarth,this.game.gameUpgrades.rainsUpBiggerAndMeaner));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,23,new Point(-26,165),"rainUpBlazingEarth",2,this.game.gameUpgrades.rainsUpBiggerAndMeaner,this.game.gameUpgrades.rainUpBlazingEarth));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,24,new Point(-26,102),"rainUpCataclysm",3,this.game.gameUpgrades.rainUpBlazingEarth,this.game.gameUpgrades.rainUpCataclysm));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,25,new Point(48,356),"reinforcementLevel1",2,true,this.getReinforcementEnable(1)));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,26,new Point(48,292),"reinforcementLevel2",3,this.getReinforcementEnable(1),this.getReinforcementEnable(2)));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,27,new Point(48,229),"reinforcementLevel3",3,this.getReinforcementEnable(2),this.getReinforcementEnable(3)));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,28,new Point(48,165),"reinforcementLevel4",3,this.getReinforcementEnable(3),this.getReinforcementEnable(4)));
         this.§_-H5§.addChild(new §_-Ay§(this,this.game,29,new Point(48,102),"reinforcementLevel5",4,this.getReinforcementEnable(4),this.getReinforcementEnable(5)));
      }
      
      protected function §_-Y§() : void
      {
         this.§_-KD§.scaleY = 0.2 * this.game.gameUpgrades.archersUpLevel;
         this.§_-3y§.scaleY = 0.2 * this.game.gameUpgrades.barracksUpLevel;
         this.progress_bar_mages.scaleY = 0.2 * this.game.gameUpgrades.magesUpLevel;
         this.§_-5O§.scaleY = 0.2 * this.game.gameUpgrades.engineersUpLevel;
         this.§_-7l§.scaleY = 0.2 * this.game.gameUpgrades.reinforcementLevel;
         this.progress_bar_rain.scaleY = 0.2 * this.game.gameUpgrades.rainUpLevel;
      }
      
      protected function getReinforcementEnable(param1:int) : Boolean
      {
         if(param1 <= this.game.gameUpgrades.reinforcementLevel)
         {
            return true;
         }
         return false;
      }
      
      protected function disableUndo() : void
      {
         this.butUndo.alpha = 0.3;
      }
      
      protected function enableUndo() : void
      {
         this.butUndo.alpha = 1;
      }
      
      protected function §_-Bg§() : void
      {
         this.resetEnabled = false;
         this.§_-78§.alpha = 0.3;
      }
      
      protected function §_-Of§() : void
      {
         this.resetEnabled = true;
         this.§_-78§.alpha = 1;
      }
      
      protected function reset(param1:MouseEvent) : void
      {
         if(!this.resetEnabled)
         {
            return;
         }
         this.game.gameSounds.playGUIButtonCommon();
         this.game.gameUpgrades.reset();
         if(this.game.gameUpgrades.heroRoomEnabled)
         {
            this.game.stars = this.game.starsWon - this.game.gameUpgrades.§ true§;
         }
         else
         {
            this.game.stars = this.game.starsWon;
         }
         this.emptyItems();
         this.loadItems();
         this.§_-Y§();
         this.updateStars();
         this.§_-Bg§();
         this.§_-9l§ = [];
         this.disableUndo();
      }
      
      protected function §_-1B§(param1:MouseEvent) : void
      {
         if(!this.resetEnabled)
         {
            return;
         }
         this.game.gameSounds.§_-Dh§();
         this.§_-78§.buttonMode = true;
         this.§_-78§.mouseChildren = false;
         this.§_-78§.useHandCursor = true;
         this.§_-78§.gotoAndStop("over");
      }
      
      protected function §_-6S§(param1:MouseEvent) : void
      {
         if(!this.resetEnabled)
         {
            return;
         }
         this.§_-78§.useHandCursor = false;
         this.§_-78§.gotoAndStop("idle");
      }
      
      protected function §_-8y§(param1:MouseEvent) : void
      {
         if(!this.resetEnabled)
         {
            return;
         }
         this.§_-78§.useHandCursor = false;
         this.§_-78§.gotoAndStop("press");
      }
      
      protected function §_-9d§(param1:MouseEvent) : void
      {
         if(!this.resetEnabled)
         {
            return;
         }
         this.§_-78§.gotoAndStop("idle");
      }
      
      protected function §_-2Y§(param1:MouseEvent) : void
      {
         if(this.§_-9l§.length == 0)
         {
            return;
         }
         Log.CustomMetric("Undo","Upgrades");
         this.game.gameSounds.playGUIButtonCommon();
         var _loc2_:Array = this.§_-9l§.reverse();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-Ay§(this.§_-H5§.getChildAt(_loc2_[_loc3_])).§_-TR§();
            this.game.gameUpgrades.undoUpgrade(§_-Ay§(this.§_-H5§.getChildAt(_loc2_[_loc3_])).§_-5K§);
            this.game.stars = this.game.stars + §_-Ay§(this.§_-H5§.getChildAt(_loc2_[_loc3_])).stars;
            this.updateStars();
            _loc3_++;
         }
         this.§_-9l§ = [];
         this.§_-HF§();
         this.§_-Y§();
         this.disableUndo();
      }
      
      protected function rollOverUndo(param1:MouseEvent) : void
      {
         if(this.§_-9l§.length == 0)
         {
            return;
         }
         this.game.gameSounds.§_-Dh§();
         this.butUndo.buttonMode = true;
         this.butUndo.mouseChildren = false;
         this.butUndo.useHandCursor = true;
         this.butUndo.gotoAndStop("over");
      }
      
      protected function rollOutUndo(param1:MouseEvent) : void
      {
         if(this.§_-9l§.length == 0)
         {
            return;
         }
         this.butUndo.useHandCursor = false;
         this.butUndo.gotoAndStop("idle");
      }
      
      protected function mouseDownUndo(param1:MouseEvent) : void
      {
         if(this.§_-9l§.length == 0)
         {
            return;
         }
         this.butUndo.useHandCursor = false;
         this.butUndo.gotoAndStop("press");
      }
      
      protected function mouseUpUndo(param1:MouseEvent) : void
      {
         if(this.§_-9l§.length == 0)
         {
            return;
         }
         this.butUndo.gotoAndStop("idle");
      }
      
      protected function submit(param1:MouseEvent) : void
      {
         this.butSubmit.removeEventListener(MouseEvent.CLICK,this.submit);
         this.game.gameSounds.playGUIButtonCommon();
         this.game.map.§_-Gg§();
         this.ytweenOut = new Tween(this,"y",Strong.easeIn,this.y,-550,0.3,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function rollOverSubmit(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.butSubmit.buttonMode = true;
         this.butSubmit.mouseChildren = false;
         this.butSubmit.useHandCursor = true;
         this.butSubmit.gotoAndStop("over");
      }
      
      protected function rollOutSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.useHandCursor = false;
         this.butSubmit.gotoAndStop("idle");
      }
      
      protected function mouseDownSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.gotoAndStop("press");
      }
      
      protected function mouseUpSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.gotoAndStop("idle");
      }
      
      protected function emptyItems() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-H5§.numChildren)
         {
            _loc1_[this.§_-H5§.getChildAt(_loc2_)] = this.§_-H5§.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.destroyThis();
         }
         _loc1_ = null;
      }
      
      protected function §_-91§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         Log.CustomMetric("Link iPhone Upgrade Main","Upgrade",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://itunes.apple.com/us/app/kingdom-rush/id516378985?ls=1&mt=8");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-Ax§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-KI§.buttonMode = true;
         this.§_-KI§.mouseChildren = false;
         this.§_-KI§.useHandCursor = true;
         this.§_-KI§.gotoAndStop("over");
      }
      
      protected function §_-DM§(param1:MouseEvent) : void
      {
         this.§_-KI§.useHandCursor = false;
         this.§_-KI§.gotoAndStop("idle");
      }
      
      protected function §_-75§(param1:MouseEvent) : void
      {
         this.§_-KI§.gotoAndStop("press");
      }
      
      protected function §_-Hh§(param1:MouseEvent) : void
      {
         this.§_-KI§.gotoAndStop("idle");
      }
      
      protected function §_-E6§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         Log.CustomMetric("Link iPhone Upgrade","Upgrade",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://itunes.apple.com/us/app/kingdom-rush/id516378985?ls=1&mt=8");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-Eq§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-9M§.buttonMode = true;
         this.§_-9M§.mouseChildren = false;
         this.§_-9M§.useHandCursor = true;
         this.§_-9M§.gotoAndStop("over");
      }
      
      protected function §_-Sk§(param1:MouseEvent) : void
      {
         this.§_-9M§.useHandCursor = false;
         this.§_-9M§.gotoAndStop("idle");
      }
      
      protected function §for§(param1:MouseEvent) : void
      {
         this.§_-9M§.gotoAndStop("press");
      }
      
      protected function §_-G3§(param1:MouseEvent) : void
      {
         this.§_-9M§.gotoAndStop("idle");
      }
      
      protected function §_-M2§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         Log.CustomMetric("Link iPad Upgrade","Upgrade",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://itunes.apple.com/us/app/kingdom-rush-hd/id489265199?ls=1&mt=8");
         trace(_loc3_,"_blank");
      }
      
      protected function §use §(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.static.buttonMode = true;
         this.static.mouseChildren = false;
         this.static.useHandCursor = true;
         this.static.gotoAndStop("over");
      }
      
      protected function §_-I5§(param1:MouseEvent) : void
      {
         this.static.useHandCursor = false;
         this.static.gotoAndStop("idle");
      }
      
      protected function §_-7R§(param1:MouseEvent) : void
      {
         this.static.gotoAndStop("press");
      }
      
      protected function §_-RR§(param1:MouseEvent) : void
      {
         this.static.gotoAndStop("idle");
      }
      
      protected function destroyThis() : void
      {
         this.game.map.itemsLocked = false;
         if(!this.game.§_-Pd§)
         {
            this.game.§_-Bn§();
            this.game.gameUpgrades.saveData();
         }
         else
         {
            this.game.map.§_-4z§();
         }
         this.emptyItems();
         this.removeChild(this.§_-H5§);
         this.§_-H5§ = null;
         this.removeChild(this.§_-KD§);
         this.§_-KD§ = null;
         this.removeChild(this.§_-3y§);
         this.§_-3y§ = null;
         this.removeChild(this.progress_bar_mages);
         this.progress_bar_mages = null;
         this.removeChild(this.§_-5O§);
         this.§_-5O§ = null;
         this.removeChild(this.§_-7l§);
         this.§_-7l§ = null;
         this.removeChild(this.progress_bar_rain);
         this.progress_bar_rain = null;
         this.removeChild(this.info_stars);
         this.info_stars = null;
         if(this.tooltip != null)
         {
            this.tooltip.destroyThis();
         }
         this.tooltip = null;
         this.§_-9l§ = null;
         if(this.closeAndShowMap)
         {
            this.game.map.§_-0Q§("UPGRADE");
         }
         this.game = null;
         this.ytweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.ytweenOut = null;
         this.§_-P8§ = null;
         this.§_-78§.removeEventListener(MouseEvent.CLICK,this.reset);
         this.§_-78§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-1B§);
         this.§_-78§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-6S§);
         this.§_-78§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8y§);
         this.§_-78§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-9d§);
         this.butUndo.removeEventListener(MouseEvent.CLICK,this.§_-2Y§);
         this.butUndo.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverUndo);
         this.butUndo.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutUndo);
         this.butUndo.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownUndo);
         this.butUndo.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpUndo);
         this.butSubmit.removeEventListener(MouseEvent.CLICK,this.submit);
         this.butSubmit.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverSubmit);
         this.butSubmit.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutSubmit);
         this.butSubmit.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownSubmit);
         this.butSubmit.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpSubmit);
         this.§_-KI§.removeEventListener(MouseEvent.CLICK,this.§_-91§);
         this.§_-KI§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Ax§);
         this.§_-KI§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-DM§);
         this.§_-KI§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-75§);
         this.§_-KI§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Hh§);
         this.§_-9M§.removeEventListener(MouseEvent.CLICK,this.§_-E6§);
         this.§_-9M§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Eq§);
         this.§_-9M§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Sk§);
         this.§_-9M§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§for§);
         this.§_-9M§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-G3§);
         this.static.removeEventListener(MouseEvent.CLICK,this.§_-M2§);
         this.static.removeEventListener(MouseEvent.ROLL_OVER,this.§use §);
         this.static.removeEventListener(MouseEvent.ROLL_OUT,this.§_-I5§);
         this.static.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-7R§);
         this.static.removeEventListener(MouseEvent.MOUSE_UP,this.§_-RR§);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
