package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class TransitionScreen extends MovieClip
   {
       
      
      private var durationTime:int = 45;
      
      private var durationTimeCounter:int = 0;
      
      private var map:Map;
      
      private var mainMenu:MainMenu;
      
      private var levelSelect:LevelSelect;
      
      private var level:Level;
      
      private var §_-14§:MainMenu;
      
      private var menuCredits:MenuCredits;
      
      private var endGame:EndGame;
      
      private var §_-Ni§:int = 15;
      
      public function TransitionScreen(param1:LevelSelect = null, param2:Level = null, param3:MainMenu = null, param4:Map = null, param5:MainMenu = null, param6:MenuCredits = null, param7:EndGame = null)
      {
         super();
         addFrameScript(44,this.frame45);
         this.levelSelect = param1;
         this.level = param2;
         this.mainMenu = param3;
         this.map = param4;
         this.§_-14§ = param5;
         this.menuCredits = param6;
         this.endGame = param7;
         this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            if(this.durationTimeCounter == this.§_-Ni§)
            {
               if(this.levelSelect != null)
               {
                  this.levelSelect.startLevel();
               }
               else if(this.level != null)
               {
                  this.level.game.§continue§(this.level);
               }
               else if(this.mainMenu != null)
               {
                  this.mainMenu.§_-CP§();
               }
               else if(this.map != null)
               {
                  this.map.endSession();
               }
               else if(this.§_-14§ != null)
               {
                  this.§_-14§.§_-LF§();
               }
               else if(this.menuCredits != null)
               {
                  this.menuCredits.endCredits();
               }
               else if(this.endGame != null)
               {
                  this.endGame.§_-LZ§();
               }
            }
            return;
         }
         this.destroyThis();
      }
      
      public function destroyThis() : void
      {
         this.level = null;
         this.levelSelect = null;
         this.mainMenu = null;
         this.map = null;
         this.§_-14§ = null;
         this.menuCredits = null;
         this.endGame = null;
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.parent.removeChild(this);
      }
      
      function frame45() : *
      {
         stop();
      }
   }
}
