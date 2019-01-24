package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-5g§ extends MovieClip
   {
       
      
      protected var isActive:Boolean;
      
      protected var §_-BB§:Boolean;
      
      protected var §_-31§:int = 15;
      
      protected var §_-PH§:int = 0;
      
      protected var §_-Pi§:Boolean;
      
      protected var §_-Sj§:int = 17;
      
      protected var §_-Ff§:int = 0;
      
      protected var §_-Nw§:Boolean;
      
      protected var §_-P9§:Boolean;
      
      protected var reloadTime:int;
      
      protected var reloadTimeCounter:int;
      
      protected var §_-Cz§:§_-1R§;
      
      protected var loaded:§_-1R§;
      
      protected var §_-34§:Boolean;
      
      protected var cRoot:Level;
      
      public function §_-5g§(param1:Level, param2:Point, param3:Boolean = true)
      {
         super();
         this.isActive = false;
         this.§_-P9§ = false;
         this.§_-Nw§ = false;
         this.x = param2.x;
         this.y = param2.y;
         this.reloadTime = 0;
         this.cRoot = param1;
         this.§_-Cz§ = new §_-1R§(new Point(0,14));
         this.§_-Cz§.visible = false;
         this.§_-Cz§.alpha = 0.9;
         this.addChild(this.§_-Cz§);
         this.gotoAndStop("opening");
         if(param3)
         {
            this.§_-Pi§ = true;
         }
      }
      
      public function activate() : void
      {
         this.§_-BB§ = true;
         this.play();
      }
      
      public function unlock() : void
      {
         this.§_-Pi§ = true;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-Pi§)
         {
            if(this.§_-PH§ < this.§_-31§)
            {
               this.§_-PH§++;
               return;
            }
            this.activate();
            this.§_-Pi§ = false;
         }
         if(!this.isActive)
         {
            if(this.§_-BB§)
            {
               if(this.§_-Ff§ < this.§_-Sj§)
               {
                  this.§_-Ff§++;
               }
               else
               {
                  this.isActive = true;
                  this.§_-BB§ = false;
                  this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
                  this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
                  this.addEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent,false,0,true);
                  this.loaded = new §_-1R§(new Point(0,14),true);
                  this.addChild(this.loaded);
                  this.§_-Nj§();
               }
            }
            return;
         }
         if(this.§_-Nw§)
         {
            return;
         }
         if(this.reloadTimeCounter == 0)
         {
            this.§_-Nj§();
            return;
         }
         this.reloadTimeCounter--;
         this.updateLoadingBar();
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function getInfo() : Object
      {
         return null;
      }
      
      public function §_-Se§(param1:int) : void
      {
         if(this.§_-Nw§ || !this.isActive)
         {
            return;
         }
         if(param1 > this.cRoot.gameSettings.framesRate)
         {
            this.cRoot.bullets.addChild(new PowerFeedback(new Point(this.cRoot.menu.x + this.x,this.cRoot.menu.y + this.y - 25),Math.round(param1 / this.cRoot.gameSettings.framesRate)));
         }
         this.reloadTimeCounter = this.reloadTimeCounter - param1;
         if(this.reloadTimeCounter <= 0)
         {
            this.reloadTimeCounter = 1;
         }
      }
      
      public function reset() : void
      {
         this.cRoot.§_-QR§();
         this.§_-Nw§ = false;
         this.§_-34§ = false;
         this.§_-P9§ = false;
         this.reloadTimeCounter = this.reloadTime;
         this.gotoAndStop("idle");
         this.§_-Cz§.visible = true;
         this.updateLoadingBar();
      }
      
      public function §_-6f§(param1:Boolean = false) : void
      {
         if(!this.isActive)
         {
            return;
         }
         if(this.§_-Nw§ && !this.§_-P9§ && this.cRoot.powerPointer == null)
         {
            if(this.cRoot.data.levelIndex == 0 && Level1(this.cRoot).powerSign != null)
            {
               Level1(this.cRoot).powerSign.closeMe();
            }
            this.cRoot.game.gameSounds.§_-2d§();
            this.§do §();
            this.cRoot.forceFreeQuickMenu();
            this.createPointer();
            if(!param1)
            {
               this.cRoot.menu.§_-8F§(this);
            }
         }
         this.cRoot.removeToopTip();
      }
      
      protected function clickEvent(param1:MouseEvent) : void
      {
         this.§_-6f§(true);
         param1.stopImmediatePropagation();
         this.cRoot.menu.§_-8F§(this);
      }
      
      protected function createPointer() : void
      {
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
      }
      
      protected function §_-Nj§() : void
      {
         this.§_-34§ = true;
         this.§_-Nw§ = true;
         this.cRoot.game.gameSounds.§_-6m§();
         this.gotoAndPlay("refresh");
         this.reloadTimeCounter = this.reloadTime;
         this.§_-Cz§.visible = false;
      }
      
      protected function §do §() : void
      {
         this.§_-34§ = false;
         this.cRoot.disableLevelElements();
         this.§_-P9§ = true;
         this.gotoAndStop("selected");
      }
      
      public function §_-Dv§() : void
      {
         this.§_-34§ = true;
         this.cRoot.§_-QR§();
         this.§_-P9§ = false;
         this.gotoAndStop("idle");
      }
      
      protected function updateLoadingBar() : void
      {
         this.loaded.updateLoadingBar(this.reloadTime,this.reloadTimeCounter);
      }
      
      protected function destroyThis() : void
      {
         if(this.isActive)
         {
            this.removeEventListener(MouseEvent.MOUSE_DOWN,this.clickEvent);
            this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         }
         this.parent.removeChild(this);
      }
   }
}
