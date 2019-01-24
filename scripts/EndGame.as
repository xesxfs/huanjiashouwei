package
{
   import Playtomic.Log;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class EndGame extends MovieClip
   {
       
      
      protected var onPause:Boolean;
      
      protected var §_-T-§:int;
      
      protected var §_-J-§:int;
      
      protected var §_-9L§:EndCredits;
      
      protected var §_-Gj§:Boolean;
      
      protected var §_-6K§:int = 2;
      
      protected var creditsEndPosition:int = -975;
      
      protected var §_-RS§:Boolean;
      
      protected var §_-Tj§:int = 100;
      
      protected var §_-MY§:int = 70;
      
      protected var §_-NJ§:int;
      
      protected var §_-IM§:§_-Ki§;
      
      protected var §_-AZ§:int;
      
      protected var currentTimeRemoveLevel:int = 60;
      
      protected var §_-9B§:int = 80;
      
      protected var §case§:int = 610;
      
      protected var §_-Ha§:int = 650;
      
      protected var §_-ME§:int = 865;
      
      protected var game:Game;
      
      protected var cRoot:Level;
      
      public function EndGame(param1:Level)
      {
         super();
         addFrameScript(609,this.frame610,649,this.frame650,864,this.frame865);
         this.cRoot = param1;
         this.game = this.cRoot.game;
         this.§_-T-§ = 1;
         this.§_-Gj§ = false;
         this.onPause = false;
         this.§_-J-§ = this.cRoot.getStars();
         this.cRoot.data.§_-9u§ = this.§_-J-§;
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
         Log.CustomMetric("Show End Game","End Game");
         Log.ForceSend();
         this.game.gameSounds.stopAllMusics();
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.onPause == true)
         {
            return;
         }
         if(this.§_-Gj§)
         {
            if(!this.§_-RS§)
            {
               this.§_-9L§.y = this.§_-9L§.y - this.§_-6K§;
               if(this.§_-9L§.y <= this.creditsEndPosition)
               {
                  this.game.gameSounds.fadeMusicCredits();
                  this.§_-RS§ = true;
                  this.§_-NJ§ = 0;
               }
               return;
            }
            if(this.§_-NJ§ < this.§_-Tj§)
            {
               this.§_-NJ§++;
               if(this.§_-NJ§ >= this.§_-MY§)
               {
                  this.§_-9L§.alpha = this.§_-9L§.alpha - 0.05;
               }
               return;
            }
            this.removeChild(this.§_-9L§);
            this.§_-9L§ = null;
            this.§_-Gj§ = false;
            this.removeChild(this.§_-IM§);
            this.game.gameSounds.§_-JE§();
            this.play();
            return;
         }
         this.§_-AZ§++;
         if(this.§_-AZ§ == this.currentTimeRemoveLevel)
         {
            this.cRoot.destroyThis();
            this.cRoot = null;
         }
         if(this.§_-AZ§ == this.§_-9B§)
         {
            this.game.gameSounds.§_-1z§();
         }
         if(this.§_-AZ§ == this.§case§)
         {
            this.onPause = true;
            this.buttonMode = true;
            this.mouseChildren = false;
            this.useHandCursor = true;
            this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         }
         if(this.§_-AZ§ == this.§_-Ha§)
         {
            this.buttonMode = false;
            this.mouseChildren = true;
            this.useHandCursor = false;
            this.§_-9L§ = new EndCredits();
            this.§_-9L§.x = 350;
            this.§_-9L§.y = 612;
            this.addChild(this.§_-9L§);
            this.§_-Gj§ = true;
            this.§_-RS§ = false;
            this.§_-IM§ = new §_-Ki§();
            this.§_-IM§.x = 602;
            this.§_-IM§.y = 513;
            this.addChild(this.§_-IM§);
            this.§_-IM§.addEventListener(MouseEvent.CLICK,this.§_-JD§,false,0,true);
            this.§_-IM§.addEventListener(MouseEvent.ROLL_OVER,this.§_-8Q§,false,0,true);
            this.§_-IM§.addEventListener(MouseEvent.ROLL_OUT,this.§_-EB§,false,0,true);
            this.§_-IM§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-O8§,false,0,true);
            this.§_-IM§.addEventListener(MouseEvent.MOUSE_UP,this.§_-TP§,false,0,true);
            this.§_-IM§.gotoAndStop("idle");
         }
         if(this.§_-AZ§ == this.§_-ME§)
         {
            this.onPause = true;
            this.buttonMode = true;
            this.mouseChildren = false;
            this.useHandCursor = true;
            this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         }
      }
      
      protected function §_-JD§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.onPause = true;
         this.game.main.showTransition(null,null,null,null,null,null,this);
         this.§_-IM§.removeEventListener(MouseEvent.CLICK,this.§_-JD§);
         this.§_-IM§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-8Q§);
         this.§_-IM§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-EB§);
         this.§_-IM§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-O8§);
         this.§_-IM§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-TP§);
      }
      
      protected function §_-8Q§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-IM§.buttonMode = true;
         this.§_-IM§.mouseChildren = false;
         this.§_-IM§.useHandCursor = true;
         this.§_-IM§.gotoAndStop("over");
      }
      
      protected function §_-EB§(param1:MouseEvent) : void
      {
         this.§_-IM§.useHandCursor = false;
         this.§_-IM§.gotoAndStop("idle");
      }
      
      protected function §_-O8§(param1:MouseEvent) : void
      {
         this.§_-IM§.gotoAndStop("press");
      }
      
      protected function §_-TP§(param1:MouseEvent) : void
      {
         this.§_-IM§.gotoAndStop("idle");
      }
      
      public function §_-LZ§() : void
      {
         this.game.§continue§(null);
         this.destroyThis();
      }
      
      protected function click(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.useHandCursor = false;
         if(this.§_-T-§ == 1)
         {
            this.§_-T-§ = 2;
            this.onPause = false;
            this.play();
         }
         else
         {
            this.game.main.showTransition(null,null,null,null,null,null,this);
         }
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.game = null;
         if(this.§_-IM§ != null)
         {
            this.§_-IM§.removeEventListener(MouseEvent.CLICK,this.§_-JD§);
            this.§_-IM§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-8Q§);
            this.§_-IM§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-EB§);
            this.§_-IM§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-O8§);
            this.§_-IM§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-TP§);
         }
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
      
      function frame610() : *
      {
         stop();
      }
      
      function frame650() : *
      {
         stop();
      }
      
      function frame865() : *
      {
         stop();
      }
   }
}
