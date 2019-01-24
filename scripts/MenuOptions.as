package
{
   import com.reintroducing.sound.SoundManager;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MenuOptions extends MovieClip
   {
       
      
      public var §_-Pu§:MovieClip;
      
      public var §_-87§:MovieClip;
      
      public var btnRestart:MovieClip;
      
      protected var §_-44§:Tween;
      
      protected var §_-0h§:Tween;
      
      protected var §_-RX§:Sprite;
      
      protected var tooltipOnOffHolder:Sprite;
      
      protected var autoPauseOnOffHolder:Sprite;
      
      protected var soundFxOnOffHolder:Sprite;
      
      protected var soundMusicOnOffHolder:Sprite;
      
      public var cRoot:Level;
      
      public function MenuOptions(param1:Level)
      {
         this.§_-RX§ = new Sprite();
         this.tooltipOnOffHolder = new Sprite();
         this.autoPauseOnOffHolder = new Sprite();
         this.soundFxOnOffHolder = new Sprite();
         this.soundMusicOnOffHolder = new Sprite();
         super();
         this.cRoot = param1;
         this.cRoot.freeMenues();
         this.cRoot.cancelAllOnKeyPress();
         this.x = 350;
         this.addChild(this.§_-RX§);
         this.addChild(this.tooltipOnOffHolder);
         this.addChild(this.autoPauseOnOffHolder);
         this.addChild(this.soundFxOnOffHolder);
         this.addChild(this.soundMusicOnOffHolder);
         this.§_-Pu§.gotoAndStop("idle");
         this.btnRestart.gotoAndStop("idle");
         this.§_-87§.gotoAndStop("idle");
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,-550,-30,0.5,true);
         this.§_-Pu§.addEventListener(MouseEvent.CLICK,this.resume,false,0,true);
         this.§_-Pu§.addEventListener(MouseEvent.ROLL_OVER,this.§_-E5§,false,0,true);
         this.§_-Pu§.addEventListener(MouseEvent.ROLL_OUT,this.§_-V§,false,0,true);
         this.§_-Pu§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-0V§,false,0,true);
         this.§_-Pu§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Nu§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.CLICK,this.restart,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.ROLL_OVER,this.§_-HA§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.ROLL_OUT,this.§_-SL§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§,false,0,true);
         this.btnRestart.addEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§,false,0,true);
         this.§_-87§.addEventListener(MouseEvent.CLICK,this.§_-Ao§,false,0,true);
         this.§_-87§.addEventListener(MouseEvent.ROLL_OVER,this.§_-GG§,false,0,true);
         this.§_-87§.addEventListener(MouseEvent.ROLL_OUT,this.§_-3r§,false,0,true);
         this.§_-87§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-IY§,false,0,true);
         this.§_-87§.addEventListener(MouseEvent.MOUSE_UP,this.§_-SW§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function execAction(param1:String) : void
      {
         switch(param1)
         {
            case "autoPauseOn":
               if(!this.cRoot.game.§_-3q§)
               {
                  this.cRoot.game.§_-3q§ = true;
                  this.loadAutoPauseOnOff();
                  break;
               }
               break;
            case "autoPauseOff":
               if(this.cRoot.game.§_-3q§)
               {
                  this.cRoot.game.§_-3q§ = false;
                  this.loadAutoPauseOnOff();
                  break;
               }
               break;
            case "tooltipOn":
               if(!this.cRoot.game.main.tooltipsStatus)
               {
                  this.cRoot.game.main.tooltipsStatus = true;
                  this.loadTooltipOnOff();
                  break;
               }
               break;
            case "tooltipOff":
               if(this.cRoot.game.main.tooltipsStatus)
               {
                  this.cRoot.game.main.tooltipsStatus = false;
                  this.loadTooltipOnOff();
                  break;
               }
               break;
            case "soundFxOn":
               if(!this.cRoot.game.main.soundFxStatus)
               {
                  this.cRoot.game.main.soundFxStatus = true;
                  SoundManager.getInstance().unMuteFx();
                  this.loadSoundFxOnOff();
                  break;
               }
               break;
            case "soundFxOff":
               if(this.cRoot.game.main.soundFxStatus)
               {
                  this.cRoot.game.main.soundFxStatus = false;
                  SoundManager.getInstance().muteFx();
                  this.loadSoundFxOnOff();
                  break;
               }
               break;
            case "soundMusicOn":
               if(!this.cRoot.game.main.soundMusicStatus)
               {
                  this.cRoot.game.main.soundMusicStatus = true;
                  SoundManager.getInstance().unMuteMusic();
                  this.cRoot.game.gameSounds.§_-CS§();
                  this.loadSoundMusicOnOff();
                  break;
               }
               break;
            case "soundMusicOff":
               if(this.cRoot.game.main.soundMusicStatus)
               {
                  this.cRoot.game.main.soundMusicStatus = false;
                  SoundManager.getInstance().muteMusic();
                  this.cRoot.game.gameSounds.stopAllMusics();
                  this.loadSoundMusicOnOff();
                  break;
               }
         }
      }
      
      protected function init(param1:Event) : void
      {
         this.§_-6h§();
         this.loadTooltipOnOff();
         this.loadAutoPauseOnOff();
         this.loadSoundFxOnOff();
         this.loadSoundMusicOnOff();
      }
      
      protected function resume(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.cRoot.game.gameSounds.playGUIButtonCommon();
         this.cRoot.pause(true);
         this.§_-0h§ = new Tween(this,"y",Strong.easeOut,this.y,-550,0.5,false);
         this.§_-0h§.addEventListener(TweenEvent.MOTION_FINISH,this.resumeFinish,false,0,true);
      }
      
      protected function restart(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.cRoot.game.gameSounds.playGUIButtonCommon();
         this.cRoot.game.restartLevel(this.cRoot,this.cRoot.mode);
         this.§_-0h§ = new Tween(this,"y",Strong.easeOut,this.y,-550,0.5,false);
         this.§_-0h§.addEventListener(TweenEvent.MOTION_FINISH,this.resumeFinish,false,0,true);
      }
      
      protected function §_-Ao§(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.cRoot.game.gameSounds.playGUIButtonCommon();
         this.cRoot.game.main.showTransition(null,this.cRoot);
         this.destroyThis();
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
      }
      
      public function resumeFinish(param1:TweenEvent) : *
      {
         this.§_-0h§.removeEventListener(TweenEvent.MOTION_FINISH,this.resumeFinish);
         this.destroyThis();
      }
      
      public function loadTooltipOnOff() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.tooltipOnOffHolder.numChildren)
         {
            MovieClip(this.tooltipOnOffHolder.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         if(this.cRoot.game.main.tooltipsStatus)
         {
            this.tooltipOnOffHolder.addChild(new §_-2w§(this,new Point(-4,271),"关","tooltipOff"));
            this.tooltipOnOffHolder.addChild(new §_-ED§(this,new Point(50,271),"开","tooltipOn"));
         }
         else
         {
            this.tooltipOnOffHolder.addChild(new §_-ED§(this,new Point(-4,271),"关","tooltipOff"));
            this.tooltipOnOffHolder.addChild(new §_-2w§(this,new Point(50,271),"开","tooltipOn"));
         }
      }
      
      public function loadAutoPauseOnOff() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.autoPauseOnOffHolder.numChildren)
         {
            MovieClip(this.autoPauseOnOffHolder.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         if(this.cRoot.game.§_-3q§)
         {
            this.autoPauseOnOffHolder.addChild(new §_-2w§(this,new Point(-4,335),"关","autoPauseOff"));
            this.autoPauseOnOffHolder.addChild(new §_-ED§(this,new Point(50,335),"开","autoPauseOn"));
         }
         else
         {
            this.autoPauseOnOffHolder.addChild(new §_-ED§(this,new Point(-4,335),"关","autoPauseOff"));
            this.autoPauseOnOffHolder.addChild(new §_-2w§(this,new Point(50,335),"开","autoPauseOn"));
         }
      }
      
      public function loadSoundFxOnOff() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.soundFxOnOffHolder.numChildren)
         {
            MovieClip(this.soundFxOnOffHolder.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         if(this.cRoot.game.main.soundFxStatus)
         {
            this.soundFxOnOffHolder.addChild(new §_-2w§(this,new Point(-4,203),"关","soundFxOff"));
            this.soundFxOnOffHolder.addChild(new §_-ED§(this,new Point(50,203),"开","soundFxOn"));
         }
         else
         {
            this.soundFxOnOffHolder.addChild(new §_-ED§(this,new Point(-4,203),"关","soundFxOff"));
            this.soundFxOnOffHolder.addChild(new §_-2w§(this,new Point(50,203),"开","soundFxOn"));
         }
      }
      
      public function loadSoundMusicOnOff() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.soundMusicOnOffHolder.numChildren)
         {
            MovieClip(this.soundMusicOnOffHolder.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         if(this.cRoot.game.main.soundMusicStatus)
         {
            this.soundMusicOnOffHolder.addChild(new §_-2w§(this,new Point(-4,237),"关","soundMusicOff"));
            this.soundMusicOnOffHolder.addChild(new §_-ED§(this,new Point(50,237),"开","soundMusicOn"));
         }
         else
         {
            this.soundMusicOnOffHolder.addChild(new §_-ED§(this,new Point(-4,237),"关","soundMusicOff"));
            this.soundMusicOnOffHolder.addChild(new §_-2w§(this,new Point(50,237),"开","soundMusicOn"));
         }
      }
      
      public function §_-6h§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-RX§.numChildren)
         {
            MovieClip(this.§_-RX§.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         switch(stage.quality)
         {
            case "LOW":
               this.§_-RX§.addChild(new §_-Fg§(this,new Point(-4,302),"低",StageQuality.LOW));
               this.§_-RX§.addChild(new §_-E-§(this,new Point(50,302),"中",StageQuality.MEDIUM));
               this.§_-RX§.addChild(new §_-E-§(this,new Point(105,302),"高",StageQuality.HIGH));
               break;
            case "MEDIUM":
               this.§_-RX§.addChild(new §_-E-§(this,new Point(-4,302),"低",StageQuality.LOW));
               this.§_-RX§.addChild(new §_-Fg§(this,new Point(50,302),"中",StageQuality.MEDIUM));
               this.§_-RX§.addChild(new §_-E-§(this,new Point(105,302),"高",StageQuality.HIGH));
               break;
            case "HIGH":
               this.§_-RX§.addChild(new §_-E-§(this,new Point(-4,302),"低",StageQuality.LOW));
               this.§_-RX§.addChild(new §_-E-§(this,new Point(50,302),"中",StageQuality.MEDIUM));
               this.§_-RX§.addChild(new §_-Fg§(this,new Point(105,302),"高",StageQuality.HIGH));
               break;
            default:
               this.§_-RX§.addChild(new §_-E-§(this,new Point(-4,302),"低",StageQuality.LOW));
               this.§_-RX§.addChild(new §_-E-§(this,new Point(50,302),"中",StageQuality.MEDIUM));
               this.§_-RX§.addChild(new §_-Fg§(this,new Point(105,302),"高",StageQuality.HIGH));
         }
      }
      
      protected function §_-7t§() : void
      {
      }
      
      protected function §_-E5§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         this.§_-Pu§.buttonMode = true;
         this.§_-Pu§.mouseChildren = false;
         this.§_-Pu§.useHandCursor = true;
         this.§_-Pu§.gotoAndStop("over");
      }
      
      protected function §_-V§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-Pu§.useHandCursor = false;
         this.§_-Pu§.gotoAndStop("idle");
      }
      
      protected function §_-0V§(param1:MouseEvent) : void
      {
         this.§_-Pu§.gotoAndStop("press");
      }
      
      protected function §_-Nu§(param1:MouseEvent) : void
      {
         this.§_-Pu§.gotoAndStop("idle");
      }
      
      protected function §_-HA§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         this.btnRestart.buttonMode = true;
         this.btnRestart.mouseChildren = false;
         this.btnRestart.useHandCursor = true;
         this.btnRestart.gotoAndStop("over");
      }
      
      protected function §_-SL§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.stopGUIMouseOverCommon();
         this.btnRestart.useHandCursor = false;
         this.btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-QV§(param1:MouseEvent) : void
      {
         this.btnRestart.gotoAndStop("press");
      }
      
      protected function §_-Ew§(param1:MouseEvent) : void
      {
         this.btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-GG§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         this.§_-87§.buttonMode = true;
         this.§_-87§.mouseChildren = false;
         this.§_-87§.useHandCursor = true;
         this.§_-87§.gotoAndStop("over");
      }
      
      protected function §_-3r§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-87§.useHandCursor = false;
         this.§_-87§.gotoAndStop("idle");
      }
      
      protected function §_-IY§(param1:MouseEvent) : void
      {
         this.§_-87§.gotoAndStop("press");
         param1.stopPropagation();
      }
      
      protected function §_-SW§(param1:MouseEvent) : void
      {
         this.§_-87§.gotoAndStop("idle");
         param1.stopPropagation();
      }
      
      protected function removeListeners() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.§_-Pu§.removeEventListener(MouseEvent.CLICK,this.resume);
         this.§_-Pu§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-E5§);
         this.§_-Pu§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-V§);
         this.§_-Pu§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-0V§);
         this.§_-Pu§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Nu§);
         this.btnRestart.removeEventListener(MouseEvent.CLICK,this.restart);
         this.btnRestart.removeEventListener(MouseEvent.ROLL_OVER,this.§_-HA§);
         this.btnRestart.removeEventListener(MouseEvent.ROLL_OUT,this.§_-SL§);
         this.btnRestart.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§);
         this.btnRestart.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§);
         this.§_-87§.removeEventListener(MouseEvent.CLICK,this.§_-Ao§);
         this.§_-87§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-GG§);
         this.§_-87§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3r§);
         this.§_-87§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-IY§);
         this.§_-87§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-SW§);
      }
      
      protected function destroyThis() : void
      {
         this.removeChild(this.§_-RX§);
         this.§_-RX§ = null;
         this.removeChild(this.tooltipOnOffHolder);
         this.tooltipOnOffHolder = null;
         this.§_-44§ = null;
         this.§_-0h§ = null;
         this.cRoot = null;
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
