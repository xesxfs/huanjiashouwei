package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-11§ extends MovieClip
   {
       
      
      public var §_-Ma§:MovieClip;
      
      public var denasSelect:§_-G§;
      
      public var geraldSelect:§_-G§;
      
      public var §_-M6§:MovieClip;
      
      public var §_-SB§:TextField;
      
      public var itemDescription:TextField;
      
      public var attackStats:MovieClip;
      
      public var malikSelect:§_-G§;
      
      public var magnusSelect:§_-G§;
      
      public var enableButton:HeroRoomButtonEnable;
      
      public var §_-5-§:MovieClip;
      
      public var disableButton:§_-T2§;
      
      public var info_stars:MovieClip;
      
      public var §_-8m§:MovieClip;
      
      public var §_-6n§:TextField;
      
      public var alleriaSelect:§_-G§;
      
      public var §_-7I§:MovieClip;
      
      public var rangeStats:MovieClip;
      
      public var §_-O4§:MovieClip;
      
      public var help1:MovieClip;
      
      public var help2:MovieClip;
      
      public var selectButton:§_-Eg§;
      
      public var itemSpecialDescription:TextField;
      
      public var ignusSelect:§_-G§;
      
      public var butClose:MovieClip;
      
      public var bolinSelect:§_-G§;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      public var closeAndShowPremium:Boolean;
      
      public var §_-KN§:int;
      
      public var §_-E7§:Object;
      
      public var game:Game;
      
      public function §_-11§(param1:Game)
      {
         super();
         this.game = param1;
         this.§_-E7§ = this.game.gameUpgrades.getHeroStats();
         this.x = 350;
         this.closeAndShowPremium = false;
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,-550,5,0.5,true);
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-A-§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         §_-G§(this.alleriaSelect).§_-3W§ = GameSettings.§_-99§;
         §_-G§(this.geraldSelect).§_-3W§ = GameSettings.§_-PW§;
         §_-G§(this.malikSelect).§_-3W§ = GameSettings.§_-6P§;
         §_-G§(this.bolinSelect).§_-3W§ = GameSettings.§_-Od§;
         §_-G§(this.magnusSelect).§_-3W§ = GameSettings.§_-7H§;
         §_-G§(this.ignusSelect).§_-3W§ = GameSettings.§_-98§;
         §_-G§(this.denasSelect).§_-3W§ = GameSettings.HERO_DENAS;
         if(this.game.gameUpgrades.heroRoomEnabled)
         {
            this.§_-0S§();
         }
         else
         {
            this.§_-Sa§();
         }
         if(this.§_-KN§ == 0 && this.game.gameUpgrades.selectedHero == 0)
         {
            this.§_-KN§ = GameSettings.§_-99§;
         }
         else
         {
            this.§_-KN§ = this.game.gameUpgrades.selectedHero;
         }
         this.§_-Hi§(this.§_-KN§);
         this.updateStars();
      }
      
      public function §_-Hi§(param1:int) : void
      {
         this.§_-KN§ = param1;
         this.loadHeroData();
         this.updatePortraits();
         if(this.game.gameUpgrades.heroRoomEnabled)
         {
            §_-Eg§(this.selectButton).setStatus();
         }
      }
      
      public function selectHero() : void
      {
         this.updatePortraits();
      }
      
      public function §_-3J§() : void
      {
         this.updatePortraits();
      }
      
      public function updatePortraits() : void
      {
         §_-G§(this.alleriaSelect).setStatus();
         §_-G§(this.geraldSelect).setStatus();
         §_-G§(this.malikSelect).setStatus();
         §_-G§(this.bolinSelect).setStatus();
         §_-G§(this.magnusSelect).setStatus();
         §_-G§(this.ignusSelect).setStatus();
         §_-G§(this.denasSelect).setStatus();
      }
      
      public function loadHeroData() : void
      {
         var _loc1_:Object = this.getStats(this.§_-KN§);
         MovieClip(this.§_-O4§).gotoAndStop(this.§_-KN§);
         TextField(this.§_-SB§).text = Locale.loadStringEx(_loc1_.localized + "_NAME",Locale.getDefaultLang());
         TextField(this.itemDescription).text = Locale.loadStringEx(_loc1_.localized + "_DESCRIPTION",Locale.getDefaultLang());
         TextField(this.itemSpecialDescription).text = Locale.loadStringEx(_loc1_.localized + "_SPECIAL",Locale.getDefaultLang());
         MovieClip(this.§_-5-§).gotoAndStop(_loc1_.stat_health + 1);
         MovieClip(this.attackStats).gotoAndStop(_loc1_.stat_attack + 1);
         MovieClip(this.rangeStats).gotoAndStop(_loc1_.stat_range + 1);
         MovieClip(this.§_-Ma§).gotoAndStop(_loc1_.stat_speed + 1);
      }
      
      public function §_-0S§() : void
      {
         this.gotoAndStop("menuOn");
         §_-T2§(this.disableButton).setStatus();
         §_-Eg§(this.selectButton).setStatus();
         this.updateStars();
         this.§_-2D§();
      }
      
      public function §_-2D§() : void
      {
         if(this.game.gameUpgrades.selectedHero != 0)
         {
            MovieClip(this.help2).gotoAndStop("off");
         }
         else
         {
            MovieClip(this.help2).gotoAndPlay("on");
         }
      }
      
      public function §_-Sa§() : void
      {
         this.gotoAndStop("menuOff");
         HeroRoomButtonEnable(this.enableButton).setStatus();
         this.updateStars();
      }
      
      public function §_-IA§() : void
      {
         switch(this.§_-KN§)
         {
            case GameSettings.§_-99§:
               this.game.gameSounds.§_-59§();
               break;
            case GameSettings.§_-PW§:
               this.game.gameSounds.§_-Ia§();
               break;
            case GameSettings.§_-Od§:
               this.game.gameSounds.§_-2R§();
               break;
            case GameSettings.HERO_DENAS:
               this.game.gameSounds.§_-Rg§();
               break;
            case GameSettings.§_-98§:
               this.game.gameSounds.§_-GH§();
               break;
            case GameSettings.§_-7H§:
               this.game.gameSounds.§_-Ta§();
               break;
            case GameSettings.§_-6P§:
               this.game.gameSounds.§_-IV§();
         }
      }
      
      public function closeAndOpenPremium() : void
      {
         if(this.closeAndShowPremium)
         {
            return;
         }
         this.closeAndShowPremium = true;
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.game.gameSounds.playGUIButtonCommon();
         this.game.map.§_-Gg§();
         this.ytweenOut = new Tween(this,"y",Strong.easeIn,this.y,-550,0.3,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.game.gameSounds.playGUIButtonCommon();
         this.game.map.§_-Gg§();
         this.ytweenOut = new Tween(this,"y",Strong.easeIn,this.y,-550,0.3,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function §_-Sv§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      protected function §_-A-§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.butClose.useHandCursor = false;
         this.butClose.gotoAndStop("idle");
      }
      
      protected function §_-Py§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("press");
      }
      
      protected function §_-Rs§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("idle");
      }
      
      public function getStats(param1:int) : Object
      {
         switch(param1)
         {
            case GameSettings.§_-99§:
               return this.§_-E7§.archer;
            case GameSettings.§_-PW§:
               return this.§_-E7§.general;
            case GameSettings.§_-Od§:
               return this.§_-E7§.dwarf;
            case GameSettings.HERO_DENAS:
               return this.§_-E7§.king;
            case GameSettings.§_-98§:
               return this.§_-E7§.fire;
            case GameSettings.§_-7H§:
               return this.§_-E7§.mage;
            case GameSettings.§_-6P§:
               return this.§_-E7§.malik;
            default:
               return null;
         }
      }
      
      protected function updateStars() : void
      {
         this.info_stars.txt.text = this.game.stars.toString();
         this.game.map.§_-Ib§();
      }
      
      protected function destroyThis() : void
      {
         this.game.map.itemsLocked = false;
         this.§_-P8§ = null;
         this.ytweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.ytweenOut = null;
         if(this.closeAndShowPremium)
         {
            this.game.map.§_-0Q§("UPGRADE");
         }
         this.game = null;
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-A-§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
