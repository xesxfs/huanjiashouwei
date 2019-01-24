package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class IceBlock extends MovieClip
   {
       
      
      private var §_-h§:Boolean = true;
      
      private var isIdle:Boolean = false;
      
      private var §_-JC§:Boolean = false;
      
      private var startTime:int = 23;
      
      private var §_-t§:int = 0;
      
      private var §_-6E§:int = 44;
      
      private var §_-H§:int = 0;
      
      private var §_-0B§:int = 0;
      
      private var tower:Tower;
      
      public var cRoot:Level;
      
      public function IceBlock(param1:Tower, param2:Level)
      {
         super();
         addFrameScript(30,this.frame31,70,this.frame71);
         this.cRoot = param2;
         this.tower = param1;
         this.x = this.tower.x;
         this.y = this.tower.y;
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
      }
      
      public function onFrameUpdate() : void
      {
         if(this.§_-h§)
         {
            if(this.§_-t§ < this.startTime)
            {
               this.§_-t§++;
               return;
            }
            this.isIdle = true;
            this.§_-h§ = false;
            this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
         }
         if(this.isIdle)
         {
            return;
         }
         if(this.§_-JC§)
         {
            if(this.§_-H§ < this.§_-6E§)
            {
               if(this.§_-H§ == 25)
               {
                  this.freeTower();
               }
               this.§_-H§++;
               return;
            }
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
            case "endEnd":
               break;
            default:
               this.play();
         }
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.forceFreeQuickMenu();
         this.cRoot.game.gameSounds.§_-k§();
         this.§_-0B§++;
         if(this.§_-0B§ == 3)
         {
            this.§_-AP§();
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
      
      private function §_-AP§() : void
      {
         this.cRoot.game.gameSounds.playSoundBreakIce();
         this.§_-JC§ = true;
         this.isIdle = false;
         this.§_-H§ = 0;
         this.gotoAndPlay("end");
      }
      
      private function freeTower() : void
      {
         this.tower.§_-RN§();
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.tower = null;
         this.parent.removeChild(this);
      }
      
      function frame31() : *
      {
         gotoAndPlay("idle");
      }
      
      function frame71() : *
      {
         stop();
      }
   }
}
