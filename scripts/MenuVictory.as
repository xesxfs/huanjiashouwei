package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MenuVictory extends MovieClip
   {
       
      
      public var btnContinue:MovieClip;
      
      public var victoryStars:MovieClip;
      
      public var btnRestart:MovieClip;
      
      protected var butEnables:Boolean;
      
      protected var starsEnded:Boolean;
      
      protected var §_-Ke§:int = 82;
      
      protected var §_-7M§:int = 98;
      
      protected var §_-9j§:int;
      
      protected var §_-J-§:int;
      
      protected var cRoot:Level;
      
      public function MenuVictory(param1:Level)
      {
         super();
         addFrameScript(98,this.frame99);
         this.cRoot = param1;
         this.§_-J-§ = this.cRoot.getStars();
         this.cRoot.game.gameSounds.stopAllMusics();
         this.cRoot.game.gameSounds.§_-0T§();
         this.starsEnded = false;
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.butEnables)
         {
            return;
         }
         this.§_-9j§++;
         if(this.§_-9j§ > 15)
         {
            this.§_-49§();
         }
         if(this.§_-9j§ >= this.§_-Ke§)
         {
            if(this.§_-9j§ == this.§_-Ke§)
            {
               MovieClip(this).btnRestart.gotoAndStop("idle");
               MovieClip(this).btnContinue.gotoAndStop("idle");
            }
            if(this.§_-9j§ == 82)
            {
               this.cRoot.game.gameSounds.playGUIButtonCommon();
            }
            if(this.§_-9j§ == 91)
            {
               this.cRoot.game.gameSounds.playGUIButtonCommon();
            }
            if(this.§_-9j§ > this.§_-7M§)
            {
               this.cRoot.data.§_-9u§ = this.§_-J-§;
               this.cRoot.data.§_-DA§ = this.cRoot.cash;
               if(this.cRoot.data.stars < this.cRoot.data.§_-9u§)
               {
                  this.cRoot.game.stars = this.cRoot.game.stars + (this.cRoot.data.§_-9u§ - this.cRoot.data.stars);
                  this.cRoot.game.starsWon = this.cRoot.game.starsWon + (this.cRoot.data.§_-9u§ - this.cRoot.data.stars);
               }
               if(this.cRoot.data.campaignDifficulty != GameSettings.DIFFICULTY_NORMAL)
               {
                  this.cRoot.data.campaignDifficulty = this.cRoot.game.difficulty;
               }
               this.cRoot.data.win();
               this.cRoot.game.gameAchievement.§_-49§(this.cRoot.game.starsWon);
               this.cRoot.game.§_-Bn§();
               MovieClip(this).btnRestart.addEventListener(MouseEvent.CLICK,this.restart,false,0,true);
               MovieClip(this).btnRestart.addEventListener(MouseEvent.ROLL_OVER,this.§_-HA§,false,0,true);
               MovieClip(this).btnRestart.addEventListener(MouseEvent.ROLL_OUT,this.§_-SL§,false,0,true);
               MovieClip(this).btnRestart.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§,false,0,true);
               MovieClip(this).btnRestart.addEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§,false,0,true);
               MovieClip(this).btnContinue.addEventListener(MouseEvent.CLICK,this.§_-JJ§,false,0,true);
               MovieClip(this).btnContinue.addEventListener(MouseEvent.ROLL_OVER,this.§_-1h§,false,0,true);
               MovieClip(this).btnContinue.addEventListener(MouseEvent.ROLL_OUT,this.§_-M3§,false,0,true);
               MovieClip(this).btnContinue.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§,false,0,true);
               MovieClip(this).btnContinue.addEventListener(MouseEvent.MOUSE_UP,this.§_-1w§,false,0,true);
               this.butEnables = true;
               this.cRoot.game.gameSounds.§_-84§();
            }
         }
      }
      
      protected function §_-49§() : void
      {
         if(this.starsEnded)
         {
            return;
         }
         if(this.§_-J-§ == 1)
         {
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 4)
            {
               this.cRoot.game.gameSounds.§_-Pr§("");
            }
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 19)
            {
               MovieClip(MovieClip(this).victoryStars).stop();
               this.gotoAndPlay("showMenu");
               this.starsEnded = true;
               this.§_-9j§ = 69;
            }
            return;
         }
         if(this.§_-J-§ == 2)
         {
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 4)
            {
               this.cRoot.game.gameSounds.§_-Pr§("");
            }
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 20)
            {
               this.cRoot.game.gameSounds.§_-Pr§("2");
            }
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 38)
            {
               MovieClip(MovieClip(this).victoryStars).stop();
               this.gotoAndPlay("showMenu");
               this.starsEnded = true;
               this.§_-9j§ = 69;
            }
            return;
         }
         if(this.§_-J-§ == 3)
         {
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 4)
            {
               this.cRoot.game.gameSounds.§_-Pr§("");
            }
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 20)
            {
               this.cRoot.game.gameSounds.§_-Pr§("2");
            }
            if(MovieClip(MovieClip(this).victoryStars).currentFrame == 39)
            {
               this.cRoot.game.gameSounds.§_-Pr§("3");
            }
         }
      }
      
      protected function restart(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.cRoot.game.restartLevel(this.cRoot,this.cRoot.mode);
         this.destroyThis();
      }
      
      protected function §_-JJ§(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.cRoot.game.main.showTransition(null,this.cRoot);
         this.cRoot = null;
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
      }
      
      protected function §_-HA§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.§_-Dh§();
         MovieClip(this).btnRestart.buttonMode = true;
         MovieClip(this).btnRestart.mouseChildren = false;
         MovieClip(this).btnRestart.useHandCursor = true;
         MovieClip(this).btnRestart.gotoAndStop("over");
      }
      
      protected function §_-SL§(param1:MouseEvent) : void
      {
         MovieClip(this).btnRestart.useHandCursor = false;
         MovieClip(this).btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-QV§(param1:MouseEvent) : void
      {
         MovieClip(this).btnRestart.gotoAndStop("press");
      }
      
      protected function §_-Ew§(param1:MouseEvent) : void
      {
         MovieClip(this).btnRestart.gotoAndStop("idle");
      }
      
      protected function §_-1h§(param1:MouseEvent) : void
      {
         this.cRoot.game.gameSounds.§_-Dh§();
         MovieClip(this).btnContinue.buttonMode = true;
         MovieClip(this).btnContinue.mouseChildren = false;
         MovieClip(this).btnContinue.useHandCursor = true;
         MovieClip(this).btnContinue.gotoAndStop("over");
      }
      
      protected function §_-M3§(param1:MouseEvent) : void
      {
         MovieClip(this).btnContinue.useHandCursor = false;
         MovieClip(this).btnContinue.gotoAndStop("idle");
      }
      
      protected function §_-9Z§(param1:MouseEvent) : void
      {
         MovieClip(this).btnContinue.gotoAndStop("press");
      }
      
      protected function §_-1w§(param1:MouseEvent) : void
      {
         MovieClip(this).btnContinue.gotoAndStop("idle");
      }
      
      protected function removeListeners() : void
      {
         MovieClip(this).btnRestart.removeEventListener(MouseEvent.CLICK,this.restart);
         MovieClip(this).btnContinue.removeEventListener(MouseEvent.CLICK,this.§_-JJ§);
         MovieClip(this).btnRestart.removeEventListener(MouseEvent.ROLL_OVER,this.§_-HA§);
         MovieClip(this).btnRestart.removeEventListener(MouseEvent.ROLL_OUT,this.§_-SL§);
         MovieClip(this).btnRestart.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-QV§);
         MovieClip(this).btnRestart.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Ew§);
         MovieClip(this).btnContinue.removeEventListener(MouseEvent.ROLL_OVER,this.§_-1h§);
         MovieClip(this).btnContinue.removeEventListener(MouseEvent.ROLL_OUT,this.§_-M3§);
         MovieClip(this).btnContinue.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-9Z§);
         MovieClip(this).btnContinue.removeEventListener(MouseEvent.MOUSE_UP,this.§_-1w§);
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
      
      function frame99() : *
      {
         stop();
      }
   }
}
