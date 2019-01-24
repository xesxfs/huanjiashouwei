package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class VeznanBlock extends MovieClip
   {
       
      
      private var §_-h§:Boolean = true;
      
      private var §_-E8§:Boolean = false;
      
      private var §_-I8§:Boolean = false;
      
      private var startTime:int;
      
      private var §_-t§:int = 0;
      
      private var holdTime:int;
      
      private var holdTimeCounter:int = 0;
      
      private var releaseTime:int = 30;
      
      private var releaseTimeCounter:int = 0;
      
      private var §_-0B§:int = 0;
      
      private var tower:Tower;
      
      private var sName:String;
      
      public var cRoot:Level;
      
      public function VeznanBlock(param1:Tower, param2:Level)
      {
         super();
         addFrameScript(39,this.frame40,54,this.frame55,64,this.frame65);
         this.cRoot = param2;
         this.tower = param1;
         this.x = this.tower.x;
         this.y = this.tower.y;
         this.startTime = this.cRoot.gameSettings.enemies.veznan.towerHoldFreeTime;
         this.holdTime = this.cRoot.gameSettings.enemies.veznan.towerHoldBlockTime;
         this.sName = Math.random().toString();
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-h§)
         {
            if(this.§_-t§ < this.startTime)
            {
               this.§_-t§++;
               if(this.§_-t§ == 31)
               {
                  this.cRoot.game.gameSounds.§_-Jb§();
               }
               return;
            }
            this.cRoot.game.gameSounds.§_-Fz§();
            this.§_-EH§();
            this.gotoAndPlay("hold");
            this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
            this.§_-E8§ = true;
            this.§_-h§ = false;
            this.holdTimeCounter = 0;
         }
         if(this.§_-E8§)
         {
            if(this.holdTimeCounter < this.holdTime)
            {
               this.holdTimeCounter++;
               return;
            }
            this.release();
         }
         if(this.§_-I8§)
         {
            if(this.releaseTimeCounter < this.releaseTime)
            {
               this.releaseTimeCounter++;
               return;
            }
            this.tower.§_-FG§();
            this.destroyThis();
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "idleEnd":
               this.gotoAndPlay("idle");
               break;
            case "holdEnd":
               break;
            case "releaseEnd":
               break;
            default:
               this.play();
         }
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.forceFreeQuickMenu();
         this.cRoot.game.gameSounds.§_-1b§();
         this.§_-0B§++;
         if(this.§_-0B§ == 3)
         {
            this.release();
            this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
            this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         }
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
      }
      
      private function release() : void
      {
         this.cRoot.game.gameSounds.§_-AK§();
         this.§_-I8§ = true;
         this.§_-E8§ = false;
         this.§_-h§ = false;
         this.releaseTimeCounter = 0;
         this.gotoAndPlay("release");
      }
      
      private function freeTower() : void
      {
         this.tower.§_-RN§();
      }
      
      private function §_-EH§() : void
      {
         var _loc2_:Tower = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.cRoot.towers)
         {
            if(!_loc2_.building && !_loc2_.isDisabled)
            {
               _loc1_++;
            }
         }
         if(_loc1_ == 0)
         {
            this.cRoot.game.gameSounds.§_-7f§();
         }
      }
      
      private function destroyThis() : void
      {
         this.cRoot.game.gameSounds.§_-81§();
         this.cRoot = null;
         this.tower = null;
         this.parent.removeChild(this);
      }
      
      function frame40() : *
      {
         gotoAndPlay("idle");
      }
      
      function frame55() : *
      {
         stop();
      }
      
      function frame65() : *
      {
         stop();
      }
   }
}
