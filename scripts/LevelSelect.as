package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import ironhide.utils.tooltip.TooltipLevelSelect;
   
   public class LevelSelect extends MovieClip
   {
       
      
      public var heroicRules:MovieClip;
      
      public var levelThumb:MovieClip;
      
      public var butPlay:MovieClip;
      
      public var modeReward:MovieClip;
      
      public var modeTitle:TextField;
      
      public var medals:MovieClip;
      
      public var ironRules:MovieClip;
      
      public var levelTitle:MovieClip;
      
      public var stageDescription:TextField;
      
      public var butClose:§_-5D§;
      
      public var selectedMode:int;
      
      public var thumb:LevelThumb;
      
      public var map:Map;
      
      private var tooltip:TooltipLevelSelect;
      
      private var yTween:Tween;
      
      private var alphaTween:Tween;
      
      private var campaignMode:LevelSelectModeCampaign;
      
      private var heroicMode:LevelSelectModeHeroic;
      
      private var ironMode:LevelSelectModeIron;
      
      private var selectDifficulty:LevelSelectDificulty;
      
      private var hitBoxHeroicWaves:LevelSelectHitArea;
      
      private var hitBoxHeroicLives:LevelSelectHitArea;
      
      private var hitBoxHeroicUpgrades:LevelSelectHitArea;
      
      private var hitBoxIronWaves:LevelSelectHitArea;
      
      private var hitBoxIronLives:LevelSelectHitArea;
      
      private var hitBoxIronUpgrades:LevelSelectHitArea;
      
      private var hitBoxIronTowers:LevelSelectHitArea;
      
      public function LevelSelect(param1:LevelThumb)
      {
         super();
         this.thumb = param1;
         this.x = 351;
         this.y = 83;
         this.campaignMode = new LevelSelectModeCampaign(new Point(-243,330),this,true,null,GameSettings.§_-OS§);
         this.heroicMode = new LevelSelectModeHeroic(new Point(-185,330),this,this.thumb.data.heroicMode,new Point(-226,245),GameSettings.§_-R6§);
         this.ironMode = new LevelSelectModeIron(new Point(-127,330),this,this.thumb.data.ironMode,new Point(-169,244),GameSettings.§_-AQ§);
         this.selectDifficulty = new LevelSelectDificulty(new Point(-241,281),this);
         this.tooltip = new TooltipLevelSelect(this,new Point(this.mouseX + 15,this.mouseY - 15),new Point(this.mouseX - 15,this.mouseY - 15));
         this.addChild(this.campaignMode);
         this.addChild(this.heroicMode);
         this.addChild(this.ironMode);
         this.addChild(this.selectDifficulty);
         this.hitBoxHeroicWaves = new LevelSelectHitArea(new Point(-17,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_WAVE_HEROIC_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_WAVE_HEROIC_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxHeroicLives = new LevelSelectHitArea(new Point(58,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_LIVES_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_LIVES_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxHeroicUpgrades = new LevelSelectHitArea(new Point(143,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_UPGRADES_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_UPGRADES_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxIronWaves = new LevelSelectHitArea(new Point(-52,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_WAVE_IRON_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_WAVE_IRON_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxIronLives = new LevelSelectHitArea(new Point(19,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_LIVES_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_LIVES_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxIronUpgrades = new LevelSelectHitArea(new Point(90,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_UPGRADES_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_UPGRADES_DESCRIPTION",Locale.getDefaultLang()));
         this.hitBoxIronTowers = new LevelSelectHitArea(new Point(168,224),this,Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_TOWERS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("LEVEL_SELECT_TOOLTIP_TOWERS_DESCRIPTION",Locale.getDefaultLang()));
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.closeClickEvent,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.closeRollOverEvents,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.closeRollOutEvents,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.map = Map(this.parent);
         this.setMode(GameSettings.§_-OS§);
         this.setMedals();
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y - 50,this.y,0.7,true);
         this.yTween.addEventListener(TweenEvent.MOTION_FINISH,this.showModes,false,0,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,0,1,0.7,true);
      }
      
      public function showModes(param1:TweenEvent) : *
      {
         this.yTween.removeEventListener(TweenEvent.MOTION_FINISH,this.showModes);
         if(this.thumb.data.heroicMode && !this.thumb.data.heroicModeView)
         {
            this.thumb.map.game.gameSounds.playGUIBuyUpgrade();
            this.thumb.data.§_-LP§();
            this.heroicMode.gotoAndPlay("unlocked");
            this.ironMode.gotoAndPlay("unlocked");
         }
      }
      
      public function setMode(param1:*) : void
      {
         this.selectedMode = param1;
         switch(this.selectedMode)
         {
            case GameSettings.§_-OS§:
               this.modeTitle.text = Locale.loadStringEx("LEVEL_MODE_CAMPAIGN",Locale.getDefaultLang());
               this.stageDescription.text = Locale.loadStringEx("LEVEL_" + (this.thumb.data.levelIndex + 1) + "_HISTORY",Locale.getDefaultLang());
               this.butPlay.gotoAndStop("campaign");
               this.campaignMode.gotoAndStop("selected");
               this.ironRules.visible = false;
               this.heroicRules.visible = false;
               this.ironRules.gotoAndStop(this.thumb.data.levelIndex + 1);
               this.heroicRules.gotoAndStop(this.thumb.data.levelIndex + 1);
               if(this.thumb.data.stars > 0)
               {
                  this.modeReward.visible = true;
                  this.modeReward.gotoAndStop(2);
                  if(this.thumb.data.campaignDifficulty == GameSettings.DIFFICULTY_NORMAL)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_NORMAL",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.campaignDifficulty == GameSettings.DIFFICULTY_EASY)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_EASY",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.campaignDifficulty == GameSettings.DIFFICULTY_HARD)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_HARD",Locale.getDefaultLang()).toLowerCase();
                  }
               }
               else
               {
                  this.modeReward.gotoAndStop(1);
                  this.modeReward.visible = false;
               }
               this.hideAllHitAreas();
               break;
            case GameSettings.§_-R6§:
               this.modeTitle.text = Locale.loadStringEx("LEVEL_MODE_HEROIC",Locale.getDefaultLang());
               this.stageDescription.text = Locale.loadStringEx("LEVEL_MODE_HEROIC_DESCRIPTION",Locale.getDefaultLang());
               this.butPlay.gotoAndStop("heroic");
               this.campaignMode.gotoAndStop("idle");
               this.heroicMode.gotoAndStop("selected");
               this.ironMode.gotoAndStop("idle");
               this.modeReward.visible = true;
               this.ironRules.visible = false;
               this.heroicRules.visible = true;
               if(this.thumb.data.heroicModeWin)
               {
                  this.modeReward.gotoAndStop(2);
                  if(this.thumb.data.heroicDifficulty == GameSettings.DIFFICULTY_NORMAL)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_NORMAL",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.heroicDifficulty == GameSettings.DIFFICULTY_EASY)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_EASY",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.heroicDifficulty == GameSettings.DIFFICULTY_HARD)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_HARD",Locale.getDefaultLang()).toLowerCase();
                  }
               }
               else
               {
                  this.modeReward.gotoAndStop(1);
               }
               this.showHeroicHitAreas();
               break;
            case GameSettings.§_-AQ§:
               this.modeTitle.text = Locale.loadStringEx("LEVEL_MODE_IRON",Locale.getDefaultLang());
               this.stageDescription.text = Locale.loadStringEx("LEVEL_MODE_IRON_DESCRIPTION",Locale.getDefaultLang());
               this.butPlay.gotoAndStop("iron");
               this.campaignMode.gotoAndStop("idle");
               this.heroicMode.gotoAndStop("idle");
               this.ironMode.gotoAndStop("selected");
               this.modeReward.visible = true;
               this.ironRules.visible = true;
               this.heroicRules.visible = false;
               if(this.thumb.data.ironModeWin)
               {
                  this.modeReward.gotoAndStop(2);
                  if(this.thumb.data.ironDifficulty == GameSettings.DIFFICULTY_NORMAL)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_NORMAL",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.ironDifficulty == GameSettings.DIFFICULTY_EASY)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_EASY",Locale.getDefaultLang()).toLowerCase();
                  }
                  else if(this.thumb.data.ironDifficulty == GameSettings.DIFFICULTY_HARD)
                  {
                     this.modeReward.completed.text = Locale.loadStringEx("C_DIFFICULTY_HARD",Locale.getDefaultLang()).toLowerCase();
                  }
               }
               else
               {
                  this.modeReward.gotoAndStop(1);
               }
               this.showIronHitAreas();
         }
         this.butPlay.btn.addEventListener(MouseEvent.CLICK,this.playClickEvent,false,0,true);
         this.butPlay.btn.addEventListener(MouseEvent.ROLL_OVER,this.playRollOverEvents,false,0,true);
         this.butPlay.btn.addEventListener(MouseEvent.ROLL_OUT,this.playRollOutEvents,false,0,true);
         this.butPlay.btn.addEventListener(MouseEvent.MOUSE_DOWN,this.playMouseDown,false,0,true);
         this.butPlay.btn.addEventListener(MouseEvent.MOUSE_UP,this.playMouseUp,false,0,true);
         this.levelThumb.gotoAndStop(this.thumb.data.levelIndex + 1);
         this.levelTitle.gotoAndStop(this.thumb.data.levelIndex + 1);
      }
      
      private function destroyAllHitAreas() : void
      {
         this.hitBoxHeroicWaves.destroyThis();
         this.hitBoxHeroicLives.destroyThis();
         this.hitBoxHeroicUpgrades.destroyThis();
         this.hitBoxIronWaves.destroyThis();
         this.hitBoxIronLives.destroyThis();
         this.hitBoxIronUpgrades.destroyThis();
         this.hitBoxIronTowers.destroyThis();
         this.hitBoxHeroicWaves = null;
         this.hitBoxHeroicLives = null;
         this.hitBoxHeroicUpgrades = null;
         this.hitBoxIronWaves = null;
         this.hitBoxIronLives = null;
         this.hitBoxIronUpgrades = null;
         this.hitBoxIronTowers = null;
      }
      
      private function hideAllHitAreas() : void
      {
         this.hitBoxHeroicWaves.hideMe();
         this.hitBoxHeroicLives.hideMe();
         this.hitBoxHeroicUpgrades.hideMe();
         this.hitBoxIronWaves.hideMe();
         this.hitBoxIronLives.hideMe();
         this.hitBoxIronUpgrades.hideMe();
         this.hitBoxIronTowers.hideMe();
      }
      
      private function showHeroicHitAreas() : void
      {
         this.hideAllHitAreas();
         this.hitBoxHeroicWaves.showMe();
         this.hitBoxHeroicLives.showMe();
         this.hitBoxHeroicUpgrades.showMe();
      }
      
      private function showIronHitAreas() : void
      {
         this.hideAllHitAreas();
         this.hitBoxIronWaves.showMe();
         this.hitBoxIronLives.showMe();
         this.hitBoxIronUpgrades.showMe();
         this.hitBoxIronTowers.showMe();
      }
      
      private function setMedals() : void
      {
         if(this.thumb.data.heroicModeWin || this.thumb.data.ironModeWin)
         {
            if(this.thumb.data.heroicModeWin && this.thumb.data.ironModeWin)
            {
               this.medals.gotoAndStop("completed");
            }
            else if(this.thumb.data.heroicModeWin)
            {
               this.medals.gotoAndStop("3stars+heroic");
            }
            else
            {
               this.medals.gotoAndStop("3stars+iron");
            }
            return;
         }
         switch(this.thumb.data.stars)
         {
            case 0:
               this.medals.gotoAndStop("empty");
               break;
            case 1:
               this.medals.gotoAndStop("1star");
               break;
            case 2:
               this.medals.gotoAndStop("2stars");
               break;
            case 3:
               this.medals.gotoAndStop("3stars");
         }
      }
      
      public function closeRollOverEvents(param1:MouseEvent) : void
      {
         this.thumb.map.game.gameSounds.§_-Dh§();
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      public function closeRollOutEvents(param1:MouseEvent) : void
      {
         this.butClose.useHandCursor = false;
         this.butClose.gotoAndStop("idle");
      }
      
      protected function closeMouseDown(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("press");
      }
      
      protected function closeMouseUp(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("over");
      }
      
      public function closeClickEvent(param1:MouseEvent) : void
      {
         this.removeButListeners();
         this.thumb.map.game.gameSounds.playGUIButtonCommon();
         this.thumb.map.§_-Gg§();
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y,this.y - 50,0.7,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,1,0,0.7,true);
         this.yTween.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      public function playRollOverEvents(param1:MouseEvent) : void
      {
         this.thumb.map.game.gameSounds.§_-Dh§();
         this.butPlay.btn.buttonMode = true;
         this.butPlay.btn.mouseChildren = false;
         this.butPlay.btn.useHandCursor = true;
         this.butPlay.btn.gotoAndStop("over");
      }
      
      public function playRollOutEvents(param1:MouseEvent) : void
      {
         this.butPlay.btn.useHandCursor = false;
         this.butPlay.btn.gotoAndStop("idle");
      }
      
      protected function playMouseDown(param1:MouseEvent) : void
      {
         this.butPlay.btn.gotoAndStop("press");
      }
      
      protected function playMouseUp(param1:MouseEvent) : void
      {
         this.butPlay.btn.gotoAndStop("over");
      }
      
      public function startLevel() : void
      {
         this.map.startLevel(this.thumb.data.levelIndex + 1,this.selectedMode);
         this.destroyThis();
      }
      
      public function playClickEvent(param1:MouseEvent) : void
      {
         this.removeButListeners();
         this.thumb.map.game.gameSounds.playGUIButtonCommon();
         this.map.game.main.showTransition(this);
      }
      
      public function removeButListeners() : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.closeClickEvent);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.closeRollOverEvents);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.closeRollOutEvents);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp);
         this.butPlay.btn.removeEventListener(MouseEvent.CLICK,this.playClickEvent);
         this.butPlay.btn.removeEventListener(MouseEvent.ROLL_OVER,this.playRollOverEvents);
         this.butPlay.btn.removeEventListener(MouseEvent.ROLL_OUT,this.playRollOutEvents);
         this.butPlay.btn.removeEventListener(MouseEvent.MOUSE_DOWN,this.playMouseDown);
         this.butPlay.btn.removeEventListener(MouseEvent.MOUSE_UP,this.playMouseUp);
      }
      
      public function showTooltip(param1:String, param2:String) : void
      {
         this.tooltip.loadTooltip(new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5),230,{
            "title":param1,
            "text":param2,
            "width":180
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
      
      public function destroyThis() : void
      {
         this.destroyAllHitAreas();
         this.campaignMode.destroyThis();
         this.heroicMode.destroyThis();
         this.ironMode.destroyThis();
         this.selectDifficulty.destroyThis();
         this.campaignMode = null;
         this.heroicMode = null;
         this.ironMode = null;
         this.selectDifficulty = null;
         this.yTween.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.thumb = null;
         this.map = null;
         this.yTween = null;
         this.alphaTween = null;
         this.parent.removeChild(this);
      }
   }
}
